<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Designer's Space</title>

	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/reset.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/style.css">
	
	<style type="text/css">
		.input {
			padding : 0px 10px;
			width: 276px;
			height: 30px;
			margin-bottom: 10px;
			border-radius: 5px;
			border: 1px solid #60524E
		}
		#button {
			width: 300px;
			height: 35px;
			color: #FFFFFF;
			margin-bottom: 10px;
			background-color: #60524E;
			font-weight: bold;
			border: 0px;
			border-radius: 5px;
			cursor: pointer;
		}
		#button:hover{
			color: #fff;
			background-color: #4AD674;
		}
		.input_span{
			font-size: 20px;
			font-weight: bold;
			color: #60524E;
		}
		
		.aTag{
			text-decoration:none; 
			color: #60524E;
		}
		.aTag:hover{
			text-decoration: underline;
		}
		
		#img_div{
			 width: 608px; 
			 height: 363px; 
			 margin: auto; 
			 margin-bottom : 50px;
		}
		#login_main_div{
			width : 300px;
 			text-align: left; 
			margin: auto;
		}
	
	</style>
	
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-3.5.1.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/script.js"></script>
	<script type="text/javascript">
		
	
	
	var imgArray = new Array ();

	
	imgArray[0] = "<%=request.getContextPath()%>/resources/img/banner/banner1.jpg";
	imgArray[1] = "<%=request.getContextPath()%>/resources/img/banner/banner2.jpg";
	imgArray[2] = "<%=request.getContextPath()%>/resources/img/banner/banner3.jpg";
	imgArray[3] = "<%=request.getContextPath()%>/resources/img/banner/banner4.jpg";




	function showImage(){
		var imgNum = Math.round(Math.random()*3);
		var objImg = document.getElementById("introImg");
		objImg.src = imgArray[imgNum];
	}

	function loginOrderFnc() {
		
		var loginForm = document.loginForm;
		var email = document.getElementById("email_input");
		var pwd = document.getElementById("pwd_input");
		
		
		if (email.value==""||email.value==null) {
			alert('이메일을 입력해주세요');
			email.focus();
			return false;
		}else if(pwd.value==""||pwd.value==null){
			alert('비밀번호를 입력해주세요');
			pwd.focus();
			return false;
		}else{
			
			return true;
		}
		
	}

	</script>
	
	
	
</head>

<body onload="showImage()">

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>	
	
	<div id="wrap">
		<div id="innerWrap">
			
			
			<div id="img_div">
				<img id = "introImg" border="0" style="width: 608px; height: 363px; border-radius: 5px;">
			</div>
			
			<div>
				<div id="login_main_div">
					<form name="loginForm" action="./member/loginCtr.do" method="post" onsubmit="return loginOrderFnc();">
						<c:choose>
							<c:when test="${empty member_email}">
								<input id="email_input" class="input" type="email" name='member_email' 
									maxlength="20" placeholder="이메일 입력" >
							</c:when>
							<c:otherwise>
								<input id="email_input" class="input" type="email" name='member_email' 
									maxlength="20" placeholder="이메일 입력" value="${member_email}">
							</c:otherwise>
						</c:choose>
						
						
						<input type="password" class="input" id="pwd_input" name='member_pwd' placeholder="비밀번호 입력" 
							style="margin-bottom: 20px;" maxlength="16">
						
						<input id="button" class="input" type="submit" value="로그인" >
					</form>
						<a class="aTag" href="member/findId.do">아이디찾기</a>
						<a style="margin: 7px; color: #60524E; cursor: default;">|</a>
						<a class="aTag" href="member/findPwd.do">비밀번호찾기</a>
						<a style="margin: 7px; color: #60524E; cursor: default;">|</a>
						<a class="aTag" href="member/join.do">회원가입</a>						
				</div>
			</div>
			
		</div>
	</div>
	
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>