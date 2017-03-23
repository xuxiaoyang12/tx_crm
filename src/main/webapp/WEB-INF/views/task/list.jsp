<%--
  Created by IntelliJ IDEA.
  User: Mxia
  Date: 2017/3/22
  Time: 17:01
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
    <link rel="stylesheet" href="/static/plugins/fullcalendar/fullcalendar.css">
    <link rel="stylesheet" href="/static/plugins/datepicker/datepicker3.css">
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
        <jsp:param name="menu" value="task"/>
    </jsp:include>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                QingSword
                <small>待办事项</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> QingSword</a></li>
                <li class="active">待办事项</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">

                <div class="row">
                    <div class="col-md-8">
                        <div class="box box-success">
                            <div class="box-header">
                                <h4>
                                    待办事项
                                    <small>日历选择</small>
                                </h4>

                            </div>
                            <div class="box-body">
                                <div id="calender">

                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="col-md-4">
                        <div class="box box-danger">
                            <div class="box-header">
                                <h4>已延期事项</h4>
                            </div>
                            <div class="box-body">
                               <ul class="todo-list">
                                   <li>
                                       <input type="checkbox" id="checkout">
                                       <span>添加待办事项</span>
                                       <div class="tools">
                                           <a href="/task/del/${task.id}"> <i class="fa fa-trash"></i></a>
                                       </div>
                                   </li>
                               </ul>
                            </div>
                        </div>

                    </div>
                </div>
        </section>
        <!-- /.content -->
        <%--新增代办事项模态框--%>
        <div class="modal fade" id="taskModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">x</span></button>
                        <h4>新增待办事项</h4>
                    </div>
                    <div class="modal-body">
                        <form id="newForm">
                            <div class="form-group">
                                <label>待办内容</label>
                                <input type="text" name="title" class="form-control">
                            </div>
                            <div class="form-group">
                                <label>开始时间</label>
                                <input id="task_start_time" type="text" name="start" class="form-control">
                            </div>
                            <div class="form-group">
                                <label>结束时间</label>
                                <input id="task_end_time" type="text" name="end" class="form-control">
                            </div>
                            <div class="form-group form-inline">
                                <label>提示时间</label><br/>
                                <select name="hour" id="task_hour_time" class="form-control" >
                                    <option value=""></option>
                                    <option value="00">00</option>
                                    <option value="01">01</option>
                                    <option value="02">02</option>
                                    <option value="03">03</option>
                                    <option value="04">04</option>
                                    <option value="05">05</option>
                                    <option value="06">06</option>
                                    <option value="07">07</option>
                                    <option value="08">08</option>
                                    <option value="09">09</option>
                                    <option value="10">10</option>
                                    <option value="11">11</option>
                                    <option value="12">12</option>
                                    <option value="13">13</option>
                                    <option value="14">14</option>
                                    <option value="15">15</option>
                                    <option value="16">16</option>
                                    <option value="17">17</option>
                                    <option value="18">18</option>
                                    <option value="19">19</option>
                                    <option value="20">20</option>
                                    <option value="21">21</option>
                                    <option value="22">22</option>
                                    <option value="23">23</option>
                                </select>
                                ：
                                <select name="minute" id="task_minute_time" class="form-control">
                                    <option value=""></option>
                                    <option value="00">00</option>
                                    <option value="05">05</option>
                                    <option value="10">10</option>
                                    <option value="15">15</option>
                                    <option value="20">20</option>
                                    <option value="25">25</option>
                                    <option value="30">30</option>
                                    <option value="35">35</option>
                                    <option value="40">40</option>
                                    <option value="45">45</option>
                                    <option value="50">50</option>
                                    <option value="55">55</option>
                                </select>

                            </div>
                            <div class="form-group">
                                <label>显示颜色</label>
                                <%--<input type="text" name="color" value="#61a5e8" class="form-control">--%>
                                <select name="color" id="" class="form-control">
                                    <option value="#61a5e8">默认</option>
                                    <option value="#5cd44a">绿色</option>
                                    <option value="#5288d4">天蓝色</option>
                                    <option value="#281ed4">深蓝色</option>
                                    <option value="#d41314">红色</option>
                                    <option value="#cccccc">灰色</option>
                                    <option value="#d8529a">粉色</option>
                                    <%--<div style="color: #d8529a"></div>--%>
                                </select>
                            </div>
                        </form>
                        <div class="modal-footer">
                            <button class="btn btn-default" data-dismiss="modal">取消</button>
                            <button class="btn btn-primary" id="saveBtn">保存</button>
                        </div>
                    </div>


                </div>
            </div>

        </div>
        <%--待办事项点击模态框--%>
        <div class="modal fade" id="see_task_Modal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">x</span></button>
                        <h4>编辑待办事项</h4>
                    </div>
                    <div class="modal-body">
                        <form id="editForm">
                            <input type="hidden" id="edit_task_id">
                            <div class="form-group">
                                <label>日程内容：</label>
                                <input disabled id="edit_task_title" type="text" name="title" class="form-control">
                            </div>
                            <div class="form-group form-inline">
                                <label>开始时间：</label>
                                <input disabled id="edit_task_start" type="text" name="start" class="form-control">
                                <label>结束时间：</label>
                                <input disabled id="edit_task_end" type="text" name="end" class="form-control">
                            </div>
                            <div class="form-group form-inline">
                                <label>提醒时间：</label>
                                <input disabled id="edit_task_reminderTime" type="text" class="form-control">
                            </div>
                        </form>
                        <div class="modal-footer">
                            <button class="btn btn-default" data-dismiss="modal">取消</button>
                            <button class="btn btn-danger"  id="del_btn" rel="" ><i class="fa fa-trash">删除</i></button>
                            <button class="btn btn-success" id="mark_btn" rel="" ><i class="fa fa-check"></i>标记为已读</button>

                        </div>

                    </div>
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
<script src="/static/plugins/moment/moment.min.js"></script>
<script src="/static/plugins/fullcalendar/fullcalendar.js"></script>
<%--<script src="/static/plugins/fullcalendar/zh-cn.js"></script>--%>
<%--日期插件--%>
<script src="/static/plugins/datepicker/bootstrap-datepicker.js"></script>
<script src="/static/plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js"></script>
<script src="/static/plugins/layer/layer.js"></script>
<script src="/static/plugins/validate/jquery.validate.min.js"></script>


<script>
    $(function () {
        var $calender = $("#calender")
        var _event = null;
        $calender.fullCalendar({
            lang:'zh-TW',//语言格式-台湾
            buttonText:{
                today:    '今天'

            },//改变返回当天的字符为中文
            titleFormat:'YYYY MMMM ',//显示主题头日期格式
            //添加点击事件
            dayClick: function(date) {
                $("#task_start_time").val(moment(date).format("YYYY-MM-DD"));

                $("#newForm")[0].reset();
                $("#taskModal").modal({
                    show:true,
                    backdrop:'static',
                    keyboard:false
                })
            },
            //获取事件源
            events:{
                //自动渲染颜色
                url:'/task/list',
                //color:'#238888',

            },
            //简单的设置事件的方式
         /*   events:[{
                title  : 'event2',
                start  : '2017-03-05',
                end    : '2017-03-07'
            }],*/
            //鼠标单击悬停
           /* eventMouseout:function (calEvent,jsEvent,view) {
                alert("out")

            },*/
            selectable: true,//允许选取多天
            select: function( startDate, endDate, allDay, jsEvent, view ){
                $("#newForm")[0].reset();
                var start =moment(startDate).format("YYYY-MM-DD");
                var end =moment(endDate).format("YYYY-MM-DD")
                $("#task_start_time").val(start);
                $("#task_end_time").val(end);

                $("#taskModal").modal({
                    show:true,
                    backdrop:'static',
                    keyboard:false
                })
            },
            editable: true,//设置是否可编辑
            //事件拖放
            eventDrop:function(event,delta,revertFunc,jsEvent,ui,view) {
                var start = moment(event.start).format("YYYY-MM-DD");
                var end = moment(event.end).format("YYYY-MM-DD");

               $.post("/task/drop",{"id":event.id,"start":start,"end":end}).done(function (data) {
                   if(data.state != 'success') {
                       layer.msg("拖放失败");
                       revertFunc()//恢复原状
                   }
               }).error(function () {
                   layer.msg("服务器错误")
               })
            },
           /* events: function(start, end, timezone, callback) {
                $.ajax({
                    url: '/task/load',
                    dataType: 'xml',
                    data: {
                        // our hypothetical feed requires UNIX timestamps
                        start: start.unix(),
                        end: end.unix()
                    },
                    success: function(doc) {
                        var events = [];
                        $(doc).find('event').each(function() {
                            events.push({
                                title: $(this).attr('title'),
                                start: $(this).attr('start') // will be parsed
                            });
                        });
                        callback(events);
                    },
                    color: 'yellow',   // an option!
                    textColor: 'black' // an option!
                });
            },*/
            //渲染时间的点击事件
            eventClick:function(calEvent, jsEvent, view){
                _event = calEvent;
                //给模态框里赋值
                $("#edit_task_id").val(calEvent.id);
                $("#edit_task_title").val(calEvent.title);
                $("#edit_task_start").val(moment(calEvent.start).format("YYYY-MM-DD"));
                $("#edit_task_end").val(moment(calEvent.end).format("YYYY-MM-DD"));
                if(calEvent.reminderTime) {
                    $("#edit_task_reminderTime").val(calEvent.reminderTime);
                }else{
                    $("#edit_task_reminderTime").val("无");
                }

                //弹出模态框
                $("#see_task_Modal").modal({
                    show:true,
                    keyboard:false,
                    backdrop:'static'
                })
            }


        });
        //通过返回对象中的三个属性来(渲染)显示事件的
       /* $calender.fullCalendar('renderEvent', {
            title  : 'event2',
            start  : '2017-03-05',
            end    : '2017-03-07'
        })*/

       //设置添加待办事项中的日期
        $("#task_start_time,#task_end_time").datepicker({
            language:'zh-CN',
            autoclose:true,
            format:'yyyy-mm-dd',
            todayHighlight:true

        })

        //表单认证
        $("#newForm").validate({
            errorClass:'text-danger',
            errorElement:'span',
            rules:{
                title:{
                    required:true
                },
                start:{
                    required:true
                },
                end:{
                    required:true
                },
                color:{
                    required:true
                }
            },
            messages:{
                title:{
                    required:'请输入内容'
                },
                start:{
                    required:'请选择开始时间'
                },
                end:{
                    required:'请选择结束时间'
                },
                color:{
                    required:'请选择时间颜色'
                }
            },
            submitHandler:function () {
                $.ajax({
                    url:'/task/new',
                    type:'post',
                    data:$("#newForm").serialize(),
                    success:function (data) {
                        if(data.state == 'success') {
                            //渲染事件到日历上
                            $calender.fullCalendar('renderEvent',data.data);
                            //隐藏模态框
                            $("#taskModal").modal('hide');

                        }
                    },
                    error:function () {
                        layer.msg("服务器错误！");
                    }
                })

            }
        })
        //提交代办事项
        $("#saveBtn").click(function () {
            $("#newForm").submit();
        })
        //删除待办事项
        $("#del_btn").click(function () {
            //获取待办事项id
            var id = $("#edit_task_id").val();
            layer.confirm("确认要删除吗？",function() {
                $.post('/task/del',{"id":id}).done(function (data) {
                    if(data.state == 'success') {
                        layer.msg("删除成功");
                        //移除属性
                        $calender.fullCalendar('removeEvents',id)
                        $("#see_task_Modal").modal('hide');
                        //window.history.go(0);
                    }else{
                        layer.msg("删除失败")
                    }
                }).error(function () {
                    layer.msg("服务器错误");
                })
            })
        });
        //标记代办事项未已读
        $("#mark_btn").click(function () {
            var id = $("#edit_task_id").val();
            $.post('/task/edit',{"id":id}).done(function (data) {
                if(data.state == 'success') {
                    layer.msg("标记成功");
                    _event.color = '#cccccc';
                    //更新属性
                    $calender.fullCalendar('updateEvent',_event);
                    $("#see_task_Modal").modal('hide');
                    //window.history.go(0);
                }else{
                    layer.msg("标记失败")
                }
            }).error(function () {
                layer.msg("服务器错误");
            })
        })

    })
</script>
</body>
</html>

