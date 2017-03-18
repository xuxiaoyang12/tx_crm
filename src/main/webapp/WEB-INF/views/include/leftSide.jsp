<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- Left side column. contains the logo and sidebar -->
<aside class="main-sidebar">

    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">


        <!-- Sidebar Menu -->
        <ul class="sidebar-menu">
            <%--<li class="header">HEADER</li>--%>
            <!-- Optionally, you can add icons to the links -->

            <li><a href="/home"><i class="fa fa-home"></i> <span>首页</span></a></li>
            <li><a href="/notice"><i class="fa fa-bullhorn"></i> <span>公告</span></a></li>
            <li><a href="/sales"><i class="fa fa-building-o"></i> <span>销售机会</span></a></li>
            <li><a href="/customer"><i class="fa fa-users"></i> <span>客户管理</span></a></li>
            <li><a href="/chart"><i class="fa fa-bar-chart"></i> <span>统计</span></a></li>
            <li><a href="/task"><i class="fa fa-calendar-check-o"></i> <span>待办事项</span></a></li>
            <li><a href="/doc"><i class="fa fa-file-text"></i> <span>文档管理</span></a></li>

            <li class="treeview">
                <a href="javascript:;"><i class="fa fa-cogs"></i> <span>系统管理</span> <i class="fa fa-angle-left pull-right"></i></a>
                <ul class="treeview-menu">
                    <li><a href="/admin/users">员工管理</a></li>
                    <li><a href="#">系统设置</a></li>
                </ul>
            </li>

        </ul>
        <!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
</aside>