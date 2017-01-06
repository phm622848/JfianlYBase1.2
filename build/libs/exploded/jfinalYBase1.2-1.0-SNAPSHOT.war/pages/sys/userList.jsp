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
                        <h1>用户管理</h1>
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
                            用户管理
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
                                <li class="active"><a href="${basepath}/user/add">用户列表</a></li>
                                <li><a href="${basepath}/user/adduserinfo">用户添加</a></li>
                            </ul>
                            <div class="tab-content">
                                <div class="panel-body">
                                        <div class="alert alert-success no-display text-center" id="successmessage">
                                            <button  class="close" type="button"
                                                    onclick="$('#successmessage').hide();">&times;</button>
                                            <strong><span id="messagess"></span></strong>
                                        </div>
                                        <div class="alert alert-danger no-display text-center" id="errormessage">
                                            <button class="close" type="button"
                                                    onclick="$('#errormessage').hide();">&times;</button>
                                            <strong><span id="messageee"></span></strong>
                                        </div>
                                    <form action="${basepath}/user/exportUser" method="post" class="form-horizontal"
                                          id="userform">
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">
                                                用户姓名：
                                            </label>
                                            <div class="col-sm-3">
                                                <input class="form-control" id="username" name="username" type="text"/>
                                            </div>
                                            <label class="col-sm-2 control-label">
                                                用户类型：
                                            </label>
                                            <div class="col-sm-3">
                                                <select class="form-control" id="usertype" name="usertype">
                                                    <option value="">--全部--</option>
                                                    <c:forEach items="${listdict}" var="dict">
                                                        <option value="${dict.dictkey}">${dict.dictvalue}</option>
                                                    </c:forEach>
                                                </select>
                                                <input type="hidden" id="userpages" name="userpages"/><input
                                                    type="hidden" id="userrp" name="userrp"/>
                                            </div>
                                            <div class="col-sm-2">
                                                <button class="btn btn-primary btn-squared btn-lg" type="button"
                                                        id="query">查询
                                                </button>
                                                <%--<button class="btn btn-primary btn-squared btn-lg" type="button"
                                                        id="export">导出
                                                </button>--%>
                                            </div>
                                        </div>
                                    </form>
                                    <table id="userList" class="table table-striped table-bordered">
                                        <thead>
                                        <tr>
                                            <th>用户姓名</th>
                                            <th>用户登录名称</th>
                                            <th>用户邮箱</th>
                                            <th>用户电话</th>
                                            <th>用户类型</th>
                                            <th>是否启用</th>
                                            <th>操作</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                        <!-- tbody是必须的 -->
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<c:import url="/pages/include/pageFoot.jsp"/>
<script type="text/javascript">
    function edit(ids) {
        location.href = "${basepath}/user/adduserinfo?id=" + ids;
    }
    function reset(ids) {
        if (confirm("确定要重置该用户密码？重置后的密码是6个1")) {
            $.ajax({
                type: 'post',
                url: '${basepath}/user/resetpassword?id=' + ids,
                cache: false,
                dataType: 'json',
                success: function (data) {
                    if (data == '1') {
                        $("#successmessage").hide();
                        $("#errormessage").show();
                        $("#messageee").text("重置失败，请联系管理员！");
                    } else {
                        $("#errormessage").hide();
                        $("#successmessage").show();
                        $("#messagess").text("重置成功！");
                    }
                    reshcg();
                }
            });
        }
    }

    function del(ids) {
        if (confirm("确定要删除该用户？")) {
            $.ajax({
                type: 'post',
                url: '${basepath}/user/deluserinfo?id=' + ids,
                cache: false,
                dataType: 'json',
                success: function (data) {
                    if (data == '1') {
                        $("#successmessage").hide();
                        $("#errormessage").show();
                        $("#messageee").text("删除失败，请联系管理员！");
                    } else {
                        $("#errormessage").hide();
                        $("#successmessage").show();
                        $("#messagess").text("删除成功！");
                    }
                    reshcg();
                }
            });
        }
    }
    $(document).ready(function () {
        $('.datetimepicker').datetimepicker({
            language: 'zh-CN',
            format: 'yyyy-mm-dd',
            weekStart: 1,
            todayBtn: 1,
            autoclose: true,
            todayHighlight: 1,
            startView: 2,
            forceParse: true,
            minView: 2,//只到天
            showMeridian: 1
        }).on('changeDate', function (ev) {
            $(this).datetimepicker('hide');
        });

        oTable = $('#userList').initDT({
            serverSide: true,
            "sAjaxSource": "${basepath}/user/addUserList"
        });

        $("#query").click(function () {
            reshcg();
        });

        $('#ceatetimes').click(function () {
            $('#starttime').val('');
        });
        $('#ceatetimee').click(function () {
            $('#endtime').val('');
        });
        $("#export").click(function () {
            $("#userpages").val(oTable.getCurrentPage());
            $("#userrp").val(oTable.getPageSize());
            $("#userform").submit();
        });

    });
    function reshcg() {
        var username = $('#username').val();
        var usertype = $('#usertype').val();
        var starttime = $('#starttime').val();
        var endtime = $('#endtime').val();
        var oSettings = [{
            "name": "username",
            "value": username
        }, {
            "name": "usertype",
            "value": usertype
        }, {
            "name": "starttime",
            "value": starttime
        }, {
            "name": "endtime",
            "value": endtime
        }];
        oTable.gridSearch(this, oSettings);
    }
</script>