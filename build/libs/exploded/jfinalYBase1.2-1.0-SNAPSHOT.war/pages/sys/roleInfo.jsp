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
                        <h1>角色信息维护</h1>
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
                            角色信息维护
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
                                    <a href="${basepath}/role/add">角色列表</a>
                                </li>
                                <li class="active">
                                    <a href="${basepath}/role/addroleinfo">角色添加</a>
                                </li>
                            </ul>
                            <div class="tab-content">
                                <div class="panel-body">
                                <c:if test="${message!=null&&message!=''}">
                                    <div class="alert alert-success text-center"  id="successmessage">
                                        <button class="close" onclick="$('#successmessage').hide();">&times;</button>
                                        <strong>保存成功！</strong>
                                    </div>
                                </c:if>
                                <form  id="roleform" class="form-horizontal" action="${basepath}/role/saveInfo"
                                       method="post" >
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label" >
                                            角色名称：
                                        </label>
                                        <div class="col-sm-9">
                                            <input class="form-control"  id="name" placeholder="请输入角色名称最多10个字" name="role.name"
                                                   type="text" placeholder="请输入角色名称！" value="${vrole.role.name}" class="required">
                                            <input name="role.id"  id = "cid"  type="hidden" value="${vrole.role.id}" />
                                            <div style="color: red; margin-top: 5px;">${rolenameMsg}</div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label" >
                                            角色类型：
                                        </label>
                                        <div class="col-sm-9">
                                            <select class="form-control" id="roletype" name="role.roleType">
                                                <option	value=''>--请选择--</option>
                                                <c:forEach items="${listd}" var="dict">
                                                    <option value="${dict.dictkey}"  <c:if test="${dict.dictkey==vroletype}">selected</c:if>>${dict.dictvalue}</option>
                                                </c:forEach>
                                            </select>
                                            <div style="color: red; margin-top: 5px;">${roletypeMsg}</div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label" >
                                            拥有权限：
                                        </label>
                                        <div class="col-sm-9">
                                            <%--新的弹出层--%>
                                            <div class="modal fade bs-example-modal-lg" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                                                <div class="modal-dialog modal-lg">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button aria-hidden="true" data-dismiss="modal" class="close" type="button">
                                                                ×
                                                            </button>
                                                            <h4 id="myLargeModalLabel" id="myModalLabel" class="modal-title">权限列表</h4>
                                                        </div>
                                                        <div class="modal-body">
                                                            <div id="ztree" class="ztree"></div>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button id="closed" data-dismiss="modal" class="btn btn-default" type="button">
                                                               关闭
                                                            </button>
                                                            <button id="saveroleright" class="btn btn-primary" type="button">
                                                                保存
                                                            </button>
                                                        </div>
                                                    </div>
                                                    <!-- /.modal-content -->
                                                </div>
                                            </div>
                                            <%--弹出层结束--%>
                                            <button type="button" id="editbt" class="btn btn-primary">修改权限</button>
                                            <span id="rolerightnames">${vrole.resnames}</span>
                                            <input type="hidden" name="resids" id="resids"  value="${vrole.resids}"/>
                                            <input type="hidden" name="rightids" id="rightids"  value="${vrole.rightids}" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label" >
                                            是否启用：
                                        </label>
                                        <label class="checkbox-inline">
                                            <input type="radio" class="red" checked="checked" value="1" id="del_flag0" name="role.useable" >
                                            是
                                        </label>
                                        <label class="checkbox-inline">
                                            <input type="radio" class="red"  value="0" id="del_flag0" name="role.useable" >
                                            否
                                            <c:if test="${vrole.role.useable=='0'}">checked</c:if>
                                        </label>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label" >
                                            备注信息：
                                        </label>
                                        <div class="col-sm-9">
                                            <textarea class="form-control" maxlength="255" id="remarks" rows="8"
                                                      name="role.remarks" placeholder="请输入备注信息,最多255字">${vrole.role.remarks}</textarea>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">
                                            所属机构：
                                        </label>
                                        <div class="col-sm-9">
                                            <%--新的弹出层开始--%>
                                            <div class="modal fade bs-example-modal-lg" id="oModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                                                <div class="modal-dialog modal-lg">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button aria-hidden="true" data-dismiss="modal" class="close" type="button">
                                                                ×
                                                            </button>
                                                            <h4 id="myLargeModalLabel" id="myOfficeLabel" class="modal-title">机构列表</h4>
                                                        </div>
                                                        <div class="modal-body">
                                                            <div id="otree" class="ztree"></div>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button id="oclosed" data-dismiss="modal" class="btn btn-default" type="button">
                                                                关闭
                                                            </button>
                                                            <button id="saveoffice" class="btn btn-primary" type="button">
                                                                保存
                                                            </button>
                                                        </div>
                                                    </div>
                                                    <!-- /.modal-content -->
                                                </div>
                                            </div>
                                            <%--新的弹出层结束--%>
                                            <button type="button" id="editoff" class="btn btn-primary">修改所属机构</button>
                                            <span id="offnames">${vrole.offnames}</span> <input
                                                type="hidden" name="offids" id="offids" value="${vrole.offids}" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-12 text-right">
                                        <button type="submit" class="btn btn-primary btn-lg">保存</button>
                                            <button type="button"class="btn btn-default btn-lg"  onclick="javascript:window.location.href='${basepath}/role/add'" >返回</button>
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
        var roleid = '${vrole.role.id}';
        var setting = {
            check : {
                enable : true,
                chkStyle : "checkbox"
            },
            async : {
                enable : true,
                url : "${basepath}/right/getRightTree",
                autoParam : [ "id", "name" ],
                otherParam : {
                    "otherParam" : "zTreeAsyncTest",
                    "roleid" : roleid
                },
                dataFilter : filter
            },
            callback : {
                onClick : zTreeOnClick,
                onAsyncSuccess : onAsyncSuccess
            }
        };
        var settingoffice = {
            check : {
                enable : true,
                chkStyle : "checkbox"
            },
            async : {
                enable : true,
                url : "${basepath}/office/getOfficeTree",
                autoParam : [ "id", "name" ],
                otherParam : {
                    "otherParam" : "zTreeAsyncTest",
                    "roleid" : roleid
                },
                dataFilter : filter
            },
            callback : {
                onClick : zTreeOnClick,
                onAsyncSuccess : onAsyncSuccesso
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

        function onAsyncSuccess(event, treeId, treeNode, msg) {
            var treeObj = $.fn.zTree.getZTreeObj("ztree");
            var nodes = treeObj.getNodesByParam("parentId", 0, null);
            if (nodes.length > 0) {
                treeObj.expandNode(nodes[0], true, false, false);
            }
        }

        function onAsyncSuccesso(event, treeId, treeNode, msg) {
            var treeObj = $.fn.zTree.getZTreeObj("ztree");
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
        function getAllCheckedNode() {
            var treeObj = $.fn.zTree.getZTreeObj("ztree");
            var nodes = treeObj.getCheckedNodes(true);
            var str = "";
            var ids = "";
            var rightids = "";
            for (var i = 0; i < nodes.length; i++) {
                str = str + nodes[i].name + "|";
                ids = ids + nodes[i].id + "|";
                rightids = rightids + nodes[i].resid + "|";
            }
            $("#resids").val(ids);
            $("#rightids").val(rightids);
            $("#rolerightnames").text(str);
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
        $(document).ready(function() {
            $.fn.zTree.init($("#ztree"), setting);
            $.fn.zTree.init($("#otree"), settingoffice);
            $("#editoff").click(function() {
                $('#oModal').modal('show');
            });
            $("#oclosed").click(function() {
                $('#oModal').modal('hide');
            });
            $("#saveoffice").click(function() {
                $("#offnames").text("");
                getAllCheckedNodeo();
                $('#oModal').modal('hide');
            });

            $("#editbt").click(function() {
                $('#myModal').modal('show');
            });
            $("#closed").click(function() {
                $('#myModal').modal('hide');
            });
            $("#saveroleright").click(function() {
                $("#rolerightnames").text("");
                getAllCheckedNode();
                $('#myModal').modal('hide');
            });
            /**
            var jqObj = new JQvalidate();
            var id = $('#cid').val();
            var roleform ="roleform";
            jqObj.setform(roleform);
            jqObj.set("role.name", "required",  "请输入角色名称!");
            if(id!=null&&id==0){
                jqObj.set("role.name", "remote",  "角色名称重复!");
            }
            jqObj.set("role.roleType", "required",  "请选择角色类型!");
            jqObj.Run();*/
        })
    </script>