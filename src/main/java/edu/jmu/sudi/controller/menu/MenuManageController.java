package edu.jmu.sudi.controller.menu;

import com.alibaba.fastjson.JSON;
import edu.jmu.sudi.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.io.Serializable;
import java.util.Map;

@RestController
@RequestMapping("/backstage/menu")
public class MenuManageController {

    @Autowired
    private MenuService menuService;

    /**
     * 查询左侧菜单栏导航列表
     * @return
     */
    @RequestMapping("/loadMenuList")
    public String loadMenuList(HttpServletRequest request){
        Map<String, Object> initJson = menuService.loadMenuList(request);
        return JSON.toJSONString(initJson);
    }

}
