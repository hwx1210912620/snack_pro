# SUDI_宿递

### · 介绍

 **毕业设计项目——宿递大学生食堂外卖点餐系统** <br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;随着近年来我国经济社会的不断发展，当代大学生的物质生活需求不断的提高，传统的大学生食堂在餐饮服务方面似乎愈发的难以跟上时代的脚步，传统的服务无法满足大学生日益增长的需求。该现象进而引发了很多大学生宁可选择优惠力度较大且方便实惠还可以送货上门的第三方外卖，也不愿意从宿舍楼走到食堂去排队用餐。该现象不仅让食堂的营业日渐冷清，更重要的是一些三无牌照的小作坊利用了第三方外卖平台的监管不力漏洞正在向大学生提供外卖服务，危害大学生的身心健康。据安徽财经大学的一份针对230名学生的抽样统计报告显示，大学生订购外卖已经成为常态化，每月订购1-5次外卖的大学生占比49.48%，每月订购5-10次外卖的大学生占比18.23%，每月订购10次以上外卖的大学生占比14.58%，一个月内没有订外卖的占比17.71%，这些数据都充分说明了大学生对于外卖的较大需求量，配送至宿舍的外卖营业模式在大学中有极好的消费前景。<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;如果大学食堂也推出外卖的服务将能够极大的发挥自身在食品安全保障以及配送范围确定的优势，弥补当前大学生餐饮服务的诸多问题。食堂还能够通过线上的点餐平台积极与用餐的学生进行互动，了解学生的所想及反馈，不断提升自身的服务水平，反省自身存在的不足，那么大学食堂在校园餐饮行业的竞争力也将大大提高。<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;本系统将致力于从食堂管理、配送员配送、用户体验的角度，通过对整个外卖流程的管控解决上文所描述的问题。其中，食堂方面对配送员进行实名管控并且推出用户投诉中心的功能能够让用户与食堂之间的互动更多，优惠券可以让食堂在与如饿了么等第三方外卖平台的优惠竞争中进行对标。宿递外卖平台系统通过Java编程语言，对上述问题进行了网站的开发，致力于推动大学生食堂外卖行业的不断推广与完善。<br>
<br><br>
### · 技术选型

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
<br><br>
### · 系统亮点（相较于大学生常规课程设计）

（1） **全系统无刷新** ：宿递整个系统采用了无刷新的方式，用户在使用的过程中将不会遇到浏览器页面级别的操作，所有的跳转都基于iFrame内联框架进行。全系统全程采用了AJAX异步请求操作，摒弃了同步请求中用户等待而无法进行操作的问题，提升了用户的体验。前后端之间的数据传递采用流行的JSON格式，数据包精简且高效。在后端的SpringMVC接取数据方面，我使用了@RestController注解，该注解能够使控制器无刷新回写数据，配合前后端缩短系统响应的等待时间，让用户体验更佳。<br>
（2） **摒弃JSP，实现前后端技术分离** ：传统JSP项目前后端技术代码杂糅问题较为严重，宿递系统的解决方案是使用基于LayUI提供的模板引擎插件，配合Ajax以及JSON，以纯JavaScript的原生方式进行数据的传递及显示。<br>
（3） **用户角色权限控制** ：每个角色对应有其能够操作的菜单面板权限范围，一个用户允许有多个角色。当用户登录的时候会根据其对应的角色显示对应的菜单，以此来达到权限控制，将前后台合并压缩系统的规模，提升效能。<br>
（4） **初级SPU、SKU机制** ：宿递系统初步使用了SPU、SKU机制，能够更好的对菜品进行管理，以规格的方式快速的区分用户的下单菜品以及点餐中心的展示菜品之间的区别和联系。<br>
<br><br>
### · 项目文件结构说明

![输入图片说明](https://images.gitee.com/uploads/images/2020/1223/160337_eb9c9e04_7848439.png "Snipaste_2020-12-23_16-03-08.png")
<br><br><br>
### · 使用说明

1.  安装Java并配置环境变量的微机
2.  安装Tomcat且版本号7以上，安装MySQL且版本号5.7及以上
3.  将项目部署后运行数据库文件（database/sudi_database_all.sql）
4.  由于项目未部署于云服务器中，仅运行在本地Tomcat服务器，所以需要手动在D盘的目录下新建一个d:/sudi_data/upload文件夹用于存储项目的上传图片
4.  运行项目即可
<br><br><br>
### · 系统功能模块

![输入图片说明](https://images.gitee.com/uploads/images/2020/1223/161902_9e7b8306_7848439.png "Snipaste_2020-12-23_16-03-08.png")
<br><br><br>
### · UML——实体类图

![输入图片说明](https://images.gitee.com/uploads/images/2020/1223/162118_63d0cd73_7848439.png "Snipaste_2020-12-23_16-03-08.png")
<br><br><br>
### · 系统局部截图

![输入图片说明](https://images.gitee.com/uploads/images/2020/1223/163548_bf595fb5_7848439.png "Snipaste_2020-12-23_16-22-46.png")


# snackPro
