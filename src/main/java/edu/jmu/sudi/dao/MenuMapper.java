package edu.jmu.sudi.dao;

import edu.jmu.sudi.entity.MenuEntity;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MenuMapper {

    /**
     * 查询所有菜单列表
     * @return
     */
    public List<MenuEntity> findMenuList();
}
