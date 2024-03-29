<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
		pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>登录</title>
  <link rel="stylesheet" href="${APP_PATH }/static/bootstrap-3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="${APP_PATH }/static/css/index.css">
  <link rel="stylesheet" type="text/css" href="${APP_PATH }/static/css/login.css">
  <script src="${APP_PATH }/static/js/jquery-3.4.1.min.js"></script> 
  <script src="${APP_PATH }/static/bootstrap-3.3.7/js/bootstrap.min.js"></script>
 <!--  <script src="./static/echarts-2.2.7/echarts-all.js"></script> -->
 <link rel="stylesheet" type="text/css" href="${APP_PATH }/static/css/login.css">
 <link rel="stylesheet" type="text/css" href="${APP_PATH }/static/icon/iconfont.css">
	
	<script type="text/javascript">
	$(function(){
		
		//登录
		$("#submitBtn").on("click",function(event){
			var data = $("#f1").serialize();
			$.ajax({
				type: "post",
				url: "login",
				data: data, 
				dataType: "json", //返回数据类型
				success: function(data){
					if("success" == data.type){
						 alert(data.msg); 
						if("1" == data.role){
							window.location.href = "userScreen"; 
							/* alert("普通用户"); */
						} else {
							/* alert("管理员"); */
							window.location.href = "adminScreen"; 
						}
					} else {
						/* $.message.alert("消息提醒", data.msg, "warning"); */
						alert(data.msg);
					}  
				}
			});
		});
	})
	
	 
	/* $(function(){
		$(".Access a").on("click",function(event){
			event.preventDefault();
			$("#f1").submit();
		});
	}) */
 </script>
</head>
<body>

  <div class="login_container">
      <div class="login_content">
          <div class="tabs_title">
            <h1>
           <!--  <span class="active-title">登录</span>
            <span>注册</span> -->
             <a href="login" class="active-title">登录</a>
            <a href="register" >注册</a>
            </h1>
          </div>
          <div class="signin">
            <form method="post" id="f1">
              <div class="form-group">
                <label for="signinInputName">账号: </label>
                <input type="text" class="form-control" name="account" id="signinInputName" placeholder="请输入账号">
              </div>
              <div class="form-group">
                <label for="signinInputPassword">密码: </label>
                <input type="password" class="form-control" name="password" id="signinInputPassword" placeholder="请输入密码">
              </div>
              <div class="forget">
                 <!--  <label>
                   <input type="checkbox" checked="checked" class="auto-cbx" id="auto-signin">七天内自动登录
                  </label>

                  <a href="/user/newforgot" class="rlf-forget r" target="_blank" hidefocus="true">找回密码</a> -->
              </div>
              <div class="Access"><a><input id="submitBtn" type="button" value="确定" style="color: yellow;background-color: red;border: none;"></a></div>
            </form>
            </div>

           <!--  第三种方式 -->
           <div class="third_content">
      <div>
         <a class="icon_font" href="${baiduAuthUrl }"> <span class="iconfont icon-baidu1"></span></a>
        <a class="icon_font" href="//www.imooc.com/help/detail/127"><span class="iconfont icon-weibo"></span></a>
          <a class="icon_font" href="//www.imooc.com/help/detail/127"> <span class="iconfont icon-qq"></span></a>
          <a class="icon_font" href="//www.imooc.com/help/detail/127"> <span class="iconfont icon-weixin"></span></a>
          <!-- <img src="./static/images/QQ.png" alt="">
          <img src="./static/images/weibo.png" alt="">
          <img src="./static/images/weixin.png" alt=""> -->
        </div>
           </div>
      </div>


  </div>

</body>
</html>
