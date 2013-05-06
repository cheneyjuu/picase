package com.jcteam.picase.web.admin;

import com.jcteam.picase.entity.About;
import com.jcteam.picase.service.admin.AboutService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;

/**
 * Created with IntelliJ IDEA.
 * User: chen
 * Date: 13-1-18
 * Time: 下午3:09
 */
@Controller
public class AboutController {

    @Autowired
    private AboutService aboutService;

    @RequestMapping (value = "/admin/about/add")
    public String add(Model model){
        About about = aboutService.findAbout();
        model.addAttribute("about",about);
        return "/admin/about/add";
    }

    @RequestMapping (value = "/admin/about/save")
    public String save(@Valid About about, RedirectAttributes redirectAttributes){
        aboutService.addAbout(about);
        redirectAttributes.addFlashAttribute("message","新增成功");
        return "redirect:/admin/about/add";
    }

    @RequestMapping (value = "/aboutus")
    public String aboutUs(Model model){
        About aboutus = aboutService.findAbout();
        model.addAttribute("aboutus", aboutus);
        return "/user/about";
    }
}
