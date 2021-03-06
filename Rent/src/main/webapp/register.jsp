<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>注册页</title>
    <link rel="stylesheet" href="layui/css/layui.css">
    <link rel="stylesheet" href="layui/css/style.css">
    <script src="layui/layui.js"></script>
<%--    <link rel="icon" href="../frame/static/image/code.png">--%>
</head>
<body>

<div class="login-main" >
    <header class="layui-elip" style="width: 82%">注册页</header>

    <!-- 表单选项 -->
    <form class="layui-form" style="width: 150%">
        <!-- 用户名 -->
        <div class="layui-input-inline">
            <div class="layui-inline" style="width: 85%">
                <input type="text" id="user" name="account" required  lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-inline">
                <i class="layui-icon" id="ri" style="color: green;font-weight: bolder;" hidden></i>
            </div>
            <div class="layui-inline">
                <i class="layui-icon" id="wr" style="color: red; font-weight: bolder;" hidden>ဆ</i>
            </div>
        </div>
        <!-- 密码 -->
        <div class="layui-input-inline">
            <div class="layui-inline" style="width: 85%">
                <input type="password" id="pwd" name="password" required  lay-verify="required" placeholder="请输入密码,只能是数字，字母或下划线，且长度为6-12位" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-inline">
                <i class="layui-icon" id="pri" style="color: green;font-weight: bolder;" hidden></i>
            </div>
            <div class="layui-inline">
                <i class="layui-icon" id="pwr" style="color: red; font-weight: bolder;" hidden>ဆ</i>
            </div>
        </div>
        <!-- 确认密码 -->
        <div class="layui-input-inline">
            <div class="layui-inline" style="width: 85%">
                <input type="password" id="rpwd" name="repassword" required  lay-verify="required" placeholder="请确认密码" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-inline">
                <i class="layui-icon" id="rpri" style="color: green;font-weight: bolder;" hidden></i>
            </div>
            <div class="layui-inline">
                <i class="layui-icon" id="rpwr" style="color: red; font-weight: bolder;" hidden>ဆ</i>
            </div>
        </div>
        <!-- 真实姓名 -->
        <div class="layui-input-inline">
            <div class="layui-inline" style="width: 85%">
                <input type="text" id="realuser" name="username" required  lay-verify="required" placeholder="请输入真实姓名" autocomplete="off" class="layui-input">
            </div>
        </div>
        <!-- 身份证号 -->
        <div class="layui-input-inline">
            <div class="layui-inline" style="width: 85%">
                <input type="text" id="userID" name="id" required  lay-verify="required" placeholder="请输入身份证号" autocomplete="off" class="layui-input">
            </div>
        </div>
        <!-- 性别 -->
        <div class="layui-form-item">
            <label class="layui-form-label">单选框</label>
            <div class="layui-input-block">
                <input type="radio" name="sex" value="男" title="男" checked="">
                <input type="radio" name="sex" value="女" title="女">
                <input type="radio" name="sex" value="禁" title="禁用" disabled="">
            </div>
        </div>
        <!-- 年龄 -->
        <div class="layui-input-inline">
            <div class="layui-inline" style="width: 85%">
                <input type="text" id="age" name="age" required  lay-verify="required" placeholder="请输入年龄" autocomplete="off" class="layui-input">
            </div>
        </div>
        <!-- 手机号 -->
        <div class="layui-input-inline">
            <div class="layui-inline" style="width: 85%">
                <input type="text" id="phone" name="phone" required  lay-verify="required" placeholder="请输入手机号" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-input-inline login-btn" style="width: 85%">
            <button type="submit" lay-submit lay-filter="sub" class="layui-btn">注册</button>
        </div>
        <hr style="width: 85%" />
        <p style="width: 85%"><a href="login.jsp" class="fl">已有账号？立即登录</a><a href="" class="fr">忘记密码？</a></p>
    </form>
</div>



<script type="text/javascript">
    layui.use(['form','jquery','layer'], function () {
        var form   = layui.form;
        var $      = layui.jquery;
        var layer  = layui.layer;
        //添加表单失焦事件
        //验证表单
        $('#user').blur(function() {
            var user = $(this).val();

            $.ajax({
                url:'/user/checkUser',
                type:'post',
                dataType:'text',
                data:{username:user},
                //验证用户名是否可用
                success:function(data){
                    if (data == "1") {
                        $('#ri').removeAttr('hidden');
                        $('#wr').attr('hidden','hidden');
                    } else {
                        console.log(data);
                        $('#wr').removeAttr('hidden');
                        $('#ri').attr('hidden','hidden');
                        layer.msg('当前用户名已被占用! ')
                    }
                }
            })
        });

        // you code ...
        // 为密码添加正则验证
        $('#pwd').blur(function() {
            var reg = /^[\w]{6,12}$/;
            if(!($('#pwd').val().match(reg))){
                //layer.msg('请输入合法密码');
                $('#pwr').removeAttr('hidden');
                $('#pri').attr('hidden','hidden');
                layer.msg('请输入合法密码');
            }else {
                $('#pri').removeAttr('hidden');
                $('#pwr').attr('hidden','hidden');
            }
        });

        //验证两次密码是否一致
        $('#rpwd').blur(function() {
            if($('#pwd').val() != $('#rpwd').val()){
                $('#rpwr').removeAttr('hidden');
                $('#rpri').attr('hidden','hidden');
                layer.msg('两次输入密码不一致!');
            }else {
                $('#rpri').removeAttr('hidden');
                $('#rpwr').attr('hidden','hidden');
            };
        });

        // 验证手机号长度是否正确
        $('#phone').blur(function() {
            //var reg = /^[\w]{6,12}$/;
            var reg = /^1\d{10}$/;
            if(!($('#phone').val().match(reg))){
                //layer.msg('请输入合法密码');
                $('#phwr').removeAttr('hidden');
                $('#phri').attr('hidden','hidden');
                layer.msg('手机号的正确长度是11位！');
            }else {
                $('#phri').removeAttr('hidden');
                $('#phwr').attr('hidden','hidden');
            }
        });

        //添加表单监听事件,提交注册信息
        form.on('submit(sub)', function() {
            $.ajax({
                url:'/user/register',
                type:'post',
                dataType:'text',
                data:{
                    username:$('#user').val(),
                    password:$('#pwd').val(),
                    name:$('#realuser').val(),
                    id:$('#userID').val(),
                    sex:$('input[name="sex"]:checked').val(),
                    age:$('#age').val(),
                    phone:$('#phone').val()
                },
                success:function(data){
                    if (data == "1") {
                        layer.msg('注册成功');
                        //location.href = "login.jsp";
                    }else {
                        layer.msg('注册失败');
                    }
                },
            })
            //防止页面跳转
            return false;
        });
    });
</script>
</body>
</html>
