<%@page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@include file="common.jsp"%>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
    <base href="<%=basePath%>">
    <title>就医助手</title>
    <meta charset="UTF-8">
    <base target="_self">
    <link rel="stylesheet" href="css/index.css" />
    <script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>
    <script type="text/javascript">
        $(function (){
            $('#Llogin').click(function(){
                var n = $('#login_frm').find('#user').val();
                var p = $('#login_frm').find('#pwd').val();
                var y=$('#login_frm').find('#vericode').val();
                var s=$('#select').val();
                if(n==''){
                    alert('请输入用户名');
                }
                else if(p==''){
                    alert('请输入密码');
                }
                else if(y=='')
                {
                    alert('验证码不能为空');
                }
                else {
                    var postData = {'user': n, 'pwd': p, 'vericode': y,'flag':s};
                    $.ajax({
                        type: "POST",
                        url: 'user/login',
                        data: postData,
                        dataType: "json",
                        async: false,
                        error: function (request) {
                            alert("服务器异常,无法完成操作!");
                        },
                        success: function (data) {
                            if (data == '0') {
                                alert("恭喜你，登录成功!");
                                location.reload();
                            } else if (data == '1') {
                                alert("验证码错误!!!");
                            } else if(data=='3'){
                                alert("恭喜你，登录成功!");
                                location.href='/Hospital/user/admin';
                            }else if(data=='4'){
                                alert("请选择登录权限!!!");
                            }else{
                                alert("用户不存在或者用户名或密码错误,登录失败!!!");
                            }

                        }
                    });
                }
            });
        });

        $(function(){
            $('#querySearch').click(function(){
                $('#med_form').submit();
            });
        });

    </script>
</head>
<body>
<header id="fastTop" class="header">
    <div class="search_box">
            <span class="logo">
                <a href="">
                    <img src="images/jiuyizhushou.png"></a>
            </span>
        <div class="keyword">
            <form method="post" id="med_form" action="hospital/hospitalList" onKeyDown="if(event.keyCode==13)return false;">
                <input type="text" name="name" autocomplete="off" placeholder="请输入医院名称"
                       id="search-tips-input" value="">
                <button type="button"  onclick="$('#med_form').submit() " class="btn-doctor" id="querySearch">搜&nbsp;索</button>
            </form>
            <div class="search-suggest-layer" style="display: none; border: 1px #eaeaea solid; margin-top: -2px; width: 466px; background-color: #fff; border-bottom-left-radius: 4px; border-bottom-right-radius: 4px; position: absolute; z-index: 1;"></div>
        </div>
<%--        会话管理  如果session有记录 直接登录 如果没有 重新登录--%>
        <c:if test="${! empty sessionScope.user }">
            <span  style="margin-left:40px;line-height:32px;font-size: 15px">尊敬的用户<a href="user/commonUser" style="color: red">${sessionScope.user.name}</a>欢迎你！</span>
            &nbsp;&nbsp;<a href = "user/logout"><font color="blue">[退出登陆]</font></a>
        </c:if>
        <c:if test="${empty sessionScope.user}">
            <div class="login">
                <div class="my-doctor">
                    <div style="float: left;color:#2896f3;">
<%--                        action="user/login"--%>
                        <div id="login_frm"  method="post" style="display: block">
                            <div>&nbsp用户名：<input type="text" name="user" id="user" style="border: 1px solid #2896f3;height: 15px"/></div>
                            <div style="margin-top:2px">&nbsp密码：<input type="password" name="pwd" id="pwd" style="border: 1px solid #2896f3;height: 15px"/></div>
                            <div style="display: block;margin-top:1px;">
                                <div>验证码:
                                <input type="text" name="vericode" id="vericode" style="border: 1px solid #2896f3;height: 15px;width: 75px"/>
                                <img src="checkCode"  width="50" height="16" onclick="this.src=this.src+'?'">
                            </div>
                            <div style="float:left;padding-left: 12px;"></div>
                            </div>

                        </div>
                    </div>
                    <div style="float: right;line-height:30px;margin-left:10px">
                        <div><input type="button" value="登&nbsp;录" id="Llogin"
                                    style="width:60px;height:30px;cursor:pointer;border: 1px solid #2896f3;color:#2896f3;"></input>
                        </div>
                        <div style="position: absolute;top: 0px;left: 280px">
                            <a href="${pageContext.request.contextPath}/register.jsp">
                                <input type="button" value="注&nbsp;册" style="width:60px;height:30px;cursor:pointer;border: 1px solid #2896f3;color:#2896f3;"></input>
                            </a>
                        </div>
                        <div style="padding-top: 8px;color:#2896f3;">
                            <select id="select" style="border: 1px solid #2896f3;">
                                <option value="">权限选择</option>
                                <option value="0">管理员</option>
                                <option value="1">普通用户</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
        </c:if>
    </div>
</header>
<div class="banner">
    <div class="banner-content">
        <ul class="banner-left" style="line-height: 40px">
            <a href="#">
                <li class="active">首页</li>
            </a>
            <a href="#">
                <li>找医院</li>
            </a><a href="#">
            <li>找医生</li>
        </a>
        </ul>
    </div>
</div>
<div class="opacity"></div>
<div class="carousel-infos">
    <div id="slideBox" class="slideBox">
        <div class="hd car-item">
            <ul><li class=""></li><li class=""></li><li class="on"></li></ul>
        </div>
        <div class="bd">
            <ul>
                <li style="display: none;"><a href="#" target="_blank"><img src="images/banner1.jpg"></a></li>
                <li style="display: none;"><a href="#" target="_blank"><img src="images/banner1.jpg"></a></li>
                <li style="display: list-item;"><a href="#" target="_blank"><img src="images/banner1.jpg"></a></li>
            </ul>
        </div>
    </div>

    <div class="wrap">
        <div class="container">

            <!-- 推荐医院-->
            <div class="find-hospital">
                <h3>
                    <ul class="tab">
                        <li class="first-tab">医院推荐</li>
                        <li class="first-tab" style="margin-left: 500px" ><a href="weihu.jsp" style="text-decoration: none">查看更多>></a></li>
                    </ul>
                    <a id="hos-more" href="#" target="_self"><span class="more-hos"><img src="images/arrow_normal.png"></span></a></h3>

                <div class="content" id="cityTab">
                    <div id="pre-arrow1" class="pre-arrow prev">
                </div>
                    <ul>
                        <c:forEach items="${hospitalTop3}" var="hospital">
                        <li class="hospital-detail"><a href="#" target="_self">
                            <img src="${hospital.image}" alt="${hospital.hname}" width="230" height="120"></a>
                            <p class="hospital-name"><a href="#" title="${hospital.hname}" target="_self"><span class="span-name">${hospital.hname}</span></a>
                            <i class="star-right star-light star-fixed"></i><i class="star-right star-light star-fixed"></i><i class="star-right star-light star-fixed"></i><i class="star-right star-light star-fixed"></i>
                            <i class="star-right star-light star-fixed"></i><span class="grade-text ">${hospital.score}</span>
                            <label class="hospital-grade"><span class="grade">${hospital.grade}</span>
                            </label>
                            </p>
                            <p class="appointent_total">
                            </p>
                        </li>
                        </c:forEach>
                    </ul>
                    <div id="next-arrow1" class="next-arrow next">
                </div>
                </div>

            </div>
            <!-- END推荐医院-->

            <!-- 优质医生-->
            <div id="excel-doctor-div" class="excel-doctor">
                <h3>名师名医<a href="#" target="_self"><span><img src="images/arrow_normal.png"></span></a>
                    <a class="first-tab" href="weihu.jsp" style="text-decoration: none;margin-left: 520px">查看更多>></a>
                </h3>
                <div class="content slideBox2">
                    <div id="pre-arrow" class="pre-arrow prev">
                    </div>
                    <div class="doctail-detail bd">
                        <ul id="dictor-list-ul">
                            <c:forEach var="doctor" items="${doctorList}">
                                <li class="doctor-first" style="background-color: rgb(249, 249, 249);">
                                    <a href="doctor/detail/${doctor.did}" >
                                        <img src="${doctor.image}">
                                    </a>
                                    <p><a target="_blank" href="#"><span>${doctor.dname}</span></a>
                                        <span class="doctor-level">
                                            <c:choose>
                                                <c:when test="${doctor.grade == 1}">主任医师</c:when>
                                                <c:when test="${doctor.grade == 2}">副主任医师</c:when>
                                                <c:when test="${doctor.grade == 3}">主治医师</c:when>
                                                <c:when test="${doctor.grade == 4}">普通医师</c:when>
                                            </c:choose>
                                        </span>
                                    </p>
                                    <p>${doctor.dept.dename}</p>
                                    <p title="${doctor.hospital.hname}">${doctor.hospital.hname}</p>
                                    <p class="btn-appoint"><a href="appointment/${doctor.did}"><span style="border-color: rgb(1, 151, 241); color: rgb(255, 255, 255); background-color: rgb(1, 151, 241);">一键预约</span></a></p>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                    <div id="next-arrow" class="next-arrow next">
                    </div>
                </div>
            </div>
        </div>
        <div class="right-sidebar-info">
            <!-- 右侧统计信息 -->
            <div class="res-info">
                <div class="city-info">
                    <h3 class="res-title">全国已开通</h3>
                    <i class="num">${hospitalList.size()}</i>家医院
                </div>
                <div class="num-info">
                    <h3 class="res-title">可预约医生数</h3>
                    <!-- 循环可预约医生数量 -->

                    <div class="img-container">
                        <img src="images/number_bg.png" class="number-bg "><i class="num">${doctorSize}</i>
                    </div>

                </div>
                <div class="num-info">
                    <h3 class="res-title">累计使用用户</h3>
                    <!-- 累计服务人数 -->

                    <div class="img-container">
                        <img src="images/number_bg.png" class="number-bg "><i class="num">${userListSize}</i>
                    </div>

                </div>
            </div>
            <!-- END右侧统计信息 -->

            <!-- 合作机构 -->
            <div class="news">
                <h3 class="news-title">合作机构</h3>
                <ul class="news-list">
                    <c:forEach items="${hospitalList}" var="hospital">
                        <li>
                            <a href="#" target="_self">
                                    ${hospital.hname}
                            </a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
            <!-- END合作机构 -->
        </div>
    </div>
</div>

<script src="js/jquery-1.11.2.min.js"></script>

<script src="js/uni_login_wrapper.js"></script>

<script src="js/jquery.SuperSlide.2.1.1.js"></script>
<script>
    jQuery(".slideBox").slide({ mainCell: ".bd ul", autoPlay: true});
</script>
</body>
</html>

