package com.jcteam.picase.web.admin;

import com.jcteam.picase.entity.Album;
import com.jcteam.picase.entity.Menu;
import com.jcteam.picase.service.admin.AlbumService;
import com.jcteam.picase.service.admin.MenuService;
import com.jcteam.picase.utility.HandlerUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import javax.validation.Valid;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

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

    @RequestMapping (value = "/save", method = RequestMethod.GET)
    public String toSave(Model model) {
        model.addAttribute("parentList",menuService.findParentMenu());
        return "admin/album/save";
    }

    @RequestMapping (value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public String save(@Valid Album album) {
        if (album.getParentMenu().equalsIgnoreCase("CorporateBusiness")){
            album.setParentMenu("Corporate & Business");
        }
        if (album.getChildMenu().equalsIgnoreCase("Interiorsbuildings")){
            album.setChildMenu("Interiors & buildings");
        }
        albumService.save(album);
        return null;
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

    @Autowired
    public void setAlbumService(AlbumService albumService) {
        this.albumService = albumService;
    }

    @Autowired
    public void setMenuService(MenuService menuService) {
        this.menuService = menuService;
    }
}
