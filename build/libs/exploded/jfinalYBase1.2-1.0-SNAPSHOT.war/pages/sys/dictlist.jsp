<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@page import="com.wide.constant.EnumDictType"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="decorator" content="default"/>

	<c:import url="/pages/include/pageNavigation.jsp" />
</head>

<script type="text/javascript">
$(document).ready(function() {

	
	$(".datepicker").datepicker({
		dateFormat : 'yyyy-mm-dd',
		showButtonPanel : true,
		changeMonth : true,
		changeYear : true
	});
	
	oTable = $('#dictList').initDT({
		serverSide : true,
		"sAjaxSource" : "${basepath}/dict/findlist"
	});

	$("#query").click(function() {
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
	});

	$('#ceatetimes').click(function() {
		$('#starttimes').val('');
	});
	$('#ceatetimee').click(function() {
		$('#endtimes').val('');
	});
});
function updateSort() {
	loading('正在提交，请稍等...');
	$("#listForm").attr("action", "${ctx}/sys/menu/updateSort");
	$("#listForm").submit();
}

		
	
</script>
	
<body>
	

	<div class="block" style="margin: 5%;">
			<div class="navbar navbar-inner block-header">
			<div class="muted pull-left">
				<ul class="breadcrumb">
					<i class="icon-chevron-left hide-sidebar"><a href='#' title="Hide Sidebar" rel='tooltip'>&nbsp;</a></i>
					<i class="icon-chevron-right show-sidebar" style="display: none;"><a href='#' title="Show Sidebar" rel='tooltip'>&nbsp;</a></i>
					<li><a href="#">系统管理</a> <span class="divider">/</span></li>
					<li class="active">数据字典列表</li>
				</ul>
			</div>
		</div>
			<div id="notice">
					<c:if test="${message!=null&&message!=''}">
						<c:if test="${message=='success'}">
							<div class="alert alert-success"
								style="margin-right: 8%; text-align: center;">
								<button class="close" data-dismiss="alert">&times;</button>
								<strong>删除成功！</strong>
							</div>
						</c:if>
						
					</c:if>
				</div>
		<div class="row-fluid">
			<div class="block" style="border: 0px;">
		<div class="block-content collapse in">					
	<ul class="nav nav-tabs">
		<li class="active"><a href="${basepath}/dict/add">数据字典列表</a></li>
		<li><a href="${basepath}/dict/adddictinfo">添加数据字典</a></li>
		</ul>	
		<div class="span12">
						<div class="span3">
							<label class="control-label" for="dictname">字典名称：</label> <input
								class="input-medium focused" id="dictname" name="dictname"
								type="text" />
						</div>
						<div class="span3">
							<label class="control-label" for="dicttype">字典类型：</label> <select
								class="span6 m-wrap" id="dicttype" name="dicttype">
								<option									
									value='0'>请选择</option>
								<c:forEach var="typelist" items="<%=EnumDictType.values()%>">
								<option									
									value='${typelist.enumKey}'>${typelist.enumText}</option>
							</c:forEach>
							</select>
						</div>
						<div class="span3">
							<label class="control-label" for="starttimes"><a href='#'
								id="ceatetimes" style="color: black; text-decoration: none;">创建时间：</a></label>
							<input type="text" class="input-medium datepicker"
								id="starttimes" value="" name="starttimes">
						</div>
						<div class="span3">
							<label class="control-label" for="endtimes"><a href='#'
								id="ceatetimee" style="color: black; text-decoration: none;">至：</a></label>
							<input type="text" class="input-medium datepicker" id="endtimes"
								value="" name="endtimes">
						</div>
					</div>
					<div class="span12 text-right" style="padding-right: 3%;">
						<button class="btn btn-medium btn-primary" type="button"
							id="query">查询</button>
						
					</div>
		
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
	 
		<!-- <iframe id="officeContent" src="${basepath}/office/list?id=&parentIds=" width="100%" height="100%" frameborder="1" onLoad="IFrameReSizeWidth()" ></iframe> -->	
		</div>
	</div>
	</div>
	</div>
			
		

</body>
</html>