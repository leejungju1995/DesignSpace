<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/reset.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/style.css">

<style type="text/css">
	#innerPage{
		margin-top: 10px;
	}
	#boardTitle{
		font-size: 80px;
		font-weight: bold;
		float: left;
		color: #7D7471;
	}
	#searchOption{
		margin-top: 40px;
		margin-left: 20px;
		width: 138px;
		height: 50px;
		vertical-align: middle;
		text-align-last: center;
		font-size: 17px;
		float: left;
		cursor: pointer;
	}
	#keyword{
		margin-top: 40px;
		width: 420px;
		height: 45px;
		float: left;
	}
	#searchButton{
		margin-top: 40px;
		width: 50px;
		height: 50px;
		float: left;
	 	background-color: #60524E;
	 	border-style: none;
	 	border-radius: 5px;
	 	vertical-align: middle;
	}
	#writeButton{
		float: right;
		text-align: center;
		color: white;
		width: 150px;
		height: 50px;
		margin-top: 40px;
		margin-right: 10px;
		font-size: 20px;
		vertical-align: middle;
		background-color: #7D7471;
	}
	#selectProcessStatus{
		margin-top: 40px;
		width: 138px;
		height: 50px;
		vertical-align: middle;
		text-align-last: center;
		font-size: 17px;
		cursor: pointer;
	}
	#projectListTable{
       width: 1350px;
    }
    #projectListTable tr{
       text-align: center;
       border: 1px solid #D8D8D8;
    }
    #projectListTable th{
       background-color: #7D7471;
       color: #fff;
       font-size: 20px;
       font-weight: bold;
       height: 50px;
       vertical-align: middle;
    }
    #projectListTable td{         
       height: 50px;
       vertical-align: middle;
    }
	#deleteBtn{
		color: red;
		font-weight: bold;
		margin-left: 265px;
		margin-right: 10px;
		vertical-align: bottom;
	}
	.detailLink{
		color: #000;
		text-decoration: none;
	}
	.detailLink:hover{
		text-decoration: underline;
	}
	#completeBtn{
		width: 138px; 
		height: 50px; 
		border: none;
		border-radius: 5px;
		margin-top: 40px;
		margin-right: 10px;
		color: #fff;
		font-size: 20px;
		vertical-align: middle; 
		background-color: #7D7471;
		cursor: pointer;
	}
	#completeBtn:hover{
		background-color: #4AD674;
	}
</style>

	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-3.5.1.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/script.js"></script>

<script type="text/javascript">
	
	function listDetailAdminPageFnc(obj, event) {
		
		var aTagObj = $(obj);
		
		event.preventDefault();
		
		var reportBoardNoObj = '';
		var keywordObj = $('#keyword');
		var searchOptionObj = $('#searchOption');
		
		// 회원이름 클릭시 자신의 회원번호 td태그
		reportBoardNoObj = aTagObj.parent().parent().children('td').eq(1);
		
		var url = '';
		
		url += './listDetail.do?';
		url += 'report_board_no=' + reportBoardNoObj.html();
		url += '&keyword=' + keywordObj.val();
		url += '&searchOption=' + searchOptionObj.val();
		
		location.href = url;

		return false;
	}
	
	function sortOptionChangeFnc(e) {
		var sortOption = document.getElementById('sortOption');
		
		if(e.value == "report_board_whole"){
			sortOption.value = e.value;
		}else if(e.value == "report_board_accept"){
			sortOption.value = e.value;
		}else if(e.value == "report_board_reject"){
			sortOption.value = e.value;
		}else if (e.value == "report_board_processing_complete") {
			sortOption.value = e.value;
		}
		
		var curPage = document.getElementById('curPage');
		curPage.value = 1;
		
		var pagingForm = document.getElementById('pagingForm'); 
		pagingForm.submit();						
	}
	
	function processingCompleteFnc() {
		
// 		var noObj = $('#report_board_no');
		var keywordObj = $('#keyword');
		var searchOptionObj = $('#searchOption');
		
		var url = '';
		
		url += './processingCompleteCtr.do?';
// 		url += 'report_board_no=' + noObj.val();
		url += 'keyword=' + keywordObj.val();
		url += '&searchOption=' + searchOptionObj.val();

		location.href = url;
	}
	
	$(document).ready(function() {
		//체크박스 전체선택
	   $('#allCheck').click(function() {
	      var allChecked = $(this).prop('checked');
	      
	      if (allChecked) {
	         $('.checkbox').each(function(){
	        	 $(this).prop('checked', true);
	         });
	      } else{
	         $('.checkbox').prop('checked', false);
	      }
	      
	   });
	   //전체선택에서 개별 선택시 전체선택 비활성화
	   $('.checkbox').click(function() {
	       if (!$(this).prop('checked')) {
	           $("#allCheck").prop('checked', false);
	       }
	   });
	});	
	
	function projectDeleteFnc() {			
		var deleteFormObj = document.getElementById('deleteForm');			
		
		if(confirm('정말로 삭제하시겠습니까?')){
			
			deleteFormObj.submit();
	 		return true;
	 	}else{
	 		return false;
	 	}
	}
	
</script>

</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>

	<div id="wrap">
		<div id="innerWrap">
			<div id='boardTitle'>신고글</div>
			
			<form action="./list.do" method="get">
				<select id='searchOption' name="searchOption">
					<c:choose>
						<c:when test="${searchMap.searchOption eq 'titleAndContent'}">
							<option value="titleAndContent" selected="selected">제목 + 내용</option>
							<option value="title">제목</option>
							<option value="content">내용</option>
							<option value="writer">작성자</option>
						</c:when>
						
						<c:when test="${searchMap.searchOption eq 'title'}">
							<option value="titleAndContent">제목 + 내용</option>
							<option value="title" selected="selected">제목</option>
							<option value="content">내용</option>
							<option value="writer">작성자</option>
						</c:when>
						
						<c:when test="${searchMap.searchOption eq 'content'}">
							<option value="titleAndContent">제목 + 내용</option>
							<option value="title">제목</option>
							<option value="content" selected="selected">내용</option>
							<option value="writer">작성자</option>
						</c:when>
						
						<c:when test="${searchMap.searchOption eq 'writer'}">
							<option value="titleAndContent">제목 + 내용</option>
							<option value="title">제목</option>
							<option value="content">내용</option>
							<option value="writer" selected="selected">작성자</option>
						</c:when>
					</c:choose>
				</select>
				
				<input type="text" id='keyword' name="keyword" value="${searchMap.keyword}">
				<button id="searchButton" type="submit">
					<img src="<%=request.getContextPath()%>/resources/img/iconSearch.png">
				</button>
				
				
				<a type="submit" id="deleteBtn" onclick="projectDeleteFnc();">게시물삭제</a>
				<input type="button" value="처리완료"  onclick="processingCompleteFnc();"
					id="completeBtn">
				<select id='selectProcessStatus' onchange="sortOptionChangeFnc(this);">
					<c:choose>
						<c:when test="${searchMap.sortOption eq 'report_board_whole'}">
							<option value="report_board_whole" selected="selected">전체</option>
							<option value="report_board_accept">접수중</option>
							<option value="report_board_processing_complete">처리완료</option>
						</c:when>
						<c:when test="${searchMap.sortOption eq 'report_board_accept'}">
							<option value="report_board_whole">전체</option>
							<option value="report_board_accept" selected="selected">접수중</option>
							<option value="report_board_reject">처리기각</option>
							<option value="report_board_processing_complete">처리완료</option>
						</c:when>
						<c:when test="${searchMap.sortOption eq 'report_board_processing_complete'}">
							<option value="report_board_whole">전체</option>
							<option value="report_board_accept">접수중</option>
							<option value="report_board_processing_complete" selected="selected">처리완료</option>
						</c:when>
					</c:choose>
				</select>
				
			</form>
			
			<div id="innerPage">
				<form action="./managementDeleteCtr.do" id="deleteForm" method="get">
					<table id='projectListTable'>
						<tr id='lineTitle' style="border: 1px solid #7D7471;">
							<th><input id="allCheck" type="checkbox"></th>
							<th>글번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>처리일</th>
							<th>처리상태</th>
						</tr>
						
						<c:choose>
							<c:when test="${empty reportBoardList}">
								<tr>
									<td colspan="6" style="text-align: center;">
										등록된 게시글이 없습니다.
									</td>
								</tr>
							</c:when>
							
							<c:otherwise>
								<c:forEach var="reportBoardDto" items="${reportBoardList}">
									<tr>
										<td><input name="reportCheck" type="checkbox" class='checkbox' 
												value="${reportBoardDto.report_board_no}"></td>
										<td>${reportBoardDto.report_board_no}</td>
										<td>
											<a class="detailLink" href='#' onclick="listDetailAdminPageFnc(this, event);">
												${reportBoardDto.report_board_reason}
											</a>
										</td>
										<td>
											${reportBoardDto.member_nick}
										</td>
										<td>
											<h5><fmt:formatDate value="${reportBoardDto.report_board_cre_date}" 
												pattern="yyyy.MM.dd"/></h5>
											<h5><fmt:formatDate value="${reportBoardDto.report_board_cre_date}" 
												pattern="HH:mm"/></h5>
										</td>
										<td>
											<c:choose>
												<c:when test="${empty reportBoardDto.report_board_answer_date}">
													-
												</c:when>
												<c:otherwise>
													<h5><fmt:formatDate value="${reportBoardDto.report_board_answer_date}" 
														pattern="yyyy.MM.dd"/></h5>
													<h5><fmt:formatDate value="${reportBoardDto.report_board_answer_date}" 
														pattern="HH:mm"/></h5>
												</c:otherwise>
											</c:choose>
										</td>
										
										<c:if test="${reportBoardDto.report_board_answer_status eq '접수중'}">
											<td style="color: #E14E4E;">
												${reportBoardDto.report_board_answer_status}
											</td>
										</c:if>
										<c:if test="${reportBoardDto.report_board_answer_status eq '처리기각'}">
											<td style="color: #BFC506;">
												${reportBoardDto.report_board_answer_status}
											</td>
										</c:if>
										<c:if test="${reportBoardDto.report_board_answer_status eq '처리완료'}">
											<td style="color: #BABABA;">
												${reportBoardDto.report_board_answer_status}
											</td>
										</c:if>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</table>
				</form>
			</div>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/common/paging.jsp">
		<jsp:param value="${pagingMap}" name="pagingMap"/>
	</jsp:include>
	
	<form action="./list.do" id='pagingForm' method="get">
		<input type="hidden" id='curPage' name='curPage' 
			value="${pagingMap.paging.curPage}">
		<input type="hidden" id='qna_board_no' name="qna_board_no" value="${reportBoardDto.report_board_no}">
		<input type="hidden" id='searchOption' name="searchOption" value="${searchMap.searchOption}">
		<input type="hidden" id='keyword' name="keyword" value="${keyword}">
		<input type="hidden" id='sortOption' name='sortOption' value="${searchMap.sortOption}">	
	</form>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>