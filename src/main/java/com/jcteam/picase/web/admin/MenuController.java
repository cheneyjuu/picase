package com.jcteam.picase.web.admin;

import com.jcteam.picase.entity.Menu;
import com.jcteam.picase.service.admin.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * User: juchen
 * Date: 13-4-13
 * Time: 下午4:14
 */
@Controller
@RequestMapping (value = "/admin/menu")
public class MenuController {

    private MenuService menuService;

    @RequestMapping (value = "/parentMenu")
    @ResponseBody
    public List<Menu> getParentMenu() {
        return menuService.findParentMenu();
    }

    @RequestMapping (value = "/childMenu")
    @ResponseBody
    public List<Menu> getChildMenu(@RequestParam("parentMenu") String parentMenu) {
        System.out.println(parentMenu);
        if (parentMenu.equalsIgnoreCase("CorporateBusiness")){
            parentMenu = "Corporate & Business";
        }
        return menuService.findChildMenu(parentMenu);
    }

    @Autowired
    public void setMenuService(MenuService menuService) {
        this.menuService = menuService;
    }
}
