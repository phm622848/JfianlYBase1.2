<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/pages/include/pageNavigation.jsp" />
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
                        <h1>我的信息</h1>
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
                                我的面板
                            </a>
                        </li>
                        <li class="active">
                            我的信息
                        </li>
                    </ol>
                </div>
            </div>
            <!-- end: BREADCRUMB -->
            <!-- start: PAGE CONTENT -->
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-white">
                        <div class="panel-body">
                            <c:if test="${message!=null&&message!=''}">
                                <div class="alert alert-success text-center" >
                                    <button class="close" data-dismiss="alert">&times;</button>
                                    <strong>保存成功！</strong>
                                </div>
                            </c:if>
                            <form id="userinfoform" class="form-horizontal" action="${basepath}/user/saveInfo" method="post">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="username">
                                        用户姓名：
                                    </label>
                                    <div class="col-sm-9">
                                        <input type="text" placeholder="Text Field" id="username" class="form-control" disabled="disabled" value="${userToken.vuser.user.name}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="phone">
                                        用户电话：
                                    </label>
                                    <div class="col-sm-9">
                                        <input name="user.id" type="hidden" value="${userToken.vuser.user.id}" >
                                        <input type="text" placeholder="请输入您的电话！" value="${userToken.vuser.user.phone}" id="phone" name="user.phone" class="form-control">${phoneMsg}
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="usermobile">
                                        用户手机：
                                    </label>
                                    <div class="col-sm-9">
                                        <input type="text" placeholder="请输入您的手机号码！" value="${userToken.vuser.user.mobile}" id="usermobile" name="user.mobile" class="form-control">${mobileMsg}
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="useremail">
                                        用户邮箱：
                                    </label>
                                    <div class="col-sm-9">
                                        <input type="text" placeholder="请输入您的邮箱地址！" value="${userToken.vuser.user.email}" id="useremail" name="user.email" class="form-control">${emailMsg}
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="remark" class="col-sm-2 control-label" >
                                        备注信息：
                                    </label>
                                    <div class="col-sm-9">
                                    <textarea maxlength="50" id="remark" class="form-control limited" placeholder="请输入备注信息" name="user.remarks">${userToken.vuser.user.remarks}</textarea>

                                    </div>
                                </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label" >所属机构：</label>
                                        <div class="col-sm-9">
                                            <c:forEach items="${userToken.vuser.officenames}" var="officename" ><c:out value="${officename.value}" />|</c:forEach>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label" for="role">所属角色：</label>
                                        <div class="col-sm-9">
                                            <span id="role"><c:forEach items="${userToken.vuser.rolenames}" var="rolenames" ><c:out value="${rolenames.value}" />|</c:forEach>
                                            </span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-2 text-center"></div>
                                        <button type="submit" class="btn btn-primary col-sm-3 ">
                                            保存
                                        </button>
                                        <div class="col-sm-2 text-center"></div>
                                        <button type="button" class="btn btn-default col-sm-3 " onclick="javascript:window.location.href='${basepath}/user'">
                                            取消
                                        </button>
                                        <div class="col-sm-2 text-center"></div>
                                    </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- end: PAGE CONTENT-->
        </div>
        <div class="subviews">
            <div class="subviews-container"></div>
        </div>
    </div>
    <!-- end: PAGE -->
</div>
<!-- end: MAIN CONTAINER -->
<c:import url="/pages/include/pageFoot.jsp" />