<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:import url="/pages/include/pageNavigationFile.jsp" />
<script type="text/javascript">

$(document).ready(function() {
	var editor = null;
	$("#successmessage").hide();
	$("#errormessage").hide();
	editor = CKEDITOR.replace('content'); //参数‘content’是textarea元素的name属性值，而非id属性值
});

	
	
	function sendemail() {
		editor.updateElement();
		//alert($("#content").val());
		var mail = {
			toMail : $("#toMail").val(),
			ccMail : $("#ccMail").val(),
			subject : $("#subject").val(),
			content : $("#content").val()
		};

		if (confirm("确定发送邮件？")) {
			editor.updateElement();
			$.ajax({
				type : 'post',
				url : '${basepath}/file/sendmail',
				data : mail,
				cache : false,
				dataType : 'json',
				success : function(data) {
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
</head>
<body>

	<!-- block -->
	<div class="block" style="margin: 5%;">
		<div class="block-content collapse in">
			<div class="span12">
				<div class="alert alert-success"
					style="margin-right: 8%; text-align: center;" id="successmessage">
					<button class="close" onclick="$('#successmessage').hide();">&times;</button>
					<strong><span id="messagess"></span></strong>
				</div>
				<div class="alert alert-error"
					style="margin-right: 8%; text-align: center;" id="errormessage">
					<button class="close" onclick="$('#errormessage').hide();">&times;</button>
					<strong><span id="messageee"></span></strong>
				</div>
			</div>
			<div class="span12">
				<form class="form-horizontal" action="${basepath}/user/saveuserinfo"
					id="userform" method="post">
					<fieldset>
						<legend>邮件发送</legend>
						<div class="control-group">
							<label class="control-label">收件人：</label>
							<div class="controls">
								<input class="input-xlarge focused" id="toMail" name="toMail"
									type="text" placeholder="请输入收件人！">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">抄送人：</label>
							<div class="controls">
								<input class="input-xlarge focused" id="ccMail" name="ccMail"
									type="text" placeholder="请输入抄送人！">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">主 题：</label>
							<div class="controls">
								<input class="input-xlarge focused" id="subject" name="subject"
									type="text" placeholder="请输入主题！">
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">邮件内容：</label>
							<div class="controls">
								<textarea id="content" name="content"></textarea>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label">选择附件：</label>
							<div class="controls">
								<input id="xFilePath" name="FilePath" type="text" size="60" /> <input
									type="button" class="btn btn-primary" value="上传附件" onclick="BrowseServer('xFilePath');" />
							</div>
						</div>

						<div class="form-actions">
							<button type="button" class="btn btn-primary"
								onclick="sendemail();">发送</button>
							<button type="reset" class="btn">取消</button>
						</div>
					</fieldset>
				</form>

			</div>
		</div>
	</div>
</body>

</html>