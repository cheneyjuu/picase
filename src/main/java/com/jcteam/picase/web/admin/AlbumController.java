package com.jcteam.picase.web.admin;

import com.jcteam.picase.entity.Album;
import com.jcteam.picase.entity.Menu;
import com.jcteam.picase.entity.Picture;
import com.jcteam.picase.service.admin.AlbumService;
import com.jcteam.picase.service.admin.MenuService;
import com.jcteam.picase.service.admin.PictureService;
import com.jcteam.picase.utility.HandlerUpload;
import com.jcteam.picase.utility.ImageTools;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

/**
 * User: juchen
 * Date: 13-4-12
 * Time: 下午11:12
 */
@Controller
@RequestMapping (value = "/admin/album")
public class AlbumController {

    private static final int PAGE_SIZE = 12;
    private AlbumService albumService;
    private MenuService menuService;
    private PictureService pictureService;

    @RequestMapping (value = "/save", method = RequestMethod.GET)
    public String toSave(Model model) {
        model.addAttribute("parentList",menuService.findParentMenu());
        return "admin/album/save";
    }

    @RequestMapping (value = "/update", method = RequestMethod.GET)
    public String toUpdate(Model model, @PathVariable("albumId") Long albumId) {
        model.addAttribute("parentList",menuService.findParentMenu());
        model.addAttribute("album", albumService.findById(albumId));
        return "admin/album/update";
    }

    @RequestMapping (value = "update", method = RequestMethod.POST)
    public String update () {

        return null;
    }

    @RequestMapping (value = "/save", method = RequestMethod.POST)
    public String save(@Valid Album album,
                       @RequestParam("parentName") String parentName,
                       @RequestParam("childName") String childName,
                       @RequestParam("file") MultipartFile file,
                       HttpServletRequest request,
                       Model model) {
        // 封面大小 225*225
        if (parentName.equalsIgnoreCase("CorporateBusiness")){
            album.setParentMenu("Corporate & Business");
        } else {
            album.setParentMenu(parentName);
        }
        if (childName.equalsIgnoreCase("Interiorsbuildings")){
            album.setChildMenu("Interiors & buildings");
        } else {
            album.setChildMenu(childName);
        }
        HandlerUpload handlerUpload = new HandlerUpload();
        Map<String, String> fileNameAndPathMap = null;
        try {
            InputStream iis = file.getInputStream();
            BufferedImage bi = ImageIO.read(iis);
            int originHeight = bi.getHeight();//高
            int originWidth = bi.getWidth();//宽
            int thumbWidth,thumbHeight;
            thumbWidth = originWidth > 225?225:originWidth;
            thumbHeight = originHeight > 225?225:originHeight;
            fileNameAndPathMap = handlerUpload.uploadFile(file,request);
            String realPath = request.getSession().getServletContext().getRealPath(fileNameAndPathMap.get("filePath"))+"/";
            File inFile = new File(realPath+fileNameAndPathMap.get("fileName"));
            File thumbFile = new File(realPath+"t_"+fileNameAndPathMap.get("fileName"));
            ImageTools.convert(inFile, thumbFile, thumbWidth, thumbHeight, 90);
            album.setImagePath(fileNameAndPathMap.get("filePath"));
            album.setOriginImage(fileNameAndPathMap.get("fileName"));
            album.setThumbImage("t_"+fileNameAndPathMap.get("fileName"));
            albumService.save(album);
        } catch (IOException e) {
            e.printStackTrace();
        }
        model.addAttribute("parentList",menuService.findParentMenu());
        return "/admin/album/save";
    }

    @RequestMapping (value = "/list/{menuName}")
    public String list(@PathVariable("menuName") String menuName,
                            @RequestParam(value = "page", defaultValue = "1") int pageNumber,
                            Model model) {
        String menu;
        if (menuName.equalsIgnoreCase("CorporateBusiness")){
            menu = "Corporate & Business";
        } else {
            menu = menuName;
        }
        Page<Album> albums = albumService.findByParentMenu(menu, pageNumber, PAGE_SIZE);
        model.addAttribute("albums", albums);
        return "admin/album/list";
    }

    @RequestMapping (value = "/delete/{albumid}/{menuName}", method = RequestMethod.GET)
    public String delete(@PathVariable("albumid") Long albumid,
                         @PathVariable("menuName") String menuName,@RequestParam(value = "page", defaultValue = "1") int pageNumber,
                         Model model) {
        // 查找相册下的所有照片，删除物理文件和数据库记录
        List<Picture> pictureList = pictureService.findByAlbumId(albumid);
        if (pictureList.size() > 0 ) {
            String imagePath,originName,sliderName,thumbName;
            File willDeleteFile;
            for (Picture picture : pictureList){
                imagePath = picture.getImagePath();
                originName = picture.getOriginName();
                sliderName = picture.getSliderName();
                thumbName = picture.getThumbName();
                willDeleteFile = new File(imagePath+originName);
                if (!willDeleteFile.isDirectory()){
                    willDeleteFile.delete();
                }
                willDeleteFile = new File(imagePath+sliderName);
                if (!willDeleteFile.isDirectory()){
                    willDeleteFile.delete();
                }
                willDeleteFile = new File(imagePath+thumbName);
                if (!willDeleteFile.isDirectory()){
                    willDeleteFile.delete();
                }
                // 删除数据库中的记录
                pictureService.delete(picture.getId());
            }
        }
        //删除相册记录
        albumService.delete(albumid);
        Page<Album> albums = albumService.findByParentMenu(menuName, pageNumber, PAGE_SIZE);
        model.addAttribute("albums", albums);
        return "/admin/album/list";
    }

    @Autowired
    public void setAlbumService(AlbumService albumService) {
        this.albumService = albumService;
    }

    @Autowired
    public void setMenuService(MenuService menuService) {
        this.menuService = menuService;
    }

    @Autowired
    public void setPictureService(PictureService pictureService) {
        this.pictureService = pictureService;
    }
}
