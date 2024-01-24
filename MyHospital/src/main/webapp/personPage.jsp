<%@page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@include file="common.jsp"%>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
    <base href="<%=basePath%>">
    <title>用户中心</title>
    <h1 align="center">
        就医助手用户中心界面
    </h1>
    <style>
        #nav {
            height: 41px;
            border-top: 2px solid #0c81f8;
            border-bottom: 2px solid #0c81f8;
            line-height: 41px;
        }
        #nav a{
            height: 39px;
            font-size: 20px;
            color: #4c4c4c;
            text-decoration: none;
            background-color: rgb(224, 224, 224,0.5);
            padding: 0 20px;
            display: inline-block;
        }
        #nav a:hover {
            background-color: rgb(224, 224, 224);
            color:#000000;
        }

        body{
            background-image: url(images/banner4.jpg);

        }
        div{
            text-align: center;
        }
        table {
            border-collapse: collapse;
            width: 80%;

        }

        th, td {
            text-align: center;
            padding: 8px;
        }

        tr:nth-child(even){background-color: #f2f2f2}

        th {
            background-color: black;
            color: white;
        }

        .search-tangle{
            border-bottom:1px solid #cccccc;

            border-top-width:0;

            border-left-width:0;

            border-right-width:0;

            width: 200px;

            padding:5px;

            margin-left: 50px;
            margin-top:5px;
            margin-bottom:5px
        }
        #querySearch{
            width: 50px;
            height: 25px;
            background: #fff;
            border:1px solid deepskyblue;
        }
    </style>
</head>
<body>
<div id="nav" style="text-align: center;">
    <a id="manage" onclick="manage()">预约信息查询</a>
    <a id="doctor" href="weihu.jsp">个人信息修改</a>
    <a href="weihu.jsp">医者信箱</a>
    <a href="weihu.jsp">患者论坛</a>
    <a href="weihu.jsp">修改密码</a>
    <a style="float: right;font-size: 15px" href = "user/logout"><font color="blue">退出登陆</font></a>
</div>
<div>
    <input type="text" name="name" autocomplete="off" placeholder="请输入预约号"
       class="search-tangle" value="">
    <input type="text" name="name" autocomplete="off" placeholder="请输入预约医院"
           class="search-tangle" value="">
    <input type="text" name="name" autocomplete="off" placeholder="请输入预约医生号"
           class="search-tangle" value="">
<button type="button" id="querySearch">搜&nbsp;索</button>
</div>
<div id="t">
    <table id="tableTest" align="center">
        <th>
            <a id="a1">预约人</a>
        </th>
        <th>
            <a id="a2">预约号</a>
        </th>
        <th>
            <a id="a3">预约时间</a>
        </th>
        <th>
            <a id="a4">预约医生号</a>
        </th>
        <th>
            <a id="a5">操作</a>
        </th>
        <c:forEach items="${appointmentList}" var="appointment">
            <tr>
                <td>${appointment.name}</td>
                <td>${appointment.aid}
                </td>
                <td>${appointment.visittime}</td>
                <td>${appointment.did}</td>
                <td>
                    <a href="#" style="text-decoration: none" onclick="del()">删除</a>
                    &nbsp;
                    <a href="#" style="text-decoration: none" onclick="del()">取消预约</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
<p>
<div id="excel-doctor-div" class="excel-doctor">
</div>
</div>
</body>
</html>
<script>
    function manage() {
        $.ajax({
            type: "POST",
            url: '/admin',
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
                } else if (data == '3') {
                    alert("恭喜你，登录成功!");
                    location.href = '/Hospital/user/admin';
                } else if (data == '4') {
                    alert("请选择登录权限!!!");
                } else {
                    alert("用户名或密码错误，登录失败!!!");
                }
            }
        })
    };
</script>