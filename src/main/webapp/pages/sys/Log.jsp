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
	
</script>
</head>
<body>
	<!-- block -->
	<div class="block" style="margin: 5%;">
		<div class="navbar navbar-inner block-header">
			<div class="muted pull-left">
				<ul class="breadcrumb">
					<i class="icon-chevron-left hide-sidebar"><a href='#'
						title="Hide Sidebar" rel='tooltip'>&nbsp;</a></i>
					<i class="icon-chevron-right show-sidebar" style="display: none;"><a
						href='#' title="Show Sidebar" rel='tooltip'>&nbsp;</a></i>
					<li><a href="#">系统管理</a> <span class="divider">/</span></li>
					<li class="active">日志管理</li>
				</ul>
			</div>
		</div>
		<div class="row-fluid">
			<div class="block" style="border: 0px;">
				<div class="block-content collapse in">
					<ul class="nav nav-tabs">
						<li class="active"><a>日志管理</a></li>
					</ul>
					<div class="span12">
						<div class="alert alert-success"
							style="margin-right: 8%; display: none; text-align: center;"
							id="successmessage">
							<button class="close" onclick="$('#successmessage').hide();">&times;</button>
							<strong><span id="messagess"></span></strong>
						</div>
						<div class="alert alert-error"
							style="margin-right: 8%; display: none; text-align: center;"
							id="errormessage">
							<button class="close" onclick="$('#errormessage').hide();">&times;</button>
							<strong><span id="messageee"></span></strong>
						</div>
					</div>
					<div class="span12">
						<div class="span3">
							<label class="control-label" for="logname">日志标题：</label> <input
								class="input-medium focused" id="logname" name="logname"
								type="text" />
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
						<td class="span12 text-right" style="padding-right: 7%;">
							<button class="btn btn-medium btn-primary" type="button"
								id="query">查询</button>
							<button class="btn btn-medium btn-primary" type="button"
								id="clear">清空本页日志</button>
						</td>
					</div>
				</div>

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
	<input type="hidden" id="resultids" />
</body>

<script type="text/javascript">
	$(document).ready(function() {
		$("#successmessage").hide();
		$("#errormessage").hide();
		$(".datepicker").datepicker({
			dateFormat : 'yyyy-mm-dd',
			showButtonPanel : true,
			changeMonth : true,
			changeYear : true
		});

		oTable = $('#listlog').initDT({
			serverSide : true,
			"sAjaxSource" : "${basepath}/log/loglist"
		});

		$("#query").click(function() {
			reshcg();
		});

		$("#clear").click(function() {
			var ids = $('#resultids').val();
			del(ids);
		});

		$('#ceatetimes').click(function() {
			$('#starttimes').val('');
		});
		$('#ceatetimee').click(function() {
			$('#endtimes').val('');
		});

	});
	function reshcg() {
		var logname = $('#logname').val();
		var starttimes = $('#starttimes').val();
		var endtimes = $('#endtimes').val();
		var oSettings = [ {
			"name" : "logname",
			"value" : logname
		}, {
			"name" : "starttimes",
			"value" : starttimes
		}, {
			"name" : "endtimes",
			"value" : endtimes
		} ];
		oTable.gridSearch(this, oSettings);
	}

	function del(ids) {
		if (confirm("确定要删除？")) {
			$.ajax({
				type : 'post',
				url : '${basepath}/log/delLog?resultids=' + ids,
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
</html>