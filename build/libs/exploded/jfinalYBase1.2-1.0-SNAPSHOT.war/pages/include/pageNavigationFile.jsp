<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link href="${basepath}/static/frame/theme/bootstrap/css/bootstrap.min.css"  rel="stylesheet" media="screen">
        <link href="${basepath}/static/frame/treeTable/themes/vsStyle/treeTable.min.css"  rel="stylesheet" media="screen">
        <link href="${basepath}/static/frame/theme/bootstrap/css/bootstrap-responsive.min.css"  rel="stylesheet" media="screen">
        <link href="${basepath}/static/frame/theme/assets/styles.css"  rel="stylesheet" media="screen">
        <link href="${basepath}/static/frame/jquery-ztree/3.5.12/css/zTreeStyle/zTreeStyle.min.css"  rel="stylesheet" media="screen">
        <link href="${basepath}/static/frame/theme/vendors/easypiechart/jquery.easy-pie-chart.css" rel="stylesheet" media="screen">
        <link href="${basepath}/static/frame/theme/vendors/datepicker.css" rel="stylesheet" media="screen" >
        <link href="${basepath}/static/frame/theme/vendors/uniform.default.css" rel="stylesheet" media="screen">
        <link href="${basepath}/static/frame/theme/vendors/chosen.min.css" rel="stylesheet" media="screen">
        <link href="${basepath}/static/frame/theme/vendors/wysiwyg/bootstrap-wysihtml5.css" rel="stylesheet" media="screen">
        <link href="${basepath}/static/frame/theme/vendors/jGrowl/jquery.jgrowl.css" rel="stylesheet" media="screen">
        <link href="${basepath}/static/frame/theme/vendors/morris/morris.css" rel="stylesheet" media="screen">
        <link href="${basepath}/static/frame/theme/assets/DT_bootstrap.css" rel="stylesheet" media="screen">
        <link href="${basepath}/static/css/style.css" rel="stylesheet" media="screen">
         <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
        <script src="${basepath}/static/frame/theme/vendors/jquery-validation/lib/jquery.js"></script>
        <script src="${basepath}/static/frame/theme/vendors/jquery-validation/dist/jquery.validate.js"></script>
        <script src="${basepath}/static/frame/theme/vendors/jquery-validation/dist/jquery.validate.extend.js"></script>
        <script src="${basepath}/static/frame/theme/vendors/jquery-validation/dist/jquery.validate.min.js"></script>
        <script src="${basepath}/static/frame/theme/vendors/jquery-1.9.1.min.js"></script>
		<script src="${basepath}/ckeditor/ckeditor.js"></script>
        <script src="${basepath}/ckfinder/ckfinder.js"></script>
        <script src="${basepath}/static/frame/theme/vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
		<script src="${basepath}/ckfinder/plugins/gallery/colorbox/jquery.min.js"></script>
        <script src="${basepath}/static/frame/theme/bootstrap/js/bootstrap.min.js"></script>
        <script src="${basepath}/static/frame/theme/vendors/easypiechart/jquery.easy-pie-chart.js"></script>
        <script src="${basepath}/static/frame/theme/assets/scripts.js"></script>
        <script src="${basepath}/static/js/common.js"></script>
        <script src="${basepath}/static/frame/jquery-ztree/3.5.12/js/jquery.ztree.all-3.5.min.js"></script>
        <script src="${basepath}/static/frame/treeTable/jquery.treeTable.min.js"></script>
        <script src="${basepath}/static/frame/theme/vendors/jquery-ui-1.10.3.js"></script>
        <script src="${basepath}/static/frame/theme/vendors/fullcalendar/fullcalendar.js"></script>
        <script src="${basepath}/static/frame/theme/vendors/fullcalendar/gcal.js"></script>
        <script src="${basepath}/static/frame/theme/vendors/bootstrap-wysihtml5/lib/js/wysihtml5-0.3.0.js"></script>
        <script src="${basepath}/static/frame/theme/vendors/bootstrap-wysihtml5/src/bootstrap-wysihtml5.js"></script>
        <script src="${basepath}/static/frame/theme/vendors/tinymce/js/tinymce/tinymce.min.js" type="text/javascript" ></script>
        <script src="${basepath}/static/frame/theme/vendors/jquery.uniform.min.js"></script>
        <script src="${basepath}/static/frame/theme/vendors/chosen.jquery.min.js"></script>
        <script src="${basepath}/static/frame/theme/vendors/bootstrap-datepicker.js"></script>
        <script src="${basepath}/static/frame/theme/vendors/wysiwyg/wysihtml5-0.3.0.js"></script>
        <script src="${basepath}/static/frame/theme/vendors/wysiwyg/bootstrap-wysihtml5.js"></script>
        <script src="${basepath}/static/frame/theme/vendors/wizard/jquery.bootstrap.wizard.min.js"></script>
        <script src="${basepath}/static/frame/theme/vendors/jquery-validation/dist/jquery.validate.min.js" type="text/javascript"></script>
        <script src="${basepath}/static/frame/theme/vendors/datatables/js/jquery.dataTables.min.js"></script>
        <script src="${basepath}/static/frame/theme/assets/form-validation.js"></script>
        <script src="${basepath}/static/frame/theme/assets/DT_bootstrap.js"></script>
        <script src="${basepath}/static/frame/theme/vendors/jGrowl/jquery.jgrowl.js"></script>
        <script src="${basepath}/static/frame/theme/vendors/jquery.knob.js"></script>
        <script src="${basepath}/static/frame/theme/vendors/raphael-min.js"></script>
        <script src="${basepath}/static/frame/theme/vendors/morris/morris.min.js"></script>
        <script src="${basepath}/static/frame/theme/vendors/flot/jquery.flot.js"></script>
        <script src="${basepath}/static/frame/theme/vendors/flot/jquery.flot.categories.js"></script>
        <script src="${basepath}/static/frame/theme/vendors/flot/jquery.flot.pie.js"></script>
        <script src="${basepath}/static/frame/theme/vendors/flot/jquery.flot.time.js"></script>
        <script src="${basepath}/static/frame/theme/vendors/flot/jquery.flot.stack.js"></script>
        <script src="${basepath}/static/frame/theme/vendors/flot/jquery.flot.resize.js"></script>
        
<title>基础框架</title>
</head>
<body>
	<div class="navbar navbar-fixed-top">
            <div class="navbar-inner">
                <div class="container-fluid">
                    <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"> <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                     <span class="icon-bar"></span>
                    </a>
                    <a class="brand" href="#">基础框架</a>
                    <div class="nav-collapse collapse">
                        <ul class="nav pull-right">
                            <li class="dropdown">
                                <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown">
									<i class="icon-user"></i>欢迎您登录：${userToken.vuser.user.name}<i class="caret"></i>
                                </a>
                                <ul class="dropdown-menu">
                                    <li>
                                        <a tabindex="-1" href="${basepath}/user/addpass">修改密码</a>
                                    </li>
                                    <li class="divider"></li>
                                    <li>
                                        <a tabindex="-1" href="${basepath}/delSession">注销</a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                        <ul class="nav">
                            <li class="dropdown">
                                <a href="${basepath}/user">首页</a>
                            </li>
                            <c:forEach items="${userToken.menulist}" var="menu" varStatus="stat0">
                            <c:if test="${menu.parentId==''}">
                            <li class="dropdown">
                                <a href="${basepath}${menu.href}" data-toggle="dropdown" class="dropdown-toggle">${menu.name}<b class="caret"></b></a>
                                <ul class="dropdown-menu" id="menu_${stat0.index+1}">
                               	 <c:forEach items="${userToken.menulist}" var="menusubtwo" varStatus="stat1">
                               	 <c:if test="${menusubtwo.parentId==menu.id}">
                                    <li>
                                    	<a href="${basepath}${menusubtwo.href}">${menusubtwo.name}</a>
                                    	<!-- 开启三层
                                        <ul class="dropdown-menu sub-menu"><i class="icon-arrow-right"></i>
                                        	<c:forEach items="${userToken.menulist}" var="menusubthree" varStatus="stat2">
                                        	<c:if test="${menusubthree.parentId==menusubtwo.id}">
                                            <li>
                                                <a href="#">${menusubthree.name}</a>
                                            </li>
                                            </c:if>
                                            </c:forEach>
                                        </ul>
                                         -->
                                    </li>
                                    </c:if>
                                  </c:forEach>
                                </ul>
                            </li>
                            </c:if>
                          </c:forEach>  
                        </ul>
                    </div>
                    <!--/.nav-collapse -->
                </div>
            </div>
        </div>
</body>
</html>