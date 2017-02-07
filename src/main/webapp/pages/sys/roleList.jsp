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
                        <h1>角色管理</h1>
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
                            角色管理
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
                                <li class="active">
                                    <a href="${basepath}/role/add">角色列表</a>
                                </li>
                                <li>
                                    <a href="${basepath}/role/addroleinfo">角色添加</a>
                                </li>
                            </ul>
                            <div class="tab-content">
                                <div class="panel-body">
                                    <div class="alert alert-success text-center no-display"
                                         id="successmessage">
                                        <button class="close" onclick="$('#successmessage').hide();">&times;</button>
                                        <strong><span id="messagess"></span></strong>
                                    </div>
                                    <div class="alert alert-danger text-center no-display"
                                         id="errormessage">
                                        <button class="close" onclick="$('#errormessage').hide();">&times;</button>
                                        <strong><span id="messageee"></span></strong>
                                    </div>
                                    <form action="${basepath}/role/exportRole" method="post" class="form-horizontal"
                                          id="roleform">
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">
                                                角色名称：
                                            </label>
                                            <div class="col-sm-4">
                                                <input class="form-control" id="rolename" name="rolename" type="text"/>
                                            </div>
                                            <label class="col-sm-2 control-label">
                                                角色类型：
                                            </label>
                                            <div class="col-sm-4">
                                                <select class="form-control" id="roletype" name="roletype">
                                                    <option value="">--全部--</option>
                                                    <c:forEach items="${listdict}" var="dict">
                                                        <option value="${dict.dictkey}">${dict.dictvalue}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group text-left">
                                            <label class="col-sm-2 control-label">
                                                <a href='#' id="ceatetimes"
                                                   style="color: black; text-decoration: none;">创建时间：</a>
                                            </label>
                                            <div class="col-sm-4">
                                                <input type="text" class="form-control datetimepicker" id="starttimes"
                                                       value="" name="starttimes">
                                            </div>
                                            <label class="col-sm-2 control-label">
                                                <a href='#' id="ceatetimee"
                                                   style="color: black; text-decoration: none;">至：</a>
                                            </label>
                                            <div class="col-sm-4">
                                                <input type="text" class="form-control datetimepicker" id="endtimes"
                                                       value="" name="endtimes">
                                            </div>
                                        </div>
                                        <input type="hidden" id="rolepages" name="rolepages"/><input
                                            type="hidden" id="rolerp" name="rolerp"/>
                                        <div class="form-group text-right">
                                            <div class="col-sm-12">
                                                <button type="button" class="btn btn-primary btn-squared btn-lg"
                                                        id="query">
                                                    查询
                                                </button>
                                                <button type="button" class="btn btn-info btn-squared btn-lg"
                                                        id="export">
                                                    导出
                                                </button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <div class="panel-body">
                                    <table id="roleList" class="table table-striped table-bordered">
                                        <thead>
                                        <tr>
                                            <th>角色名称</th>
                                            <th>角色类型</th>
                                            <th>创建人</th>
                                            <th>创建时间</th>
                                            <th>拥有权限</th>
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
    jQuery(document).ready(function () {
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

        oTable = $('#roleList').initDT({
            serverSide: true,
            "sAjaxSource": "${basepath}/role/addinfo"
        });

        $("#query").click(function () {
            reshcg();
        });

        $('#ceatetimes').click(function () {
            $('#starttimes').val('');
        });
        $('#ceatetimee').click(function () {
            $('#endtimes').val('');
        });
        $("#export").click(function () {
            $("#rolepages").val(oTable.getCurrentPage());
            $("#rolerp").val(oTable.getPageSize());
            $("#roleform").submit();
        });

    });
    function edit(ids) {
        location.href = "${basepath}/role/addroleinfo?id=" + ids;
    }

    function del(ids) {
        if (confirm("确定要删除该角色？")) {
            $.ajax({
                type: 'post',
                url: '${basepath}/role/delroleinfo?id=' + ids,
                cache: false,
                dataType: 'json',
                success: function (data) {
                    if (data == '1') {
                        $("#successmessage").hide();
                        $("#errormessage").show();
                        $("#messageee").text("当前角色已被用户使用中，无法删除！");
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

    function reshcg() {
        var rolename = $('#rolename').val();
        var roletype = $('#roletype').val();
        var starttimes = $('#starttimes').val();
        var endtimes = $('#endtimes').val();
        var oSettings = [{
            "name": "rolename",
            "value": rolename
        }, {
            "name": "roletype",
            "value": roletype
        }, {
            "name": "starttimes",
            "value": starttimes
        }, {
            "name": "endtimes",
            "value": endtimes
        }];
        oTable.gridSearch(this, oSettings);
    }
</script>