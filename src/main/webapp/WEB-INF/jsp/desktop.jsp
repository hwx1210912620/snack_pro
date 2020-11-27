<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <meta charset="utf-8">
        <title>首页</title>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/plugins/layui/lib/layui-v2.5.5/css/layui.css" media="all">
    </head>
    <body>
        <%-- 轮播图区域 --%>
        <div class="layui-carousel" id="test1">
            <div carousel-item>
                <div><a><img src="${pageContext.request.contextPath}/static/resources/images/banner1.png"></a></div>
                <div><a><img src="${pageContext.request.contextPath}/static/resources/images/banner2.png"></a></div>
                <div><a><img src="${pageContext.request.contextPath}/static/resources/images/banner3.png"></a></div>
                <div><a><img src="${pageContext.request.contextPath}/static/resources/images/banner4.png"></a></div>
                <div><a><img src="${pageContext.request.contextPath}/static/resources/images/banner5.png"></a></div>
            </div>
        </div>



    </body>
    <script src="${pageContext.request.contextPath}/static/plugins/layui/lib/layui-v2.5.5/layui.js" charset="utf-8"></script>
    <script>
        layui.use('carousel', function(){
            var carousel = layui.carousel;

            //建造实例
            carousel.render({
                elem: '#test1'
                ,width: '100%' //设置容器宽度
                ,arrow: 'always' //始终显示箭头
                //,anim: 'updown' //切换动画方式
            });
        });
    </script>

</html>
