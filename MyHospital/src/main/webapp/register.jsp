<%@page pageEncoding="UTF-8"  contentType="text/html; UTF-8" language="java" %>
<%@include file="common.jsp"%>
<html>
<head >
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title></title>
    <script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>
    <link rel="stylesheet" href="css/all.css"/>
</head>
<body>
<!--头部-->
<div class="header">
    <a class="logo" href=""><img src="images/jiuyizhushou.png"></a>
    <div class="desc" style="margin-left: 120px;font-size: 25px">欢迎注册</div>
</div>
<!--版心-->
<div class="container">
    <!--注册模块-->
    <div class="register">
        <form action="${pageContext.request.contextPath}/user/register" method="post">
            <!--账号名-->
            <div class="register-box">
                <!--表单项-->
                <div class="box default">
                    <label for="user">账&nbsp;户&nbsp;名：</label>
                    <input   name="user" type="text" id="user" placeholder="请输入账户名" />
                    <i></i>
                </div>
                <!--提示信息-->
                <div class="tip">
                    <i></i>
                    <span></span>
                </div>
            </div>
            <!--姓名-->
            <div class="register-box">
                <!--表单项-->
                <div class="box default">
                    <label for="name">姓&nbsp;&nbsp;&nbsp;名&nbsp;&nbsp;：</label>
                    <input name="name" type="text" id="name" placeholder="请输入姓名" />
                    <i></i>
                </div>
                <!--提示信息-->
                <div class="tip">
                    <i></i>
                    <span></span>
                </div>
            </div>
            <div class="register-box">
                <!--表单项-->
                <div class="box default">
                    <label for="name">性&nbsp;&nbsp;&nbsp;别&nbsp;&nbsp;：</label>
                    <input style="width: 50px" name="gender" value="男" type="radio" checked />男
                    <input style="width: 50px" name="gender" value="女" type="radio"  />女
                    <i></i>
                </div>
                <!--提示信息-->
                <div class="tip">
                    <i></i>
                    <span></span>
                </div>
            </div>
            <!--设置密码-->
            <div class="register-box">
                <!--表单项-->
                <div class="box default">
                    <label for="pwd">设 置 密 码：</label>
                    <input name = "pwd" type="password" id="pwd" placeholder="建议至少两种字符组合" />
                    <i></i>
                </div>
                <!--提示信息-->
                <div class="tip">
                    <i></i>
                    <span></span>
                </div>
            </div>
            <!--确认密码-->
            <div class="register-box">
                <!--表单项-->
                <div class="box default">
                    <label for="pwd2">确 认 密 码：</label>
                    <input type="password" id="pwd2" placeholder="请再次输入密码" />
                    <i></i>
                </div>
                <!--提示信息-->
                <div class="tip">
                    <i></i>
                    <span></span>
                </div>
            </div>
            <!--邮 箱 验 证-->
            <div class="register-box">
                <!--表单项-->
                <div class="box default">
                    <label for="email">邮 箱 验 证：</label>
                    <input name="email" type="text" id="email" placeholder="请输入邮箱" />
                    <i></i>
                </div>
                <!--提示信息-->
                <div class="tip">
                    <i></i>
                    <span></span>
                </div>
            </div>
            <!--手机验证-->
            <div class="register-box">
                <!--表单项-->
                <div class="box default">
                    <label for="mobile">手 机 号 码：</label>
                    <input name="phone" type="text" id="mobile" placeholder="请输入手机号" />
                    <i></i>
                </div>
                <!--提示信息-->
                <div class="tip">
                    <i></i>
                    <span></span>
                </div>
            </div>
            <!--注册协议-->
            <div class="register-box xieyi">
                <!--表单项-->
                <div class="box default">
                    <input type="checkbox" id="ck" />
                    <span>我已阅读并同意<a href="##">《用户注册协议》</a></span>
                </div>
                <!--提示信息-->
                <div class="tip">
                    <i></i>
                    <span></span>
                </div>
            </div>
            <!--注册-->
            <button id="btn" type="submit">注册</button>
        </form>
    </div>
</div>
</body>
</html>