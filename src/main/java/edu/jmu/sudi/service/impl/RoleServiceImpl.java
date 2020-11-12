package edu.jmu.sudi.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import edu.jmu.sudi.dao.RoleMapper;
import edu.jmu.sudi.entity.RoleEntity;
import edu.jmu.sudi.entity.UserEntity;
import edu.jmu.sudi.service.RoleService;
import edu.jmu.sudi.utils.LayuiTableDataResult;
import edu.jmu.sudi.utils.SystemConstant;
import edu.jmu.sudi.vo.RoleVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Transactional
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleMapper roleMapper;

    /**
     * 根据页面的条件查询角色列表
     * @param vo
     * @return
     */
    @Override
    public LayuiTableDataResult findRoleListByPage(RoleVo vo) {
        //设置分页信息
        PageHelper.startPage(vo.getPage(), vo.getLimit());
        //调用分页查询的方法
        List<RoleEntity> roleListByPage = roleMapper.findRoleListByPage(vo);
        //创建分页对象，将查询到的数据放进去
        PageInfo<RoleEntity> pageInfo = new PageInfo<>(roleListByPage);
        //返回数据
        return new LayuiTableDataResult(pageInfo.getTotal(), pageInfo.getList());
    }

    /**
     * 添加角色
     * @param vo
     * @param session
     * @return
     */
    @Override
    public Map<String, Object> addRole(RoleVo vo, HttpSession session) {
        Map<String, Object> map = new HashMap<>(16);
        //获取当前登录用户信息
        UserEntity userLogin = (UserEntity) session.getAttribute(SystemConstant.USERLOGIN);
        vo.setLastModifyBy(userLogin.getUsername());
        if (roleMapper.addRole(vo) >= 1) {
            map.put(SystemConstant.FLAG, true);
            map.put(SystemConstant.MESSAGE, "新增角色【" + vo.getRoleName() + "】成功");
        }else {
            map.put(SystemConstant.FLAG, false);
            map.put(SystemConstant.MESSAGE, "【" + vo.getRoleName() + "】角色新增失败");
        }
        return map;
    }

    /**
     * 编辑角色信息
     * @param vo
     * @param session
     * @return
     */
    @Override
    public Map<String, Object> modifyRole(RoleVo vo, HttpSession session) {
        Map<String, Object> map = new HashMap<>(16);
        String username = ((UserEntity) session.getAttribute(SystemConstant.USERLOGIN)).getUsername();
        vo.setLastModifyBy(username);
        if (roleMapper.modifyRole(vo) >= 1) {
            map.put(SystemConstant.FLAG, true);
            map.put(SystemConstant.MESSAGE, "角色【" + vo.getRoleName() + "】信息修改成功");
        }else {
            map.put(SystemConstant.FLAG, false);
            map.put(SystemConstant.MESSAGE, "角色【" + vo.getRoleName() + "】信息修改失败");
        }
        return map;
    }


}
