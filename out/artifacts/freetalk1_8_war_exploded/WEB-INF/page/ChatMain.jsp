<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html >
<head>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/myJS.js"></script>
    <title>麦田</title>
    <style>
        .divShow
        {
            border:0 solid ;
            height:450px;
            width:1000px;
            padding:0;
            font-size:20px;
            overflow-y:hidden;
            border-radius: 10px;
        }
        .dv2{
            background-color:#202020;
            opacity: 0.5;
            width:1000px;
            height:367px;
            overflow-y: auto;
        }
        .dv3{
            background-color:#202020;
            opacity: 0.5;
            width:1000px;;
            height:800px;
        }
        p{
            background-color: #101010 ;
            width:1000px;
            height:50px;
            top:0;
            margin:0;
            padding:0;
            border-radius: 8px;
        }
        h2{
            color:	white;
            font:40px solid;
            font-family: "微软雅黑",serif;
            position: absolute;
            left:300px;
            margin-top:50px;
        }
        h4{
            font:18px solid;
            color:	#D2691E;
        }
        .dv1{
            background: url("${pageContext.request.contextPath}/img/聊天背景.jpg") no-repeat center center;
            background-size: cover;
            opacity: 0.9;
            float: left;
        }
        .btn{
            background-color: #F0E68C	;
            color:black;
            width: 90px;
            height:40px;
            border-radius: 10px;
            padding:8px 10px;
            position:absolute;
            left:700px;
        }
        .cls{
            background-color:whitesmoke;
            width:600px;
            height:70px;
            cursor:pointer;
            font-size:20px;
            position: absolute;
            border-radius:8px;
            color: black;
            line-height: 45px;
            left:30px;
        }
    </style>

    <!--实时刷新在线人数-->
    <script type="text/javascript">

        function updateLoginPeople() {

            var LoginedPeoples= document.getElementById("LoginedPeople");

            //创建XMLHttpRequest对象
            var xhr = getXMLHttpRequest();
            //处理结果
            xhr.onreadystatechange = function(){
                if(xhr.readyState===4){//请求一切正常
                    if(xhr.status===200){//服务器响应一切正常
                        //alert(xhr.responseText);
                       LoginedPeoples.innerHTML = xhr.responseText;
                    }
                }
            }

            //创建连接
            xhr.open("get","${pageContext.request.contextPath}/servlet/updateLoginPeople");
            //发送请求
            xhr.send(null);
            //window.setTimeout(updateLoginPeople, 5000);       这个是在特定时间后只执行一次

        }
         setInterval(updateLoginPeople, 2000);

    </script>

    <!--将自己的发言存入数据库-->
    <script type="text/javascript">
        function send2() {

           var textContent= document.getElementById("textContent");
           var myName = document.getElementById("myName");
           var sendMessage=textContent.value;
           if(sendMessage===""||sendMessage==='\n'){
               alert("请输入发送内容！");
           }else{
           textContent.value="";
            //创建XMLHttpRequest对象
            var xhr = getXMLHttpRequest();
            //处理结果
            xhr.onreadystatechange = function(){
                if(xhr.readyState===4){//请求一切正常
                    if(xhr.status===200){//服务器响应一切正常
                        sendMessage.value=xhr.responseText;
                    }
                }
            }
            //创建连接
            xhr.open("get","${pageContext.request.contextPath}/servlet/sendMyMessage?nickname="+myName.value+"&textContent="+sendMessage);
            //发送请求
            xhr.send(null);
            //window.setTimeout(updateLoginPeople, 5000);       这个是在特定时间后只执行一次
           }


        }
        //window.setTimeout(updateLoginPeople, 5000);

    </script>

    <!--实时刷新聊天记录-->
    <script type="text/javascript">

        function updateAllContent() {

            var AllContent= document.getElementById("AllContent");

            //创建XMLHttpRequest对象
            var xhr = getXMLHttpRequest();
            //处理结果
            xhr.onreadystatechange = function(){
                if(xhr.readyState===4){//请求一切正常
                    if(xhr.status===200){//服务器响应一切正常
                        //alert(xhr.responseText);
                        AllContent.innerHTML = xhr.responseText;
                        var div = document.getElementById('AllContent');
                        div.scrollTop = div.scrollHeight;
                    }
                }
            };

            //创建连接
            xhr.open("get","${pageContext.request.contextPath}/servlet/sendAllMessages");
            //发送请求
            xhr.send(null);
            //window.setTimeout(updateLoginPeople, 5000);       这个是在特定时间后只执行一次

        }
        setInterval(updateAllContent, 1000);

    </script>

    <!--关闭当前窗口退出状态-->
    <script type="text/javascript">
        function exitStatus() {

                //创建XMLHttpRequest对象
                var xhr = getXMLHttpRequest();
                //处理结果
                xhr.onreadystatechange = function(){
                    if(xhr.readyState===4){//请求一切正常
                        if(xhr.status===200){//服务器响应一切正常
                        }
                    }
                };
                //创建连接
                xhr.open("get","${pageContext.request.contextPath}/servlet/loginOutServlet?nickname=${u.nickname}");
                //发送请求
                xhr.send(null);
                //window.setTimeout(updateLoginPeople, 5000);       这个是在特定时间后只执行一次
        }
    </script>

</head>
<body  onunload="exitStatus()">
<div class="dv1" style="position:absolute; left:0;top:0; width:100%;height:100%;"> <!--聊天界面和在线人员界面 -->
         <h2> "&nbsp;麦&nbsp;田&nbsp;之&nbsp;说&nbsp;"&nbsp;聊&nbsp;天&nbsp;室 <br>
               <h4>欢迎你：${u.nickname}</h4>
         </h2> <br/> <br/>

         <div style="position:relative;left:30px;margin-top:10px;" class="divShow" id="divContent">
             <p></p>
           <!--所有的聊天记录-->
                <div class="dv2" id="AllContent" name="AllContent">

                </div>
         </div>
         <div class="divShow" style="position:absolute;right:100px;top:80px;border:1px solid #F0E68C; width:350px;height:650px;" id="divOnLine">
             <p></p>

             <h3>当前在线人员</h3>
             <div class="dv3"  id="LoginedPeople" >
              </div>
        </div>
     <br/>
     <div> <!-- 发送消息的地方-->

             <input type="hidden" value="${u.nickname}" id="myName" name="myName">

            <!--发送的内容-->
             <textarea class="cls" id="textContent" cols="64" rows="3" name="textContent" onkeypress="if (event.keyCode == 13) {send2(); this.value='';}"></textarea>
             <input class="btn"  id="send" name="send" type="button" value="发送"  onclick="send2()" ><br><br>
             <a class="btn" href="${pageContext.request.contextPath}/servlet/loginOutServlet?nickname=${u.nickname}">退出</a>


     </div>
 </div>
</body>
</html>
