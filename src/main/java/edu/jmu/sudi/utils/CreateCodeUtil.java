package edu.jmu.sudi.utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

/**
 * 专门用于快速生成各种编号
 */
public class CreateCodeUtil {

    /**
     * 生成配送员唯一Id
     * @return  入职的时间到毫秒+两个随机数
     */
    public static String createDeliverId(){
        Random random = new Random();
        //获取当前时间
        Date date = new Date();
        String timeStr = new SimpleDateFormat("yyyyMMddHHmmss").format(date);
        String endNum = random.nextInt(9) + "" + random.nextInt(9);
        return timeStr + "" + endNum;
    }



}
