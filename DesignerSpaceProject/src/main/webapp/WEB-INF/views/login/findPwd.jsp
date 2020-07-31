<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Designer's Space</title>

	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/reset.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/style.css">

	<style type="text/css">
		#innerWrap {
			font-size: 20px;
			font-weight: bold;
			color: #60524E;
		}
		.input {
			padding : 0px 10px;
			width: 276px;
			height: 30px;
			margin-top : 10px;
			margin-bottom: 30px;
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
			border:none;
			border-radius: 5px;
			cursor: pointer;
		}
		#cancel{
			width: 300px;
			height: 35px;
			margin-bottom: 10px;
			font-weight: bold;
			border:1px solid #000;
			border-radius: 5px;
			cursor: pointer;
			background-color: #fff;
			color: #000
		}
		#button:hover{
			background-color: #4AD674;
		}
		#cancel:hover{
			color: #fff;
			background-color: #4AD674;
			border: none;
		}
		.input_span{
			color: #60524E;
			font-size: 20px;
			font-weight: bold;
		}
		#checkQuestion{
			width: 298px;
			height: 35px;
			border-radius: 5px;
			margin-top: 10px;
		}
		#find_pwd_div{
			width : 300px;
 			text-align: left; 
			margin: auto;
		}	
	
	</style>


	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-3.5.1.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/script.js"></script>
	
	<script type="text/javascript">
	
	
	function backMoveFnc() {
		location.href='<%=request.getContextPath()%>/login.do';
	}
	
	function findPwdOrderFnc() {
		
		var findPwdForm = document.findPwdForm;
		var email = document.getElementById("input_email");
		var answer = document.getElementById("input_answer");
		
	    

		if (email.value==""||email.value==null) {
			alert('이메일을 입력해주세요');
			email.focus();
			return false;
		}else if(answer.value==""||answer.value==null){
			alert('답변을 입력해주세요');
			answer.focus();
			return false;
		}else{
			return true;
		}
	}
	
	</script>
	
</head>

	
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>	
	
	<div id="wrap">
		<div id="innerWrap">
		
			
				
			<div style="margin-bottom: 80px; text-align: center;">
				<span style="font-size: 50px;">비밀번호 찾기</span>
			</div>
			
			
			<div id="find_pwd_div">
				<form action="findPwdCtr.do" name="findPwdForm" method="post" onsubmit="return findPwdOrderFnc();">
					<span>이메일</span>
					<input type="email" id="input_email" class="input" name="member_email" 
						placeholder="이메일입력" maxlength="20">
					<span>본인확인</span>
					<select id="checkQuestion" name="member_check_question">
						<option value="1">나의 보물1호는?</option>
						<option value="2">내가 태어난 고향은?</option>
						<option value="3">가장 친한 친구 이름은?</option>
					</select><br>
					<input type="text" id="input_answer" class="input" name="member_check_answer" 
						placeholder="답변을 입력해 주세요" maxlength="30">
					
					<input type="submit" id="button" value="비밀번호 찾기"
						style="margin-top: 50px;">
					</form>
					<input type="button" id="cancel"  value="취소" onclick="backMoveFnc();">
				
			</div>
		
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>