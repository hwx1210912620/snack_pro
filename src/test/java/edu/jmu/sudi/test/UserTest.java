package edu.jmu.sudi.test;

import edu.jmu.sudi.controller.user.UserManageController;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:applicationContext-service.xml", "classpath:applicationContext-dao.xml"})//用配置文件形式
public class UserTest {

    /**
     * 用户角色授权测试方法
     */
    @Test
    public void test1(){
        UserManageController controller = new UserManageController();
        String roleListByUserId = controller.findRoleListByUserId((long) 1);
        System.out.println(roleListByUserId);

    }

}
