package edu.jmu.sudi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 系统控制器，专门用于控制页面的跳转，负责跳转后台管理页面
 */
@Controller
@RequestMapping("/backstage")
public class BackstageController {

    /**
     * 跳转到用户管理界面
     * @return
     */
    @RequestMapping("/userManage.html")
    public String userManage(){
        return "user/userManage";
    }

    /**
     * 跳转到角色管理界面
     * @return
     */
    @RequestMapping("/roleManage.html")
    public String roleManage(){
        return "role/roleManage";
    }

}
