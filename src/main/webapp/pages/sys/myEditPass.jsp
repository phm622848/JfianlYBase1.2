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
                                <div class="alert alert-success text-center">
                                    <button class="close" data-dismiss="alert">&times;</button>
                                    <strong id="message">${message}</strong>
                                </div>
                            </c:if>
                            <form class="form-horizontal" action="${basepath}/user/updatepass" method="post"
                                  id="commentForm">
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="oldpassword">
                                        原始密码：
                                    </label>
                                    <div class="col-sm-9">
                                        <input type="password" placeholder="请输入您的原始密码！" id="oldpassword"
                                               class="form-control">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="password">
                                        新密码：
                                    </label>
                                    <div class="col-sm-9">
                                        <input type="password" placeholder="请输入您的新密码！" id="password"
                                               name="user.password" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label" for="cfpassword">
                                        重复新密码：
                                    </label>
                                    <div class="col-sm-9">
                                        <input type="password" placeholder="请重复输入您的新密码！" id="cfpassword"
                                               name="cfpassword" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-2 text-center"></div>
                                    <button type="submit" class="btn btn-primary col-sm-3 ">
                                        保存
                                    </button>
                                    <div class="col-sm-2 text-center"></div>
                                    <button type="reset" class="btn btn-default col-sm-3 ">
                                        取消
                                    </button>
                                    <div class="col-sm-2 text-center"></div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

<c:import url="/pages/include/pageFoot.jsp" />
        <script type="text/javascript">

            $(document).ready(function () {
                $("#oldpassword").blur(function () {
                    var pass = $("#oldpassword").val();
                    $.ajax({
                        type: "GET",
                        url: "${basepath}/user/checkpass",
                        data: {oldpassword: pass},
                        dataType: "json",
                        success: function (data) {
                            if (data == 1) {
                                $("#oldline").html("<font color='green'>输入正确</font>");
                            } else {
                                $("#oldline").html("<font color='red'>输入错误</font>");
                                $("#oldpassword").val('');
                            }
                        }
                    });
                });
                $("#cfpassword").blur(function () {
                    var cfpassword = $("#cfpassword").val();
                    var password = $("#password").val();
                    if (cfpassword == password) {
                        $("#newline").html("<font color='green'>重复密码输入正确</font>");
                    } else {
                        $("#newline").html("<font color='red'>重复密码输入错误</font>");
                        $("#cfpassword").val('');
                    }

                });

                $("#save").click(function () {
                    var oldpass = $("#oldpassword").val();
                    var cfpass = $("#cfpassword").val();
                    var newpass = $("#password").val();

                    if (oldpass == '' || oldpass == null) {
                        $("#oldline").html("<font color='red'>请输入原密码</font>");
                        return false;
                    }
                    if (newpass == '' || newpass == null) {
                        $("#newpass").html("<font color='red'>请输入新密码</font>");
                        return false;
                    }
                    if (cfpass == '' || cfpass == null) {
                        $("#newline").html("<font color='red'>请重复输入新密码</font>");
                        return false;
                    }

                    $("#commentForm").submit();
                });
            });
        </script>