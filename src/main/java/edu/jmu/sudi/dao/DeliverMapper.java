package edu.jmu.sudi.dao;

import edu.jmu.sudi.entity.DeliverEntity;
import org.apache.ibatis.annotations.Param;

public interface DeliverMapper {

    /**
     * 根据用户ID查找配送员
     * @param userId
     * @return
     */
    public Integer findDeliverByUserId(Long userId);

    /**
     * 将用户设置为配送员
     * @param deliverId
     * @param userId
     * @return
     */
    public Integer addDeliver(@Param("deliverId") String deliverId, @Param("userId") Long userId);
}
