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
    <link rel="stylesheet" href="/static/plugins/daterangepicker/daterangepicker-bs3.css">
    <link rel="stylesheet" href="/static/plugins/datepicker/datepicker3.css">
    <link rel="stylesheet" href="/static/plugins/layer/skin/default/layer.css">
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
                <form id="serach" class="form-inline" >
                    <div class="form-group">
                        <input type="hidden" id="q_start_time">
                        <input type="hidden" id="q_end_time">
                        <input id="q_name" type="text" name="name" placeholder="输入机会名称" class="form-control">
                    </div>

                    <div class="form-group">
                        <select  id="q_progress" class="form-control">
                            <option value="">当前进度</option>
                            <option value="初次接触">初次接触</option>
                            <option value="提交合同">提交合同</option>
                            <option value="确认意向">确认意向</option>
                            <option value="完成交易">完成交易</option>
                            <option value="交易搁置">交易搁置</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <input type="text" id="dataranglepicker" class="form-control">
                    </div>
                    <div class="form-group">
                        <button id="search_btn" class="btn btn-default">搜索</button>
                    </div>

                </form>

            </div>
            <h3></h3>
            <div class="box box-solid">

                <div class="box-header">
                    <h4>机会明细列表</h4>
                    <div class="box-tools">
                        <button class="btn btn-primary btn-xs" id="addSales"><i class="fa fa-plus">新增机会</i></button>
                    </div>
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

            <%--当点击新增时弹出模态框--%>
            <div class="modal fade" id="salesModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">x</span></button>
                            <h4>新增机会</h4>
                        </div>
                        <div class="modal-body">
                            <form action="/sales/new" method="post" id="newForm">
                                <div class="form-group">
                                    <label>机会名称</label>
                                    <input id="sales_name" type="text" name="name" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label>价值</label>
                                    <input id="sales_price" type="text" name="price" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label>关联客户</label>
                                    <select name="customerId" id="sales_customer_name" class="form-control" >
                                        <option value="">选择客户</option>
                                        <option value="1">tom</option>
                                        <option value="2">jack</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>当前进度</label>
                                    <select name="progress" id="sales_progress" class="form-control">
                                        <option value="">当前进度</option>
                                        <option value="初次接触">初次接触</option>
                                        <option value="提供合同">提供合同</option>
                                        <option value="完成交易">完成交易</option>
                                        <option value="交易搁置">交易搁置</option>
                                    </select>
                                </div>
                                <div class="modal-footer">
                                    <button class="btn btn-default" data-dismiss="modal">取消</button>
                                    <button class="btn btn-primary" id="saveSalesBtn">保存</button>
                                </div>

                            </form>

                        </div>
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

<script src="/static/plugins/datatables/js/jquery.dataTables.min.js"></script>
<script src="/static/plugins/datatables/js/dataTables.bootstrap.min.js"></script>
<script src="/static/plugins/moment/moment.min.js"></script>
<%--日期范围选择框--%>
<script src="/static/plugins/daterangepicker/daterangepicker.js"></script>
<script src="/static/plugins/datepicker/bootstrap-datepicker.js"></script>
<script src="/static/plugins/validate/jquery.validate.min.js"></script>
<script src="/static/plugins/layer/layer.js"></script>

<script>
    $(function () {
        //添加database
        var dataBase = $("#salesTable").DataTable({

            searching:false,//是否添加搜索
            serverSide:true,//
            ajax:{
                url:"/sales/load",
                data:function(dataSouce) {
                    dataSouce.name = $("#q_name").val();
                    dataSouce.progress = $("#q_progress").val();
                    dataSouce.startTime = $("#q_start_time").val();
                    dataSouce.endTime = $("#q_end_time").val();


                }

            },//请求的url
            ordering:false,
            "autoWidth": false,//自动调整
            columns:[
                {"data":function(row){
                    return "<a href='/sales/"+row.id+"'>"+row.name+"</a>"
                }},
                {"data":function(row){
                    return "<a href='/sales/"+row.customerId+"'>"+row.customerName+"</a>"
                }},
                {"data":function (row) {
                    return "￥"+row.price;
                }},
                {"data":"progress"},
                {"data":function(row){
                    var day = moment(row.lastTime).format("YYYY-MM-DD");
                    return day;
                }},
                {"data":"userName"},
                {"data":function () {
                        return "编辑"
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


        });
        //搜索
        $("#search_btn").click(function(){
            dataBase.ajax.reload();

        });


        //搜索日期选择框
        $("#dataranglepicker").daterangepicker({
            format:'YYYY-MM-DD',
            separator:'-',
            locale:{
                "applyLabel": "选择",
                "cancelLabel": "取消",
                "fromLabel": "从",
                "toLabel": "到",
                "customRangeLabel": "自定义",
                "weekLabel": "周",
                "daysOfWeek": [
                    "日",
                    "一",
                    "二",
                    "三",
                    "四",
                    "五",
                    "六"

                ],
                "monthNames": [
                    "一月",
                    "二月",
                    "三月",
                    "四月",
                    "五月",
                    "六月",
                    "七月",
                    "八月",
                    "九月",
                    "十月",
                    "十一月",
                    "十二月"
                ],
                "firstDay": 1,
            },
            ranges:{
                '今天':[moment(),moment()],
                '昨天':[moment().subtract(1,'days'),moment().subtract(1,'days')],
                '最近七天':[moment().subtract(6,'days'),moment()],
                '最近30天':[moment().subtract(29,'days'),moment()],
                '本月':[moment().startOf('momth'),moment().endOf('momth')]
            }
        });
        //点击日期框获取范围日期 并赋予到input中
        $('#dataranglepicker').on('apply.daterangepicker', function(ev, picker) {
            $("#q_start_time").val(picker.startDate.format('YYYY-MM-DD'));
            $("#q_end_time").val(picker.endDate.format('YYYY-MM-DD'));
            console.log(picker.startDate.format('YYYY-MM-DD'));
            console.log(picker.endDate.format('YYYY-MM-DD'));
        });


        //点击弹出模态框
        $("#addSales").click(function () {
            //重置模态框中的值
            $("#newForm")[0].reset();
            $("#salesModal").modal({
                show:true,
                backdrop:'static',
                keyboard:false
            })
        });

        //模态框提交
        //加入表单验证
        $("#newForm").validate({
            errorClass:'text-danger',
            errorElement:'span',
            rules:{
                name:{
                    required:true,
                } ,
                price:{
                    required:true,
                },
                customerId:{
                    required:true,
                },
                progress:{
                    required:true
                }

            },
            messages:{
                name:{
                    required:'请输入机会名称',
                } ,
                price:{
                    required:'请输入金额',
                },
                customerId:{
                    required:'请选择关联客户',
                },
                progress:{
                    required:'请选择进度'
                }
            },
            submitHandler:function() {
                $.ajax({
                    type:'post',
                    url:"/sales/new",
                    data:$("#newForm").serialize(),
                    success:function(data){
                        if(data.state == 'success') {
                            layer.msg("新增客户成功");
                            $("#salesModal").modal('hide');
                            dataBase.ajax.reload();
                        } else {
                            layer.msg("添加失败")
                        }
                    },
                    error:function(){
                        alert("服务器错误");
                    },


                })

            }

        })
    })
</script>
</body>
</html>
