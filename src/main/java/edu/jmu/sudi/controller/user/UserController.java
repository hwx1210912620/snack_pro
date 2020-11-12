package edu.jmu.sudi.controller.user;

import com.alibaba.fastjson.JSON;
import edu.jmu.sudi.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    /**
     * 用户登录
     * @param username
     * @param password
     * @param session
     * @return
     */
    @ResponseBody
    @RequestMapping("/login")
    public String login(String username, String password, HttpSession session){
        Map<String, Object> map = userService.login(username, password, session);
        return JSON.toJSONString(map);
    }

    /**
     * 退出登录
     * @param session
     * @return
     */
    @RequestMapping("/exit")
    public String exit(HttpSession session){
        userService.exit(session);
        return "redirect:/login.html";
    }
}
