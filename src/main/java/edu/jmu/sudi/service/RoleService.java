package edu.jmu.sudi.service;

import edu.jmu.sudi.utils.LayuiTableDataResult;
import edu.jmu.sudi.vo.RoleVo;

import javax.servlet.http.HttpSession;
import java.util.Map;

public interface RoleService {

    /**
     * 根据页面的条件查询角色列表
     * @param vo
     * @return
     */
    public LayuiTableDataResult findRoleListByPage(RoleVo vo);

    /**
     * 添加角色
     * @param vo
     * @param session
     * @return
     */
    public Map<String, Object> addRole(RoleVo vo, HttpSession session);

    /**
     * 编辑角色信息
     * @param vo
     * @param session
     * @return
     */
    public Map<String, Object> modifyRole(RoleVo vo, HttpSession session);
}
