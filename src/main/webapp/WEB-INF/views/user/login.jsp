<%--
  Created by IntelliJ IDEA.
  User: Mxia
  Date: 2017/3/15
  Time: 21:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML >
<!-- saved from url=(0064)http://www.17sucai.com/preview/137615/2015-01-15/demo/index.html -->


<META http-equiv="Content-Type" content="text/html; charset=utf-8">
<TITLE>登录页面</TITLE>
<link rel="stylesheet" href="/static/login/style.css">
<META name="GENERATOR" content="MSHTML 11.00.9600.17496"></HEAD>
<BODY>
<DIV class="top_div"></DIV>
    <DIV style="background: rgb(255, 255, 255); margin: -100px auto auto; border: 1px solid rgb(231, 231, 231); border-image: none; width: 400px; height: 200px; text-align: center;">
        <DIV style="width: 165px; height: 96px; position: absolute;">
            <DIV class="tou"></DIV>
            <DIV class="initial_left_hand" id="left_hand"></DIV>
            <DIV class="initial_right_hand" id="right_hand"></DIV>
        </DIV>
        <form action="/login" method="post" id="subForm">

                <c:if test="${not empty message}" >
                    <div class="alert alert-error">
                        ${message}
                    </div>
                </c:if>

            <P style="padding: 30px 0px 10px; position: relative;">
                <SPAN class="u_logo"></SPAN>
                <INPUT class="ipt" name="username" value="rose" type="text" placeholder="请输入用户名或邮箱" value="">
            </P>
            <P style="position: relative;">
                <SPAN class="p_logo"></SPAN>
                <INPUT class="ipt" name="password" value="123123" id="password" type="password" placeholder="请输入密码" value="">
            </P>
            <DIV style="height: 50px; line-height: 50px; margin-top: 30px; border-top-color: rgb(231, 231, 231); border-top-width: 1px; border-top-style: solid;">
                <P style="margin: 0px 35px 20px 45px;">
                <SPAN style="float: left;">
                    <A style="color: rgb(204, 204, 204);" href="#">忘记密码?</A>
                </SPAN>
                    <SPAN style="float: right;">
                    <A style="color: rgb(204, 204, 204); margin-right: 10px;"
                       href="#">注册</A>
                        <button id="subBtn" type="submit">
                             <A style="background: rgb(0, 142, 173); padding: 7px 10px; border-radius: 4px; border: 1px solid rgb(26, 117, 152); border-image: none; color: rgb(255, 255, 255); font-weight: bold;"
                               >登录</A>
                        </button>

               </SPAN>
                </P>
            </DIV>
        </form>

    </DIV>
    <div style="text-align:center;">
</div>
<SCRIPT src="/static/login/js/jquery-1.9.1.min.js" type="text/javascript"></SCRIPT>


<SCRIPT type="text/javascript">
    $(function(){
        //得到焦点
        $("#password").focus(function(){
            $("#left_hand").animate({
                left: "150",
                top: " -38"
            },{step: function(){
                if(parseInt($("#left_hand").css("left"))>140){
                    $("#left_hand").attr("class","left_hand");
                }
            }}, 2000);
            $("#right_hand").animate({
                right: "-64",
                top: "-38px"
            },{step: function(){
                if(parseInt($("#right_hand").css("right"))> -70){
                    $("#right_hand").attr("class","right_hand");
                }
            }}, 2000);
        });
        //失去焦点
        $("#password").blur(function(){
            $("#left_hand").attr("class","initial_left_hand");
            $("#left_hand").attr("style","left:100px;top:-12px;");
            $("#right_hand").attr("class","initial_right_hand");
            $("#right_hand").attr("style","right:-112px;top:-12px");
        });
       /* $("#subBtn").click(function () {
            $("#subForm").submit;
        })*/
    });
</SCRIPT>
</BODY>
</HTML>
