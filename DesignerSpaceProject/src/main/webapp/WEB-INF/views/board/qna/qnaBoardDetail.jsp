<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/reset.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/style.css">

<style type="text/css">
	#boardTitle{
		font-size: 80px;
		font-weight: bold;
		color: #7D7471;
		text-align: center;
	}
	
	#updateButton{
		margin-bottom: 50px;
		width: 150px; 
		height: 50px;
		margin-top: -40px; 
		text-align: center; 
		font-size: 20px; 
		background-color: #7D7471;
		color: white; 
		border-collapse: collapse;
		border: none;
		border-radius: 5px;		
		cursor: pointer;
	}
	#updateButton:hover{
		background-color: #4AD674;
	}
	
	#deleteButton{
		margin-bottom: 50px;
		width: 150px; 
		height: 50px;
		margin-top: -40px; 
		text-align: center; 
		font-size: 20px; 
		background-color: #7D7471;
		color: white; 
		border-collapse: collapse;
		border: none;
		border-radius: 5px;		
		cursor: pointer;
	}
	#deleteButton:hover{
		background-color: #4AD674;
	}
	#listButton{
		margin-bottom: 50px;
		width: 150px; 
		height: 50px;
		margin-top: -40px; 
		text-align: center; 
		font-size: 20px; 
		background-color: #7D7471;
		color: white; 
		border-collapse: collapse;
		border: none;
		border-radius: 5px;		
		cursor: pointer;
	}
	#listButton:hover{
		background-color: #4AD674;
	}
	
</style>

	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-3.5.1.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/script.js"></script>

<script type="text/javascript">

	function pageMoveListFnc() {
		
		var noObj = $('#qna_board_no');
		var keywordObj = $('#keyword');
		var searchOptionObj = $('#searchOption');
		
		var url = '';
		
		url += './list.do?';
		url += 'qna_board_no=' + noObj.val();
		url += '&keyword=' + keywordObj.val();
		url += '&searchOption=' + searchOptionObj.val();
		
		location.href = url;
	}
	
	function pageMoveDeleteFnc(qna_board_no) {
		var reQuestion = confirm('게시물을 삭제하시겠습니까?');
		
		if (reQuestion) {
			var url = "./deleteCtr.do?qna_board_no=" + qna_board_no;
			location.href = url;
		}else {
			alert("다시 되돌아갑니다");
		}
		
	}
	
	function commentAddFnc() {
		
		var noObj = $('#qna_board_no');
		var mnoObj = $('#qna_comment_mno');
		var qbnoObj = $('#qna_comment_qbno');
		var keywordObj = $('#keyword');
		var searchOptionObj = $('#searchOption');
		var sortOptionObj = $('#sortOption');
		var commentsObj = $('#comment_text');
		
		var url = '';
		
		url += './commentAddCtr.do?';
		url += 'qna_board_no=' + noObj.val();
		url += '&qna_comment_qbno=' + qbnoObj.val();
		url += '&keyword=' + keywordObj.val();
		url += '&searchOption=' + searchOptionObj.val();
		url += '&sortOptionObj=' + sortOptionObj.val();
		url += '&qna_comment_mno=' + mnoObj.val();
		url += '&qna_comment_comments=' + commentsObj.val();
		
		location.href = url;
	}
	
	function commentsDeleteFnc(obj, event) {
		var reQuestion = confirm('댓글을 삭제하시겠습니까?');
		
		if (reQuestion) {

			var aTagObj = $(obj);
      
     		event.preventDefault();

			var mnoObj = $('#qna_comment_mno');
			var qbnoObj = $('#qna_comment_qbno');
			var keywordObj = $('#keyword');
			var searchOptionObj = $('#searchOption');
			var sortOptionObj = $('#sortOption');
			var commentsObj = '';
			var qcnoObj = '';

			qcnoObj = aTagObj.parent().parent().children('div').eq(1).children('input').eq(1);
			
			alert(qcnoObj.val());
			
		    commentsObj = aTagObj.parent().parent().children('div').eq(1).children('input').eq(0);
			
		    alert(commentsObj.val());
			
			var url = '';
			
			url += './commentDeleteCtr.do?';
		    url += 'qna_board_no=' + qbnoObj.val();
// 		    url += '&qna_comment_qbno=' + qbnoObj.val();S
		    url += '&keyword=' + keywordObj.val();
		    url += '&searchOption=' + searchOptionObj.val();
		    url += '&sortOption=' + sortOptionObj.val();
		    url += '&qna_comment_mno=' + mnoObj.val();
		    url += '&qna_comment_no=' + qcnoObj.val();
		    url += '&qna_comment_comments=' + commentsObj.val();
		      
		    location.href = url;
 
		}
		
	}
	
	function commentUpdateOneFnc(no) {
      	var locationObjId = '#comment_span' + no;
      	var locationObj = '';

      	locationObj = $(locationObjId);
      	var $commentsObj = $('<input type="text" value="' + locationObj.html() + '" name="qna_comment_comments" id="qna_comment_comments">');
      	
      	locationObj.after($commentsObj);
      	locationObj.remove();
      
      	var updaObj = '';
      
      	updaObj = $('#updateBtn');
      	
      	var confirmBtn = $('<input type="button" value="수정 완료" onclick="commentsUpdateFnc(this,event);">');
		
		updaObj.before(confirmBtn);
		
		updaObj.remove();
      
   }
	
	function commentsUpdateFnc(obj, event) {
		
      	var aTagObj = $(obj);
      
      	event.preventDefault();
      
      	var mnoObj = $('#qna_comment_mno');
		var qbnoObj = $('#qna_comment_qbno');
		var keywordObj = $('#keyword');
		var searchOptionObj = $('#searchOption');
		var sortOptionObj = $('#sortOption');
		var commentsObj = '';
		var qcnoObj = '';
      
		qcnoObj = aTagObj.parent().parent().children('div').eq(1).children('input').eq(2);
		
		alert(qcnoObj.val());
		
	    commentsObj = aTagObj.parent().parent().children('div').eq(1).children('input').eq(0);
      
	    alert(commentsObj.val());
	    
      	var url = '';
      
      	url += './commentUpdateCtr.do?';
      	url += 'qna_board_no=' + qbnoObj.val();
      	url += '&keyword=' + keywordObj.val();
      	url += '&searchOption=' + searchOptionObj.val();
      	url += '&sortOptionObj=' + sortOptionObj.val();
      	url += '&qna_comment_mno=' + mnoObj.val();
      	url += '&qna_comment_no=' + qcnoObj.val();
      	url += '&qna_comment_comments=' + commentsObj.val();
      
      	location.href = url;
	}

	function answerCompleteFnc() {

		var noObj = $('#qna_board_no');
		var keywordObj = $('#keyword');
		var searchOptionObj = $('#searchOption');
		
		var url = '';
		
		url += './answerCompleteCtr.do?';
		url += 'qna_board_no=' + noObj.val();
		url += '&keyword=' + keywordObj.val();
		url += '&searchOption=' + searchOptionObj.val();

		location.href = url;
	}   


</script>

<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
	<div id="wrap">
		<form action='./update.do' method='get'>
			<div id="innerWrap">
				<div id='boardTitle'>
					QnA
				</div>
				
				<div id="innerPage" style="height: 809px; margin-top: 40px;">
					<br>
					<br>
					<br>
					<br>
					<div style="margin-left: 200px;">
						<span style="width: 200px;">작성자</span>
						<span style="margin-left: 100px;">${qnaBoardDto.member_nick}</span>
					</div>
					<br>
					<hr style="text-align: center; width: 80%;">
					<br>
					<br>
					<div style="margin-left: 200px;">
						<span style="width: 200px;">제목</span>
						<span style="margin-left: 117px;">${qnaBoardDto.qna_board_title}</span>
					</div>
					<br>
					<hr style="text-align: center; width: 80%;">
					<br>
					<br>
					<div style="margin-left: 200px; height: 400px;">
						<span style="width: 200px;">질문내용</span>
						<span style="margin-left: 86px;">${qnaBoardDto.qna_board_contents}</span>
					</div>
					<br>
					<hr style="text-align: center; width: 80%;">
					<br>
					<br>
					<div style="margin-left: 200px; float: left;">
						<span style="width: 200px;">작성일</span>
						<span style="margin-left: 100px;">
							<fmt:formatDate value="${qnaBoardDto.qna_board_cre_date}" 
								pattern="yyyy.MM.dd hh:mm"/>
						</span>
					</div>
					<div style="margin-left: 120px; float: left;">
						<span style="width: 200px;">답변일</span>
						<span style="margin-left: 100px;">
							<c:choose>
								<c:when test="${empty qnaBoardDto.qna_board_answer_date}">
									-
								</c:when>
								<c:otherwise>
									<fmt:formatDate value="${qnaBoardDto.qna_board_answer_date}" 
										pattern="yyyy.MM.dd hh:mm"/>
								</c:otherwise>
							</c:choose>
						</span> 
						
					</div>
					<div style="margin-left: 200px; float: left;">
						<span style="width: 200px;">처리상태</span>
						<c:if test="${qnaBoardDto.qna_board_answer_status eq '접수중'}">
							<span style="margin-left: 86px; color: #E14E4E;">
								${qnaBoardDto.qna_board_answer_status}
							</span>
						</c:if>
						<c:if test="${qnaBoardDto.qna_board_answer_status eq '답변중'}">
							<span style="margin-left: 86px; color: #2E89D4;">
								${qnaBoardDto.qna_board_answer_status}
							</span>
						</c:if>
						<c:if test="${qnaBoardDto.qna_board_answer_status eq '답변완료'}">
							<span style="margin-left: 86px; color: #BBBBBB;">
								${qnaBoardDto.qna_board_answer_status}
							</span>
						</c:if>
						
					</div>
					<div style="margin-left: 200px;">
						<input type="hidden" id='qna_board_no' 
							name="qna_board_no" value="${qnaBoardDto.qna_board_no}">
						<input type="hidden" id='member_nick' 
							name="member_nick" value="${qnaBoardDto.member_nick}">
						<input type="hidden" id='searchOption' name="searchOption" value="${searchOption}">
						<input type="hidden" id='keyword' name="keyword" value="${keyword}">
					</div>
				</div>
			</div>
			
			<c:choose>
				<c:when test="${memberDto.member_nick eq qnaBoardDto.member_nick}">
					
					<c:if test="${qnaBoardDto.qna_board_answer_status eq '답변중'}">
						<div style="text-align: center; margin-top: -50px;">
							<input type="button" value="답변완료" style="width: 150px; height: 150px;
								border-radius: 50%; background-color: #4AD674; color: white; border: none; cursor: pointer;"
								onclick="answerCompleteFnc();">
						</div>
					</c:if>
					
					<c:if test="${qnaBoardDto.qna_board_answer_status eq '접수중'}">
						<div style="text-align: center; margin-top: -50px;">
							<input type="button" value="답변완료" disabled="disabled" style="width: 150px; height: 150px;
								border-radius: 50%; background-color: #D4D4D4; color: white; border: none;" 
								onclick="answerCompleteFnc();">
						</div>
					</c:if>
					
					<div style="text-align: center; margin-top: 50px;">
						<input type="submit" value="수정" id='updateButton'>
						<input type="button" value="삭제" id='deleteButton'
							 onclick="pageMoveDeleteFnc(${qnaBoardDto.qna_board_no});">
						<input type="button" value="목록" id='listButton' onclick="pageMoveListFnc();">
					</div>
					
				</c:when>
				
				<c:when test="${memberDto.member_grade == 1}">
					<div style="text-align: center; margin-top: 50px;">
						<input type="button" value="삭제" id='deleteButton'
							 onclick="pageMoveDeleteFnc(${qnaBoardDto.qna_board_no});">
						<input type="button" value="목록" id='listButton' onclick="pageMoveListFnc();">
					</div>
				</c:when>
				
				<c:otherwise>
					<div style="text-align: center; margin-top: 50px;">
						<input type="button" value="목록" id='listButton' onclick="pageMoveListFnc();">
					</div>
				</c:otherwise>
			</c:choose>
		</form>
	</div>
	
	<div id='wrap'>
		<div id='innerWrap'>
			<div id='innerPage'>
				<div style="text-align: center; margin-bottom: 50px;">
					
					<c:if test="${qnaBoardDto.qna_board_mno eq memberDto.member_no 
										|| memberDto.member_grade == 1}">
						<img alt="프로필 이미지" src="<c:url value='/profileImg/${memberDto.profile_table_stored_name}'/>"
							style="border-radius: 50%; width: 75px; height: 75px; vertical-align: middle;">
						<input type="text" value="" 
							id='comment_text' style="width: 800px; height: 100px;">
						<input type="button" value="등록" onclick="commentAddFnc();" 
							style="width: 100px; height: 100px;">
					</c:if>
					<input type="hidden" id='qna_comment_mno'
						name="qna_comment_mno" value="${memberDto.member_no}">
					<input type="hidden" id='qna_comment_qbno' 
						name="qna_comment_qbno" value="${qnaBoardDto.qna_board_no}">
				</div>
				
				<c:choose>
					<c:when test="${empty qnaBoardCommentList}">
						댓글이 없습니다
					</c:when>
					<c:otherwise>
						<c:forEach var="qnaBoardComment" items="${qnaBoardCommentList}">
							<div style="margin-left: 154px; width: 950px; height: 116px; clear: both;">
								<img alt="프로필 이미지" src="<c:url value='/profileImg
									/${qnaBoardComment.profile_table_stored_name}'/>"
									style="border-radius: 50%; width: 75px; height: 75px; float: left;">
								<div>
									<span style="font-size: 25px;">
										${qnaBoardComment.member_nick}
									</span>
									<fmt:formatDate value="${qnaBoardComment.qna_comment_cre_date}" 
											pattern="yyyy.MM.dd HH:mm"/>
									<c:if test="${qnaBoardComment.qna_comment_mno eq memberDto.member_no}">
										<input type="button" value="수정" id="updateBtn"
											style="width: 60px; height: 20px;"
											onclick="commentUpdateOneFnc(${qnaBoardComment.qna_comment_no})">
									</c:if>
									<c:if test="${qnaBoardComment.qna_comment_mno eq memberDto.member_no 
										|| memberDto.member_grade == 1}">
										<input type="button" value="삭제" id="deleteBtn" 
											style="width: 60px; height: 20px;" 
											onclick="commentsDeleteFnc(this, event);">
									</c:if>
									
								</div>
								<div style="margin-top: 10px;">
									<span id="comment_span${qnaBoardComment.qna_comment_no}"
										>${qnaBoardComment.qna_comment_comments}</span>
									<input type="hidden" value="${qnaBoardComment.qna_comment_comments}" 
										name="qna_comment_comments" id="qna_comment_comments">
									<input type="hidden" id='qna_comment_no'
										name="qna_comment_no" value="${qnaBoardComment.qna_comment_no}">
								</div>
								
							</div>
						</c:forEach>
						
						<jsp:include page="/WEB-INF/views/common/commentpaging.jsp">
							<jsp:param value="${freeBoardCommentPaging}" name="freeBoardCommentPaging"/>
						</jsp:include>
						
						<form action="./listDetail.do#navList" id='pagingForm' method="get">
							<input type="hidden" id='curPage' name='curPage' 
								value="${freeBoardCommentPaging.curPage}">
							<input type="hidden" id='qna_board_no' name="qna_board_no" 
								value="${qnaBoardDto.qna_board_no}">
							<input type="hidden" id='searchOption' name="searchOption" 
								value="${searchMap.searchOption}">
							<input type="hidden" id='keyword' name="keyword" value="${keyword}">
							<input type="hidden" id="comments" name="comments">
						</form>
						
					</c:otherwise>
				</c:choose>
				
			</div>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>