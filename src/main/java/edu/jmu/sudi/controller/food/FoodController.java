package edu.jmu.sudi.controller.food;

import com.alibaba.fastjson.JSON;
import edu.jmu.sudi.entity.FoodEntity;
import edu.jmu.sudi.entity.FoodTypeEntity;
import edu.jmu.sudi.service.FoodService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

/**
 * 前台点餐中心控制器
 * @author LiangJie
 */
@Controller
@RequestMapping("/reception/food")
public class FoodController {

    @Autowired
    private FoodService foodService;

    /**
     * 查找所有上架类别的所有上架菜品
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/findFoodType", produces = "application/json;charset=utf-8")
    public String findFood(){
        List<FoodTypeEntity> foodTypeList = foodService.findFoodType();
        return JSON.toJSONString(foodTypeList);
    }

    /**
     * 根据类别ID查询上架菜品
     * @param typeId
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/findFood", produces = "application/json;charset=utf-8")
    public String findOnshelfFoodByType(Long typeId){
        List<FoodEntity> onshelfFoodByType = foodService.findOnshelfFoodByType(typeId);
        return JSON.toJSONString(onshelfFoodByType);
    }

    /**
     * 根据菜品编号查询所有菜品信息
     * @param foodId
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/findFoodInfo", produces = "application/json;charset=utf-8")
    public String findFoodInfoById(Long foodId){
        Map<String, Object> foodInfo = foodService.findFoodInfoById(foodId);
        return JSON.toJSONString(foodInfo);
    }

}
