<%--
  Created by IntelliJ IDEA.
  User: 14741
  Date: 2018/10/19
  Time: 21:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/myJS.js"></script>
    <meta charset="UTF-8">
    <title>Register</title>
    <style>
        html {
            height: 100%;
        }
        h3{
            color:	#404040 ;
            font:28px solid;
            text-align: center;
        }
        body{
            background: url("${pageContext.request.contextPath}/img/city5.jpg") no-repeat center center;
            background-size: cover;
        }
        div{
            border:0;
            width:350px;
            height:400px;
            background-color:rgba(255, 255, 255, 0.2);
            margin:auto;
            border-radius:3px;
            padding:20px;
            left: 400px;
            right:700px;
        }
        form input:not(.sex) {
            border:1px solid rgba(255, 255, 255, 0.4);
            background-color: rgba(255, 255, 255, 0.2);
            border-radius:8px;
            width:200px;
            height:30px;
            font-size:18px;
            padding:8px 10px;
            margin: 0 auto 8px auto;
            color:#ae8b9c;
        }
        form input:not(.sex):hover {
            background-color:rgba(255, 255, 255, 0.4);
        }
        form input:not(.sex):focus {
            background-color: white;
            width:250px;
            color:#180000;
        }
        .cls{
            border: 3px black;
            width: 200px;
            height: 30px;
            text-align: center;
        }
        .sex{
            font-size:18px;
            margin: 0 auto 10px auto;
            padding:0;
            width:70px;height:20px;
        }
        input::-ms-input-placeholder{
            text-align: center;
        }
        input::-webkit-input-placeholder{
            text-align: center;
            font-family: "Microsoft YaHei","微软雅黑";
        }
        input.text{
            text-align:center;
        }
        button{
            background-color:white;
            color:#8baaaa;
            border:0;
            padding:8px 10px;
            border-radius:8px;
            cursor:pointer;
            width:230px;
            height:45px;
            font-size:18px;
            text-align:center;
            vertical-align:middle;
            line-height: 18px;
        }
        button:hover{
            background-color: #f5f7f9;
        }
        a{
            color:yellow;
        }
    </style>
    <script>
        var status1 = 0;
        var status2 = 0;
        var status3 = 0;
        var status4 = 0;
    </script>
    <script type="text/javascript">
        function ckName() {
            //获取用户名
            var nickname = document.getElementById("nickname");
            //创建XMLHttpRequest对象
            var xhr = getXMLHttpRequest();
            //处理结果
            xhr.onreadystatechange = function(){
                if(xhr.readyState==4){//请求一切正常
                    if(xhr.status==200){//服务器响应一切正常
                        //alert(xhr.responseText);//得到响应结果
                        var msg = document.getElementById("msgName");
                        if(xhr.responseText=="<font color='green'>可以使用</font>"){
                            status1 = 1;
                        }else{
                            status1 = 0;
                        }
                        msg.innerHTML = xhr.responseText;

                    }
                }
            }
            //创建连接
            xhr.open("get","${pageContext.request.contextPath}/servlet/ckNameServlet?nickname="+nickname.value);
            //发送请求
            xhr.send(null);
        }
    </script>
    <script type="text/javascript">
        function ckEmail() {
            //获取邮箱名
            var email = document.getElementById("email");
            //创建XMLHttpRequest对象
            var xhr = getXMLHttpRequest();
            //处理结果
            xhr.onreadystatechange = function(){
                if(xhr.readyState==4){//请求一切正常
                    if(xhr.status==200){//服务器响应一切正常
                        //alert(xhr.responseText);//得到响应结果
                        if(xhr.responseText=="<font color='green'>可以使用</font>"){
                            status2 = 1;
                        }else{
                            status2 = 0;
                        }
                        var msg = document.getElementById("msgEmail");
                        msg.innerHTML = xhr.responseText;
                    }
                }
            }
            //创建连接
            xhr.open("get","${pageContext.request.contextPath}/servlet/ckEmailServlet?email="+email.value);
            //发送请求
            xhr.send(null);
        }
    </script>
    <script type="text/javascript">
        function ckPassword() {
            //获取密码
            var password = document.getElementById("password");
            //创建XMLHttpRequest对象
            var xhr = getXMLHttpRequest();
            //处理结果
            xhr.onreadystatechange = function(){
                if(xhr.readyState==4){//请求一切正常
                    if(xhr.status==200){//服务器响应一切正常

                        if(xhr.responseText=="<font color='green'>可以使用</font>"){
                            status3 = 1;
                        }else{
                            status3 = 0;
                        }
                        var msg = document.getElementById("msgPassword");
                        msg.innerHTML = xhr.responseText;
                    }
                }
            }
            //创建连接
            xhr.open("get","${pageContext.request.contextPath}/servlet/ckPasswordServlet?password="+password.value);
            //发送请求
            xhr.send(null);
        }
    </script>
    <script type="text/javascript">
        function ckRePassword() {
            //获取密码
            var password = document.getElementById("password");
            var repassword = document.getElementById("repassword");
            var msg = document.getElementById("msgRePassword");
            if(repassword.value===""){
                msg.innerHTML="<br><font color='red'>密码不能为空</font>";
            }else {
                if (password.value != repassword.value) {
                    status4 = 0;
                    msg.innerHTML = "<br><font color='red'>两次密码不一致</font>";
                } else {
                    status4 = 1;
                    msg.innerHTML = "<font color='green'>两次一致</font>";
                }
            }
        }
    </script>
    <script type="text/javascript">
        function ckForm() {
            var form1 = document.getElementById("form1");
            if(status1==1&&status2==1&&status3==1&&status4==1){
                form1.submit();
            }else{
                alert("请检查是否输入错误注册信息");
            }
        }
    </script>
</head>

<body>
<div style="position:absolute; left:0; top:45px; ">
    <h3>Welcome to Join Us!</h3>
    <form action="${pageContext.request.contextPath}/servlet/regisServlet" method="post" align="center" id="form1">

        <input type="text" placeholder="昵称" class="cls" value="" name="nickname" onblur="ckName()" id = "nickname"><span id="msgName"></span><br>
        <input type="password" placeholder="密码" class="cls" value="" name="password" onblur="ckPassword()" id="password"><span id="msgPassword"></span><br>
        <input placeholder="重复密码" class="cls" type="password" value="" name="repassword" onblur="ckRePassword()" id="repassword"><span id="msgRePassword"></span><br>
        性别： <input type="radio" value="男" name="sex" class="sex" checked="checked">男
        <input type="radio" value="女" name="sex" class="sex">女<br>
        <input type="text" placeholder="邮箱" class="cls" name="email" value="" onblur="ckEmail()" id="email"><span id="msgEmail"></span>
        <br>
        <input type="button" value="提交" onclick="ckForm()">
    </form>
    &nbsp;&nbsp;&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/index.jsp">返回</a>
</div>
</body>
</html>
