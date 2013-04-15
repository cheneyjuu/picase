package com.jcteam.picase.web.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created with IntelliJ IDEA.
 * User: juchen
 * Date: 13-4-12
 * Time: 下午1:51
 * To change this template use File | Settings | File Templates.
 */
@Controller
public class IndexController {

    @RequestMapping (value = "admin/index")
    public String index(){
        return "/admin/index";
    }
}
