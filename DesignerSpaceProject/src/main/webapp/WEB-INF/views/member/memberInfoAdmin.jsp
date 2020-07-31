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
			padding: 60px 0px;
		}
		.input {
			padding : 0px 10px;
			width: 277px;
			height: 30px;
			margin-top : 10px;
			margin-bottom: 30px;
			border-radius: 5px;
			border: 1px solid #60524E;
			background-color: #EAEAEA;
		}
		#button {
			width: 300px; 
	 		height: 35px; 
			color: #FFFFFF;
			margin-bottom: 10px;
			background-color: #FF0000;
			font-weight: bold;
			border: none;
			border-radius: 5px;
		}
		#cancel{
			width: 300px;
			height: 35px;
			margin-bottom: 10px;
			font-weight: bold;
			border: 1px solid #60524E;
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
			margin-bottom: 30px;	
		}
		#textarea {
			padding: 10px;
			width: 277px;
			resize: none;
			border-radius: 5px;
			margin-top: 10px;
			margin-bottom: 40px;
			background-color: #EAEAEA;
		}
	</style>


	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-3.5.1.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/script.js"></script>
	
	<script type="text/javascript">
		function backMoveFnc() {
			var curPageObj = $('#curPage');
			location.href='listAdmin.do?curPage=' + curPageObj.val();
		}
		
		function removeMemberFnc(){
			
			if(confirm("정말 삭제하시겠습니까?")==true){
				
				var remove_no = $('#member_no').val();
				
				
				
				location.href='../member/remove.do?member_no='
					+remove_no;	
				
			}
		
		}
	</script>
	
	
</head>

<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>	
	
	<div id="wrap">
		<div id="innerWrap">
			<div id="innerPage">
				
				<div style="margin-bottom: 80px; text-align: center;">
					<span style="font-size: 50px; font-weight: bold; color: #60524E;">회원정보 조회</span>
				</div> 
			
				<div id="join_div">
					<input type="hidden" id=curPage name="curPage" value="${curPage}">
					<input type="hidden" id="member_no" class="input" value="${memberDto.member_no}" 
						name='member_no' readonly="readonly">
					<span>닉네임</span>
					<input type="text" value="${memberDto.member_nick}" class="input"
						name='member_nick' readonly="readonly">
					
					<span>이메일</span>
					<input type="text" value="${memberDto.member_email}" class="input"
						name='member_email' readonly="readonly">
					
					<span>성명</span>
					<input type="text" value="${memberDto.member_name}" class="input"
						name='member_name' readonly="readonly">
										
					<span>휴대번호</span>
					<input type="text" value="${memberDto.member_phone}" class="input"
						name='member_phone' readonly="readonly">
					
					<div class="title">
						프로필 이미지
					</div>
					
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
					
					<span>자기소개</span>					
					<textarea id="textarea"  rows="8" cols="38" readonly="readonly">${memberDto.member_comments}</textarea>
					<c:if test="${memberDto.member_grade == 0}">
						<button id="button" onclick="removeMemberFnc()">
							삭제</button>
					</c:if>
					
					<button id="cancel" onclick="backMoveFnc()">뒤로가기</button>
					
				</div>	
				
			</div>
		</div>
	</div>
	
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>