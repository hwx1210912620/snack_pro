package edu.jmu.sudi.test;

import edu.jmu.sudi.service.DeliverService;
import edu.jmu.sudi.service.UserService;
import edu.jmu.sudi.utils.CreateCodeUtil;
import edu.jmu.sudi.utils.UUIDUtil;
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
public class MySystemTest {

    @Autowired
    private UserService userService;
    @Autowired
    private DeliverService deliverService;

    /**
     * 测试删除用户
     */
    @Test
    public void test1(){
        Map<String, Object> map = userService.deleteUser((long) 14);
        System.out.println(map);
    }

    /**
     * 测试自动生成配送员编号
     */
    @Test
    public void test2(){
        //2020 1131 9150 3370
        //2020 1114 1504 5354
        //2020111610132217
        //2020111610150820
        //2020111610152351
        System.out.println(CreateCodeUtil.createDeliverId());
    }

    /**
     * 测试UUID怎么用
     */
    @Test
    public void test3(){
        //2a78f1a2-5b60-434b-b72b-71ad37027d6b
        //4edce847a7fd4852bc95ec0c792cdf1f
        System.out.println(UUIDUtil.randomUUID());
    }

    /**
     * 查找配送员的三个最大值
     */
    @Test
    public void test4(){
        Map<String, Object> max = deliverService.findMax();
        System.out.println(max);
    }
}
