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
                        <h1>组织机构维护</h1>
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
                                组织机构维护
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
                                <li><a href="${basepath}/office/add">机构列表</a></li>
                                </li>
                                <li class="active">
                                <li class="active"><a href="${basepath}/office/addofficeinfo">机构添加</a></li>
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
				<form class="form-horizontal" action="${basepath}/office/saveofficeinfo" id="officeform" method="post">
                    <div class="form-group">
                        <label class="col-sm-2 control-label" >
                            机构类型：
                        </label>
                        <div class="col-sm-9">
                            <c:if test="${typename==''}">
                                机构
                            </c:if>
                            ${typename}
                            <input type="hidden" name="office.type" value="${type==''||type==null?1:type}" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" >
                            上级机构：
                        </label>
                        <div class="col-sm-9">
                            ${lastpname} <input type="hidden" name="office.parentId"
                                                value="${office.parentId}" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" >
                            机构编码：
                        </label>
                        <div class="col-sm-9">
                            <input onkeyup="this.value=this.value.replace(/\D/g, '')" class="form-control" id="code" name="office.code"
                                   type="text" placeholder="请填写编码！" value="${office.code}">
                            <input id="offid" name="office.id" type="hidden" value="${office.id}" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" >
                            机构名称：
                        </label>
                        <div class="col-sm-9">
                            <input class="form-control" id="officename" name="office.name" type="text" placeholder="请输入名称！" value="${office.name}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" >
                            属于地区：
                        </label>
                        <div class="col-sm-9">
                            <input class="form-control" type="text" id="areanames"
                                   name="area.name" value="${areaname}" readonly="readonly" />
                            <input type="hidden" id="areaids" name="office.areaId" value="${areaid}" readonly="readonly" />
                            <%--新的弹出层--%>
                            <div class="modal fade bs-example-modal-lg" id="oModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                                <div class="modal-dialog modal-lg">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button aria-hidden="true" data-dismiss="modal" class="close" type="button">
                                                ×
                                            </button>
                                            <h4 id="myLargeModalLabel" id="myModalLabel" class="modal-title">地区列表</h4>
                                        </div>
                                        <div class="modal-body">
                                            <div id="otree" class="ztree"></div>
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
                            <button type="button" id="edithigh" class="btn btn-primary">修改上级地区</button>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" >
                            机构负责人姓名：
                        </label>
                        <div class="col-sm-9">
                            <input class="form-control" id="name" name="office.master" type="text" placeholder="请输入负责人姓名！"
                                   value="${office.master}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" >
                            机构负责人电话：
                        </label>
                        <div class="col-sm-9">
                            <input class="form-control" id="phone" name="office.phone" type="phone" placeholder="请输入负责人电话！"
                                   value="${office.phone}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" >
                            机构负责人邮箱：
                        </label>
                        <div class="col-sm-9">
                            <input class="form-control" id="email" name="office.email" type="email" placeholder="请输入负责人邮箱！"
                                   value="${office.email}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label" >
                            机构联系地址：
                        </label>
                        <div class="col-sm-9">
                            <input class="form-control" id="address" name="office.address" type="email" placeholder="请输入联系地址！"
                                   value="${office.address}">
                        </div>
                    </div>
						<!-- 
						<div class="control-group">
							<label class="control-label" for="isenable">是否启用：</label>
							<div class="controls">
								<label for="delFlag0">是&nbsp;&nbsp;<input
									type="radio" id="delFlag0" value="1" name="office.delFlag"
									checked /></label> &nbsp;&nbsp;&nbsp;&nbsp; <label for="delFlag1">否&nbsp;&nbsp;<input
									type="radio" id="delFlag1" value="0" name="office.delFlag"
									<c:if test="${office.delFlag=='0'}">checked</c:if> /></label>
							</div>
						</div> -->
                    <div class="form-group">
                        <label class="col-sm-2 control-label" >
                            备注信息：
                        </label>
                        <div class="col-sm-9">
                            <textarea class="form-control" id="remarks" name="office.remarks"  placeholder="请输入备注信息" rows="8" cl
                                      value="${office.remarks}"> </textarea>
                        </div>
                    </div>
						<div class="control-group">
							<label class="control-label" for="remark"></label>
							<div class="controls">
								<textarea class="input-xlarge focused" id="remarks"
									name="office.remarks" placeholder="请输入备注信息">${office.remarks}</textarea>
							</div>
						</div>
						<div class="form-actions">
							<button type="button" class="btn btn-primary" id="savebutton">保存</button>
							<input type="button" value="取消" class="btn"
								onclick="javascript:window.location.href='${basepath}/office/add'">
						</div>
					</fieldset>
				</form>

			</div>
		</div>
	</div>
<script type="text/javascript">
    $(document).ready(function() {
        var officetype = '${type}';
        if (officetype == '2') {
            $("span[id^='group_']").each(function(i) {
                $(this).text("虚拟组");
            });
        } else if (officetype == '3') {
            $("span[id^='group_']").each(function(i) {
                $(this).text("岗位");
            });
        } else {
            $("span[id^='group_']").each(function(i) {
                $(this).text("机构");
            });
        }
        $("#savebutton").click(function() {
            $("#officeform").submit();
        });
    })

    var areaid = '${areaid}';
    var officeid = '${parentId}';
    officeid = officeid == '' ? '${office.id}' : officeid;
    var settingarea = {
        check : {
            enable : true, //设置 zTree 的节点上是否显示 checkbox / radio
            chkStyle : "radio", //设置为单选框
            radioType : "all"
        },
        async : {
            enable : true, //设置 zTree 是否开启异步加载模式
            url : "${basepath}/office/getAreaTree", //Ajax 获取数据的 URL 地址。
            autoParam : [ "id", "name" ], //异步加载时需要自动提交父节点属性的参数。
            otherParam : { //Ajax 请求提交的静态参数键值对。
                "otherParam" : "zTreeAsyncTest",
                "areaid" : areaid,
                "officeid" : officeid
            },
            dataFilter : filter
            //用于对 Ajax 返回数据进行预处理的函数。
        },
        callback : {
            onClick : zTreeOnClick, //用于捕获节点被点击的事件回调函数
            onAsyncSuccess : onAsyncSuccesso
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
    $(document).ready(function() {
        $.fn.zTree.init($("#otree"), settingarea);
        $("#edithigh").click(function() {
            $('#oModal').modal('show');
        });
        $("#oclosed").click(function() {
            $('#oModal').modal('hide');
        });
        $("#savearea").click(function() {
            $("#areanames").text("");
            getAllCheckedNodeo();
            $('#oModal').modal('hide');
        });
        $("#savebutton").click(function() {
            var box = "";
            $("input[id^='optionsCheckbox_']").each(function(i) {
                box = box + $(this).val() + "|";
            });
            $("#areaids").val(box);
            $("#areaform").submit();
        });

        var jqObj = new JQvalidate();
        var officeform ="officeform";
        var id = $('#offid').val();
        jqObj.setform(officeform);
        jqObj.set("office.code", "required",  "请填写机构编码!");
        if(id!=null&&id==0){
            jqObj.set("office.code", "remote",  "机构编码重复!");
        }
        jqObj.set("office.name", "required",  "请填写机构名称!");
        jqObj.set("office.master", "required",  "请填写负责人姓名!");
        jqObj.Run();
    })
</script>