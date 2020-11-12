package edu.jmu.sudi.service.impl;

import edu.jmu.sudi.dao.MenuMapper;
import edu.jmu.sudi.entity.MenuEntity;
import edu.jmu.sudi.service.MenuService;
import edu.jmu.sudi.utils.MenuNode;
import edu.jmu.sudi.utils.TreeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service
@Transactional
public class MenuServiceImpl implements MenuService {

    @Autowired
    private MenuMapper menuMapper;

    /**
     * 加载左侧导航的菜单栏列表
     * @return
     */
    @Override
    public Map<String, Object> loadMenuList(HttpServletRequest request) {
        //创建两个个Map集合分别对应init.json模板中的logoInfo和homeInfo
        Map<String, Object> homeInfo = new HashMap<>(16);
        Map<String, Object> logoInfo = new HashMap<>(16);
        //创建一个总的map去存放三个map
        Map<String, Object> initJson = new HashMap<>(16);

        /*//调用根据用户Id查询其菜单列表的方法，得到菜单的list集合
        //List<MenuEntity> menuList = menuMapper.findMenuListByUserId(userId);*/
        List<MenuEntity> menuList = menuMapper.findMenuList();

        //创建一个List集合去保存菜单的节点
        List<MenuNode> menuNodeList = new ArrayList<>();
        //遍历循环菜单列表，目的是创建菜单之间的层级关系（一级菜单、二级菜单...）
        for (MenuEntity menu : menuList) {
            //创建一个节点工具类对象
            MenuNode menuNode = new MenuNode();
            menuNode.setId(menu.getId());
            menuNode.setPid(menu.getPid());
            menuNode.setTitle(menu.getTitle());
            menuNode.setHref(menu.getHref());
            menuNode.setSpread(menu.getSpread());
            menuNode.setIcon(menu.getIcon());
            //将节点添加到List集合中去
            menuNodeList.add(menuNode);
        }
        //将homeInfo的数据填入对应Map中
        homeInfo.put("title", "首页");
        homeInfo.put("href", "/backstage/desktop");
        //将logoInfo的数据填入对应Map中
        logoInfo.put("title", "宿递 · SUDI");
        logoInfo.put("image", request.getContextPath() + "/static/plugins/layui/images/sudilogo.png");
        logoInfo.put("href", request.getContextPath() + "/index.html");
        //将所有的数据全部添加到总的Map映射中去
        initJson.put("homeInfo", homeInfo);
        initJson.put("logoInfo", logoInfo);
        //将菜单节点层级关系的List集合转换为Map集合，第二个参数表示最高父级，写0就ok
        initJson.put("menuInfo", TreeUtil.toTree(menuNodeList, 0));
        return initJson;
    }
}
