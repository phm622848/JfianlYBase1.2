<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String baseURL = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:import url="/pages/include/pageNavigation.jsp" />
<script type="text/javascript">
	
	var userid = '${user.id}';
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
				"userid" : userid
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
	$(document).ready(function() {
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
		$("#savebutton").click(function() {
			var box = "";
			$("input[id^='optionsCheckbox']").each(function(i) {

				if ($(this).is(':checked')) {
					box = box + $(this).val() + "|";
				}
			});
			$("#roleids").val(box);
			$("#userform").submit();
		});
		var jqObj = new JQvalidate();
		var id = $('#nid').val();
 	     var userform ="userform"; 
     	jqObj.setform(userform);
 	    jqObj.set("user.name", "required",  "请输入用户姓名!");
 	    jqObj.set("user.loginName", "required",  "请输入登录名!");
 	    if(id!=null&&id==0){
 	    	  jqObj.set("user.loginName", "remote",  "登录名重复!");
 	    }
 	 
 	    jqObj.set("user.email", "required",  "请输入用户邮箱!");  
 	    jqObj.set("user.email", "email",  "请输入正确的用户邮箱!");	   
 	    jqObj.set("user.mobile", "required",  "请输入用户手机!");
 	    jqObj.set("user.mobile", "number",  "请输入正确的手机号!");
 	    jqObj.set("user.mobile", "isMobile",  "请输入正确格式的手机号!");
 	    jqObj.set("usertype", "required",  "请选择用户类型!");
 	    jqObj.Run();

	})
</script>
</head>
<body>

	<!-- block -->
	<div class="block" style="margin: 5%;">
		<div class="navbar navbar-inner block-header">
			<div class="muted pull-left">
				<ul class="breadcrumb">
					<i class="icon-chevron-left hide-sidebar"> <a href='#'
						title="Hide Sidebar" rel='tooltip'>&nbsp;</a>
					</i>
					<i class="icon-chevron-right show-sidebar" style="display: none;">
						<a href='#' title="Show Sidebar" rel='tooltip'>&nbsp;</a>
					</i>
					<li><a href="#">系统管理</a> <span class="divider">/</span></li>
					<li class="active">用户信息维护</li>
				</ul>
			</div>
		</div>
		<div class="block-content collapse in">
			<ul class="nav nav-tabs">
				<li><a href="${basepath}/user/add">用户列表</a></li>
				<li class="active"><a href="${basepath}/user/adduserinfo">用户添加</a>
				</li>
			</ul>
			<div class="span12">
				<c:if test="${message!=null&&message!=''}">
					<div class="alert alert-success"
						style="margin-right: 8%; text-align: center;" id="successmessage">
						<button class="close" onclick="$('#successmessage').hide();">&times;</button>
						<strong>保存成功！</strong>
					</div>
				</c:if>
				<form id="userform" class="form-horizontal"
					action="${basepath}/user/saveuserinfo" id="userform" method="post">
					<fieldset>
						<legend>用户信息维护</legend>
						<div class="control-group">
							<label class="control-label">用户姓名：</label>
							<div class="controls">
								<input class="input-xlarge focused" id="username"
									name="user.name"  type="text" placeholder="请输入用户姓名！"
									value="${user.name}"> <input id="nid" name="user.id"
									type="hidden" value="${user.id}" />
								<div style="color: red; margin-top: 5px;">${usernameMsg}</div>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">用户登录名：</label>
							<div class="controls">
								<input class="input-xlarge focused  checkloginname " id="loginName"
									name="user.loginName"   type="text" placeholder="请输入登录名！"
									value="${user.loginName}">
								<div style="color: red; margin-top: 5px;">${loginNameMsg}</div>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">用户Email：</label>
							<div class="controls">
								<input class="input-xlarge focused" id="email" name="user.email"
									type="text" placeholder="请输入用户Email！" value="${user.email}">
								<div style="color: red; margin-top: 5px;">${noemailMsg}</div>
								<div style="color: red; margin-top: 5px;">${erroremailMsg}</div>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">用户电话：</label>
							<div class="controls">
								<input class="input-xlarge focused" id="phone" name="user.phone"
									type="text" placeholder="请输入用户电话！" value="${user.phone}">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">用户手机：</label>
							<div class="controls">
								<input class="input-xlarge focused" maxlength="11" id="mobile"
									name="user.mobile" type="text" placeholder="请输入用户手机！"
									value="${user.mobile}">
								<div style="color: red; margin-top: 5px;">${mobileMsg}</div>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="userType">用户类型： </label>
							<div class="controls">
								<select class="span6 m-wrap" id="usertype" name="usertype">
									<option value=''>请选择</option>
									<c:forEach items="${listdict}" var="dict">
										<option value="${dict.dictkey}"
											<c:if test="${dict.dictkey==utype}">selected</c:if>>${dict.dictvalue}</option>
									</c:forEach>
								</select>
								<div style="color: red; margin-top: 5px;">${userTypeMsg}</div>
							</div>
						</div>

						<div class="control-group">
							<label class="control-label" for="isenable">是否启用：</label>
							<div class="controls">
								<label for="login_flag0"> 是&nbsp;&nbsp; <input
									type="radio" id="login_flag0" value="1" name="user.loginFlag"
									checked <c:if test="${user.loginFlag=='1'}">checked</c:if> />
								</label> &nbsp;&nbsp;&nbsp;&nbsp; <label for="login_flag1">
									否&nbsp;&nbsp; <input type="radio" id="login_flag1" value="0"
									name="user.loginFlag"
									<c:if test="${user.loginFlag=='0'}">checked</c:if> />
								</label>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">用户角色：</label>
							<div class="controls">

								<c:forEach items="${rolelist}" var="role" varStatus="status">
									<label class="uniform" for="optionsCheckbox_${status.index+1}">
										<input class="uniform_on" type="checkbox"
										id="optionsCheckbox_${status.index+1}" value="${role.id}"
										<c:if test="${roleids.indexOf((role.id))!=-1}">checked</c:if> />${role.name}
										&nbsp;&nbsp;&nbsp;&nbsp;
									</label>
								</c:forEach>
								<input class="input-xlarge focused" id="roleids" name="roleids"
									type="hidden" value="${roleids}">

							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="remarks">备注信息：</label>
							<div class="controls">
								<textarea class="input-xlarge focused" id="remarks"
									name="user.remarks" placeholder="请输入备注信息">${user.remarks}</textarea>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">所属机构：</label>
							<div class="controls">
								<!-- 弹出层 start -->
								<div class="modal hide fade" id="oModal" tabindex="-1"
									role="dialog">
									<div class="modal-header">
										<button class="close" type="button" data-dismiss="modal">×</button>
										<h3 id="myModalLabel">机构列表</h3>
									</div>
									<div class="modal-body">
										<div id="otree" class="ztree"></div>
									</div>
									<div class="modal-footer">
										<a href="#" class="btn" id="oclosed">关闭</a> <a href="#"
											class="btn btn-primary" id="saveoffice">保存</a>
									</div>
								</div>
								<!-- 弹出层 end -->
								<button type="button" id="editoff" class="btn btn-primary">修改所属机构</button>
								<span id="offnames">${officenames}</span> <input type="hidden"
									name="offids" id="offids" value="${offids}" />
							</div>
						</div>
						<div class="form-actions">
							<button type="button" class="btn btn-primary" id="savebutton">保存</button>
							<input type="button" value="返回" class="btn"
								onclick="javascript:window.location.href='<%=baseURL%>/user/add'">
						</div>
					</fieldset>
				</form>

			</div>
		</div>
	</div>
</body>
</html>