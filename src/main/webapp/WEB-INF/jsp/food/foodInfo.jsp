<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8" />
        <title>菜品详情</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/plugins/layui/lib/layui-v2.5.5/css/layui.css" media="all">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/plugins/layui/css/public.css" media="all">
        <link href="${pageContext.request.contextPath}/static/plugins/Ruidan_Page/css/style.css" type="text/css" rel="stylesheet">
        <script type="text/javascript" src="${pageContext.request.contextPath}/static/plugins/Ruidan_Page/js/-jquery-1.8.3.min.js"></script>
        <link href="${pageContext.request.contextPath}/static/plugins/Ruidan_Page/css/nav2.css" type="text/css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/static/plugins/Ruidan_Page/css/amazeui.min.css" rel="stylesheet" />
        <script src="${pageContext.request.contextPath}/static/plugins/Ruidan_Page/js/amazeui.min.js"></script>
        <link href="${pageContext.request.contextPath}/static/plugins/Ruidan_Page/css/fanda.css" type="text/css" rel="stylesheet">
        <script src="${pageContext.request.contextPath}/static/plugins/Ruidan_Page/js/MagicZoom.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/static/plugins/Ruidan_Page/js/ShopShow.js"></script>
        <script type="text/javascript">
            <!--
            var timeout         = 500;
            var closetimer		= 0;
            var ddmenuitem      = 0;
            // open hidden layer
            function mopen(id)
            {
                // cancel close timer
                mcancelclosetime();
                // close old layer
                if(ddmenuitem) ddmenuitem.style.visibility = 'hidden';
                // get new layer and show it
                ddmenuitem = document.getElementById(id);
                ddmenuitem.style.visibility = 'visible';
            }
            // close showed layer
            function mclose()
            {
                if(ddmenuitem) ddmenuitem.style.visibility = 'hidden';
            }
            // go close timer
            function mclosetime()
            {
                closetimer = window.setTimeout(mclose, timeout);
            }
            // cancel close timer
            function mcancelclosetime()
            {
                if(closetimer)
                {
                    window.clearTimeout(closetimer);
                    closetimer = null;
                }
            }
            // close layer when click-out
            document.onclick = mclose;
            // -->
        </script>
        <style>
            .one_qcode{
                position:absolute;
                top:190px;
                width:200px;
                height:180px;
                background:#fff;
                text-align:center;
                color:#000;
                z-index:200;
            }
            .one_qcode img{
                margin:0 auto;
            }
        </style>
    </head>
    <body>
        <div id="view"></div>

        <div class="qing banq" style="margin-bottom:20px;">闽ICP备201721086021号 Copyright 宿递By <font color="#1aa094"><b>LiangJ</b></font>，All Rights Reserved</div>
    </body>
    <script id="demo" type="text/html">
        <!--页面标题 -->
        <div class="qing juzhong prbg" style="position: relative;">
            <div class=" lf pro" style="width:410px;margin-left:20px;margin-right:30px;overflow: initial;">
                <!--演示内容开始-->
                <div id="tsShopContainer" style="height: 346px;position: relative;">
                    <div id="tsImgS" style="height: 100%;position: absolute;top: 14%;">
                        {{# var foodImage = "${pageContext.request.contextPath}/upload/" + d.list.foodSpu.foodImage; }}
                        <a href="javascript:void(0)" title="Images" class="MagicZoom" id="MagicZoom">
                            <img style="width:100%;height:100%;" src={{ foodImage }} />
                        </a>
                    </div>
                </div>
                <!--演示内容结束-->
            </div>
            <div style="position: absolute;right: 28px;top: 28px;">
                <a href="${pageContext.request.contextPath}/reception/foodCenter.html">
                    <button type="button" class="layui-btn layui-btn-primary" style="width: 80px;padding-right: 25px;">返 回<i class="layui-icon layui-icon-right" style="position: absolute;top: 2px;right: 5px;"></i></button>
                </a>
            </div>
            <style>
                .guige{ width:100%; overflow:hidden; margin-bottom:10px;}
                .guige a{ float:left; width:80px; line-height:30px; border:1px solid #ccc; color:#555; margin:0 5px 5px 0px; text-align:center;}
                .guige .selected{border:1px solid #1e9fff; color:#1e9fff;}
            </style>
            <div class="lf pryo">
                <div class="pr-ti">{{ d.list.foodSpu.foodName }}</div>
                <div class="pr-jgk">
                    <div class="pr-jti" style="height: 28px;">
                        <b>价格：</b>￥<span id="skuPrice">{{ d.list.foodSkuList[0].skuPrice }}</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>已售<span id="skuSale">{{ d.list.foodSkuList[0].skuSale }}</span>件</strong>
                    </div>
                </div>
                <div class="qing">
                    <div class="guige">
                        <span class="lf sul">{{ d.list.foodvalueList[0].foodattrName }}&nbsp;&nbsp;：</span>
                        {{# layui.each(d.list.foodSkuList, function(index, foodsku){
                                var skuName = foodsku.skuName.split("(")[1];
                                skuName = skuName.substr(0, skuName.length-1);
                                var checkClass = "";
                                if(index == 0){
                                    checkClass += " selected";
                                }
                                var skuId = "sku_" + foodsku.skuId; }}
                                <a href="javascript:void(0)" id={{ skuId }} class={{ checkClass }}>{{ skuName }}</a>
                        {{# }) }}

                    </div>
                    <span class="lf sul">数量&nbsp;&nbsp;：</span>
                    <div class="lf">
                        <div class="gw-sl0">
                            <a href="javascript:void(0)" class="gw-sl1 lf" id="reduce-btn">-</a>
                            <input name="shuliang" id="order_num" value="1" onkeyup="value=value.replace(/[^0-9]/g,'')" onblur="if(value=='') value=1">
                            <a href="javascript:void(0)" class="gw-sl2 rf" id="add-btn">+</a>
                        </div>
                    </div>
                </div>
                <div class="pr-jia">
                    <a href="javascript:void(0)" class="jiaj" id="addShopcart-btn">
                        <span>加入购物车</span>
                        <span>加入购物车</span>
                    </a>
                </div>
            </div>

        </div>
        <!--会员内容 -->
        <div class="qing juzhong">
            <div class="lf tu-prk" style="width: 100%;">
                <div class="tu-pr">
                    <div class="tu-pr-ti">
                        <a href="javascript:void(0)" name="q1" class="tinn">菜品信息</a>
                    </div>
                    <div class="qing cpxk shu12" style="padding: 22px 30px 0px;line-height: 28px;">
                        <p style="float:left;width:50%;display:inline-block;padding: 0px; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-size: 14px; white-space: normal;">
                            <font color="#1bac9f">【菜品名称】</font>{{ d.list.foodSpu.foodName }}
                        </p>
                        <p style="float:left;width:50%;display:inline-block;padding: 0px; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-size: 14px; white-space: normal;">
                            <font color="#1bac9f">【配料】</font>{{ d.list.foodSpu.foodIngredient }}
                        </p>
                        <p style="float:left;width:50%;display:inline-block;padding: 0px; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-size: 14px; white-space: normal;">
                            <font color="#1bac9f">【荤素类别】</font>{{ d.list.foodSpu.foodVegon }}
                        </p>
                        <p style="float:left;width:50%;display:inline-block;padding: 0px; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-size: 14px; white-space: normal;">
                            <font color="#1bac9f">【烹饪方式】</font>{{ d.list.foodSpu.foodCookWay }}
                        </p>
                        <p style="line-height:22px;padding: 0px; margin-top: 0px; margin-bottom: 0px; color: rgb(51, 51, 51); font-family: Arial, Helvetica, sans-serif; font-size: 14px; white-space: normal;">
                            <font color="#1bac9f">【菜品描述】</font>{{ d.list.foodSpu.foodDesc }}
                        </p>
                        <p><br></p>
                    </div>
                </div>

            </div>
        </div>

    </script>
    <script src="${pageContext.request.contextPath}/static/plugins/layui/lib/layui-v2.5.5/layui.js" charset="utf-8"></script>
    <script>
        //获取菜品编号参数
        var foodId = window.location.href.split("?")[1].split("=")[1];

        layui.use(['form', 'table', 'jquery', 'layer', 'laytpl'], function () {
            var $ = layui.jquery,
                layer = layui.layer,
                laytpl = layui.laytpl;

            /**
             * 请求后端访问该菜品的所有信息数据
             */
            $.post("${pageContext.request.contextPath}/reception/food/findFoodInfo", {foodId: foodId}, function (result) {
                /**
                 * 渲染模版
                 * @type {{title: string, list: *}}
                 */
                var templetData = { //数据
                    "title":"Layui常用模块"
                    ,"list":result
                }
                console.log(templetData);

                var getTpl = demo.innerHTML;
                var view = document.getElementById('view');
                laytpl(getTpl).render(templetData, function(html){
                    view.innerHTML = html;
                });

                /**
                 * 绑定菜品数量的添加和减少按钮点击事件
                 */
                $("#add-btn").click(function () {
                    $("#order_num").val(parseInt($("#order_num").val())+1);
                });
                $("#reduce-btn").click(function () {
                    if ($("#order_num").val() == 1){
                        $("#reduce-btn").css("disabled", "disabled");
                    }else {
                        $("#order_num").val(parseInt($("#order_num").val())-1);
                    }
                });

                /**
                 * 绑定SKU选项的点击事件
                 */
                $(".qing .guige a").click(function () {
                    $(".selected").removeClass("selected");
                    $(this).addClass("selected");
                    var skuId = $(this).attr("id").split("_")[1];
                    var skuInfo = templetData.list.foodSkuList.filter(function (sku) {
                        return sku.skuId==skuId;
                    });
                    $("#skuPrice").text(skuInfo[0].skuPrice);
                    $("#skuSale").text(skuInfo[0].skuSale);

                });

                /**
                 * 监听加入购物车点击事件
                 */
                $("#addShopcart-btn").click(function () {
                    var skuId = $(".selected").attr("id").split("_")[1];//获取skuId
                    var numCount = $("#order_num").val();//获取购买数量
                    var url = "${pageContext.request.contextPath}/reception/shopcart/add";
                    $.post(url, {skuId: skuId, numCount: numCount}, function (result) {
                        layer.msg(result.message);
                    }, "json");
                });



            }, "json");








        });
    </script>



</html>
