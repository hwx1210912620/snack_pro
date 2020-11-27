package edu.jmu.sudi.dao;

import org.apache.ibatis.annotations.Param;

/**
 * 菜品SKU持久层
 * @author LiangJie
 */
public interface FoodSkuMapper {

    /**
     * 新增菜品SKU
     * @param skuName
     * @return
     */
    public Integer addFoodSku(@Param("skuName") String skuName, @Param("foodId") Long foodId);

    /**
     * 查找某个菜品下的所有菜品SKU信息是否都已经完善
     * @param foodId
     * @return
     */
    public Integer findFoodSkuIsNull(Long foodId);

    /**
     * 删除某个菜品的所有SKU信息
     * @param foodId
     * @return
     */
    public Integer deleteFoodSkuByFoodId(Long foodId);

}
