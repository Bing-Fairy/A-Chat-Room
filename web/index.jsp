<%--
  Created by IntelliJ IDEA.
  User: 14741
  Date: 2018/10/19
  Time: 18:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>主界面</title>
  <link rel="stylesheet" type="text/css" href="css/styles.css">
  <style>
    .cls2{
      font-size: 20px;
      color: steelblue;
      overflow:hidden;
      /*position:relative;*/
      text-align:center;
      margin-top: 500px;
    }
  </style>
</head>
<body>
<div class="htmleaf-container">
  <div class="wrapper">
    <div class="container">
      <h1>Welcome</h1>
      <form class="form">
        <div  style="position:relative; left:10px; top: 0;" class="dv2">
          <input class="cls"  type="button" value="sign in" id="btn1"><br/>
          <input class="cls"  type="button" value="sign up" id="btn2">
        </div>
      </form>
    </div>
    <%--<ul class="bg-bubbles">--%>
      <%--<li></li>--%>
      <%--<li></li>--%>
      <%--<li></li>--%>
      <%--<li></li>--%>
      <%--<li></li>--%>
      <%--<li></li>--%>
      <%--<li></li>--%>
      <%--<li></li>--%>
      <%--<li></li>--%>
      <%--<li></li>--%>
    <%--</ul>--%>
  </div>
</div>
<p class="cls2">开发人员：&nbsp;&nbsp;曾中杰&nbsp;干冰雪&nbsp;陈嘉莹&nbsp;</p>
<script src="js/jquery-2.1.1.min.js" type="text/javascript"></script>
<script>

    $(document).ready(function () {
        $('#login-button').click(function (event) {
            event.preventDefault();
            $('form').fadeOut(500);
            $('.wrapper').addClass('form-success');
        });
        $("#btn1").click(function () {
            window.location.href="login.jsp";
        });
        $("#btn2").click(function () {
            window.location.href="register.jsp";
        });
    });
</script>
</body>
</html>
