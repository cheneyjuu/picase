package com.jcteam.picase.web.admin;

import com.jcteam.picase.entity.Album;
import com.jcteam.picase.entity.Picture;
import com.jcteam.picase.service.admin.AlbumService;
import com.jcteam.picase.service.admin.PictureService;
import com.jcteam.picase.utility.HandlerUpload;
import com.jcteam.picase.utility.ImageTools;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
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
 * Date: 13-4-14
 * Time: 下午12:37
 */
@Controller
@RequestMapping(value = "/admin/picture")
public class PictureController {

    private static int PAGE_SIZE=12;
    private PictureService pictureService;
    private AlbumService albumService;

    @RequestMapping(value = "save/{id}", method = RequestMethod.GET)
    public String toSave(@PathVariable("id") Long id, Model model) {
        model.addAttribute("albumid", id);
        return "admin/picture/save";
    }

    @RequestMapping(value = "upload", method = RequestMethod.POST)
    public String save(@RequestParam("intro") String intro,
                       @RequestParam("file") MultipartFile[] files,
                       @Valid @ModelAttribute("preloadAlbum") Album album,
                       HttpServletRequest request) {
        HandlerUpload handlerUpload = new HandlerUpload();
        Map<String, String> fileNameAndPathMap = null;
        try {
            for(MultipartFile file : files){
                InputStream iis = file.getInputStream();
                BufferedImage bi = ImageIO.read(iis);
                int originHeight = bi.getHeight();//高
                int originWidth = bi.getWidth();//宽
                int sliderWidth,sliderHeight;
                int thumbWidth,thumbHeight;
                sliderWidth = originWidth>480?480:originWidth;
                sliderHeight = originHeight>830?830:originHeight;
                thumbWidth = originWidth>260?260:originWidth;
                thumbHeight = originHeight>180?180:originHeight;
                fileNameAndPathMap = handlerUpload.uploadFile(file,request);
                Picture picture = new Picture();
                picture.setIntro(intro);
                picture.setAlbum(album);
                picture.setImagePath(fileNameAndPathMap.get("filePath"));
                //  真实路径
                String realPath = request.getSession().getServletContext().getRealPath(fileNameAndPathMap.get("filePath"))+"/";
                File inFile = new File(realPath+fileNameAndPathMap.get("fileName"));
                File sliderFile = new File(realPath+"s_"+fileNameAndPathMap.get("fileName"));
                File thumbFile = new File(realPath+"t_"+fileNameAndPathMap.get("fileName"));
                ImageTools.convert(inFile, sliderFile, sliderWidth, sliderHeight, 90);
                ImageTools.convert(inFile, thumbFile, thumbWidth, thumbHeight, 90);
                picture.setOriginName(fileNameAndPathMap.get("fileName"));
                picture.setSliderName("s_"+fileNameAndPathMap.get("fileName"));
                picture.setThumbName("t_"+fileNameAndPathMap.get("fileName"));
                pictureService.save(picture);
            }

        } catch (IOException e) {
            e.printStackTrace();
        }
        return "";
    }

    @RequestMapping(value = "list/{menu}/{albumId}")
    public String list(@PathVariable("menu") String menu,
                       @PathVariable("albumId") Long albumId,
                       @RequestParam(value = "page", defaultValue = "1") int pageNumber,
                       Model model){
        String menus[] = menu.split("-");
        String parentMenu,childMenu;
        if (menus.length == 1) {
            parentMenu = menus[0];
            childMenu = null;
        } else {
            parentMenu = menus[0];
            childMenu = menus[1];
        }
        Page<Picture> picturePage = pictureService.findByMenu(parentMenu, childMenu, albumId, pageNumber, PAGE_SIZE);
        model.addAttribute("picturePage",picturePage);
        return "admin/picture/list";
    }

    @RequestMapping (value = "update", method = RequestMethod.POST)
    @ResponseBody
    public String update(@RequestParam("intro") String intro,
                         @RequestParam("pictureId") Long pictureId){
        Picture picture = pictureService.findById(pictureId);
        picture.setIntro(intro);
        pictureService.save(picture);
        return null;
    }

    @RequestMapping (value = "delete", method = RequestMethod.POST)
    @ResponseBody
    public String delete(@RequestParam("pictureId") Long pictureId) {
        pictureService.delete(pictureId);
        return null;
    }

    @ModelAttribute("preloadAlbum")
    public Album getAlbum(@RequestParam(value = "albumid", required = false) Long albumid) {
        if (albumid != null) {
            Album album =  albumService.findById(albumid);
            return album;
        }
        return null;
    }

    @Autowired
    public void setPictureService(PictureService pictureService) {
        this.pictureService = pictureService;
    }

    @Autowired
    public void setAlbumService(AlbumService albumService) {
        this.albumService = albumService;
    }
}
