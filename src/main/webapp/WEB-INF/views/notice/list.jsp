<%--
  Created by IntelliJ IDEA.
  User: Mxia
  Date: 2017/3/18
  Time: 12:50
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
    <%--添加database依赖--%>
    <link rel="stylesheet" href="/static/plugins/datatables/css/dataTables.bootstrap.min.css">
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
        <jsp:param name="menu" value="notice"/>
    </jsp:include>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                QingSword
                <small>公告栏</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> QingSword</a></li>
                <li class="active">公告</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <div>
                <c:if test="${not empty message}" >
                    <div ${'发布成功'== message ? 'class="alert alert-success"':'class="alert alert-danger"'}>${message}</div>
                </c:if>

            </div>
            <!-- Your Page Content Here -->
            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">公告列表</h3>

                        <div class="box-tools pull-right">
                            <a href="/notice/new" class="btn btn-xs btn-primary"><i class="fa fa-pencil"></i> 发表公告</a>
                        </div>

                </div>
                <div class="box-body">
                    <table class="table" id="noticeTable">
                        <thead>
                        <tr>
                            <th>标题</th>
                            <th>发布时间</th>
                            <th>发布人</th>
                        </tr>
                        </thead>
                    </table>
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

<%--添加database插件依赖--%>
<script src="/static/plugins/datatables/js/jquery.dataTables.min.js"></script>
<script src="/static/plugins/datatables/js/dataTables.bootstrap.min.js"></script>
<script src="/static/plugins/moment/moment.min.js"></script>
<script>
    $(function () {

//        database
        var dataTable = $("#noticeTable").DataTable({
            searching:false,//是否添加搜索
            serverSide:true,//
            ajax:"/notice/load",//请求的url
            ordering:false,
            "autoWidth": false,//自动调整
            columns:[
                {"data":function(row){
                    return "<a href='/notice/"+row.id+"'>"+row.title+"</a>"
                }},
                {"data":function(row){
                    var day = moment(row.createtime).format("YYYY-MM-DD HH:mm");
                    return day;
                }},
                {"data":"realname"}
            ],
            "language": { //定义中文
                "search": "请输入书籍名称:",
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
        });
    })

</script>


</body>
</html>

