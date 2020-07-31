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
			margin-top: 20px;
			margin-bottom: 20px;	
		}
		
		#textarea {
		padding: 10px;
		width: 277px;
		resize: none;
		border-radius: 5px;
		margin-top: 10px;
		margin-bottom: 40px;
	}
	</style>


	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-3.5.1.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/script.js"></script>
	
	<script type="text/javascript">
		function backMoveFnc() {
			
			var grade = document.getElementById('member_grade').value;
			
			if(grade==0){
				location.href='<%=request.getContextPath()%>/main/member.do';
				
			}else {
				location.href='<%=request.getContextPath()%>/main/admin.do';
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
					<span style="font-size: 50px;">회원정보 조회</span>
				</div> 
			
				<div id="join_div">
					<input type="hidden" class="input" value="${member.member_no}" 
						name='member_no'>
					<input type="hidden" id="member_grade" class="input" value="${memberDto.member_grade}" 
						name='member_grade'>
					<span>닉네임</span>					
					<input type="text" class="input" value="${member.member_nick}" 
						name='member_nick' readonly="readonly">
					<span>이메일</span>
					<input type="text" class="input" value="${member.member_email}" 
						name='member_email' readonly="readonly">
					<span>성명</span>
					<input type="text" class="input" value="${member.member_name}" 
						name='member_name' readonly="readonly">
					<span>휴대번호</span>
					<input type="text" class="input" value="${member.member_phone}" 
						name='member_phone' readonly="readonly">
					<span>프로필 이미지</span>
					<div id="img_div">
						<c:choose>
							<c:when test="${empty member.profile_table_stored_name}">
								<img id="p_image" alt="기본 프로필 이미지"  src="<%=request.getContextPath()%>/resources/img/defaultProfile.png">
							</c:when>
							<c:otherwise>
								<img id="p_image" alt="프로필 이미지" 
									src="<c:url value='/profileImg/${member.profile_table_stored_name}'/>">
							</c:otherwise>
						</c:choose>
					</div>
					
					<span>자기소개</span>
					<textarea id="textarea" rows="8" cols="38" readonly="readonly"
					name="member_comments">${member.member_comments}</textarea>
					
					
					
					
					<button id="button" onclick="location.href='modInfo.do'">수정</button>
					<button id="cancel" onclick="backMoveFnc();">목록으로</button>
				</div>	
				
			</div>
		</div>
	</div>
	
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>