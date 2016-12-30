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
                        <h1>地区信息维护</h1>
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
                            地区信息维护
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
                                <li>
                                    <a href="${basepath}/area/add">地区列表</a>
                                </li>
                                <li class="active">
                                    <a href="${basepath}/area/addareainfo">地区添加</a>
                                </li>
                            </ul>
                            <div class="tab-content">
                                <div class="panel-body">
                                    <c:if test="${message!=null&&message!=''}">
                                        <div class="alert alert-success text-center" id="successmessage">
                                            <button class="close"
                                                    onclick="$('#successmessage').hide();">&times;</button>
                                            <strong>保存成功！</strong>
                                        </div>
                                    </c:if>
                                    <div id="errorRoleHandler">
                                        <div class="alert alert-danger text-center" id="errormessage">
                                            <button class="close"
                                                    onclick="$('#errorRoleHandler').hide();">&times;</button>
                                            <strong>输入错误,请查证后重新输入!</strong>
                                        </div>
                                    </div>
                                    <form id="area" class="form-horizontal" action="${basepath}/area/areaSave"
                                          id="areaform" method="post">
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">
                                                地区名称：
                                            </label>
                                            <div class="col-sm-9">
                                                <input class="form-control" id="areaid" name="area.id" type="hidden"
                                                       value="${area.id}">
                                                <input class="form-control" id="areaname" name="area.name" type="text"
                                                       placeholder="请输入地区名称！" value="${area.name}">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">
                                                上级地区：
                                            </label>
                                            <div class="col-sm-6">
                                                <input class="form-control" type="text" id="areanames" name="area.name"
                                                       value="${parea.name}" readonly="readonly"/>
                                                <input class="form-control" type="hidden" id="areaids"
                                                       name="area.parentId"
                                                       value="${parea.id}" readonly="readonly"/>
                                                <%--新的弹出层--%>
                                                <div class="modal fade bs-example-modal-lg" id="oModal" tabindex="-1"
                                                     role="dialog" aria-labelledby="myLargeModalLabel"
                                                     aria-hidden="true">
                                                    <div class="modal-dialog modal-lg">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <button aria-hidden="true" data-dismiss="modal"
                                                                        class="close" type="button">
                                                                    ×
                                                                </button>
                                                                <h4 id="myLargeModalLabel" id="myModalLabel"
                                                                    class="modal-title">地区列表</h4>
                                                            </div>
                                                            <div class="modal-body">
                                                                <div id="otree" class="ztree"></div>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button id="closed" data-dismiss="modal"
                                                                        class="btn btn-default" type="button">
                                                                    关闭
                                                                </button>
                                                                <button id="saveroleright" class="btn btn-primary"
                                                                        type="button">
                                                                    保存
                                                                </button>
                                                            </div>
                                                        </div>
                                                        <!-- /.modal-content -->
                                                    </div>
                                                </div>
                                                <%--弹出层结束--%>
                                            </div>
                                            <div class="col-sm-3">
                                                <button type="button" id="edithigh" class="btn btn-primary">修改上级地区
                                                </button>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">
                                                区域编码：
                                            </label>
                                            <div class="col-sm-9">
                                                <input onkeyup="this.value=this.value.replace(/\D/g, '')"
                                                       class="form-control"
                                                       id="areacode" name="area.code" type="text" placeholder="请输入区域编码！"
                                                       value="${area.code}">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">
                                                区域类型：
                                            </label>
                                            <div class="col-sm-9">
                                                <select class="form-control" id="areatype" name="area.type">
                                                    <option value="">---请选择区域类型---</option>
                                                    <c:forEach items="${listdict}" var="dict">
                                                        <option value="${dict.dictkey}">${dict.dictvalue}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">
                                                备注信息：
                                            </label>
                                            <div class="col-sm-9">
							<textarea class="form-control" id="area.remarks" name="area.remarks" rows="8"
                                      placeholder="请输入备注信息">${area.remarks}</textarea>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-12 text-right">
                                                <button type="submit" class="btn btn-primary btn-lg">保存</button>
                                                <input type="button" value="取消" class="btn btn-default btn-lg"
                                                       onclick="javascript:window.location.href='${basepath}/area/add'">
                                            </div>
                                        </div>
                                    </form>
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
    var areaid = '${area.parentId}';
    var settingarea = {
        check: {
            enable: true, //设置 zTree 的节点上是否显示 checkbox / radio
            chkStyle: "radio", //设置为单选框
            radioType: "all"
        },
        async: {
            enable: true, //设置 zTree 是否开启异步加载模式
            url: "${basepath}/area/getAreaTree", //Ajax 获取数据的 URL 地址。
            autoParam: ["id", "name"], //异步加载时需要自动提交父节点属性的参数。
            otherParam: { //Ajax 请求提交的静态参数键值对。
                "otherParam": "zTreeAsyncTest",
                "areaid": areaid
            },
            dataFilter: filter
            //用于对 Ajax 返回数据进行预处理的函数。
        },
        callback: {
            onClick: zTreeOnClick, //用于捕获节点被点击的事件回调函数
            onAsyncSuccess: onAsyncSuccesso
            //用于捕获异步加载正常结束的事件回调函数
        }
    };

    var treeNodez;

    function filter(treeId, parentNode, childNodes) {
        if (!childNodes)
            return null;
        for (var i = 0, l = childNodes.length; i < l; i++) {
            childNodes[i].name = childNodes[i].name.replace(/\.n/g, '.');
        }
        return childNodes;
    }

    function onAsyncSuccesso(event, treeId, treeNode, msg) {
        var treeObj = $.fn.zTree.getZTreeObj("otree");
        var nodes = treeObj.getNodesByParam("parentId", 0, null);
        if (nodes.length > 0) {
            treeObj.expandNode(nodes[0], true, false, false);
        }
    }

    //机构树单击事件

    function zTreeOnClick(event, treeId, treeNode) {
        if (treeNode.nodetype == 1) {
            treeNodez = treeNode.nodetype;

        } else {
            treeNodez = treeNode.nodetype;

        }
    }

    function getAllCheckedNodeo() {
        var treeObj = $.fn.zTree.getZTreeObj("otree");
        var nodes = treeObj.getCheckedNodes(true);
        var str = "";
        var ids = "";
        for (var i = 0; i < nodes.length; i++) {
            str = str + nodes[i].name;
            ids = ids + nodes[i].id;
        }
        $("#areaids").val(ids);
        $("#areanames").val(str);
    }
    $(document).ready(function () {
        $('#errorRoleHandler').hide();
        $.fn.zTree.init($("#otree"), settingarea);
        $("#edithigh").click(function () {
            $('#oModal').modal('show');
        });
        $("#oclosed").click(function () {
            $('#oModal').modal('hide');
        });
        $("#savearea").click(function () {
            $("#areanames").text("");
            getAllCheckedNodeo();
            $('#oModal').modal('hide');
        });
        $("#savebutton").click(function () {
            var box = "";
            $("input[id^='optionsCheckbox_']").each(function (i) {
                box = box + $(this).val() + "|";
            });
            $("#areaids").val(box);
        });
        var type = '${area.type}';
        if (type != '' || type != null) {
            $("#areatype option[value='" + type + "']").attr(
                "selected", "selected");
        }
        ;
       /* var jqObj = new JQvalidate();
        var id = $('#areaid').val();
        var area = "area";
        jqObj.setform(area);
        jqObj.set("area.name", "required", "请输入地区名称!");
        jqObj.set("area.code", "required", "请输入区域编码!");
        jqObj.set("area.type", "required", "请选择区域类型!");
        if (id != null && id == 0) {
            jqObj.set("area.code", "remote", "区域编码重复!");
        }

        jqObj.Run();*/
    })
</script>