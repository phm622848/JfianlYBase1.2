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
                        <h1>菜单信息维护</h1>
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
                            菜单信息维护
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
                                <li><a href="${basepath}/menu/add">菜单列表</a></li>
                                <li class="active"><a href="${basepath}/menu/addmenuinfo">菜单添加</a></li>
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
                                    <form class="form-horizontal" action="${basepath}/menu/menuSave" id="menuform"
                                          method="post">
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">
                                                菜单名称：
                                            </label>
                                            <div class="col-sm-9">
                                                <input id="menu.id" name="menu.id"
                                                       type="hidden" value="${menu.id}">
                                                <input class="form-control" id="menuname" name="menu.name"
                                                       type="text" placeholder="请输入菜单名称！" value="${menu.name}">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">
                                                上级菜单：
                                            </label>
                                            <div class="col-sm-9">
                                                <input class="form-control" type="text" id="menunames"
                                                       value="${pmenu.name}" readonly="readonly"/>
                                                <input class="form-control" type="hidden" id="menuids"
                                                       name="menu.parentId" value="${pmenu.id}" readonly="readonly"/>
                                                <%--新的弹出层开始--%>
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
                                                                <h4 id="myLargeModalLabel" id="myOfficeLabel"
                                                                    class="modal-title">机构列表</h4>
                                                            </div>
                                                            <div class="modal-body">
                                                                <div id="otree" class="ztree"></div>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button id="oclosed" data-dismiss="modal"
                                                                        class="btn btn-default" type="button">
                                                                    关闭
                                                                </button>
                                                                <button id="savemenu" class="btn btn-primary"
                                                                        type="button">
                                                                    保存
                                                                </button>
                                                            </div>
                                                        </div>
                                                        <!-- /.modal-content -->
                                                    </div>
                                                </div>
                                                <%--新的弹出层结束--%>
                                                <button type="button" id="edithigh" class="btn btn-primary">修改上级菜单
                                                </button>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">
                                                链接：
                                            </label>
                                            <div class="col-sm-9">
                                                <input class="form-control" id="menuhref"
                                                       name="menu.href" type="text" placeholder="请输入链接地址！"
                                                       value="${menu.href}">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">
                                                是否显示：
                                            </label>
                                            <div class="col-sm-9">
                                                <label class="checkbox-inline">
                                                    <input type="radio" class="grey" checked="checked" value="1"
                                                           id="menu.isShow0" name="menu.isShow">
                                                    是
                                                </label>
                                                <label class="checkbox-inline">
                                                    <input type="radio" class="grey" value="2" id="menu.isShow1"
                                                           name="menu.isShow">
                                                    否
                                                </label>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">
                                                权限标识：
                                            </label>
                                            <div class="col-sm-9">
                                                <input class="form-control" id="menu.permission" type="text"
                                                       name="menu.permission" placeholder="权限标识"
                                                       value="${menu.permission}"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">
                                                备注信息：
                                            </label>
                                            <div class="col-sm-9">
                            <textarea class="form-control" maxlength="255" id="menu.remarks" rows="8"
                                      name="menu.remarks"
                                      placeholder="请输入备注信息,最多255字">${menu.remarks}</textarea>
                                            </div>
                                        </div>
                                        <div class="form-group text-center">
                                            <button type="submit" class="btn btn-primary  btn-lg btn-squared ">保存
                                            </button>
                                            <input type="button" value="取消" class="btn btn-default btn-lg btn-squared "
                                                   onclick="javascript:window.location.href='${basepath}/menu/add'">
                                        </div>
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
            var menuid = '${menu.parentId}';
            var settingmenu = {
                check: {
                    enable: true, //设置 zTree 的节点上是否显示 checkbox / radio
                    chkStyle: "radio", //设置为单选框
                    radioType: "all"
                },
                async: {
                    enable: true, //设置 zTree 是否开启异步加载模式
                    url: "${basepath}/menu/getMenuTree", //Ajax 获取数据的 URL 地址。
                    autoParam: ["id", "name"], //异步加载时需要自动提交父节点属性的参数。
                    otherParam: { //Ajax 请求提交的静态参数键值对。
                        "otherParam": "zTreeAsyncTest",
                        "menuid": menuid
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
                $("#menuids").val(ids);
                $("#menunames").val(str);
            }
            $(document).ready(function () {
                runSetDefaultValidation();
                $.fn.zTree.init($("#otree"), settingmenu);
                $("#edithigh").click(function () {
                    $('#oModal').modal('show');
                });
                $("#oclosed").click(function () {
                    $('#oModal').modal('hide');
                });
                $("#savemenu").click(function () {
                    $("#menunames").text("");
                    getAllCheckedNodeo();
                    $('#oModal').modal('hide');
                });
                var form3 = $('.form-horizontal');
                form3.validate({
                    rules: {
                        'menu.name': {
                            minlength: 2,
                            required: true
                        },

                        'menu.href': {
                            required: true
                        },

                        'menu.permission': {
                            required: true
                        }
                    },

                    messages: {
                        'menu.name': {
                            minlength: '菜单名称不能少于2位',
                            required: '请输入菜单名称'
                        },

                        'menu.href': {
                            required: '请输入菜单链接'
                        },
                        'menu.permission': {
                            required: '请输入菜单权限标识'
                        },
                    },
                    submitHandler: function (form) {
                        form.submit();
                    },
                    invalidHandler: function (event, validator) {//display error alert on form submit
                    }
                });

            })
        </script>