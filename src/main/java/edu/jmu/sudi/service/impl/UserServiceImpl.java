package edu.jmu.sudi.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import edu.jmu.sudi.dao.UserMapper;
import edu.jmu.sudi.entity.UserEntity;
import edu.jmu.sudi.service.UserService;
import edu.jmu.sudi.utils.LayuiTableDataResult;
import edu.jmu.sudi.utils.SystemConstant;
import edu.jmu.sudi.vo.UserVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    /**
     * 用户登录方法，根据用户名和密码校验用户的信息是否正确
     * @return
     */
    @Override
    public Map<String, Object> login(String usernane, String password, HttpSession session) {
        Map<String, Object> map = new HashMap<>(16);
        UserEntity userLogin = userMapper.findUserByUsername(usernane);
        if (userLogin != null) {
            if (userLogin.getPassword().equals(password)){
                //登录通过，保存登录成功的信息
                userMapper.setLoginSuccessInfo(userLogin.getUserId());
                //将user信息保存到session中
                session.setAttribute(SystemConstant.USERLOGIN, userLogin);
                map.put(SystemConstant.LOGINFLAG, true);
            }else {
                //密码错误
                map.put(SystemConstant.LOGINFLAG, false);
                map.put(SystemConstant.MESSAGE, "密码错误！");
            }
        }else {
            //用户名不存在
            map.put(SystemConstant.LOGINFLAG, false);
            map.put(SystemConstant.MESSAGE, "用户名不存在！");
        }
        return map;
    }

    /**
     * 用户退出登录时的业务逻辑
     * @param session
     */
    @Override
    public void exit(HttpSession session) {
        UserEntity user = (UserEntity)session.getAttribute(SystemConstant.USERLOGIN);
        //保存用户登出信息
        userMapper.setLogoutSuccessInfo(user.getUserId());
        session.removeAttribute(SystemConstant.USERLOGIN);
    }

    /**
     * 根据页面条件查询用户列表
     * @param vo
     * @return
     */
    @Override
    public LayuiTableDataResult findUserListByPage(UserVo vo) {
        //设置分页信息
        PageHelper.startPage(vo.getPage(), vo.getLimit());
        //调用分页查询的方法
        List<UserEntity> userList = userMapper.findUserListByPage(vo);
        //创建分页对象，将查询到的数据放进去
        PageInfo<UserEntity> pageInfo = new PageInfo<>(userList);
        //返回数据
        return new LayuiTableDataResult(pageInfo.getTotal(), pageInfo.getList());
    }

    /**
     * 后台添加用户
     * @param vo
     * @return
     */
    @Override
    public Map<String, Object> addUser(UserVo vo) {
        //设置默认的用户初始密码
        vo.setPassword(SystemConstant.DEFAULTPASSWORD);
        Map<String, Object> map = new HashMap<>(16);
        if (userMapper.addUser(vo) >= 1){
            map.put(SystemConstant.FLAG, true);
            map.put(SystemConstant.MESSAGE, "添加用户成功");
        }else {
            map.put(SystemConstant.FLAG, false);
            map.put(SystemConstant.MESSAGE, "添加用户失败");
        }
        return map;
    }

    /**
     * 后台修改用户信息
     * @param vo
     * @return
     */
    @Override
    public Map<String, Object> modifyUserBackstage(UserVo vo) {
        Map<String, Object> map = new HashMap<>(16);
        if (userMapper.modifyUserBackstage(vo) >= 1){
            map.put(SystemConstant.FLAG, true);
            map.put(SystemConstant.MESSAGE, "修改用户成功");
        }else {
            map.put(SystemConstant.FLAG, false);
            map.put(SystemConstant.MESSAGE, "修改用户失败");
        }
        return map;
    }

    /**
     * 重置用户密码
     * @param userId
     * @return
     */
    @Override
    public Map<String, Object> resetPassword(Long userId) {
        Map<String, Object> map = new HashMap<>(16);
        if (userMapper.resetPassword(userId, SystemConstant.DEFAULTPASSWORD) >= 1){
            map.put(SystemConstant.FLAG, true);
            map.put(SystemConstant.MESSAGE, "用户密码重置成功");
        }else {
            map.put(SystemConstant.FLAG, false);
            map.put(SystemConstant.MESSAGE, "用户密码重置失败");
        }
        return map;
    }


}
