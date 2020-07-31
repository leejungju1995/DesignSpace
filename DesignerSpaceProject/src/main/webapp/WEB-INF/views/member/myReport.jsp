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
	}	
	#keyword{
		margin-top: 40px;
		width: 420px;
		height: 45px;
		float: left;
	}	
	#searchBtn{
	 	width: 50px;
	 	height: 50px;
	 	background-color: #60524E;
	 	border-style: none;
	 	border-radius: 5px;
	 	vertical-align: middle;
	 	margin-top: 40px;
	}
	#writeButton{
		float: right;
		text-align: center;
		color: white;
		width: 150px;
		height: 50px;
		margin-top: 40px;
		margin-right: 185px;
		font-size: 20px;
		background-color: #7D7471;
		border-radius: 5px;
		border: none;
		cursor: pointer;
	}	
	#writeButton:hover{
		color: #fff;
		background-color: #4AD674;
	}	
	#selectProcessStatus{
		margin-top: 40px;
		margin-left: 20px;
		width: 138px;
		height: 50px;
		margin-right: 10px;
		vertical-align: middle;
		text-align-last: center;
		font-size: 17px;
		float: right;
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
    #innerWrap select{
    	cursor: pointer;
    }
    #innerPage{
    	margin-top: 10px;
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

</script>
</head>

<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>	
	
	<div id="wrap">
		<div id="innerWrap">
			<div id='boardTitle'>신고글</div>
			
			<form action="./myReport.do" method="get">
				<input type="hidden" id='mno' name='mno' value="${memberDto.member_no}">
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
				<button id="searchBtn" type="submit"><img src="<%=request.getContextPath()%>/resources/img/iconSearch.png"></button>
				<input id="writeButton" name="reportWrite" type="button" onclick="reportWriteFnc();" value="작성">
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
				<table id='projectListTable'>
					<colgroup>
						<col width="10%">
						<col width="33%">
						<col width="12%">
						<col width="15%">
						<col width="15%">
						<col width="15%">
					</colgroup>
					<tr id='lineTitle'>
						<th>글번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>답변일</th>
						<th>처리상태</th>
					</tr>
					
					<c:choose>
						<c:when test="${empty reportBoardList}">
							<tr>
								<td colspan="6" style="text-align: center; font-size: 20px;">
									등록된 게시글이 없습니다.
								</td>
							</tr>
						</c:when>
						
						<c:otherwise>
							<c:forEach var="reportBoardDto" items="${reportBoardList}">
								<tr>
									<td>${reportBoardDto.report_board_no}</td>
									<td>
										<a class="detailLink" href="../reportBoard/listDetail.do?report_board_no=${reportBoardDto.report_board_no}">
											${reportBoardDto.report_board_title}
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
			</div>
			
			<jsp:include page="/WEB-INF/views/common/paging.jsp">
				<jsp:param value="${pagingMap}" name="pagingMap"/>
			</jsp:include>
			
			<form action="./myReport.do" id='pagingForm' method="get">
				<input type="hidden" id='curPage' name='curPage' 
					value="${pagingMap.paging.curPage}">
				<input type="hidden" id='qna_board_no' name="qna_board_no" value="${reportBoardDto.report_board_no}">
				<input type="hidden" id='searchOption' name="searchOption" value="${searchMap.searchOption}">
				<input type="hidden" id='keyword' name="keyword" value="${searchMap.keyword}">
				<input type="hidden" id='sortOption' name='sortOption' value="${searchMap.sortOption}">
				<input type="hidden" id='mno' name='mno' value="${memberDto.member_no}">					
			</form>
			
		</div>
	</div>
	
	
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>