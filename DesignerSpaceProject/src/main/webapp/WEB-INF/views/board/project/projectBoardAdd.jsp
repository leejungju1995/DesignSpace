<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Designer's Space</title>

	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/reset.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/style.css">
	
	<style type="text/css">
		#exProjectPic{
			background-color: #D3D3D3;
			height: 700px;
		}
		#exProjectPic2{
			height: 700px;
			background-repeat: no-repeat;
			background-position: center;
			background-size: cover;
		}
		#projectPicArea{
			text-align: right;
		}
		#projectPicArea button{
			width: 150px;
			height: 50px;
			box-sizing: border-box;
			text-align: center;
			margin: 10px 20px;
			background-color: #60524E;
			border-style: none;
			border-radius: 5px;
			font-size: 20px;
			color: #fff;
			cursor: pointer;
		}
		#addFileBtn{
			width: 150px;
			height: 50px;
			border-style: none;
			border-radius: 5px;
			background-color: #4AD674;
			color: #fff;
			margin-top: 20px;
			margin-left: calc(100% - 170px);
			margin-bottom: 20px;
			font-size: 20px;
			cursor: pointer;
		}
		#contextArea{
			padding: 0px 100px;
			text-align: center;
			position: relative;
		}
		#contextArea textarea{	
			width: 100%;
			resize: none;
			margin-bottom: 20px;
			border-radius: 3px;
			border: 1px solid #60524E;
			box-shadow: 4px 4px 10px 1px rgba(0,0,0,0.3);
		}
		#contextArea h1{
			float: left;
			font-size: 35px;
			font-weight: bold;
			margin-bottom: 10px;
			color: #60524E;
		}
		#contextArea input{
			width: 150px;
			height: 50px;
			border-style: none;
			border-radius: 5px;
			background-color: #60524E;
			color: #fff;
			font-size: 20px;
			margin-bottom: 100px;
			cursor: pointer;
		}
		#contextArea input:hover{
			background-color: #4AD674;
		}
		#categoryArea span{
			vertical-align: middle;			 
		}
		.exProjectPic{
			width: 1350px;
			height: 600px;
			margin-bottom: 10px;
			background-repeat: no-repeat;
			background-position: center;
			background-size: cover;
			background-color: gray;
		}
	</style>
	
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-3.5.1.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/script.js"></script>
	
	<script type="text/javascript">
 		var createFlag = false;

 		function fileAddFnc() { 			 
 			if(!createFlag){
	 			
 			var str = "<a>";
			str += "<div class='exProjectPic' style=''></div>";
			str += "<input type='file' value='파일선택' accept='image/*' onchange='setThumbnailFnc(event, this);'>";
			str += "<button name='delete' onclick='fileDelFnc($(this));'>파일삭제</button>";
			str += "</a>";
			

			if($("button[name='delete']").length < 5){
				$('#projectPicArea').append(str);
			}
				
			createFlag = true;
 			}
			
 		}
 		
 		function fileDelFnc(obj) {
			obj.parent().remove();			
			
			createFlag = false;
		}
 		
 		function fileNamingFnc() {
			var projectList = document.getElementById('projectPicArea').children;
			var projectSize = projectList.length;
			
			for (var i = 0; i < projectSize; i++) {
				projectList[i].children[1].setAttribute('name', 'file_' + (i+1));
			}
		}
 		
 		function setThumbnailFnc(event, obj) { 
		      var reader = new FileReader(); 
		      var imgObj = obj.parentNode.children[0];
		      
		      reader.onload = function(event) { 
		         imgObj.setAttribute("src", event.target.result);
		         imgObj.setAttribute("style", 'background-image: url(' + event.target.result +')');        
		         
		    	 createFlag = false;
		      }; 
		      
		      reader.readAsDataURL(event.target.files[0]); 
 		}
 		
 		function validateFnc() {
 			var fileObj = document.getElementsByClassName('exProjectPic');
 			var titleObj = document.getElementById('project_board_title');
 			var contentObj = document.getElementById('project_board_contents');
 			var categoryObj = document.getElementsByName('project_board_category');
 			var categoryChk = "F";
 			// 유효성 검사 
 			// 1. 파일이 없을 경우 2. 제목을 입력하지 않은 경우 3. 내용이 없는 경우 4. 카테고리를 선택하지 않은 경우
 			if(!fileObj.length){
 				
 				alert("하나 이상의 파일을 추가해주세요!");
 			return false;
 			}
 			
 			for(var i = 0; i < fileObj.length; i++) {				
				if(fileObj[i].getAttribute('style') == ""){
					
	 				alert("하나 이상의 파일을 추가해주세요!");
					return false;
				}
			}
 			
			if(titleObj.value == ""){
				
				alert("제목을 입력해주세요!");
			return false;
 			}
			
			if(contentObj.value == ""){
				
				alert("내용을 작성해주세요!");
			return false;
 			}
			
			for (var i = 0; i < categoryObj.length; i++) {
				if(categoryObj[i].checked){
					categoryChk = "T";
				}
			}
			if(categoryChk == "F"){
				
				alert("카테고리를 선택해주세요!");
			return false;
 			}
			
			return true;
		}
 		
		var message = "";
		var MAX_MESSAGE_BYTE = 100;
		var MAX_MESSAGE_BYTE_TWO = 600;
		
		window.onload = function() {
			commentObj = document.getElementsByClassName('commentContext');
			commentObj[0].addEventListener('keyup', checkByte);	
			commentObj[1].addEventListener('keyup', checkByteTwo);	

			maxCountObj = document.getElementsByClassName('maxCount')
			maxCountObj[0].innerHTML = MAX_MESSAGE_BYTE.toString();				
			maxCountObj[1].innerHTML = MAX_MESSAGE_BYTE_TWO.toString();				
		}		
		
		function count(message) {
			var totalByte = 0;
			
			for (var i = 0, length = message.length; i < length; i++) {
				var currentByte = message.charCodeAt(i);
				(currentByte > 128) ? totalByte += 3 : totalByte++;
			}
			return totalByte;
		}
		
		function checkByte(event) {
			const totalByte = count(event.target.value);
			var countSpan = event.target.nextSibling.nextSibling.childNodes[0];
// 			var countSpan = document.getElementById('count');

			if(totalByte <= MAX_MESSAGE_BYTE){
				countSpan.innerText = totalByte.toString();
				message = event.target.value;
			}else{
				alert("제목은 " + MAX_MESSAGE_BYTE + "Byte까지 작성가능합니다.");
				countSpan.innerText = count(message).toString();
				event.target.value = message;
			}
		}
		
		function checkByteTwo(event) {
			const totalByte = count(event.target.value);
			var countSpan = event.target.nextSibling.nextSibling.childNodes[0];
// 			var countSpan = document.getElementById('count');

			if(totalByte <= MAX_MESSAGE_BYTE_TWO){
				countSpan.innerText = totalByte.toString();
				message = event.target.value;
			}else{
				alert("내용은 " + MAX_MESSAGE_BYTE_TWO + "Byte까지 작성가능합니다.");
				countSpan.innerText = count(message).toString();
				event.target.value = message;
			}
		}
	</script>
	
</head>

<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>	
	
	<div id="wrap">
		<div id="innerWrap">
			<div id="innerPage">
				<form action="./addCtr.do" method="post"
					enctype="multipart/form-data" onsubmit="return validateFnc();">
					<div id="projectPicArea">
					
										    									
					</div>
					<input id="addFileBtn" type="button" value="파일추가"
						onclick="fileAddFnc();">
					
					<div id="contextArea">
						<input type="hidden" name="project_board_mno" value="${memberDto.member_no}">
						<h1>제목</h1>
						<textarea id="project_board_title" class="commentContext" name="project_board_title" style="height: 120px; font-size: 40px;"></textarea>
						<div style="opacity: 0; position: absolute;"><span>0</span> / <span class="maxCount">0</span></div>
						<h1>설명</h1>
						<textarea id="project_board_contents" class="commentContext" name="project_board_contents" style="height: 360px; font-size: 20px;"></textarea>
						<div style="opacity: 0; position: absolute;"><span>0</span> / <span class="maxCount">0</span></div>
						<div id="categoryArea">
							<span>사진</span><input type="radio" name='project_board_category' value="p"/>
							<span>일러스트</span><input type='radio' name='project_board_category' value="i"/>
						</div>
						
						<input type="submit" value="확인" onclick="fileNamingFnc();">
						<c:choose>
							<c:when test="${chkPage eq 0}">
								<input type="button" value="취소" onclick="location.href='../main/member.do'">
							</c:when>
							<c:when test="${chkPage eq 1}">
								<input type="button" value="취소" onclick="location.href='../member/myBoard.do?mno=${memberDto.member_no}'">	
							</c:when>							
						</c:choose>						
					</div>
				</form>
			</div>

		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>