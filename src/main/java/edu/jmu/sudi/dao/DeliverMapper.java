package edu.jmu.sudi.dao;

import edu.jmu.sudi.entity.DeliverEntity;
import edu.jmu.sudi.entity.UserEntity;
import edu.jmu.sudi.vo.DeliverVo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 配送员Mapper接口
 * @author LiangJie
 */
@Repository
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

    /**
     * 将用户设置为配送员,传递更多的信息
     * @param vo
     * @return
     */
    public Integer addDeliverMoreInfo(DeliverVo vo);

    /**
     * 根据页面的条件查询配送员列表
     * @param vo
     * @return
     */
    public List<DeliverEntity> findDeliverListByPage(DeliverVo vo);

    /**
     * 查找不是配送员的用户
     * @return
     */
    public List<UserEntity> findUserListNotDeliver();

    /**
     * 修改配送员
     * @param vo
     * @return
     */
    public Integer modifyDeliver(DeliverVo vo);

    /**
     * 配送员离职
     * @param deliverId
     * @return
     */
    public Integer leaveDeliver(String deliverId);

    /**
     * 配送员复职
     * @param deliverId
     * @return
     */
    public Integer reJoinDeliver(String deliverId);

    /**
     * 查找最大接单数
     * @return
     */
    public Integer findMaxOrderCount();

    /**
     * 查找最大差评数
     * @return
     */
    public Integer findMaxFaultCount();

    /**
     * 查找最大结单数
     * @return
     */
    public Integer findMaxFinishCount();
}
