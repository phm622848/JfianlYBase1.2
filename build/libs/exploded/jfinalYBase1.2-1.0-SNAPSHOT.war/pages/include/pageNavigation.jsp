<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/pages/include/pageHead.jsp"/>
<!-- start: TOPBAR -->
<body>
<div class="main-wrapper">
    <header class="topbar navbar navbar-inverse navbar-fixed-top inner">
        <!-- start: TOPBAR CONTAINER -->
        <div class="container">
            <div class="navbar-header">
                <a class="sb-toggle-left hidden-md hidden-lg" href="#main-navbar">
                    <i class="fa fa-bars"></i>
                </a>
                <!-- start: LOGO -->
                <a class="navbar-brand" href="${basepath}/user">
                    JfinalYBaseV1.2
                </a>
                <!-- end: LOGO -->
            </div>
            <div class="topbar-tools">
                <!-- start: TOP NAVIGATION MENU -->
                <ul class="nav navbar-right">
                    <!-- start: USER DROPDOWN -->
                    <li class="dropdown current-user">
                        <a data-toggle="dropdown" data-hover="dropdown" class="dropdown-toggle" data-close-others="true"
                           href="#">
                            <img src="${basepath}/static/rapido/assets/images/avatar-1-small.jpg" class="img-circle"
                                 alt="">
                            <span class="username hidden-xs">${userToken.vuser.user.name}</span>
                            <i class="fa fa-caret-down "></i>
                        </a>
                        <ul class="dropdown-menu dropdown-dark">
                            <li>
                                <a href="${basepath}/user/addInfo">
                                    我的信息
                                </a>
                            </li>
                            <li>
                                <a href="${basepath}/user/addpass">
                                    修改密码
                                </a>
                            </li>
                            <%--<li>
                                <a href="pages_messages.html">
                                    我的消息
                                </a>
                            </li>--%>
                            <li>
                                <a href="${basepath}/logout">
                                    注销
                                </a>
                            </li>
                        </ul>
                    </li>
                    <!-- end: USER DROPDOWN -->
                    <%--<li class="right-menu-toggle">
                        <a href="#" class="sb-toggle-right">
                            <i class="fa fa-globe toggle-icon"></i> <i class="fa fa-caret-right"></i> <span
                                class="notifications-count badge badge-default hide"> 3</span>
                        </a>
                    </li>--%>
                </ul>
                <!-- end: TOP NAVIGATION MENU -->
            </div>
        </div>
        <!-- end: TOPBAR CONTAINER -->
    </header>

    <!-- end: TOPBAR -->
    <!-- start: PAGESLIDE LEFT -->
    <a class="closedbar inner hidden-sm hidden-xs" href="#">
    </a>
    <nav id="pageslide-left" class="pageslide inner">
        <div class="navbar-content">
            <!-- start: SIDEBAR -->
            <div class="main-navigation left-wrapper transition-left">
                <div class="navigation-toggler hidden-sm hidden-xs">
                    <a href="#main-navbar" class="sb-toggle-left">
                    </a>
                </div>
                <div class="user-profile border-top padding-horizontal-10 block">
                    <div class="inline-block">
                        <img src="${basepath}/static/rapido/assets/images/avatar-1.jpg" alt="">
                    </div>
                    <div class="inline-block">
                        <h5 class="no-margin"> 欢迎您 </h5>
                        <h4 class="no-margin"> ${userToken.vuser.user.name} </h4>
                        <%--<a class="btn user-options sb_toggle">
                            <i class="fa fa-cog"></i>
                        </a>--%>
                    </div>
                </div>
                <!-- start: MAIN NAVIGATION MENU -->
                <ul class="main-navigation-menu">
                    <li class="active open">
                        <a href="${basepath}/user"><i class="fa fa-home"></i> <span class="title"> 首页 </span>
                            <%--<span class="label label-default pull-right ">更新</span>--%>
                        </a>
                    </li>
                    <c:forEach items="${userToken.menulist}" var="menu" varStatus="stat0">
                        <c:if test="${menu.parentId==''}">
                            <li>
                                <a href="${basepath}${menu.href}">
                                    <i class="fa fa-cogs"></i> <span class="title"> ${menu.name} </span><i
                                        class="icon-arrow"></i> <span class="arrow "></span>
                                </a>

                                <ul class="sub-menu" id="menu_${stat0.index+1}">
                                    <c:forEach items="${userToken.menulist}" var="menusubtwo" varStatus="stat1">
                                        <c:if test="${menusubtwo.parentId==menu.id}">
                                            <li>
                                                <a href="${basepath}${menusubtwo.href}"> ${menusubtwo.name} <i
                                                        class="icon-arrow"></i>
                                                </a>
                                                    <%--开启第三层
                                                    <ul class="sub-menu">
                                                        <li>
                                                            <a href="javascript:;">
                                                                Sample Link 1 <i class="icon-arrow"></i>
                                                            </a>
                                                            开启第四层
                                                            <ul class="sub-menu">
                                                                <li>
                                                                    <a href="#"><i class="fa fa-times"></i> Sample Link 1</a>
                                                                </li>
                                                            </ul>
                                                        </li>
                                                    </ul>--%>
                                            </li>
                                        </c:if>
                                    </c:forEach>
                                </ul>
                            </li>
                        </c:if>
                    </c:forEach>
                </ul>
                <!-- end: MAIN NAVIGATION MENU -->
            </div>
            <!-- end: SIDEBAR -->
        </div>
        <div class="slide-tools">
            <div class="col-xs-6 text-left no-padding">
                <a class="btn btn-sm status" href="#">
                    当前状态 <i class="fa fa-dot-circle-o text-green"></i> <span>在线</span>
                </a>
            </div>
            <div class="col-xs-6 text-right no-padding">
                <a class="btn btn-sm log-out text-right" href="${basepath}/logout">
                    <i class="fa fa-power-off"></i> 退出
                </a>
            </div>
        </div>
    </nav>

    <!-- end: PAGESLIDE LEFT -->