package edu.jmu.sudi.service;

import edu.jmu.sudi.dao.MenuMapper;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

public interface MenuService {

    /**
     * 加载左侧菜单栏的导航列表
     * @return
     */
    public Map<String, Object> loadMenuList(HttpServletRequest request);

}
