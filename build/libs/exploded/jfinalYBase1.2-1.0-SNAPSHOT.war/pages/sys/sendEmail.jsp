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
                        <h1>邮件发送</h1>
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
                                我的面板
                            </a>
                        </li>
                        <li class="active">
                            邮件发送
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
                            </ul>
                            <div class="tab-content">
                                <div class="panel-body">
                                    <div class="alert alert-success text-center no-display"
                                         id="successmessage">
                                        <button class="close" onclick="$('#successmessage').hide();">&times;</button>
                                        <strong><span id="messagess"></span></strong>
                                    </div>
                                    <div class="alert alert-danger text-center no-display"
                                         id="errormessage">
                                        <button class="close" onclick="$('#errormessage').hide();">&times;</button>
                                        <strong><span id="messageee"></span></strong>
                                    </div>
                                    <form class="form-horizontal" action="${basepath}/user/saveuserinfo" id="userform"
                                          method="post">
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">
                                                收件人：
                                            </label>
                                            <div class="col-sm-9">
                                                <input class="form-control" id="toMail" name="toMail"
                                                       type="text" placeholder="请输入收件人！">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">
                                                抄送人：
                                            </label>
                                            <div class="col-sm-9">
                                                <input class="form-control" id="ccMail" name="ccMail"
                                                       type="text" placeholder="请输入抄送人！">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">
                                                主 题：
                                            </label>
                                            <div class="col-sm-9">
                                                <input class="form-control" id="subject" name="subject"
                                                       type="text" placeholder="请输入主题！">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">
                                                邮件内容：
                                            </label>
                                            <div class="col-sm-9">
                                                <textarea id="content" name="content" class="form-control"
                                                          rows="8"></textarea>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">
                                                选择附件：
                                            </label>
                                            <div class="col-sm-9">
                                                <input id="xFilePath" class="from-control" name="FilePath" type="text"/>
                                                <input type="button" class="btn btn-primary btn-squared"
                                                       value="上传附件" onclick="BrowseServer('xFilePath');"/>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-12 text-center">
                                                <button type="button" class="btn btn-primary btn-squared btn-lg"
                                                        onclick="sendemail();">发送
                                                </button>
                                                <button type="reset" class="btn btn-default btn-squared btn-lg">取消
                                                </button>
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
    </div>
</div>
<c:import url="/pages/include/pageFoot.jsp"/>
<script type="text/javascript">
    $(document).ready(function () {
        var editor = null;
        $("#successmessage").hide();
        $("#errormessage").hide();
        editor = CKEDITOR.replace('content'); //参数‘content’是textarea元素的name属性值，而非id属性值
    });
    function sendemail() {
        editor.updateElement();
        //alert($("#content").val());
        var mail = {
            toMail: $("#toMail").val(),
            ccMail: $("#ccMail").val(),
            subject: $("#subject").val(),
            content: $("#content").val()
        };
        if (confirm("确定发送邮件？")) {
            editor.updateElement();
            $.ajax({
                type: 'post',
                url: '${basepath}/file/sendmail',
                data: mail,
                cache: false,
                dataType: 'json',
                success: function (data) {
                    if (data == '1') {
                        $("#successmessage").hide();
                        $("#errormessage").show();
                        $("#messageee").text("发送失败！");
                    } else {
                        $("#errormessage").hide();
                        $("#successmessage").show();
                        $("#messagess").text("发送成功！");
                    }
                    reshcg();
                }
            });
        }
    }
    //使用input框打开ckfinder
    function BrowseServer(inputId) {
        var finder = new CKFinder();
        finder.basePath = '/WHXYWXSYS/ckfinder'; //导入CKFinder的路径
        finder.selectActionFunction = SetFileField; //设置文件被选中时的函数
        finder.selectActionData = inputId; //接收地址的input ID
        finder.popup();
    }
    //文件选中时执行
    function SetFileField(fileUrl, data) {
        document.getElementById(data["selectActionData"]).value = fileUrl;
    }
</script>