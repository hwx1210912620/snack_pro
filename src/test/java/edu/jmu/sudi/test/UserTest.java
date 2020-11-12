package edu.jmu.sudi.test;

import edu.jmu.sudi.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Map;

@RunWith(SpringJUnit4ClassRunner.class)
//用配置文件形式
@ContextConfiguration({"classpath:applicationContext-dao.xml",
                        "classpath:applicationContext-service.xml",
                        "classpath:SqlMapConfig.xml"
                        })
public class UserTest {

    @Autowired
    private UserService userService;

    /**
     * 测试删除用户
     */
    @Test
    public void test1(){
        Map<String, Object> map = userService.deleteUser((long) 14);
        System.out.println(map);
    }

}
