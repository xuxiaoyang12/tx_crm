<%--
  Created by IntelliJ IDEA.
  User: Mxia
  Date: 2017/3/18
  Time: 21:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <!-- AdminLTE Skins. We have chosen the skin-blue for this starter
          page. However, you can choose any other skin. Make sure you
          apply the skin class to the body tag so the changes take effect.
    -->
    <link rel="stylesheet" href="/static/dist/css/skins/skin-blue.min.css">
    <link rel="stylesheet" href="/static/plugins/layer/skin/default/layer.css">
    <%--database--%>
    <link rel="stylesheet" href="/static/plugins/datatables/css/dataTables.bootstrap.min.css">
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

    <%@include file="../include/mainHeader.jsp"%>
    <jsp:include page="../include/leftSide.jsp">
        <jsp:param name="menu" value="admin_userList"/>
    </jsp:include>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->

        <section class="content-header">
            <h1>
                员工管理
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>系统管理</a></li>
                <li class="active">员工列表</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="box box-primary">

                <div class="box-header">
                    <h2 class="box-title">员工列表</h2>
                    <div class="box-tools">
                        <a href="javaScript:;" id="newBtn" class="btn btn-xs btn-primary"><i class="fa fa-plus">新增</i></a>
                    </div>

                </div>
                <div class="box-body">
                    <table class="table" id="userTable">
                        <thead>
                           <tr>
                               <th>ID</th>
                               <th>账户名称</th>
                               <th>微信号</th>
                               <th>真实姓名</th>
                               <th>部门</th>
                               <th>创建时间</th>
                               <th>状态</th>
                               <th>#</th>
                           </tr>
                        </thead>
                        <tbody></tbody>

                    </table>
                </div>
                <div class="box-footer">
                        <div class="pull-right">
                            <small><a href="http://www.spring.io">QingSword 员工管理系统</a></small>
                        </div>
                </div>


            </div>

            <!-- Your Page Content Here -->

        </section>

        <!-- /.content -->
    </div>
    <%--新增用户模态框--%>
    <div class="modal fade" id="newModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">新增用户</h4>
                </div>
                <div class="modal-body">
                    <form id="newForm">
                        <div class="form-group">
                            <label>账号(用于系统登录)</label>
                            <input type="text" class="form-control" name="userName">
                        </div>
                        <div class="form-group">
                            <label>员工姓名(真实姓名)</label>
                            <input  type="text" class="form-control" name="realName">
                        </div>
                        <div class="form-group">
                            <label>密码(默认 666666)</label>
                            <input type="text" class="form-control" name="password" value="666666">
                        </div>
                        <div class="form-group">
                            <label>微信号</label>
                            <input type="text" class="form-control" name="weixin">
                        </div>
                        <div class="form-group">
                            <label>角色</label>
                            <select class="form-control" name="roleId" >
                                <c:forEach items="${roleList}" var="role">
                                    <option value="${role.id}">${role.roleName }</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="modal-footer">
                            <button  class="btn btn-default" data-dismiss="modal">取消</button>
                            <button  class="btn btn-primary" id="saveNewBtn">保存</button>
                        </div>
                    </form>
                </div>

            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
    <%--编辑用户模态框--%>
    <div class="modal fade" id="editModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <btton class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" >x</span></btton>
                    <h3 class="modal-title">编辑用户</h3>

                </div>
                <div class="modal-body">
                    <form id="editForm">
                        <input type="hidden" name="id" id="edit_user_id">
                        <div class="form-group">
                            <label>账户名称</label>
                            <input id="edit_user_name"  type="text" name="userName" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>员工姓名</label>
                            <input id="edit_real_name"  type="text" name="realName" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>密码(默认 666666)</label>
                            <input id="edit_password" type="password" name="password" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>微信号</label>
                            <input id="edit_weixin" type="text" name="weixin" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>角色</label>
                            <select name="roleId" class="form-control" id="edit_role_id">
                                <c:forEach items="${roleList}" var="role">
                                    <option value="${role.id}">${role.roleName}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group">
                            <lable>状态</lable>
                            <%--赋予select值相当于给option赋予value值--%>
                            <select class="form-control" name="state" id="edit_state">
                                <option value="0">禁用</option>
                                <option value="1">正常</option>

                            </select>
                        </div>
                        <div class="modal-footer">
                            <button class="btn btn-default" data-dismiss="modal" >取消</button>
                            <button class="btn btn-primary"  id="saveEditBtn">保存</button>
                        </div>
                    </form>
                </div>

            </div>
        </div>

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

<script src="/static/plugins/datatables/js/jquery.dataTables.js"></script>
<script src="/static/plugins/datatables/js/dataTables.bootstrap.min.js"></script>
<script src="/static/plugins/moment/moment.min.js"></script>
<script src="/static/plugins/validate/jquery.validate.min.js"></script>
<script src="/static/plugins/layer/layer.js"></script>

<script>
    $(function() {
        $("#saveEditBtn").click(function(){

            $("#editForm").submit;
        });
        var dataBase =$("#userTable").DataTable({
            searching:true,//是否添加搜索
            serverSide:true,//
            ajax:"/admin/list",//请求的url
            ordering:false,
            "autoWidth": false,//自动调整
            columns:[
                {"data":"id"},
                {"data":"userName"},
                {"data":"weixin"},
                {"data":"realName"},
                {"data":function(row) {
                    return row.role.roleName;
                }},
                {"data":function(row) {
                    var day = moment(row.createTime).format("yyyy-mm-dd hh:mm:ss")
                    return day;
                }},

                {"data":function(row) {
                    if(row.state == 1) {
                        return  "正常";
                    }else{
                        return "禁用";
                    }
                }},
                {"data":function(row) {
                   /* if(row.userName == 'admin') {
                        return '';
                    }else {*/
//                    }
                    return "<a href='javascript:;' class='resetPassword' rel='"+row.id+"'>重置密码</a> &nbsp;&nbsp;" +
                        "<a href='javascript:;' class='edit' rel='"+row.id+"' >编辑</a>";

                }}
            ],
            "language": { //定义中文
                "search": "请输入账号名称:",
                "zeroRecords": "没有匹配的数据",
                "lengthMenu": "显示 _MENU_ 条数据",
                "info": "显示从 _START_ 到 _END_ 条数据 共 _TOTAL_ 条数据",
                "infoFiltered": "(从 _MAX_ 条数据中过滤得来)",
                "loadingRecords": "加载中...",
                "processing": "处理中...",
                "paginate": {
                    "first": "首页",
                    "last": "末页",
                    "next": "下一页",
                    "previous": "上一页"
                }
            }

        })

        $("#newBtn").click(function(){
            $("#newForm")[0].reset();
            $("#newModal").modal({
                show:true,
                backdrop:'static',
                keyboard:false
            });
        });

        //提交新增用户表单

        $("#newForm").validate({
            errorClass:'text-danger',
            errorElement:'span',
            rules:{
                userName:{
                    required:true,//不为空
                    rangelength:[3,20],//长度
                    remote:"/admin/user/checkUserName"//通过远程查询名字是否被占用
                },
                realName:{
                    required:true,//不为空
                    rangelength:[2,20]//长度
                },
                password:{
                    required:true,
                    rangelength:[6,18]
                },
                weixin:{
                    required:true
                }
            },
            messages:{
                userName:{
                    required:"请输入用户名",
                    rangelength:"用户名的长度3~20位",
                    remote:"该用户名已被占用"
                },
                realName:{
                    required:"请输入真实姓名",
                    rangelength:"真实姓名长度2~20位"
                },
                password:{
                    required:"请输入密码",
                    rangelength:"密码长度6~18位"
                },
                weixin:{
                    required:"请输入微信号码"
                }
            },
            submitHandler:function(form){
                //通过post方式异步请求
                $.post("/admin/user/new",$(form).serialize()).done(function(data){
                    if(data == "success") {
                        $("#newModal").modal('hide');
                        dataBase.ajax.reload();//列表重新刷新
                    }else{
                        alert(data)
                    }
                }).error(function(){
                    alert("服务器异常,请稍后重试！");
                });
            }

        });



        //使用时间委托机制弹出编辑模态框
        $(document).delegate(".edit","click",function(){
            //获取当前用户的id
            var id = $(this).attr("rel");
            //通过用户id 异步获取到用户数据 并附与模态框中
            $.get("/admin/user/"+id+".json").done(function(result) {
                if(result.state == "success"){
                    //给模态框赋值
                    $("#edit_user_id").val(result.data.id);

                    $("#edit_user_name").val(result.data.userName);
                    $("#edit_password").val(result.data.password);
                    $("#edit_real_name").val(result.data.realName);
                    $("#edit_weixin").val(result.data.weixin);
                    $("#edit_role_id").val(result.data.role.id);
                    $("#edit_state").val(result.data.state);

                    $("#editModal").modal({
                        show:true,
                        backdrop:'static',
                        keyboard:false
                    })


                }else{
                    alert(result.messsage);
                }

            }).error(function(){
                alert("服务器错误请稍后重试！");
            })

        } );
        
        //提交编辑表单
        $("#editForm").validate({

            errorClass:'text-danger',
            errorElements:'span',
            rules:{
                realName:{
                    required:true,//不为空
                    rangelength:[2,20]//长度
                },
                password:{
                    required:true,
                    rangelength:[6,18]
                },
                weixin:{
                    required:true
                }
            },
            messages:{
                realName:{
                    required:"请输入真实姓名",
                    rangelength:"真实姓名长度2~20位"
                },
                password:{
                    required:"请输入密码",
                    rangelength:"密码长度6~18位"
                },
                weixin:{
                    required:"请输入微信号码"
                }
            },
            submitHandler:function(form) {
                $.post("/admin/user/edit",$(form).serialize()).done(function (data) {
                    if(data == 'success') {
                        $("#editModal").modal('hide');
                        dataBase.ajax.reload();//列表重新刷新
                    }else{
                        alert("编辑失败")
                    }
                }).error(function () {
                    alert("服务器异常")
                })
            }
        });

        //重置密码
        $(document).delegate(".resetPassword","click",function(){
            var id = $(this).attr("rel");
            layer.confirm("确定要重置密码吗？",function(){
                $.get("/user/reset/"+id+".json").done(function (result) {
                    if(result.state == 'success') {
                        layer.msg("密码重置成功");
                    }else{
                        layer.msg(result.message);
                    }
                }).error(function(){
                    layer.msg("服务器错误")
                })
            });


        })

    })


</script>
</body>
</html>

