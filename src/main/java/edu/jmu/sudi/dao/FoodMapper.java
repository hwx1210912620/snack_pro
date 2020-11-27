package edu.jmu.sudi.dao;

import edu.jmu.sudi.entity.FoodEntity;
import edu.jmu.sudi.vo.FoodVo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 菜品SPU管理持久层
 * @author LiangJie
 */
@Repository
public interface FoodMapper {

    /**
     * 根据页面条件查询菜品SPU信息列表
     * @param vo
     * @return
     */
    public List<FoodEntity> findFoodListByPage(FoodVo vo);

    /**
     * 添加菜品SPU信息
     * @param vo
     * @return
     */
    public Integer addFood(FoodVo vo);

    /**
     * 修改菜品SPU信息
     * @param vo
     * @return
     */
    public Integer modifyFood(FoodVo vo);

    /**
     * 菜品上架
     * @param foodId
     * @param username
     * @return
     */
    public Integer foodOnShelf(@Param("foodId") Long foodId, @Param("username") String username);

    /**
     * 删除菜品SPU
     * @param foodId
     * @return
     */
    public Integer deleteFood(Long foodId);

    /**
     * 菜品下架
     * @param foodId
     * @param username
     * @return
     */
    public Integer foodOffShelf(@Param("foodId") Long foodId, @Param("username") String username);
}
