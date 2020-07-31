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
		cursor: pointer;
		float: left;
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
		text-align: center;
		font-size: 20px;
		color: white;
		width: 150px;
		height: 50px;
		margin-top: 40px;
		margin-left: 425px;
		margin-right: 10px;
		border: none;
		border-radius: 5px;
		cursor: pointer;
		vertical-align: middle;
		background-color: #7D7471;
	}
	#writeButton:hover{
		background-color: #4AD674;
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
		margin-left: 330px;
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
</style>

	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-3.5.1.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/script.js"></script>

<script type="text/javascript">
	function writeButtonFnc() {
		location.href = './add.do';
	}
	
	function listDetailUserPageFnc(obj, event) {
		
		var aTagObj = $(obj);
		
		event.preventDefault();
		
		var qnaBoardNoObj = '';
		var keywordObj = $('#keyword');
		var searchOptionObj = $('#searchOption');
		
		// 회원이름 클릭시 자신의 회원번호 td태그
		qnaBoardNoObj = aTagObj.parent().parent().children('td').eq(0);
		
		var url = '';
		
		url += './listDetail.do?';
		url += 'qna_board_no=' + qnaBoardNoObj.html();
		url += '&keyword=' + keywordObj.val();
		url += '&searchOption=' + searchOptionObj.val();
				
		location.href = url;

		return false;
	}
	
	function listDetailAdminPageFnc(obj, event) {
		
		var aTagObj = $(obj);
		
		event.preventDefault();
		
		var qnaBoardNoObj = '';
		var keywordObj = $('#keyword');
		var searchOptionObj = $('#searchOption');
		
		// 회원이름 클릭시 자신의 회원번호 td태그
		qnaBoardNoObj = aTagObj.parent().parent().children('td').eq(1);
		
		var url = '';
		
		url += './listDetail.do?';
		url += 'qna_board_no=' + qnaBoardNoObj.html();
		url += '&keyword=' + keywordObj.val();
		url += '&searchOption=' + searchOptionObj.val();
				
		location.href = url;

		return false;
	}
	
	function sortOptionChangeFnc(e) {
		var sortOption = document.getElementById('sortOption');
		
		if(e.value == "qna_board_whole"){
			sortOption.value = e.value;
		}else if(e.value == "qna_board_accept"){
			sortOption.value = e.value;
		}else if(e.value == "qna_board_answer"){
			sortOption.value = e.value;
		}else if (e.value == "qna_board_time_limit") {
			sortOption.value = e.value;
		}else if (e.value == "qna_board_answer_complete") {
			sortOption.value = e.value;
		}
		
		var curPage = document.getElementById('curPage');
		curPage.value = 1;
		
		var pagingForm = document.getElementById('pagingForm'); 
		pagingForm.submit();						
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
			<div id='boardTitle'>QnA</div>
			
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
				<c:if test="${memberDto.member_grade == 0}">
					<input type="button" value="작성" id='writeButton' onclick="writeButtonFnc();">
				</c:if>
				<c:if test="${memberDto.member_grade == 1}">
					<a type="submit" id="deleteBtn" style="margin-left: 500px;" onclick="projectDeleteFnc();">게시물삭제</a>
				</c:if>
				
				<select id='selectProcessStatus' name="sortOption" onchange="sortOptionChangeFnc(this);">
					<c:choose>
						<c:when test="${searchMap.sortOption eq 'qna_board_whole'}">
							<option value="qna_board_whole" selected="selected">전체</option>
							<option value="qna_board_accept">접수중</option>
							<option value="qna_board_answer">답변중</option>
							<option value="qna_board_answer_complete">답변완료</option>
						</c:when>
						<c:when test="${searchMap.sortOption eq 'qna_board_accept'}">
							<option value="qna_board_whole">전체</option>
							<option value="qna_board_accept" selected="selected">접수중</option>
							<option value="qna_board_answer">답변중</option>
							<option value="qna_board_answer_complete">답변완료</option>
						</c:when>
						<c:when test="${searchMap.sortOption eq 'qna_board_answer'}">
							<option value="qna_board_whole">전체</option>
							<option value="qna_board_accept">접수중</option>
							<option value="qna_board_answer" selected="selected">답변중</option>
							<option value="qna_board_answer_complete">답변완료</option>
						</c:when>
						<c:when test="${searchMap.sortOption eq 'qna_board_answer_complete'}">
							<option value="qna_board_whole">전체</option>
							<option value="qna_board_accept">접수중</option>
							<option value="qna_board_answer">답변중</option>
							<option value="qna_board_answer_complete" selected="selected">답변완료</option>
						</c:when>					
					</c:choose>
				</select>
			</form>
			
			<div id="innerPage">
				<c:if test="${memberDto.member_grade == 1}">
					<form action="./managementDeleteCtr.do" id="deleteForm" method="get">
						<table id='projectListTable'>
							<colgroup>
								<col width="5%">
								<col width="10%">
								<col width="20%">
								<col width="15%">
								<col width="15%">
								<col width="15%">
								<col width="20%">
							</colgroup>
							<tr id='lineTitle' style="border: 1px solid #7D7471;">
								<th class="cell"><input id="allCheck" type="checkbox"></th>
								<th class="cell">글번호</th>
								<th class="cell">제목</th>
								<th class="cell">작성자</th>
								<th class="cell">작성일</th>
								<th class="cell">답변일</th>
								<th class="cell">처리상태</th>
							</tr>
							
							<c:choose>
								<c:when test="${empty qnaBoardList}">
									<tr>
										<td colspan="6" style="text-align: center;">
											등록된 게시글이 없습니다.
										</td>
									</tr>
								</c:when>
								
								<c:otherwise>
									<c:forEach var="QnaBoardDto" items="${qnaBoardList}">
										<tr>
											<td><input name="qnaCheck" type="checkbox" class='checkbox' 
												value="${QnaBoardDto.qna_board_no}"></td>
											<td >${QnaBoardDto.qna_board_no}</td>
											<td>
												<a class="detailLink" href='#' onclick="listDetailAdminPageFnc(this, event);">
													${QnaBoardDto.qna_board_title}
												</a>
											</td>
											<td>
												${QnaBoardDto.member_nick}
											</td>
											<td>
												<h5><fmt:formatDate value="${QnaBoardDto.qna_board_cre_date}" 
													pattern="yyyy.MM.dd"/></h5>
												<h5><fmt:formatDate value="${QnaBoardDto.qna_board_cre_date}" 
													pattern="hh:mm"/></h5>
											</td>
											<td>
												<c:choose>
													<c:when test="${empty QnaBoardDto.qna_board_answer_date}">
														-
													</c:when>
													<c:otherwise>
														<h5><fmt:formatDate value="${QnaBoardDto.qna_board_answer_date}" 
															pattern="yyyy.MM.dd"/></h5>
														<h5><fmt:formatDate value="${QnaBoardDto.qna_board_answer_date}" 
															pattern="hh:mm"/></h5>
													</c:otherwise>
												</c:choose>
											</td>
											<c:if test="${QnaBoardDto.qna_board_answer_status eq '접수중'}">
												<td style="color: #E14E4E;">
													${QnaBoardDto.qna_board_answer_status}
												</td>
											</c:if>
											<c:if test="${QnaBoardDto.qna_board_answer_status eq '답변중'}">
												<td style="color: #2E89D4;">
													${QnaBoardDto.qna_board_answer_status}
												</td>
											</c:if>
											<c:if test="${QnaBoardDto.qna_board_answer_status eq '답변완료'}">
												<td style="color: #BBBBBB;">
													${QnaBoardDto.qna_board_answer_status}
												</td>
											</c:if>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</table>
					</form>		
				</c:if>
				
				<c:if test="${memberDto.member_grade == 0}">
					<table id='projectListTable'>
						<colgroup>
							<col width="8%">
							<col width="32%">
							<col width="15%">
							<col width="15%">
							<col width="15%">
							<col width="15%">
						</colgroup>
						<tr id='lineTitle' style="border: 1px solid #7D7471;">
							<th class="cell">글번호</th>
							<th class="cell">제목</th>
							<th class="cell">작성자</th>
							<th class="cell">작성일</th>
							<th class="cell">답변일</th>
							<th class="cell">처리상태</th>
						</tr>
						
						<c:choose>
							<c:when test="${empty qnaBoardList}">
								<tr>
									<td colspan="6" style="text-align: center;">
										등록된 게시글이 없습니다.
									</td>
								</tr>
							</c:when>
							
							<c:otherwise>
								<c:forEach var="QnaBoardDto" items="${qnaBoardList}">
									<tr>
										<td>${QnaBoardDto.qna_board_no}</td>
										<td>
											<a class="detailLink" href='#' onclick="listDetailUserPageFnc(this, event);">
												${QnaBoardDto.qna_board_title}
											</a>
										</td>
										<td>
											${QnaBoardDto.member_nick}
										</td>
										<td>
											<h5><fmt:formatDate value="${QnaBoardDto.qna_board_cre_date}" 
												pattern="yyyy.MM.dd"/></h5>
											<h5><fmt:formatDate value="${QnaBoardDto.qna_board_cre_date}" 
												pattern="hh:mm"/></h5>
										</td>
										<td>
											<c:choose>
												<c:when test="${empty QnaBoardDto.qna_board_answer_date}">
													-
												</c:when>
												<c:otherwise>
													<h5><fmt:formatDate value="${QnaBoardDto.qna_board_answer_date}" 
														pattern="yyyy.MM.dd"/></h5>
													<h5><fmt:formatDate value="${QnaBoardDto.qna_board_answer_date}" 
														pattern="hh:mm"/></h5>
												</c:otherwise>
											</c:choose>
										</td>
										<c:if test="${QnaBoardDto.qna_board_answer_status eq '접수중'}">
											<td style="color: #E14E4E;">
												${QnaBoardDto.qna_board_answer_status}
											</td>
										</c:if>
										<c:if test="${QnaBoardDto.qna_board_answer_status eq '답변중'}">
											<td style="color: #2E89D4;">
												${QnaBoardDto.qna_board_answer_status}
											</td>
										</c:if>
										<c:if test="${QnaBoardDto.qna_board_answer_status eq '답변완료'}">
											<td style="color: #BBBBBB;">
												${QnaBoardDto.qna_board_answer_status}
											</td>
										</c:if>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</table>
				</c:if>
			</div>
			
			<input type="hidden" value="${qna_comment_no}" name="qna_comment_no">
	
			<jsp:include page="/WEB-INF/views/common/paging.jsp">
				<jsp:param value="${pagingMap}" name="pagingMap"/>
			</jsp:include>
			
			<form action="./list.do" id='pagingForm' method="get">
				<input type="hidden" id='curPage' name='curPage' 
					value="${pagingMap.paging.curPage}">
				<input type="hidden" id='qna_board_no' name="qna_board_no" value="${qnaBoardDto.qna_board_no}">
				<input type="hidden" id='searchOption' name="searchOption" value="${searchMap.searchOption}">
				<input type="hidden" id='keyword' name="keyword" value="${searchMap.keyword}">
				<input type="hidden" id='sortOption' name='sortOption' value="${searchMap.sortOption}">	
			</form>
			
		</div>
	</div>
	

	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>