<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>基础框架</title>
<style type="text/css">
.hoverimg{filter:alpha(Opacity=80);-moz-opacity:0.8;opacity: 0.8} 
</style>
</head>
<body>
	<c:import url="/pages/include/pageNavigation.jsp" />


	<div style="margin-top: 3%; margin-left: 10%; margin-right: 10%"
		class="row">

		<div class=".col-xs-12 .col-sm-12 .col-md-12 .col-lg-12">
			<!-- block -->
			<div class="block">
				<div class="navbar navbar-inner block-header">
					<div class="muted pull-left">
					占位统计 <small>统计图</small>
					</div>
					<div class="pull-right">
						<span class="badge badge-warning">更多数据</span>

					</div>
				</div>
				<div class="block-content collapse in">
					首页要加载图表
				</div>
			</div>
			<!-- /block -->
		</div>
	</div>
	<div class="row" style="margin-left: 10%; margin-right: 10%">
		<div class="pull-left" style="width: 30%">

			<div class="col-md-4">
				<!-- block -->
				<div class="block">
					<div class="navbar navbar-inner block-header">
						<div class="muted pull-left">快捷入口</div>
					</div>
					<div class="block-content collapse in">
						<table width="100%" border="0">
							<tr height="100px">
								<td><div align="center">
										<a href="../file/add"><img alt=""
											src="../static/img/1.png" width="80px" class="img-rounded"></a>
									</div></td>
								<td><div align="center">
										<a href=""><img alt="" src="../static/img/2.png"
											width="80px"  class="img-rounded"></a>
									</div></td>
							</tr>
							<tr height="100px">
								<td><div align="center">
										<a href=""><img alt="" src="../static/img/3.png"
											width="80px" class="img-rounded"></a>
									</div></td>
								<td><div align="center">
										<a href="../weixin/menu"><img alt=""
											src="../static/img/4.png" width="80px" class="img-rounded"></a>
									</div></td>
							</tr>
							<tr height="110px">
								<td><div align="center">
										<a href=""><img alt="" src="../static/img/5.png"
											width="80px" class="img-rounded"></a>
									</div></td>
								<td><div align="center">
										<a href=""><img alt="" src="../static/img/6.png"
											width="80px" class="img-rounded"></a>
									</div></td>
							</tr>
						</table>

					</div>
				</div>
				<!-- /block -->
			</div>
		</div>
		<div class="pull-left" style="margin-left: 3%; width: 67%">

			<div class="col-md-9">
				<!-- block -->
				<div class="block">
					<div class="navbar navbar-inner block-header">
						<div class="muted pull-left">内容列表</div>
						<div class="muted pull-right"><a href="${basepath }/bbs/getPostingAll">更多..</a></div>
					</div>
					<div class="block-content collapse in">
							<table class="table table-bordered">
								<c:forEach items="${postlist }" var="postmodel">
									<tr style="height:42px !important;">
										<td width="50%">${postmodel.title }</td>
										<td  width="30%">${postmodel.create_date }</td>
										<td  width="20%">
										<c:if test="${postmodel.is_check==0 }"><button class="flagbtn" id="${postmodel.id}">审核</button>
										</c:if></td>
									</tr>
								</c:forEach>
							</table>
						</div>
				</div>
				<!-- /block -->
			</div>
		</div>
	</div>


	<!-- block -->
	<script type="text/javascript">
		$(function() {
			$(".flagbtn").click(function(){
				var id=this.id;
				var url="${basepath}/bbs/updateis_check";
				$.ajax({
					type : 'post',
					url : url,
					data : {
						id : id
					},
					cache : false,
					dataType : 'json',
					success : function(data) {
						$("#"+id).hide();
					},
					error : function() {
					}
				});
			});
			$(".img-rounded").mouseover(function(){
				$(this).addClass("hoverimg");
			});
			$(".img-rounded").mouseout(function(){
				$(this).removeClass("hoverimg");
			});
			// Morris Line Chart
			var tax_data = [ {
				"period" : "2016-01",
				"visits" : 2407,
				"signups" : 660
			}, {
				"period" : "2016-02",
				"visits" : 3351,
				"signups" : 729
			}, {
				"period" : "2016-03",
				"visits" : 2469,
				"signups" : 1318
			}, {
				"period" : "2016-04",
				"visits" : 2246,
				"signups" : 461
			}, {
				"period" : "2016-05",
				"visits" : 3171,
				"signups" : 1676
			}, {
				"period" : "2016-06",
				"visits" : 2155,
				"signups" : 681
			}, {
				"period" : "2016-07",
				"visits" : 1226,
				"signups" : 620
			}, {
				"period" : "2016-08",
				"visits" : 2245,
				"signups" : 500
			} ];
			Morris.Line({
				element : 'hero-graph',
				data : tax_data,
				xkey : 'period',
				xLabels : "month",
				ykeys : [ 'visits', 'signups' ],
				labels : [ '新闻量', '发帖量' ]
			});
		});
	</script>
</body>
</html>