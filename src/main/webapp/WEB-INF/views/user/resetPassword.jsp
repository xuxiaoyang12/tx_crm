<%--
  Created by IntelliJ IDEA.
  User: Mxia
  Date: 2017/3/19
  Time: 19:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>QingSword CRM</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.6 -->
    <link rel="stylesheet" href="/static/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="/static/plugins/fontawesome/css/font-awesome.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="/static/dist/css/AdminLTE.min.css">
    <link rel="stylesheet" href="/static/plugins/layer/skin/default/layer.css">
    <!-- AdminLTE Skins. We have chosen the skin-blue for this starter
          page. However, you can choose any other skin. Make sure you
          apply the skin class to the body tag so the changes take effect.
    -->
    <link rel="stylesheet" href="/static/dist/css/skins/skin-blue.min.css">
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

    <%@include file="../include/mainHeader.jsp"%>
    <jsp:include page="../include/leftSide.jsp">
        <jsp:param name="menu" value="home"/>
    </jsp:include>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                QingSword
                <small>密码修改</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 账户管理</a></li>
                <li class="active">密码修改</li>
            </ol>

        </section>

        <!-- Main content -->
        <section class="content">

            <div class="box box-primary">
                <div class="box-header">
                    <h3>密码修改</h3>
                </div>
                <div class="box-body">
                    <form id="resetPwdForm">

                        <div class="form-group">
                            <label >旧密码</label>
                            <input class="form-control" type="text" name="oldPassword" placeholder="请输入旧密码">
                        </div>
                        <div class="form-group">
                            <label >新密码</label>
                            <input class="form-control" id="newPassword" type="text" name="newPassword" placeholder="请输入新密码">
                        </div>
                        <div class="form-group">
                            <label >再次输入新密码</label>
                            <input class="form-control" type="text" name="repassword" placeholder="请再次输入新密码">
                        </div>


                    </form>
                    <div class="form-group">
                        <button id="saveBtn" class="btn btn-primary">保存修改</button>
                    </div>
                </div>
            </div>

        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
</div>
<!-- ./wrapper -->

<!-- REQUIRED JS SCRIPTS -->

<!-- jQuery 2.2.0 -->
<script src="/static/plugins/jQuery/jQuery-2.2.0.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="/static/bootstrap/js/bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="/static/dist/js/app.min.js"></script>

<script src="/static/plugins/validate/jquery.validate.min.js"></script>
<script src="/static/plugins/layer/layer.js"></script>
<script>

    $(function () {

        //表单提交与验证
        $("#resetPwdForm").validate({
            errorClass:'text-danger',
            errorElements:'span',
            rules:{

                oldPassword:{
                    required:true,
                    rangelength:[3,20],
                },
                newPassword:{
                    required:true,
                    rangelength:[3,20],
                },
                repassword:{
                    required:true,
                    rangelength:[3,20],
                    equalTo:"#newPassword"
                }
            },
            messages:{
                oldPassword:{
                    required:"请输入旧密码",
                    rangelength:"密码长度3-20位"
                },
                newPassword:{
                    required:"请输入新密码",
                    rangelength:"密码长度3-20位"
                },
                repassword:{
                    required:"请再次输入新密码",
                    rangelength:"密码长度3-20位",
                    equalTo:"两次密码不一致"
                }
            },
            submitHandler:function (form) {
                $.ajax({
                    url:"/user/password",
                    type:"post",
                    data:$(form).serialize(),
                    beforeSend:function () {
                        $("#saveBtn").text("保存中...").attr("disabled","disabled");
                    },
                    success:function (data) {
                        if(data=='success') {
                            layer.confirm("密码修改成功",function () {
                                window.history.go(-1);
                            })
                        }else{
                            layer.msg("账号或密码错误");
                        }
                    },
                    error:function () {
                        layer.msg("服务器异常！");
                    },
                    complete:function () {
                        $("#saveBtn").text("保存修改").removeAttr("disabled");
                    }
                })
            }


        });

        $("#saveBtn").click(function () {
            $("#resetPwdForm").submit();
        })



    })
</script>
</body>
</html>
