<%--
  Created by IntelliJ IDEA.
  User: Mxia
  Date: 2017/3/19
  Time: 23:41
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
    <title>凯盛CRM</title>
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
    <link rel="stylesheet" href="/static/plugins/datatables/css/dataTables.bootstrap.css">
    <link rel="stylesheet" href="/static/dist/css/skins/skin-blue.min.css">
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

    <%@include file="../include/mainHeader.jsp"%>
    <jsp:include page="../include/leftSide.jsp">
        <jsp:param name="menu" value="sales"/>
    </jsp:include>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                QingSword
                <small>销售机会明细表</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 销售机会</a></li>
                <li class="active">列表</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="box-title">
                <form id="serach" >
                    <div class="form-group inline" >
                        <input type="text" name="name" placeholder="输入搜索">
                    </div>
                    <div class="form-group inline">
                        <select name="" id="dd">
                            <option value="">初次接触</option>
                            <option value="">完成交易</option>
                        </select>
                    </div>
                    <div class="form-group inline">
                        <select name="" id="ddd">
                            <option value="">初次接触</option>
                            <option value="">完成交易</option>
                        </select>
                    </div>
                    <div class="form-group inline">
                        <button class="btn btn-default">搜索</button>
                    </div>

                </form>
            </div>

            <div class="box box-primary">

                <div class="box-header">
                    <h4>机会明细列表</h4>
                </div>
                <div class="box-body">
                    <table class="table" id="salesTable">
                        <thead>
                            <tr>
                                <td>机会名称</td>
                                <td>关联客户</td>
                                <td>金额</td>
                                <td>完成进度</td>
                                <td>最后跟进时间</td>
                                <td>跟进人</td>
                                <td>#</td>
                            </tr>
                        </thead>
                        <tbody></tbody>
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

<script src="/static/plugins/datatables/js/jquery.dataTables.min.js"></script>
<script src="/static/plugins/datatables/js/dataTables.bootstrap.min.js"></script>

<script>
    $(function () {
        //添加database
        var dataBase = $("#salesTable").DataTable({

            searching:false,//是否添加搜索
            serverSide:true,//
            ajax:"/sales/load",//请求的url
            ordering:false,
            "autoWidth": false,//自动调整
            columns:[
                {"data":function(row){
                    return "<a href='/sales/"+row.id+"'>"+row.name+"</a>"
                }},
                {"data":function(row){
                    return "<a href='/sales/"+row.costomerId+"'>"+row.costomerName+"</a>"
                }},
                {"data":"price"},
                {"data":"progress"},
                {"data":function(row){
                    var day = moment(row.createTime).format("YYYY-MM-DD HH:mm");
                    return day;
                }},
                {"data":"userName"},
                {"data":function () {

                }},
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







        })


    })
</script>
</body>
</html>
