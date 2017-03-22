<%--
  Created by IntelliJ IDEA.
  User: Mxia
  Date: 2017/3/18
  Time: 13:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="x-ua-compatible" content="IE=edge">
    <title>QingSword 新增</title>
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

    <%--添加文本编辑器的插件--%>
    <link rel="stylesheet" href="/static/plugins/simditor/styles/simditor.css">
    <link rel="stylesheet" href="/static/plugins/simditor/styles/editor.scss">
    <link rel="stylesheet" href="/static/plugins/simditor/styles/fonticon.scss">

</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

    <%@include file="../include/mainHeader.jsp"%>
    <jsp:include page="../include/leftSide.jsp">
        <jsp:param name="menu" value="notice"/>
    </jsp:include>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">

        <!-- Main content -->
        <section class="content">
            <!-- Your Page Content Here -->
            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">新增</h3>

                </div>
                <div class="box-body">
                    <form action="/notice/new" method="post" id="newForm">
                        <div class="form-group">
                            <label>主题</label>
                            <input type="text" name="title" value="" placeholder="请输入新增主题名称" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>公告内容</label>
                            <%--rows代表文本框的行数  也就是有个多高--%>
                            <textarea name="context" rows="10" class="form-control" placeholder="输入内容" id="context"></textarea>
                        </div>

                        <div class="form-group">

                            <button id="newBtn" class="btn btn-primary">发布公告</button>

                        </div>
                    </form>
                </div>
                <div class="box-footer ">
                    <%--<button id="newBtn" type="button" class="btn btn-primary">发布公告</button>--%>
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

<%--文本编辑器的插件--%>
<script src="/static/plugins/simditor/scripts/module.js"></script>
<script src="/static/plugins/simditor/scripts/hotkeys.js"></script>
<script src="/static/plugins/simditor/scripts/uploader.js"></script>

<script src="/static/plugins/simditor/scripts/simditor.min.js"></script>
<script src="/static/plugins/simditor/scripts/simditor-emoji.js"></script>

<script >
    $(function () {
        //文本框编辑器
      var edit = new Simditor({
          //关联文本框
          textarea: $("#context"),
          //设置文本提示输入
          placeholder:"亲..请输入公告内容",
          //手动设置 编辑头
          // 如果不设置自动生成默认设置
          toolbar: ['title','bold','italic','underline','strikethrough',
              'fontScale','color','ol' ,'ul', 'blockquote','code',
              'table', 'image','emoji'],
          emoji: {
              //添加表请路径
              imagePath: '/static/plugins/simditor/emoji',
              //添加表情 图片名称
              images: ['+1.png','a.png','ab.png',
                  '100.png',
                  '109.png']
          },
          //上传图片 七牛云
          upload:{
              url: 'http://up-z1.qiniu.com/',
              params:{"token":"${token}"},
              fileKey:'file'
          }
      });
        //提交表单
        $("#newBtn").click(function () {
            $("#newForm").submit();
        })

    })

</script>


</body>
</html>
