# sudi

#### 介绍
毕业设计项目——宿递大学生食堂外卖点餐系统

#### 技术选型

    开发系统：Windows 7
    开发语言：Java
    开发编辑器：IntelliJ IDEA 2020.1.3
    数据库及GUI工具：MySQL Server 5.5，SQLyog
    数据库连接池：Druid连接池
    Web容器：Tomcat 9.0.27
    前端技术：HTML，CSS，JavaScript，AJAX
    前端框架：jQuery，BootStrap，LayUI，LayUImini
    数据交换载体：JSON
    后端技术：Servlet，JSP，JDBC
    后端框架：SpringMVC，Spring，MyBatis
    测试框架：Junit4
    测试工具：Apache JMeter 5.4
    项目管理工具：Maven
    代码托管技术及代码托管平台：Git、Gitee码云、GitHub

#### 项目文件结构说明

database：数据库文件
src：项目源码
    main：主要源码包
        java：Java源码包
            edu.jmu.sudi
                controller：控制器包（下属各个功能模块子包）
                dao：持久层映射接口包
                entity：实体类包（即domain或POJO）
                interceptor：拦截器包
                service：业务逻辑层包
                    impl：业务逻辑层接口实现类包
                utils：工具包
                vo：ViewObject实体类视窗包
        resources：项目配置文件以及映射文件包（附MyBatis映射文件）
        webapp：网页文件包
            WEB-INF：系统动态资源文件及网络项目配置包
                jsp：JSP页面代码包（下属各个功能模块子包）
            static：静态资源文件包
                pages：静态页面包（异常报错友好提示页面）
                plugins：静态资源插件包
                    Ruidan_Page：瑞丹网页样式
                    echarts：Apache ECharts数据可视化库插件
                    jquery_sku：基于jquery的sku规格输入插件
                    layui：layui框架
                    layui_ext：基于LayUI的扩展插件
                    layui_inputTag：基于LayUI的规格输入框插件
                    productStore：productStore网页样式
                resources：本项目静态资源包
                    css：本项目CSS文件
                    images：本项目基础图片包
    test：测试代码包
        edu.jmu.sudi.test：主要测试包
target：编译字节码文件包

#### 使用说明

1.  安装Java并配置环境变量的微机
2.  安装Tomcat且版本号7以上，安装MySQL且版本号5.7及以上
3.  将项目部署后运行数据库文件（database/sudi_database_all.sql）
4.  由于项目未部署与云服务器中，仅运行在本地Tomcat服务器，所以需要手动在D盘的目录下新建一个d:/sudi_data/upload文件夹用于存储项目的上传图片
4.  运行项目即可




