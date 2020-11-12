package edu.jmu.sudi.dao;

import edu.jmu.sudi.entity.RoleEntity;
import edu.jmu.sudi.vo.RoleVo;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface RoleMapper {

    /**
     * 根据页面的条件查询角色列表
     * @param vo
     * @return
     */
    public List<RoleEntity> findRoleListByPage(RoleVo vo);

    /**
     * 添加角色
     * @param vo
     * @return
     */
    public Integer addRole(RoleVo vo);

    /**
     * 编辑角色信息
     * @param vo
     * @return
     */
    public Integer modifyRole(RoleVo vo);

    /**
     * 查询所有角色列表，返回map集合
     * @return
     */
    public List<Map<String, Object>> findRoleListMap();
}
