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
		#projectInfo{
			width: 1350px;
			margin: 0px auto 50px;
		}		
		#projectInfo h1{
			padding: 10px 100px;
			font-weight: bold;
			font-size: 30px;			
		}
		#projectInfo span{
			font-size: 20px;	
			padding-left: 20px;		
		}
		#projectInfo .profileImg{
			width: 80px;
			height: 80px;
			float: left;
			border-radius: 50%;
			margin: 5px auto;
			background-repeat: no-repeat;
			background-position: center;
			background-size: cover;
		}
		#projectArea{
			width: 1350px;
			margin: auto;
			background-color: #fff;
			text-align: right;
			box-shadow: 5px 5px 20px rgba(0,0,0,0.3);
			border-radius: 5px;
		}
		.btnList{
			float: right;
			margin-right: 10px;
			width: 150px;
			height: 50px;
			border-style: none;
			border-radius: 5px;
			background-color: #60524E;
			color: #fff;
			font-size: 20px;
			cursor: pointer;
		}
		.btnList:hover{
			background-color: #4AD674;
		}
		#exProjectPic2{
			height: 700px;
			margin-bottom: 10px;
			background-repeat: no-repeat;
			background-position: center;
			background-size: cover;
		}
		.exProjectPic{
			height: 700px;
			margin-bottom: 10px;
			background-repeat: no-repeat;
			background-position: center;
			background-size: cover;
		}
		#projectInfoArea{
			width: 1350px;
			margin: auto;
			text-align: center;
			padding: 100px 0px;
		}
		#projectInfoArea .profileImg{
			float: left;
			width: 150px;
			height: 150px;
			border-radius: 50%;
			background-repeat: no-repeat;
			background-position: center;
			background-size: cover;
		}
		#projectInfoArea h1{
			font-size: 35px;
			margin-top: 40px;
			margin-bottom: 20px;
		}
		#likeBtn{		
			width: 150px;
			height: 150px;
			margin: auto;
			background-color: #4AD674;
			border-radius: 50%;			
		}
		#likeBtn img{		
			margin-top: 54px;				
		}		
		#likeBtn h5{
			font-size: 20px;
			color: #4AD674;
			margin-top: 10px;
		}
		#contextArea{
			width: 1350px;
			margin: auto;
		}
		#commentArea{
			width: 1350px;
			margin: auto;
			padding: 50px 0px;
			background-color: #fff;
			text-align: center;
			box-shadow: 5px 5px 20px rgba(0,0,0,0.3);
			border-radius: 5px;
		}
		#commentArea img{
			vertical-align: middle;
			margin: 0px 15px;
		}
		#commentArea .profileImg{
			float: left;
			width: 75px;
			height: 75px;
			border-radius: 50%;
			background-repeat: no-repeat;
			background-position: center;
			background-size: cover;
		}
		.profileInfo{
			 box-sizing: border-box; 
			 height: 75px; 
			 padding-top: 15px; 
			 padding-left: 95px;
		}
		.profileInfo .profileInfoNic{
			 font-size: 28px; 
			 font-weight: bold; 
			 margin-top: 10px;
		}	 		
		.profileInfo .profileInfoDate{
			 font-size: 15px; 
			 color: #696969;
		}		
		#commentInput{
			width: 750px;
			height: 100px;		
			box-sizing: border-box;	
			vertical-align: middle;
			resize: none;
			font-size: 20px;
		}
		#commentInput::placeholder{
			font-size: 20px;	
			padding-top: 35px;
			padding-left: 10px;
		}
		#commentWriteBtn{
			width: 100px;
			height: 100px;
			background-color: #60524E;
			color: #fff;
			font-weight: bold;
			font-size: 20px;
			vertical-align: middle;
			margin-left: -6px;
		}
		.commentBtn{
			padding: 5px 25px;
			background-color: #000;
			border-radius: 30px;
			color: #fff;
			font-size: 7px;
		}
		.commentContext{
			display: block;
			margin-top: 10px; 
			font-size: 20px;
			border: none;
			resize: none;
			width: 855px; 
			height: 80px;
		}		
		.memberInfoLink{
			text-decoration: none;
			color: #000;
		}
		.memberInfoLink:hover{
			text-decoration: underline;
		}
		#projectContent{
			margin-left: 20px;
			resize: none;
			width: 1170px;
			height: 100px;
			border: none;
			background: none;
		}
	</style>
	
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-3.5.1.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/script.js"></script>
	
	<script type="text/javascript">
		function projectDeleteFnc() {		
			var deleteProjectNum = document.getElementById('deleteProjectNum').value;

		 	if(confirm('정말로 삭제하시겠습니까?')){
		 		
		 		location.href='./deleteCtr.do?project_board_no=' + deleteProjectNum;
		 	}else{
		 		return false;
		 	}	
		}
		
		function projectLikeFnc() {
			var likeBtnObj = document.getElementById('likeBtn');
			var likeChk = document.getElementById('projectLikeChk');
			var likeFlag = document.getElementById("projectLikeFlag");

			if(likeChk.value == "" || likeFlag.value == 'N'){				
				
				var likeForm = document.getElementById('like');
				var likeUpdateForm = document.getElementById('likeUpdate');
				if(likeChk.value != "" && likeFlag.value == 'N'){
					//좋아요 업데이트
					likeUpdateForm.submit();
				}else if(likeChk.value == "" && likeFlag.value == ""){
					//좋아요 새로 생성
					likeForm.submit();
				}
			}else{
				//좋아요삭제
				var likeDeleteForm = document.getElementById('likeDelete');
				likeDeleteForm.submit();
			}
		}
		
		var tempCommentValue;
		
		function commentUpdateFnc(obj) {
			var commentContextObj = obj.parentNode.lastElementChild;
			var otherBtn = obj.nextSibling.nextSibling;
			var commentNo = obj.previousSibling.previousSibling;
			var textValObj = obj.parentNode.nextSibling.nextSibling;
			
			var sendCommentNoObj = document.getElementById('PROJECT_COMMENT_NO');
			var sendCommentCommentsObj = document.getElementById('PROJECT_COMMENT_COMMENTS');
			var updateFormObj = document.getElementById('commentUpdateForm');
			
			sendCommentNoObj.value = commentNo.value;
			sendCommentCommentsObj.value = commentContextObj.value;

			if(obj.innerHTML == "수정"){
				textValObj.style.opacity = '1';
				tempCommentValue = commentContextObj.value;
				commentContextObj.removeAttribute("readonly");
				commentContextObj.setAttribute("style", "border: 1px solid #000;")	
				obj.innerHTML = "수정완료";
				otherBtn.innerHTML = "취소";
			}else if(obj.innerHTML == "수정완료"){
				textValObj.style.opacity = '0';
				commentContextObj.setAttribute("readonly", "readonly");
				commentContextObj.setAttribute("style", "")	
				obj.innerHTML = "수정";
				otherBtn.innerHTML = "삭제";				
				//★댓글수정로직

				updateFormObj.submit();
			}
			
		}
		
		function commentDeleteFnc(obj) {
			var commentContextObj = obj.parentNode.lastElementChild;
			var otherBtn = obj.previousSibling.previousSibling;
			var commentNo = otherBtn.previousSibling.previousSibling;
			var textValObj = obj.parentNode.nextSibling.nextSibling;
			
			var sendCommentNoObj = document.getElementById('PROJECT_COMMENT_NO_DELETE');
			var deleteFormObj = document.getElementById('commentDeleteForm');
			
			sendCommentNoObj.value = commentNo.value;
			
			//삭제 경우 - Main !
			if(obj.innerHTML == "삭제"){
				//★댓글삭제로직
				
				if(confirm("정말로 삭제하시겠습니까?")){
					deleteFormObj.submit();	
				}else{
					return false;
				}
			}else if(obj.innerHTML == "취소"){ // 취소 경우		
				textValObj.style.opacity = '0';
				commentContextObj.setAttribute("readonly", "readonly");
				commentContextObj.setAttribute("style", "")	
				commentContextObj.value = tempCommentValue;
				otherBtn.innerHTML = "수정";
				obj.innerHTML = "삭제";
			}
		}
				
		var message = "";
		var MAX_MESSAGE_BYTE = 300;
		
		window.onload = function() {
			document.getElementById('commentInput').addEventListener('keyup', checkByte);
			commentObj = document.getElementsByClassName('commentContext');
			for (var i = 0; i < commentObj.length; i++) {
				commentObj[i].addEventListener('keyup', checkByte);	
			}
			maxCountObj = document.getElementsByClassName('maxCount')
			for (var i = 0; i < maxCountObj.length; i++) {
				maxCountObj[i].innerHTML = MAX_MESSAGE_BYTE.toString();	
			}			
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
			var countSpan = event.target.parentNode.nextSibling.nextSibling.childNodes[0];
// 			var countSpan = document.getElementById('count');

			if(totalByte <= MAX_MESSAGE_BYTE){
				countSpan.innerText = totalByte.toString();
				message = event.target.value;
			}else{
				alert("댓글은 " + MAX_MESSAGE_BYTE + "Byte까지 작성가능합니다.");
				countSpan.innerText = count(message).toString();
				event.target.value = message;
			}
		}
		
		function returnPageFnc(chkPage) {
			var curPageObj = document.getElementById('curPage');
			var categoryOptionObj = document.getElementById('categoryOption');
			var sortOptionObj = document.getElementById('sortOption');
			var searchOptionObj = document.getElementById('searchOption');
			var keywordObj = document.getElementById('keyword');
			var projectBoardMno = document.getElementById('projectBoardMno');
			
			if(chkPage == 0){
				var str = "./list.do"
				str += "?curPage=" + curPageObj.value;
			}else if(chkPage == 1){
				var str = "../member/myBoard.do"
				str += "?curPage=" + curPageObj.value;
				str += "&mno=" + projectBoardMno.value;
			}					
			
			str += "&categoryOption=" + categoryOptionObj.value;
			str += "&sortOption=" + sortOptionObj.value;
			str += "&searchOption=" + searchOptionObj.value;
			str += "&keyword=" + keywordObj.value;
			
			location.href = str;
		}
	</script>
	
</head>

<body>
<!-- 	삭제용 작품번호 저장 -->
	<input type="hidden" id='deleteProjectNum' value="${projectBoardDto.project_board_no}">
	<input type="hidden" id="projectLikeChk" value="${projectLikeFlag.PROJECT_LIKE_NO}">
	<input type="hidden" id="projectLikeFlag" value="${projectLikeFlag.PROJECT_LIKE_FLAG}">
	<input type="hidden" id="projectBoardMno" value="${projectBoardDto.project_board_mno}">
	
	<input type="hidden" id="curPage" value="${searchOptionMap.curPage}">
	<input type="hidden" id="sortOption" value="${searchOptionMap.sortOption}">
	<input type="hidden" id="categoryOption" value="${searchOptionMap.categoryOption}">
	<input type="hidden" id="searchOption" value="${searchOptionMap.searchOption}">
	<input type="hidden" id="keyword" value="${searchOptionMap.keyword}">

	<form action="./like.do#projectInfoArea" id="like" method="get">
		<input type="hidden" name="project_board_no" value="${projectBoardDto.project_board_no}">
		<input type="hidden" name="mno" value="${memberDto.member_no}">
		<input type="hidden" name="chkPage" value="${chkPage}">
	</form>
	
	<form action="./likeUpdate.do#projectInfoArea" id="likeUpdate" method="get">
		<input type="hidden" name="project_board_no" value="${projectBoardDto.project_board_no}">
		<input type="hidden" name="mno" value="${memberDto.member_no}">
		<input type="hidden" name="chkPage" value="${chkPage}">
	</form>
	
	<form action="./likeDelete.do#projectInfoArea" id="likeDelete" method="get">
		<input type="hidden" name="project_board_no" value="${projectBoardDto.project_board_no}">
		<input type="hidden" name="mno" value="${memberDto.member_no}">
		<input type="hidden" name="chkPage" value="${chkPage}">
	</form>
	
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>	
	
	<div id="wrap">
		<div id="innerWrap">
			<div id="projectInfo">
				<div class="profileImg" style="background-image: url(<c:url value='/profileImg/${projectBoardDto.PROFILE_TABLE_STORED_NAME}'/>);"></div>
				<h1>${projectBoardDto.project_board_title}</h1>
				<span><a class="memberInfoLink" href="../member/myBoard.do?mno=${projectBoardDto.project_board_mno}">${projectBoardDto.member_nick}</a></span>
			</div>
			<div id="projectArea">
				<c:forEach var="projectBoardFileDto" items="${projectBoardFileList}">
					<div class="exProjectPic" style="background-image: url(<c:url value='/projectImg/${projectBoardFileDto.FILE_TABLE_STORED_FILE_NAME}'/>)"></div>
				</c:forEach>				
			</div>
			<c:choose>
				<c:when test="${chkPage eq 0}">
					<input class="btnList" style="margin-right: 175px;" type="button" onclick="returnPageFnc(${chkPage});" value="목록">					
				</c:when>
				<c:when test="${chkPage eq 1}">
					<input class="btnList" style="margin-right: 175px;" type="button" onclick="returnPageFnc(${chkPage});" value="목록">
				</c:when>
				<c:when test="${chkPage eq 2}">
					<input class="btnList" style="margin-right: 175px;" type="button" onclick="location.href='./management.do'" value="목록">
				</c:when>
				<c:when test="${chkPage eq 3}">
					<input class="btnList" style="margin-right: 175px;" type="button" onclick="location.href='../reportBoard/list.do'" value="목록">
				</c:when>
			</c:choose>
			<c:choose>
					<c:when test="${memberDto.member_grade eq 0}">
						<c:choose>
							<c:when test="${memberDto.member_no eq projectBoardDto.project_board_mno}">
								<input class="btnList" type="button" onclick="projectDeleteFnc();" value="삭제">
								<input class="btnList" type="button" onclick="location.href='./update.do?project_board_no=${projectBoardDto.project_board_no}&chkPage=${chkPage}'" value="수정">					
							</c:when>
							<c:when test="${memberDto.member_no ne projectBoardDto.project_board_mno}">
								<input class="btnList" type="button" onclick="location.href='<%=request.getContextPath()%>/reportBoard/add.do?project_board_no=${projectBoardDto.project_board_no}'" value="신고"> 
							</c:when>
						</c:choose>
					</c:when>
					<c:when test="${memberDto.member_grade eq 1}">
						<input class="btnList" type="button" onclick="projectDeleteFnc();" value="삭제">
					</c:when>
				</c:choose>			
			
			<div id="projectInfoArea">
				<c:choose>
					<c:when test="${projectLikeFlag eq null || projectLikeFlag.PROJECT_LIKE_FLAG eq 'N'}">
						<div id="likeBtn" onclick="projectLikeFnc();">
							<img src="<%=request.getContextPath()%>/resources/img/iconLike_Brown.png">
						</div>
					</c:when>
					<c:otherwise>
						<div id="likeBtn" onclick="projectLikeFnc();" style="background-color: #60524E;">
							<img src="<%=request.getContextPath()%>/resources/img/iconLike_Green.png" style="margin-top: 40px;">
							<h5>${projectBoardDto.project_board_like}</h5>
						</div>
					</c:otherwise>
				</c:choose>				
				<h1>${projectBoardDto.project_board_title}</h1>					
					
				<img src="<%=request.getContextPath()%>/resources/img/iconLike_grey.png">
				<span>${projectBoardDto.project_board_like}</span>
				<img src="<%=request.getContextPath()%>/resources/img/iconView_grey.png">
				<span>${projectBoardDto.project_board_views}</span>
				<img src="<%=request.getContextPath()%>/resources/img/iconChat_grey.png">
				<span>${projectBoardDto.project_comment_cnt}</span>
							
				<h6 style="margin: 40px 0px;">작성일 <fmt:formatDate value="${projectBoardDto.project_board_cre_date}" pattern="yyyy년 MM월 dd일"/></h6>
				
				<div class="profileImg" 
					style="background-image: url(<c:url value='/profileImg/${projectBoardDto.PROFILE_TABLE_STORED_NAME}'/>);"></div>
				<div style="height: 150px; text-align: left;">
					<h1><a class="memberInfoLink" href="../member/myBoard.do?mno=${projectBoardDto.project_board_mno}">${projectBoardDto.member_nick}</a></h1>
					<textarea id="projectContent">${projectBoardDto.project_board_contents}</textarea>
				</div>								
			</div>
			<div id="commentArea">
				<div style="position: relative; padding: 0px 190px;">
					<form action="./commentAddCtr.do#commentArea" method="get">
<!-- 			▶(댓글작성)컨트롤러로 보내야 할 데이터 : 작성자번호, 게시물번호, 댓글내용 -->
						<input type="hidden" name="PROJECT_COMMENT_MNO" value="${memberDto.member_no}">
						<input type="hidden" name="PROJECT_COMMENT_PBNO" value="${projectBoardDto.project_board_no}">
					
						<div class="profileImg" 
							style="background-image: url(<c:url value='/profileImg/${memberDto.profile_table_stored_name}'/>);
								   margin-top: 13px;"></div>
						<textarea rows="10" cols="3" id="commentInput" name="PROJECT_COMMENT_COMMENTS" placeholder="댓글 작성하기..."></textarea>						
						<input id="commentWriteBtn" type="submit" value="등록">						
					</form>
					<div style="position: absolute; right: 330px; top: 70px;"><span id="count">0</span> / <span class="maxCount">0</span></div>
							
<!-- 			▶업데이트 시 컨트롤러로 전달																											 -->
					<form action="./commentUpdateCtr.do#commentArea" id="commentUpdateForm" method="get">
						<input type="hidden" id="PROJECT_COMMENT_NO" name="PROJECT_COMMENT_NO" value="">
						<input type="hidden" id="PROJECT_COMMENT_COMMENTS" name="PROJECT_COMMENT_COMMENTS" value="">
						<input type="hidden" id='PROJECT_COMMENT_PBNO' name="PROJECT_COMMENT_PBNO" value="${projectBoardDto.project_board_no}">
					</form>		
					
<!-- 			▶삭제 시 컨트롤러로 전달																											 -->
					<form action="./commentDeleteCtr.do#commentArea" id="commentDeleteForm" method="get">
						<input type="hidden" id="PROJECT_COMMENT_NO_DELETE" name="PROJECT_COMMENT_NO" value="">
						<input type="hidden" id='PROJECT_COMMENT_PBNO_DELETE' name="PROJECT_COMMENT_PBNO" value="${projectBoardDto.project_board_no}">
					</form>															
					
					<c:forEach var="projectCommentDto" items="${projectCommentList}">						
						<div style="position:relative; width: 840px; text-align: left; padding: 30px 0px;">
							<div class="profileImg"
								style="background-image: url(<c:url value='/profileImg/${projectCommentDto.profile_table_stored_name}'/>);"></div>
							<div class="profileInfo">
								<span class="profileInfoNic">${projectCommentDto.member_nick}</span>
								<span class="profileInfoDate">
									<c:choose>
										<c:when test="${projectCommentDto.PROJECT_COMMENT_MOD_DATE eq null}">
											· <fmt:formatDate value="${projectCommentDto.PROJECT_COMMENT_CRE_DATE}" pattern="yyyy.MM.dd"/> 작성	
										</c:when>
										<c:when test="${projectCommentDto.PROJECT_COMMENT_MOD_DATE ne null}">
											· <fmt:formatDate value="${projectCommentDto.PROJECT_COMMENT_MOD_DATE}" pattern="yyyy.MM.dd"/> 수정 
										</c:when>
									</c:choose>
								</span>								
								<input type="hidden" value="${projectCommentDto.PROJECT_COMMENT_NO}">
								<c:choose>
									<c:when test="${memberDto.member_grade eq 0}">
										<c:choose>
											<c:when test="${projectCommentDto.PROJECT_COMMENT_MNO eq memberDto.member_no}">
												<a class="commentBtn" onclick="commentUpdateFnc(this);">수정</a>
												<a class="commentBtn" onclick="commentDeleteFnc(this);">삭제</a>
											</c:when>											
										</c:choose>										
									</c:when>
									<c:when test="${memberDto.member_grade eq 1}">
										<c:choose>
											<c:when test="${projectCommentDto.PROJECT_COMMENT_MNO eq memberDto.member_no}">
												<a class="commentBtn" onclick="commentUpdateFnc(this);">수정</a>
												<a class="commentBtn" onclick="commentDeleteFnc(this);">삭제</a>
											</c:when>
											<c:when test="${projectCommentDto.PROJECT_COMMENT_MNO ne memberDto.member_no}">
												<a class="commentBtn" onclick="commentDeleteFnc(this);">삭제</a>
											</c:when>
										</c:choose>										
									</c:when>
								</c:choose>								
								<textarea class="commentContext" readonly="readonly">${projectCommentDto.PROJECT_COMMENT_COMMENTS}</textarea>								
							</div>							
							<div style="opacity: 0; position: absolute; right: -100px; bottom: -20px;"><span id="count">0</span> / <span class="maxCount">0</span></div>
						</div>
					</c:forEach>
					
				</div>
			</div>
			
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>