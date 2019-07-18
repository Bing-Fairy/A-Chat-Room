<%--
  Created by IntelliJ IDEA.
  User: 14741
  Date: 2018/10/19
  Time: 18:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>麦田之说</title>
    <style>
        h2{
            color:antiquewhite;
            font:70px solid;
            text-align: center;
        }
        body{
            background-image:url('${pageContext.request.contextPath}/img/city9.jpg');
            background-size: cover;
            opacity: 0.8;
        }
        .cls{
            border: 3px black;
            width: 200px;
            height: 35px;
            text-align: center;
        }
        .dv2{
            border:0;
            width:300px;
            background-color:rgba(255, 255, 255, 0.2);
            margin:auto;
            border-radius:3px;
            top: 0;
            padding:15px;
            height:280px;
        }
        form input:not(.sex) {
            border:1px solid rgba(255, 255, 255, 0.4);
            background-color: rgba(255, 255, 255, 0.2);
            border-radius:8px;
            width:200px;
            height:35px;
            font-size:18px;
            padding:5px 5px;
            margin-top:24px;
            margin-left: 40px;
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
        button{
            background-color:white;
            color:#8baaaa;
            border:0;
            padding:8px 10px;
            border-radius:8px;
            cursor:pointer;
            width:220px;
            height:40px;
            font-size:18px;
            text-align:center;
            vertical-align:middle;
            line-height: 18px;
            margin-left: 40px;
            margin-bottom: 0;
        }
        button:hover{
            background-color: #f5f7f9;
        }
        a{
            color:yellow;
        }
    </style>
</head>
<body>
    <h2>Welcome to <strong>"The room of Wheat field"</strong></h2>
    <form action="${pageContext.request.contextPath}/servlet/loginServlet" method="post" >
        <div class="dv2" style="position:absolute; left:180px; top:180px; ">
        <input type="text" value="" name="nickname" placeholder="Username" style="border-radius: 8px;font-size: 30px;" class="cls"><br/><br/>
        <input type="password" value="" name="password" placeholder="Password" style="border-radius: 8px; font-size: 30px;" class="cls"><br/><br/>
        <input type="submit" value="登录" style="font-size: 20px;"><br>
            &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<font color="red">${Error}</font>
         <br>
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <br>
        <a href="${pageContext.request.contextPath}/index.jsp" >返回到上一级</a>
        </div>
    </form>

</body>
</html>
