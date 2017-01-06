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
                        <h1>日志管理</h1>
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
                            日志管理
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
                            <div class="tab-content">
                                <div class="panel-body">
                                    <div class="col-sm-12">
                                        <div class="alert alert-success text-center"
                                             id="successmessage">
                                            <button class="close"
                                                    onclick="$('#successmessage').hide();">&times;</button>
                                            <strong><span id="messagess"></span></strong>
                                        </div>
                                        <div class="alert alert-error text-center"
                                             id="errormessage">
                                            <button class="close" onclick="$('#errormessage').hide();">&times;</button>
                                            <strong><span id="messageee"></span></strong>
                                        </div>
                                    </div>
                                    <form action="#" method="post" class="form-horizontal">
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">
                                                日志标题：
                                            </label>
                                            <div class="col-sm-4">
                                                <input
                                                        class="form-control" id="logname" name="logname"
                                                        type="text"/>
                                            </div>
                                            <label class="col-sm-2 control-label">
                                                <a href='#'
                                                   id="ceatetimes"
                                                   style="color: black; text-decoration: none;">创建时间：</a>
                                            </label>
                                            <div class="col-sm-4">
                                                <input type="text" class="form-control datetimepicker"
                                                       id="starttimes" value="" name="starttimes">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">
                                                <a href='#'
                                                   id="ceatetimee" style="color: black; text-decoration: none;">至：</a>
                                            </label>
                                            <div class="col-sm-4">
                                                <input type="text" class="form-control datetimepicker" id="endtimes"
                                                       value="" name="endtimes">
                                            </div>
                                            <div class="col-sm-6 text-right ">
                                                <button class="btn btn-bg btn-primary" type="button"
                                                        id="query">查询
                                                </button>
                                                <button class="btn btn-bg btn-primary" type="button"
                                                        id="clear">清空本页日志
                                                </button>
                                            </div>
                                        </div>
                                    </form>
                                </div>

                                <div class="panel-body">
                                    <table id="listlog" class="table table-striped table-bordered">
                                        <thead>
                                        <tr>
                                            <th width="8%">类型</th>
                                            <th width="27%">日志标题</th>
                                            <th width="40%">内容</th>
                                            <th width="10%">操作员姓名</th>
                                            <th width="10%">创建时间</th>
                                            <th width="5%">操作</th>
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
<input type="hidden" id="resultids"/>
<c:import url="/pages/include/pageFoot.jsp"/>
<script type="text/javascript">
    $(document).ready(function () {
        $("#successmessage").hide();
        $("#errormessage").hide();
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

        oTable = $('#listlog').initDT({
            serverSide: true,
            "sAjaxSource": "${basepath}/log/loglist"
        });

        $("#query").click(function () {
            reshcg();
        });

        $("#clear").click(function () {
            var ids = $('#resultids').val();
            del(ids);
        });

        $('#ceatetimes').click(function () {
            $('#starttimes').val('');
        });
        $('#ceatetimee').click(function () {
            $('#endtimes').val('');
        });

    });
    function reshcg() {
        var logname = $('#logname').val();
        var starttimes = $('#starttimes').val();
        var endtimes = $('#endtimes').val();
        var oSettings = [{
            "name": "logname",
            "value": logname
        }, {
            "name": "starttimes",
            "value": starttimes
        }, {
            "name": "endtimes",
            "value": endtimes
        }];
        oTable.gridSearch(this, oSettings);
    }

    function del(ids) {
        if (confirm("确定要删除？")) {
            $.ajax({
                type: 'post',
                url: '${basepath}/log/delLog?resultids=' + ids,
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
</script>