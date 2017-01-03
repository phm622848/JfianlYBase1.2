<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/pages/include/pageNavigation.jsp"/>
<!-- start: MAIN CONTAINER -->
<div class="main-container inner">
    <!-- start: PAGE -->
    <div class="main-content">
        <div class="container">
            <!-- start: PAGE HEADER -->
            <!-- start: TOOLBAR -->
            <div class="toolbar row">
                <div class="col-sm-6 hidden-xs">
                    <div class="page-center">
                        <h1>菜单列表</h1>
                    </div>
                </div>
            </div>
            <!-- end: TOOLBAR -->
            <!-- end: PAGE HEADER -->
            <!-- start: BREADCRUMB -->
            <div class="row">
                <div class="col-md-12">
                    <ol class="breadcrumb">
                        <li>
                            <a href="#">
                                系统管理
                            </a>
                        </li>
                        <li class="active">
                            菜单列表
                        </li>
                    </ol>
                </div>
            </div>
            <!-- end: BREADCRUMB -->
            <!-- start: PAGE CONTENT -->
            <div class="panel-body">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="tabbable">
                            <ul id="myTab2" class="nav nav-tabs">
                                <li class="active"><a href="#">菜单列表</a></li>
                                <li><a href="${basepath}/menu/addmenuinfo">菜单添加</a></li>
                            </ul>
                            <div class="tab-content">
                                <div class="panel-body">
                                    <div class="alert alert-success no-display text-center"
                                         id="successmessage">
                                        <button class="close" onclick="$('#successmessage').hide();">&times;</button>
                                        <strong><span id="messagess"></span></strong>
                                    </div>
                                    <div class="alert alert-danger no-display text-center"
                                         id="errormessage">
                                        <button class="close" onclick="$('#errormessage').hide();">&times;</button>
                                        <strong><span id="messageee"></span></strong>
                                    </div>
                                        <button class="btn btn-lg btn-primary pull-right btn-squared" style="margin-bottom: 1%;" type="button"
                                                onclick="menusynchronization();" id="menusynchronization">菜单同步
                                        </button>
                                    <form id="listForm" method="post">
                                        <table id="treeTable" class="table table-striped table-bordered"
                                               style="width: 100%">
                                            <thead>
                                            <tr>
                                                <th>名称</th>
                                                <th>链接</th>
                                                <th>可见</th>
                                                <th>权限标识</th>
                                                <th>操作</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${listmenu}" var="menu">
                                                <tr id="${menu.id}"
                                                    pId="${menu.parentId ne '1'?menu.parentId:'0'}">
                                                    <td nowrap><i
                                                            class="icon-${not empty menu.icon?menu.icon:' hide'}"></i><span>${menu.name}</span>
                                                        <input type="hidden" name="ids" value="${menu.id}"/></td>
                                                    <td title="${menu.href}">${menu.href}</td>
                                                    <td>${menu.isShow eq '1'?'显示':'隐藏'}</td>
                                                    <td title="${menu.permission}">${menu.permission}</td>
                                                    <td nowrap><a
                                                            href="${basepath}/menu/addmenuinfo?id=${menu.id}">修改</a>|<a
                                                            href="${basepath}/menu/delmenuinfo?id=${menu.id}"
                                                            onclick="return confirm('要删除该菜单项吗？', this.href)">删除</a></td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <c:import url="/pages/include/pageFoot.jsp"/>
        <script type="text/javascript">
            function menusynchronization() {
                $.ajax({
                    type: 'post',
                    url: '${basepath}/menu/menusynchronization',
                    cache: false,
                    dataType: 'json',
                    success: function (data) {
                        if (data == '2') {
                            $("#successmessage").hide();
                            $("#errormessage").show();
                            $("#messageee").text("菜单同步异常！");
                        } else {
                            $("#errormessage").hide();
                            $("#successmessage").show();
                            $("#messagess").text("菜单同步成功！");
                        }
                    }
                });
            }
            setTimeout(function () {
                $("#notice").css("display", "none");
            }, 5000);
            $(document).ready(function () {
                $("#treeTable").treeTable({
                    expandLevel: 3
                }).show();
            });
        </script>