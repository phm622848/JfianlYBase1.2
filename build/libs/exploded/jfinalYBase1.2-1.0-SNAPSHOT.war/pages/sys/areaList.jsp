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
                        <h1>地区管理</h1>
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
                            地区管理
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
                                <li class="active"><a href="${basepath}/area/add">地区列表</a></li>
                                <li><a href="${basepath}/area/addareainfo">地区添加</a></li>
                            </ul>
                            <div class="tab-content">
                                <div class="panel-body">
                                    <div class="col-sm-12">
                                        <c:if test="${message!=null&&message!=''}">
                                            <c:if test="${message=='success'}">
                                                <div class="alert alert-success"
                                                     style="text-align: center;">
                                                    <button class="close" data-dismiss="alert">&times;</button>
                                                    <strong>删除成功！</strong>
                                                </div>
                                            </c:if>
                                            <c:if test="${message=='error'}">
                                                <div class="alert alert-error"
                                                     style="text-align: center;">
                                                    <button class="close" data-dismiss="alert">&times;</button>
                                                    <strong>该菜单含有下级地区，请清空下级地区后重试！</strong>
                                                </div>
                                            </c:if>
                                        </c:if>
                                    </div>
                                    <form action="${basepath}/area/add" method="post" class="form-horizontal">
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">
                                                地区名：
                                            </label>
                                            <div class="col-sm-4">
                                                <input class="input-medium focused" id="areaname" name="areaname"
                                                       type="text" value="${areaname}"/>
                                            </div>
                                            <label class="col-sm-2 control-label">
                                                区域类型：
                                            </label>
                                            <div class="col-sm-4">
                                                <select class="form-control" id="areatype" name="areatype">
                                                    <option value="">--全部--</option>
                                                    <c:forEach items="${listdict}" var="dict">
                                                        <option value="${dict.dictkey}"
                                                                <c:if test="${areatype==dict.dictkey}">selected</c:if>>${dict.dictvalue}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group text-right">
                                            <div class="col-sm-12">
                                                <button type="submit" class="btn btn-primary btn-squared btn-lg"
                                                        id="query">查询
                                                </button>
                                            </div>
                                        </div>
                                    </form>
                                    <table id="treeTable" class="table table-striped table-bordered">
                                        <thead>
                                        <tr>
                                            <th>名称</th>
                                            <th>区域编码</th>
                                            <th>类型</th>
                                            <th>操作</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${listarea}" var="area">
                                            <tr id="${area.id}"
                                                pId="${area.parentId ne '1'?area.parentId:'0'}">
                                                <td nowrap>${area.name}</td>
                                                <td nowrap>${area.code}</td>
                                                <td nowrap><c:if test="${area.type=='1'}">国家</c:if> <c:if
                                                        test="${area.type=='2'}">省份/直辖市</c:if> <c:if
                                                        test="${area.type=='3'}">地市</c:if> <c:if
                                                        test="${area.type=='4'}">区县</c:if></td>
                                                <td nowrap><a
                                                        href="${basepath}/area/addareainfo?id=${area.id}"> 修改 </a> | <a
                                                        href=" ${basepath}/area/delareainfo?id=${area.id}"
                                                        onclick="return confirm('要删除该地区及所有子地区项吗？', this.href)"> 删除
                                                </a></td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <c:import url="/pages/include/pageFoot.jsp"/>
        <script type="text/javascript">
            $(document).ready(function () {
                $("#treeTable").treeTable({
                    expandLevel: 4
                }).show();
            });
        </script>