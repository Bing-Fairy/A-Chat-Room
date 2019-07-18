$(function(){
	$("#divMsg").ajaxStart(function(){
		$(this).show();
	})
	$("#divMsg").ajaxStop(function(){
		$(this).html("请求处理已完成。").hide();
	})
	$("#Button1").click(function(){
		var $name=$("#txtName");
		var $pass=$("#txtPass");
		if($name.val()!="" && $pass.val()!=""){
			UserLogin($name.val(),$pass.val());
		}else{
			if($name.val()==""){
				alert("用户名不能为空！");
				$name.focus();
				return false;
			}else{
				alert("密码不能为空！");
				$pass.focus();
				return false;
			}
		}
	})
});
function UserLogin(name,pass){
	$.ajax({
	type:"POST",
	url:"chat",
	data:"action=Login&d="+new Date()+"&name="+name+"&pass="+pass,
	success:function(data){
		if(data){
			window.location.href="ChatMain.html";
		}else{
			alert("用户名或密码错误");
			return false;
		}
	}
	}
	);
}