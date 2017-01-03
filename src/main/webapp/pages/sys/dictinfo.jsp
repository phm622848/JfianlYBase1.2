<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:import url="/pages/include/pageNavigation.jsp"/>
<%@ page import="com.wide.constant.EnumDictType" %>
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
                        <h1>数据字典维护</h1>
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
                            数据字典维护
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
                                <li><a href="${basepath}/dict/add">数据字典列表</a></li>
                                <li class="active"><a href="${basepath}/dict/addnewdict">添加数据字典</a></li>
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
                                    <form id="dict" class="form-horizontal" action="${basepath}/dict/save" method="post"
                                          class="form-horizontal">
                                        <!-- 	<div class="control-group">
							<label class="control-label" >所属字典：</label>
							
						     <div class="controls">
								<input class="input-xlarge focused" disabled="disabled" id="parentNAME" name="parentNAME"
									type="text"  value="${parentNAME}" >
							</div>
						</div> -->
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">
                                                字典类型：
                                            </label>
                                            <div class="col-sm-9">
                                                <select class="span3 m-wrap" id="dicttype" name="dict.type"
                                                        onchange="gradeChange(this.id)" placeholder="请选择数据字典类型！">
                                                    <option value=''>请选择</option>
                                                    <c:forEach var="typelist" items="<%=EnumDictType.values()%>">
                                                        <option
                                                                <c:if test="${dict.type==typelist.enumKey}">selected</c:if>
                                                                value='${typelist.enumKey}'>${typelist.enumText}</option>
                                                    </c:forEach>
                                                </select>
                                                <input type="hidden" id="hidTypeInfo" name="dict.typeinfo"
                                                       value="${dict.typeinfo}">
                                                <input type="hidden" id="hidType" name="dict.type"
                                                       value="${dict.type}"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">
                                                字典键：
                                            </label>
                                            <div class="col-sm-9">
                                                <input class="form-control" id="dictkey" name="dict.dictkey"
                                                       type="text" placeholder="请输入数据字典键！" value="${dict.dictkey}">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">
                                                字典值：
                                            </label>
                                            <div class="col-sm-9">
                                                <input id="did" name="dict.id" type="hidden" value="${dict.id}">
                                                <input class="form-control" id="dictvalue" name="dict.dictvalue"
                                                       type="text" placeholder="请输入数据字典值！" value="${dict.dictvalue}">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">
                                                备注：
                                            </label>
                                            <div class="col-sm-9">
                                                <textarea class="form-control" id="dict.remarks" rows="8"
                                                          name="dict.remarks" placeholder="请输入备注信息">${dict.remarks}</textarea>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-12 text-center">
                                                <button type="submit" class="btn btn-primary btn-lg">保存</button>
                                                <input type="button" value="返回" class="btn btn-default btn-lg"
                                                       onclick="javascript:window.location.href='${basepath}/dict/add'"/>
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
        <script type="text/JavaScript">
            function gradeChange(s) {
                var typeval = $("#" + s).val();
                var typename = $("#" + s).find("option:selected").text();
                $("#hidTypeInfo").val(typename);
                $("#hidType").val(typeval);
            }
            $().ready(function () {
                runSetDefaultValidation();
                var form3 = $('.form-horizontal');
                form3.validate({
                    rules: {
                        'dict.dictvalue': {
                            required: true
                        },
                        'dict.type': {
                            required: true
                        },
                        'dict.dictkey': {
                            required: true,
                            remote: {
                                url: '${basepath}/dict/dictkeycheck',
                                type: "post",
                                dataType: "json",
                                data: {
                                    dictkey: function () {
                                        return $("#dictkey").val();
                                    },
                                    type: function () {
                                        return $("#dicttype").val();
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
                        }
                    },
                    messages: {
                        'dict.dictvalue': {
                            required: '请输入数据字典值'
                        },
                        'dict.type': {
                            required: '请选择数据字典类型'
                        },
                        'dict.dictkey': {
                            required: '请输入数据字典键',
                            remote: '字典键重复，请重新输入'
                        }
                    },
                    submitHandler: function (form) {
                        form.submit();
                    },
                    invalidHandler: function (event, validator) {//display error alert on form submit
                    }
                });
            });
        </script>