<%--
登录页面
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">

    <title>登录页</title>
    <link rel="stylesheet" href="layui/css/layui.css">
    <link rel="stylesheet" href="layui/css/style.css">
</head>
<body>

<div class="login-main">
    <header class="layui-elip">登录页</header>
    <form class="layui-form">
        <div class="layui-input-inline">
            <input type="text" name="username" required lay-verify="required" placeholder="用户名" autocomplete="off"
                   class="layui-input">
        </div>
        <div class="layui-input-inline">
            <input type="password" name="password" required lay-verify="required" placeholder="密码" autocomplete="off"
                   class="layui-input">
        </div>
        <div class="layui-input-inline login-btn">
            <button lay-submit lay-filter="login" class="layui-btn">登录</button>
        </div>
        <p><a href="register.jsp" class="fl">立即注册</a><a href="javascript:;" class="fr">忘记密码？</a></p>
    </form>
</div>

<script src="layui/layui.js"></script>
<script type="text/javascript">
    layui.use(['form','layer','jquery'], function () {
        // 操作对象
        var form = layui.form;
        var $ = layui.jquery;
        form.on('submit(login)',function (data) {
             console.log(data.field);
            $.ajax({
                url:'/user/login',//
                data:data.field,
                dataType:'text',
                type:'get',
                success:function (data) {
                    if (data == 1){
                        location.href = "../index.jsp";
                    }else{
                        layer.msg('登录名或密码错误');
                    }
                }
            })
            return false;
        })
    });
</script>
</body>
</html>