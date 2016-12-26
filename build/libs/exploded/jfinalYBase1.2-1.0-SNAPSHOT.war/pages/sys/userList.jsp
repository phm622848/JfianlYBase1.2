<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:import url="/pages/include/pageNavigation.jsp" />
<script type="text/javascript">
	function edit(ids) {
		location.href = "${basepath}/user/adduserinfo?id=" + ids;
	}
	function reset(ids){
		if(confirm("确定要重置该用户密码？重置后的密码是6个1")){
			$.ajax({
				type : 'post',
				url : '${basepath}/user/resetpassword?id=' + ids,
				cache : false,
				dataType : 'json',
				success : function(data) {
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
				type : 'post',
				url : '${basepath}/user/deluserinfo?id=' + ids,
				cache : false,
				dataType : 'json',
				success : function(data) {
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
</head>
<body>
	<!-- block -->
	<div class="block" style="margin: 5%;">
		<div class="navbar navbar-inner block-header">
			<div class="muted pull-left">
				<ul class="breadcrumb">
					<i class="icon-chevron-left hide-sidebar"> <a href='#'
						title="Hide Sidebar" rel='tooltip'>&nbsp;</a></i>
					<i class="icon-chevron-right show-sidebar" style="display: none;">
						<a href='#' title="Show Sidebar" rel='tooltip'>&nbsp;</a>
					</i>
					<li><a href="#">系统管理</a> <span class="divider">/</span></li>
					<li class="active">用户管理</li>
				</ul>
			</div>
		</div>
		<div class="row-fluid">
			<div class="block" style="border: 0px;">
				<div class="block-content collapse in">
					<ul class="nav nav-tabs">
						<li class="active"><a href="${basepath}/user/add">用户列表</a></li>
						<li><a href="${basepath}/user/adduserinfo">用户添加</a></li>
					</ul>
					
					<!-- 删除用户提示 -->
					<div class="span12">
						<div class="alert alert-success"
							style="margin-right: 8%;display: none; text-align: center;" id="successmessage">
							<button class="close" onclick="$('#successmessage').hide();">&times;</button>
							<strong><span id="messagess"></span></strong>
						</div>
						<div class="alert alert-error"
							style="margin-right: 8%;display: none; text-align: center;" id="errormessage">
							<button class="close" onclick="$('#errormessage').hide();">&times;</button>
							<strong><span id="messageee"></span></strong>
						</div>
					</div>
					<form action="${basepath}/user/exportUser" method="post"
						id="userform">
						<div class="span12">
							<div class="span3">
								<label class="control-label" for="username">用户姓名：</label> <input
									class="input-medium focused" id="username" name="username"
									type="text" />
							</div>
							<div class="span3">
								<label class="control-label" for="usertype">用户类型：</label> <select
									class="span6 m-wrap" id="usertype" name="usertype">
									<option value="">--全部--</option>
									<c:forEach items="${listdict}" var="dict">
										<option value="${dict.dictkey}">${dict.dictvalue}</option>
									</c:forEach>
								</select>
							</div>
							
						</div>
						<input type="hidden" id="userpages" name="userpages" /><input
							type="hidden" id="userrp" name="userrp" />
					</form>
					<div class="span12 text-right" style="padding-right: 7%;">
						<button class="btn btn-medium btn-primary" type="button"
							id="query">查询</button>
						<button class="btn btn-medium btn-primary" type="button"
							id="export">导出</button>
					</div>
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
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$(".datepicker").datepicker({
			dateFormat : 'yyyy-mm-dd',
			showButtonPanel : true,
			changeMonth : true,
			changeYear : true
		});

		oTable = $('#userList').initDT({
			serverSide : true,
			"sAjaxSource" : "${basepath}/user/addUserList"
		});

		$("#query").click(function() {
			reshcg();
		});

		$('#ceatetimes').click(function() {
			$('#starttime').val('');
		});
		$('#ceatetimee').click(function() {
			$('#endtime').val('');
		});
		$("#export").click(function() {
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
		var oSettings = [ {
			"name" : "username",
			"value" : username
		}, {
			"name" : "usertype",
			"value" : usertype
		}, {
			"name" : "starttime",
			"value" : starttime
		}, {
			"name" : "endtime",
			"value" : endtime
		} ];
		oTable.gridSearch(this, oSettings);
	}
</script>
</html>