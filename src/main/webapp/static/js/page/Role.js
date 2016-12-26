var runRoleValidator = function () {
    var form3 = $('.form-horizontal');
    var errorHandler3 = $('.errorRoleHandler', form3);
    form3.validate({
        rules: {
            'role.name': {
                minlength: 2,
                required: true,
                remote: {
                    url: basepath + '/role/getName',
                    type: "post",
                    dataType: "json",
                    data: {
                        name: function () {
                            return $("#name").val();　
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
            'role.name': {
                minlength: 2,
                required: true
            },
            messages: {
                'role.name': {
                    minlength: '角色名不能少于2位',
                    required: '请输入角色名',
                    remote: '登录名称重复，请重新输入'
                },
                agree: {
                    required: '请同意相关协议'
                }
            },
            submitHandler: function (form) {
                errorHandler3.hide();
                form.submit();
            },
            invalidHandler: function (event, validator) {//display error alert on form submit
                errorHandler3.show();
            }}
        });
};
return {
    //main function to initiate template pages
    init: function () {
        runRoleValidator();
    }
};