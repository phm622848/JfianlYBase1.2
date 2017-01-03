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
                        <h1>用户信息维护</h1>
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
                            用户信息维护
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
                                <li><a href="${basepath}/user/add">用户列表</a></li>
                                <li class="active"><a href="${basepath}/user/adduserinfo">用户添加</a></li>
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
                                    <form id="userform" class="form-horizontal" action="${basepath}/user/saveuserinfo"
                                          id="userform" method="post">
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">
                                                用户姓名：
                                            </label>
                                            <div class="col-sm-9">
                                                <input class="form-control" id="username"
                                                       name="user.name" type="text" placeholder="请输入用户姓名！"
                                                       value="${user.name}">
                                                <input id="nid" name="user.id"
                                                       type="hidden" value="${user.id}"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">
                                                用户登录名：
                                            </label>
                                            <div class="col-sm-9">
                                                <input class="form-control" id="loginName"
                                                       name="user.loginName" type="text" placeholder="请输入登录名！"
                                                       value="${user.loginName}">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">
                                                用户邮箱：
                                            </label>
                                            <div class="col-sm-9">
                                                <input class="form-control" id="email" name="user.email"
                                                       type="email" placeholder="请输入用户Email！" value="${user.email}">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">
                                                用户电话：
                                            </label>
                                            <div class="col-sm-9">
                                                <input class="form-control" id="phone" name="user.phone"
                                                       type="text" placeholder="请输入用户电话！" value="${user.phone}">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">
                                                用户手机：
                                            </label>
                                            <div class="col-sm-9">
                                                <input class="form-control" maxlength="11" id="mobile"
                                                       name="user.mobile" type="text" placeholder="请输入用户手机！"
                                                       value="${user.mobile}">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">
                                                用户类型：
                                            </label>
                                            <div class="col-sm-9">
                                                <select class="form-control" id="usertype" name="usertype">
                                                    <option value=''>请选择</option>
                                                    <c:forEach items="${listdict}" var="dict">
                                                        <option value="${dict.dictkey}"
                                                                <c:if test="${dict.dictkey==utype}">selected</c:if>>${dict.dictvalue}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">
                                                是否启用：
                                            </label>
                                            <div class="col-sm-9">
                                                <label class="radio-inline">
                                                    <input type="radio" id="login_flag0" value="1" name="user.loginFlag"
                                                           class="grey" checked
                                                           <c:if test="${user.loginFlag=='1'}">checked</c:if> /> 是
                                                </label>
                                                <label class="radio-inline">
                                                    <input type="radio" id="login_flag2" value="0" name="user.loginFlag"
                                                           class="grey"
                                                           <c:if test="${user.loginFlag=='0'}">checked</c:if> /> 否
                                                </label>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">
                                                用户角色：
                                            </label>
                                            <div class="col-sm-9">
                                                <c:forEach items="${rolelist}" var="role" varStatus="status">
                                                    <label class="uniform" for="optionsCheckbox_${status.index+1}">
                                                        <input class="uniform_on" type="checkbox"
                                                               id="optionsCheckbox_${status.index+1}" value="${role.id}"
                                                               <c:if test="${roleids.indexOf((role.id))!=-1}">checked</c:if> />${role.name}
                                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                                    </label>
                                                </c:forEach>
                                                <input name="roleids" id="roleids" type="hidden"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">
                                                备注信息：
                                            </label>
                                            <div class="col-sm-9">
                                                <textarea class="form-control" id="remarks" rows="8"
                                                          name="user.remarks" placeholder="请输入备注信息">${user.remarks}</textarea>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">
                                                所属机构：
                                            </label>
                                            <div class="col-sm-9">
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
                                                                <button id="saveoffice" class="btn btn-primary"
                                                                        type="button">
                                                                    保存
                                                                </button>
                                                            </div>
                                                        </div>
                                                        <!-- /.modal-content -->
                                                    </div>
                                                </div>
                                                <%--新的弹出层结束--%>
                                                <button type="button" id="editoff" class="btn btn-lg btn-primary">
                                                    修改所属机构
                                                </button>
                                                <span id="offnames">${officenames}</span>
                                                <input type="hidden" name="offids" id="offids" value="${offids}"/>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="col-sm-12 text-center">
                                                <button type="submit" class="btn btn-primary btn-lg btn-squared " id="savebutton">
                                                    保存
                                                </button>
                                                <input type="button" value="返回" class="btn btn-default btn-lg btn-squared "
                                                       onclick="javascript:window.location.href='${basepath}/user/add'">
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
        <c:import url="/pages/include/pageFoot.jsp"/>
        <script type="text/javascript">

            var userid = '${user.id}';
            var settingoffice = {
                check: {
                    enable: true,
                    chkStyle: "checkbox"
                },
                async: {
                    enable: true,
                    url: "${basepath}/office/getOfficeTree",
                    autoParam: ["id", "name"],
                    otherParam: {
                        "otherParam": "zTreeAsyncTest",
                        "userid": userid
                    },
                    dataFilter: filter
                },
                callback: {
                    onClick: zTreeOnClick,
                    onAsyncSuccess: onAsyncSuccesso
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
                    str = str + nodes[i].name + "|";
                    ids = ids + nodes[i].id + "|";
                }
                $("#offids").val(ids);
                $("#offnames").text(str);
            }
            $(document).ready(function () {
                runSetDefaultValidation();
                $.fn.zTree.init($("#otree"), settingoffice);
                $("#editoff").click(function () {
                    $('#oModal').modal('show');
                });
                $("#oclosed").click(function () {
                    $('#oModal').modal('hide');
                });
                $("#saveoffice").click(function () {
                    $("#offnames").text("");
                    getAllCheckedNodeo();
                    $('#oModal').modal('hide');
                });
                var form3 = $('.form-horizontal');
                form3.validate({
                    rules: {
                        'user.name': {
                            minlength: 2,
                            required: true
                        },
                        'user.loginName': {
                            minlength: 2,
                            required: true,
                            remote: {
                                url: '${basepath}/user/getloginname',
                                type: "post",
                                dataType: "json",
                                data: {
                                    loginname: function () {
                                        return $("#loginName").val();
                                    }
                                },
                                dataFilter: function (data) {　　　　//判断控制器返回的内容
                                    if (data == "true") {
                                        return true;
                                    }
                                    else {
                                        return false;
                                    }
                                }
                            }
                        },
                        'user.email': {
                            required: true,
                            remote: {
                                url: '${basepath}/user/getemail',
                                type: "post",
                                dataType: "json",
                                data: {
                                    useremail: function () {
                                        return $("#email").val();
                                    }
                                },
                                dataFilter: function (data) {　　　　//判断控制器返回的内容
                                    if (data == "true") {
                                        return true;
                                    }
                                    else {
                                        return false;
                                    }
                                }
                            }
                        },
                        'user.mobile': {
                            required: true
                        },
                        'user.type': {
                            required: true
                        }
                    },
                    messages: {
                        'user.name': {
                            minlength: '姓名不能少于2位',
                            required: '请输入姓名'
                        },
                        'user.loginName': {
                            minlength: '登录名不能少于2位',
                            required: '请输入登录名',
                            remote: '登录名称重复，请重新输入'
                        },
                        'user.email': {
                            required: '请输入email',
                            remote: 'email重复，请重新输入'
                        },
                        'user.mobile': {
                            required: '请输入手机号码'
                        },
                        'user.type': {
                            required: '请选择登录类型'
                        }
                    },
                    submitHandler: function (form) {
                        var box = "";
                        $("input[id^='optionsCheckbox']").each(function (i) {

                            if ($(this).is(':checked')) {
                                box = box + $(this).val() + "|";
                            }
                        });
                        $("#roleids").val(box);
                        alert($("#roleids").val());
                        form.submit();
                    },
                    invalidHandler: function (event, validator) {//display error alert on form submit
                    }
                });
            })
        </script>