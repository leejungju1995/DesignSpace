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
		#innerPage {
			font-size: 20px;
			font-weight: bold;
			color: #60524E;
		}
		.input {
			padding : 0px 10px;
			width: 277px;
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
			border: none;
			border-radius: 5px;
		}
		#cancel{
			width: 300px;
			height: 35px;
			color: #000;
			margin-bottom: 10px;
			background-color: #fff;
			font-weight: bold;
			border: 1px solid #60524E;
			border-radius: 5px;
			cursor: pointer;
			
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
		#join_div{
			width : 300px;
			text-align: left; 
			margin: auto;
		}	
		#p_image{
			width: 100px;
			height: 100px;
			border-radius: 50%;
		}
		
		#img_div{
			border:1px solid black;
			width: 100px;
			height: 100px;
			border-radius: 50%;
			margin: auto;
			margin-bottom: 20px;
		}
	
	</style>
	
	
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-3.5.1.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/script.js"></script>
	
	<script type="text/javascript">
				
		function moidDetailFnc(){
			
			var pwdOne = document.getElementById("chk_pwd");
			var pwdTwo = document.getElementById("chk_pwd2");
			
			if(pwdOne.value==pwdTwo.value){
				location.href='modInfoDetail.do';
			}else {
				alert('비밀번호를 다시 입력해주세요');
				pwdOne.focus();
			}
			
		}
	
	</script>
	
</head>

<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>	
	
	<div id="wrap">
		<div id="innerWrap">
			<div id="innerPage" style="padding: 60px 0px;">
				
				<div style="margin-bottom: 80px; text-align: center;">
					<span style="font-size: 50px;">회원정보 수정</span>
				</div> 
				
				<div id="join_div">
					<div id="img_div">
					<c:choose>
						<c:when test="${empty memberDto.profile_table_stored_name}">
							<img id="p_image" alt="기본 프로필 이미지"  src="<%=request.getContextPath()%>/resources/img/defaultProfile.png">
						</c:when>
						<c:otherwise>
							<img id="p_image" alt="프로필 이미지" 
								src="<c:url value='/profileImg/${memberDto.profile_table_stored_name}'/>">
						</c:otherwise>
					</c:choose>
					</div>
				
					<input type="hidden" value="${member_no}" name='member_no'>
					
					
					
					<input type="password" id="chk_pwd" class="input" placeholder="비밀번호를 입력해주세요"
						maxlength="16">
					
					<input type="hidden" id="chk_pwd2" value="${member_pwd}" name='member_pwd'>
				
					
					
					<button id="button" onclick="moidDetailFnc()" style="margin-top: 30px;">
						확인</button>
					<button id="cancel" onclick="location.href='info.do;'">취소</button>
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>