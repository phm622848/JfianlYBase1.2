<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.wide.constant.EnumDictType" %>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                        <h1>数据字典列表</h1>
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
                            数据字典列表
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
                                <li class="active"><a href="${basepath}/dict/add">数据字典列表</a></li>
                                <li><a href="${basepath}/dict/adddictinfo">添加数据字典</a></li>
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
                                    <form action="#" method="post" class="form-horizontal">
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">
                                                字典名称：
                                            </label>
                                            <div class="col-sm-4">
                                                <input class="form-control" id="dictname" name="dictname" type="text"/>
                                            </div>
                                            <label class="col-sm-2 control-label">
                                                字典类型：
                                            </label>
                                            <div class="col-sm-4">
                                                <select class="form-control" id="dicttype" name="dicttype">
                                                    <option value='0'>--全部--</option>
                                                    <c:forEach var="typelist" items="<%=EnumDictType.values()%>">
                                                        <option value='${typelist.enumKey}'>${typelist.enumText}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">
                                                <a href='#' id="ceatetimes"
                                                   style="color: black; text-decoration: none;">创建时间：</a>
                                            </label>
                                            <div class="col-sm-4">
                                                <input type="text" class="form-control datetimepicker"
                                                       id="starttimes" value="" name="starttimes">
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
                                        <div class="form-group">
                                            <div class="col-sm-12 text-right">
                                                <button class="btn btn-primary btn-squared btn-lg" type="button"
                                                        id="query">查询
                                                </button>
                                            </div>
                                        </div>
                                    </form>
                                    <table id="dictList" class="table table-striped table-bordered">
                                        <thead>
                                        <tr>
                                            <th>数据字典名称</th>
                                            <th>键值</th>
                                            <th>类型</th>
                                            <th>创建时间</th>
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
        location.href = "${basepath}/dict/adddictinfo?id=" + ids;
    }

    function del(ids) {
        if (confirm("确定要删除该字典？")) {
            $.ajax({
                type : 'post',
                url : '${basepath}/dict/delete?id=' + ids,
                cache : false,
                dataType : 'json',
                success : function(data) {
                    if (data.result == 1) {
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

        oTable = $('#dictList').initDT({
            serverSide: true,
            "sAjaxSource": "${basepath}/dict/findlist"
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
    });
    function reshcg() {
        var dictname = $('#dictname').val();
        var dicttype = $('#dicttype').val();
        var starttimes = $('#starttimes').val();
        var endtimes = $('#endtimes').val();
        var oSettings = [ {
            "name" : "dictname",
            "value" : dictname
        }, {
            "name" : "dicttype",
            "value" : dicttype
        }, {
            "name" : "starttimes",
            "value" : starttimes
        }, {
            "name" : "endtimes",
            "value" : endtimes
        } ];
        oTable.gridSearch(this, oSettings);
    }
</script>
