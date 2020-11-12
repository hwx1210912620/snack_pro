package edu.jmu.sudi.dao;

import edu.jmu.sudi.entity.UserEntity;
import edu.jmu.sudi.vo.UserVo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserMapper {

    /**
     * 根据用户名查询用户信息
     * @param username
     * @return
     */
    public UserEntity findUserByUsername(String username);

    /**
     * 设置用户登录成功后的信息记录，如登入时间，登录次数+1等
     * @param userId
     * @return
     */
    public Integer setLoginSuccessInfo(Long userId);

    /**
     * 设置用户退出登录后的信息记录，如登出时间
     * @param userId
     * @return
     */
    public Integer setLogoutSuccessInfo(Long userId);

    /**
     * 根据页面条件查询用户列表
     * @param vo
     * @return
     */
    public List<UserEntity> findUserListByPage(UserVo vo);

    /**
     * 后台添加用户
     * @param vo
     * @return
     */
    public Integer addUser(UserVo vo);

    /**
     * 后台修改用户信息
     * @param vo
     * @return
     */
    public Integer modifyUserBackstage(UserVo vo);

    /**
     * 重置用户密码
     * @param userId
     * @param newPassword
     * @return
     */
    public Integer resetPassword(@Param("userId") Long userId, @Param("newPassword") String newPassword);
}
