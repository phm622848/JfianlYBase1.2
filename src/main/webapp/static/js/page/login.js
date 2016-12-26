var Login = function() {
	"use strict";
	var runBoxToShow = function() {
		var el = $('.box-login');
		if (getParameterByName('box').length) {
			switch(getParameterByName('box')) {
				case "register" :
					el = $('.box-register');
					break;
				case "forgot" :
					el = $('.box-forgot');
					break;
				default :
					el = $('.box-login');
					break;
			}
		}
		el.show().addClass("animated flipInX").on('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function() {
			$(this).removeClass("animated flipInX");
		});
	};
	var runLoginButtons = function() {
		$('.forgot').on('click', function() {
			$('.box-login').removeClass("animated flipInX").addClass("animated bounceOutRight").on('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function() {
				$(this).hide().removeClass("animated bounceOutRight");

			});
			$('.box-forgot').show().addClass("animated bounceInLeft").on('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function() {
				$(this).show().removeClass("animated bounceInLeft");

			});
		});
		$('.register').on('click', function() {
			$('.box-login').removeClass("animated flipInX").addClass("animated bounceOutRight").on('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function() {
				$(this).hide().removeClass("animated bounceOutRight");

			});
			$('.box-register').show().addClass("animated bounceInLeft").on('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function() {
				$(this).show().removeClass("animated bounceInLeft");

			});

		});
		$('.go-back').click(function() {
			var boxToShow;
			if ($('.box-register').is(":visible")) {
				boxToShow = $('.box-register');
			} else {
				boxToShow = $('.box-forgot');
			}
			boxToShow.addClass("animated bounceOutLeft").on('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function() {
				boxToShow.hide().removeClass("animated bounceOutLeft");

			});
			$('.box-login').show().addClass("animated bounceInRight").on('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function() {
				$(this).show().removeClass("animated bounceInRight");

			});
		});
	};
	//function to return the querystring parameter with a given name.
	var getParameterByName = function(name) {
		name = name.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
		var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"), results = regex.exec(location.search);
		return results == null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
	};
	var runSetDefaultValidation = function() {
		$.validator.setDefaults({
			errorElement : "span", // contain the error msg in a small tag
			errorClass : 'help-block',
			errorPlacement : function(error, element) {// render error placement for each input type
				if (element.attr("type") == "radio" || element.attr("type") == "checkbox") {// for chosen elements, need to insert the error after the chosen container
					error.insertAfter($(element).closest('.form-group').children('div').children().last());
				} else if (element.attr("name") == "card_expiry_mm" || element.attr("name") == "card_expiry_yyyy") {
					error.appendTo($(element).closest('.form-group').children('div'));
				} else {
					error.insertAfter(element);
					// for other inputs, just perform default behavior
				}
			},
			ignore : ':hidden',
			success : function(label, element) {
				label.addClass('help-block valid');
				// mark the current input as valid and display OK icon
				$(element).closest('.form-group').removeClass('has-error');
			},
			highlight : function(element) {
				$(element).closest('.help-block').removeClass('valid');
				// display OK icon
				$(element).closest('.form-group').addClass('has-error');
				// add the Bootstrap error class to the control group
			},
			unhighlight : function(element) {// revert the change done by hightlight
				$(element).closest('.form-group').removeClass('has-error');
				// set error class to the control group
			}
		});
	};
    /**
     * 添加
     *
     * **/
    var successType = $('#successType').val();
    var basepath = $('#basepath').val();
	var runLoginValidator = function() {
        var msg = $('#msg').val();
        if(msg!=null&&msg!=''){
            errorHandler.show();
            $("#messages").empty();
            $("#messages").append(msg);
        }
        var formlogin = $('.form-login');
        var errorHandler = $('.errorHandler', formlogin);
        var successRegHandler = $('.successRegHandler',formlogin);
        var regerrorHandler = $('.regerrorHandler',formlogin);
        var successEmailHandler = $('.successEmailHandler',formlogin);
        var senderrorHandler = $('.senderrorHandler',formlogin);
        if(successType==1){
            regerrorHandler.hide();
            successRegHandler.show();
        }else if(successType == 2){
            successRegHandler.hide();
            regerrorHandler.show();
        }
        else if(successType == 3){
            senderrorHandler.show();
            successEmailHandler.hide();
        }
        else if(successType == 4){
            successEmailHandler.show();
            senderrorHandler.hide();
        }
        formlogin.validate({
			rules : {
				username : {
					minlength : 2,
					required : true
				},
				password : {
					minlength : 6,
					required : true
				},
                captcha : {
                    required : true
				}
			},
            messages : {
				username : {minlength: "最小长度为2位",required: "请输入用户名"},
				password : {minlength: "最小长度为6位",required: "请输入密码"},
                captcha:{required: "请输入验证码"}
			},
			submitHandler : function(formlogin) {
				errorHandler.hide();
                formlogin.submit();
			},
			invalidHandler : function(event, validator) {//display error alert on form submit
				errorHandler.show();
			}
		});
	};
	var runForgotValidator = function() {
        var form2 = $('.form-forgot');
        var errorEmailHandler = $('.errorEmailHandler', form2);
		form2.validate({
			rules : {
				email : {
					required : true,
                    remote: {
                        url: basepath+'/user/checkemail',
                        type: "post",
                        dataType: "json",
                        data: {
                            loginname: function () {
                                return $("#emailer").val();　　　　//这个是取要验证的密码
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
			    email :{
                    required : "请填写找回密码邮箱",
                    remote : "您填写的邮箱出错，请重新填写！"
			    }
            },
			submitHandler : function(form) {
                errorEmailHandler.hide();
                form.submit();
			},
			invalidHandler : function(event, validator) {//display error alert on form submit
                errorEmailHandler.show();
			}
		});
	};
	var runRegisterValidator = function() {
        var form3 = $('.form-register');
        var errorHandler3 = $('.errorRegHandler', form3);
		form3.validate({
			rules : {
				'user.loginName' : {
					minlength : 2,
					required : true,
                    remote: {
                        url: basepath+'/user/getloginname',
                        type: "post",
                        dataType: "json",
                        data: {
                            loginname: function () {
                                return $("#loginname").val();　　　　//这个是取要验证的密码
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
				},
				'user.name' : {
					minlength : 2,
					required : true
				},
				'user.no' : {
					minlength : 2,
					required : true
				},
				'user.sex' : {
					required : true
				},
				'user.email' : {
					required : true,
                    remote: {
                        url: basepath+'/user/getemail',
                        type: "post",
                        dataType: "json",
                        data: {
                            useremail: function () {
                                return $("#useremail").val();　　　　//这个是取要验证的密码
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
				},
                'user.phone' : {
                    required : true
                },
				'user.password' : {
					minlength : 6,
					required : true
				},
				password_again : {
					required : true,
					minlength : 5,
					equalTo : "#password"
				},
				agree : {
					minlength : 1,
					required : true
				}
			},
			messages : {
                'user.loginName':{
                    minlength:'登录名不能少于2位',
                    required:'请输入登录名',
                    remote:'登录名称重复，请重新输入'
				},
                'user.name':{
                    minlength:'用户名不能少于2位',
                    required:'请输入用户名'
                },
                'user.no':{
                    minlength:'学工号不能少于2位',
                    required:'请输入学工号'
                },'user.sex':{
                    required:'请选择性别'
                },'user.email':{
                    required:'请输入邮箱',
                    remote:'邮箱重复，请重新输入'
                },'user.phone':{
                    required:'请输入手机号'
                },'user.password':{
                    minlength:'密码不能少于6位',
                    required:'请输入密码'
                },password_again:{
                    minlength:'密码不能少于6位',
                    required:'请再次输入密码'
                },agree :{
                    required:'请同意相关协议'
                }
            },
			submitHandler : function(form) {
				errorHandler3.hide();
                form.submit();
			},
			invalidHandler : function(event, validator) {//display error alert on form submit
				errorHandler3.show();
			}
		});
	};
	return {
		//main function to initiate template pages
		init : function() {

			runBoxToShow();
			runLoginButtons();
			runSetDefaultValidation();
			runLoginValidator();
			runForgotValidator();
			runRegisterValidator();
		}
	};
}();
