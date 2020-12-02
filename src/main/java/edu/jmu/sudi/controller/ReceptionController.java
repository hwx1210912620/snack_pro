package edu.jmu.sudi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 系统控制器，专门用于控制页面的跳转，负责跳转前台页面
 */
@Controller
@RequestMapping("/reception")
public class ReceptionController {


    /**
     * 跳转到点餐中心
     * @return
     */
    @RequestMapping("/foodCenter.html")
    public String foodCenter(){
        return "food/foodCenter";
    }

    /**
     * 跳转到菜品详情页
     * @return
     */
    @RequestMapping("/foodInfo.html")
    public String foodInfo(){
        return "food/foodInfo";
    }

    /**
     * 跳转到购物车界面
     * @return
     */
    @RequestMapping("/shopcart.html")
    public String shopcart(){
        return "shopcart/shopcart";
    }

    /**
     * 跳转到优惠券商城页面
     * @return
     */
    @RequestMapping("/ticketShop.html")
    public String ticketShop(){
        return "ticket/ticketShop";
    }

}
