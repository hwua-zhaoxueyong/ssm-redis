<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="WEB-INF/common/common.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script type="text/javascript" src="${path}/static/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="${path}/static/js/jquery.cookie.js"></script>
    <title>赵学勇制作额网页</title>
    <script type="text/javascript">
        $(function(){
            var username=$.cookie("username");
            var password=$.cookie("password");
            var remember=$.cookie("remember");
            if(remember!=null){
                $("#username").val(username);
                $("#password").val(password);
                $("#remember").prop("checked",true);
            }
        })
        function login(){
            var remember=$("#remember").is(":checked");
            var username = $("#username").val();
            var password = $("#password").val();
            if (username == "" || password == "") {
                alert("请填写用户名和密码");
             /*   $.messager.alert("提示","请填写用户名和密码");*/
                return;
            }
            $.ajax({
                url: "${path}/user/Login",
                type: "post",
                dataType: "json",
                async: false,
                data: {
                    username: username,
                    password: password
                },
                success: function (result) {
                    console.log(result);
                    if (result.success) {
                        alert(result.info);
                        if(remember){
                            $.cookie("username",username,{expires:7});
                            $.cookie("password",password,{expires:7});
                            $.cookie("remember",true,{expires:7});
                        }else{
                            $.removeCookie("username");
                            $.removeCookie("password");
                            $.removeCookie("remember");
                        }
                        window.location.href = "${path}/user/tomain"
                    } else {
                        alert(result.info);
                    }
                }
            });
        }
    </script>
</head>
<body>
<div class="log_bg">
    <div class="top">
        <h1 align="center">权限管理系统</h1>
        <div class="logo"><a href="Zhao.jsp"><img src="${path}/static/images/b2.png" /></a></div>
    </div>
    <div class="login">
        <div class="log_img"><img src="${path}/static/images/z_1.png" width="611" height="425" /></div>
        <div class="log_c">
            <form>
                <table border="0" style="width:370px; font-size:14px; margin-top:30px;" cellspacing="0" cellpadding="0">
                    <tr height="50" valign="top">
                        <td width="55">&nbsp;</td>
                        <td>
                            <span class="fl" align="center" style="font-size:24px;">登录</span>
                            <span class="fr"><a href="Regist.jsp" style="color:#ff4e00;">立即注册</a></span>
                        </td>
                    </tr>
                    <tr height="70">
                        <td>用户名</td>
                        <td><input type="text" value="" id="username" name="username" class="l_user" /></td>
                    </tr>
                    <tr height="70">
                        <td>密&nbsp; &nbsp; 码</td>
                        <td><input type="password" value="" id="password" name= "password" class="l_pwd" /></td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td style="font-size:12px; padding-top:20px;">
                	<span style="font-family:'宋体';" class="fl">
                    	<label class="r_rad"><input type="checkbox" checked="checked" id="remember"/>
                        </label><label class="r_txt">记住密码 </label>
                    </span>
                            <span class="fr"><a href="#" style="color:#ff4e00;">忘记密码</a></span>
                        </td>
                    </tr>
                    <tr height="60">
                        <td>&nbsp;</td>
                        <td><input type="button" onclick="login()" value="登录" class="log_btn" /></td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</div>
<h1>4444</h1>
<%@include file="WEB-INF/common/footer3.jsp"%>
</body>
</html>

