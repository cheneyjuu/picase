package com.jcteam.picase.web.user;

import com.jcteam.picase.entity.Picture;
import com.jcteam.picase.service.admin.PictureService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

/**
 * User: juchen
 * Date: 13-4-18
 * Time: 下午3:15
 */
@Controller
@RequestMapping (value = "/picture")
public class UserPictureController {

    private PictureService pictureService;

    @RequestMapping (value = "list/{albumId}", method = RequestMethod.GET)
    public String list(@PathVariable("albumId") Long albumId, Model model) {
        List<Picture> pictureList = pictureService.findByAlbumId(albumId);
        model.addAttribute("pictureList", pictureList);
        return "user/picture/list";
    }

    @RequestMapping (value = "index", method = RequestMethod.GET)
    public String index(Model model) {
        List<Picture> pictureList = pictureService.findIndexPictureById();
        model.addAttribute("pictureList", pictureList);
        return "user/picture/list";
    }

    @Autowired
    public void setPictureService(PictureService pictureService) {
        this.pictureService = pictureService;
    }
}
