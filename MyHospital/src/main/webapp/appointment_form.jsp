<%@page contentType="text/html; UTF-8"  pageEncoding="UTF-8" language="java"  %>
<%@include file="common.jsp"%>
<!DOCTYPE html>
<html lang="zh_CN">
<head>
    <base href="<%=basePath%>" >
    <meta charset="UTF-8" http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>就医助手</title>
    <link rel="stylesheet" href="css/appointment_form.css" />
    <style>
        .header .top-box .top-icon-img {
            width: 13px;
            height: 13px;
            vertical-align: middle;
            margin-bottom: 3px;
        }

        .header .top-box .sign a {
            color: #0c81f8;
            cursor: pointer;
        }
    </style>

</head>
<body>
<header class="header">
    <header id="fastTop" class="header" style="height: 100px;">
        <div class="search_box">
                <span class="logo">
                    <a href="">
                        <img src="images/jiuyizhushou.png"></a>
                </span>
            <input type="hidden" id="current-area-info" data-province="16" data-city="371" data-region="0" data-provtag="0" data-value="1">
        </div>
    </header>
</header>

<div class="wrap">
    <div class="title">
        <p>
            <a href="hospital/detail/${doctor.hospital.hid}">首页</a>
            <a href="doctor/detail/${doctor.did}"></a> &gt; 填写预约信息
        </p>
    </div>
    <div class="container">
        <p class="doctor-title">已选择的医生</p>
        <div class="doctor-info">
            <div class="info-pic">
                <img src="${doctor.image}">
            </div>
            <div class="infos">
                <div class="info-title">
                    <div>${doctor.dname}</div>
                    <div class="info-doc"><i></i><span>认证医生</span>
                        <span class="doctor-medtitle">
                                <c:choose>
                                    <c:when test="${doctor.grade == 1}">
                                        主任医师
                                    </c:when>
                                    <c:when test="${doctor.grade == 2}">
                                        副主任医师
                                    </c:when>
                                    <c:when test="${doctor.grade == 3}">
                                        主治医师
                                    </c:when>
                                    <c:when test="${doctor.grade == 4}">
                                        普通医师
                                    </c:when>
                                </c:choose>
                                &nbsp;/&nbsp;${doctor.gender}</span>
                    </div>
                </div>
                <p class="info-hospittal"><span>${doctor.hospital.hname}</span>${doctor.dept.dename}</p>
                <p class="info-hospittal"><span>${doctor.description}</span></p>
            </div>
        </div>
        <div class="write-list">
            <p class="doctor-title">请填写预约信息<span class="right-info"><span>*</span>为必填项</span></p>
            <form id="appForm" action="" method="post">
                <input type="hidden" id="did" name="did" value="${doctor.did}" />
                <table>
                    <tbody>
                    <tr>
                        <td class="label">就诊人</td>
                        <td class="essential-mark"><span class="star-red">*</span></td>
                        <td>
                            <div class="widget-input" id="widget-input-name">
                                <input type="text" id="name" name="name" >
                                <span class="right" style="display: none;"><i class="instant-state fa fa-check-circle"></i></span>
                                <span class="wrong" style="display: none;"><i class="instant-state fa fa-times-circle"></i><i id="name-wrong-info">请输入姓名</i></span>
                            </div>
                        </td>
                    </tr>
                    <tr id="id-card-tr">
                        <td class="label">身份证号</td>
                        <td class="essential-mark"><span class="star-red">*</span></td>
                        <td>
                            <div class="widget-input" id="widget-input-identity">
                                <input type="text" id="idcast" name="idcast" >
                                <span class="right" style="display: none;"><i class="instant-state fa fa-check-circle"></i></span>
                                <span class="wrong" style="display: none;"><i class="instant-state fa fa-times-circle"></i><i id="idcard-wrong-info">请输入身份证号</i></span>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="label">联系手机</td>
                        <td class="essential-mark"><span class="star-red">*</span></td>
                        <td>
                            <div class="widget-input" id="widget-input-phone">
                                <input type="text" id="aphone" name="aphone" >
                                <span class="right" style="display: none;"><i class="instant-state fa fa-check-circle"></i></span>
                                <span class="wrong" style="display: none;"><i class="instant-state fa fa-times-circle"></i><i id="phone-wrong-info">请正确输入手机号</i></span>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="label">预约时间</td>
                        <td class="essential-mark"><span class="star-red">*</span></td>
                        <td>
                            <div class="widget-input" id="widget-input-time">
                                <select name="visitTime" id="visitTime">
                                    <c:forEach var="visitTime" items="${dayInfoList}">
                                        <option>${visitTime.toString()}</option>
                                    </c:forEach>
                                </select>
                                <span class="right" style="display: none;"><i class="instant-state fa fa-check-circle"></i></span>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td>
                            <div class="widget-input">
                                <input id="agreement" type="checkbox" checked="checked" value=""><label for="agreement">同意</label><span class="agreement"><a href="#" target="_blank">《医者天下用户协议》</a></span><span class="wrong widget-wrong" style="display: none"><i class="instant-state fa fa-times-circle"></i><i>您还未同意用户协议</i></span>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td>
                            <div class="widget-input submit-button" style="margin-top: -5px;"><span id="submit-order" class="submit-but action">提交预约单</span></div>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </form>
        </div>
    </div>
</div>



<script src="js/esl.js"></script>
<script src="js/jquery-1.11.2.min.js"></script>
<script type="text/javascript">

    $(function(){
        $('#submit-order').click(function(){
            var name = $('#name').val();
            if(name==''){
                $('#widget-input-name .wrong').show(500).delay(5000).hide(1000);
                return;
            }
            var identity = $('#idcast').val();
            if(identity==''){
                $('#widget-input-identity .wrong').show(500).delay(5000).hide(1000);
                return;
            }
            var phone = $('#aphone').val();
            if(phone==''){
                $('#widget-input-phone .wrong').show(500).delay(5000).hide(1000);
                return;
            }
            var time=$('#visitTime option:selected').val();
            var did=$('#did').val();

            var postData= {
                "visittime":time,
                "name": name,
                "idcast": identity,
                "aphone":phone,
                "did":did
            }

                $.ajax({
                type: "POST",
                url:'appointment/submit',
                data:postData,
                dataType : "json",
                async: false,
                error: function(request) {
                    alert("服务器异常,无法完成操作!");
                },
                success: function(data) {
                    if(data=='0'){
                        alert("该医生预约已满,请更换日期或医生!");
                    }
                    else if(data=='-1'){
                        alert('就诊人不存在,请先注册就诊人信息!');
                        location.href = 'register.jsp';
                    }
                    else if(data=='-2'){
                        alert('对不起,您还未登录,请登录后预约!');
                        location.href = '';
                    }
                    else if(data=='-3'){
                        alert('对不起,您已经预约过该医生了,不能重复预约!');
                    }
                    else{
                        alert('恭喜您,预约成功,您的预约顺序号是：'+data+',请记住您的序号!');
                    }
                }
            });
        });

    });

</script>
</body>
</html>

