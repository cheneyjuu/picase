package com.jcteam.picase.web.user;

import com.jcteam.picase.entity.Album;
import com.jcteam.picase.service.admin.AlbumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

/**
 * User: juchen
 * Date: 13-4-17
 * Time: 下午8:36
 */
@Controller
@RequestMapping (value = "/album")
public class UserAlbumController {

    private static final int PAGE_SIZE = 12;
    private AlbumService albumService;

    @RequestMapping (value = "list/{parentMenu}", method = RequestMethod.GET)
    public String list(@PathVariable("parentMenu") String parentMenu,
                       @RequestParam(value = "page", defaultValue = "1") int pageNumber,
                       Model model) {
        String pmenu = null, cmenu = null;
        String[] menus = parentMenu.split("-");
        if (menus.length > 1) {
            if (menus[0].equalsIgnoreCase("CorporateBusiness")) {
                pmenu = "Corporate & Business";
            } else {
                pmenu = menus[0];
            }
            if (menus[1].equalsIgnoreCase("Interiorsbuildings")) {
                cmenu = menus[1];
            } else {
                cmenu = menus[1];
            }
        } else {
            if (menus[0].equalsIgnoreCase("CorporateBusiness")) {
                pmenu = "Corporate & Business";
            } else {
                pmenu = menus[0];
            }
        }
//        if (parentMenu.equalsIgnoreCase("CorporateBusiness")){
//            pmenu = "Corporate & Business";
//        } else {
//            pmenu = parentMenu;
//        }
//        if (childMenu.equalsIgnoreCase("Interiorsbuildings")) {
//            cmenu = "Interiors & buildings";
//        } else {
//            cmenu = childMenu;
//        }
        Page<Album> albums = albumService.findbyParentAndChildMenu(pmenu, cmenu, pageNumber, PAGE_SIZE);
        model.addAttribute("albums", albums);
        return "user/album/list";
    }

    @Autowired
    public void setAlbumService(AlbumService albumService) {
        this.albumService = albumService;
    }
}
