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
		#manageMentHeader{
			font-size: 80px;
			font-weight: bold;
			color: #60524E;
		}
		#projectListTable td a{			
			text-decoration: none;
			color: black;
		}
		#projectListTable td a:hover{			
			text-decoration: underline;
		}
		#topMenu{
			display: table;
		}
		#topMenu select{
			width: 130px;
		 	height: 50px;
		 	vertical-align: middle;
		 	font-size: 17px;
		 	margin: auto;
		 	text-align-last: center; 
		}
		#searchBtn{
		 	width: 50px;
		 	height: 50px;
		 	background-color: #60524E;
		 	border-style: none;
		 	border-radius: 5px;
		 	vertical-align: middle;
		}
		#searchInput{
			width: 420px;
			height: 50px;
			vertical-align: middle;
			box-sizing: border-box;
		}
		#deleteBtn{
			color: red;
			font-weight: bold;
			margin-left: 540px;
			vertical-align: bottom;			
		}
		#innerPage{
			margin-top: 10px;
		}
		#pagingArea{
			margin-top: 50px;
		}
		#memberInfoLink{
			text-decoration: none;
			color: #000;
		}
		#memberInfoLink:hover{
			text-decoration: underline;
		}
	</style>
	
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-3.5.1.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/script.js"></script>
	
	<script type="text/javascript">	
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
<!-- 			페이지정보, 검색, 파일삭제Btn -->
			<form action="./management.do" method="get">
				<div id="topMenu">
					<span id="manageMentHeader">작품관리</span>
								
					<select name="searchOption">
						<c:choose>
							<c:when test="${listOptionMap.searchOption eq 'project_board_title'}">
								<option value="project_board_title" selected="selected">제목</option>
								<option value="all">제목+내용</option>
								<option value="project_board_contents">내용</option>
								<option value="member_nick">작성자</option>
							</c:when>
							<c:when test="${listOptionMap.searchOption eq 'all'}">
								<option value="project_board_title">제목</option>
								<option value="all" selected="selected">제목+내용</option>
								<option value="project_board_contents">내용</option>
								<option value="member_nick">작성자</option>
							</c:when>
							<c:when test="${listOptionMap.searchOption eq 'project_board_contents'}">
								<option value="project_board_title">제목</option>
								<option value="all">제목+내용</option>
								<option value="project_board_contents" selected="selected">내용</option>
								<option value="member_nick">작성자</option>
							</c:when>
							<c:when test="${listOptionMap.searchOption eq 'member_nick'}">
								<option value="project_board_title">제목</option>
								<option value="all">제목+내용</option>
								<option value="project_board_contents">내용</option>
								<option value="member_nick" selected="selected">작성자</option>
							</c:when>
						</c:choose>						
					</select>					
					<input id="searchInput" name="keyword" type="text">
					<button id="searchBtn" type="submit"><img src="<%=request.getContextPath()%>/resources/img/iconSearch.png"></button>
					
					<a type="submit" id="deleteBtn" onclick="projectDeleteFnc();">작품삭제</a>							
				</div>
			</form>
			
			<div id="innerPage">			
	<!-- 			프로젝트 관리 테이블 ( 작품 게시물 정보 ) -->
				<form action="./ManagementDeleteCtr.do" id="deleteForm" method="get">
					<table id="projectListTable">
						<colgroup>
							<col width="5%">
							<col width="8%">
							<col width="25%">
							<col width="12%">
							<col width="12%">
							<col width="8%">
							<col width="8%">
							<col width="8%">
							<col width="14%">
						</colgroup>
						<tr style="border: 1px solid #7D7471;">
							<th><input id="allCheck" type="checkbox"></th>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>카테고리</th>
							<th>댓글수</th>
							<th>조회수</th>
							<th>좋아요</th>
							<th>작성일</th>					
						</tr>
						<c:if test="${empty projectBoardList}">
							<tr style="text-align: center;">
								<td colspan="9">게시물이 존재하지 않습니다.</td>								
							</tr>
						</c:if>
						<c:forEach var="projectList" items="${projectBoardList}">
							<tr>
								<td><input name='projectCheck' type="checkbox" class='checkbox' value="${projectList.project_board_no}"></td>
								<td>${projectList.project_board_no}</td>
								<td><a href="./detail.do?project_board_no=${projectList.project_board_no}&chkPage=2">${projectList.project_board_title}</a></td>
								<td><a id="memberInfoLink" href="../member/myBoard.do?mno=${projectList.project_board_mno}">${projectList.member_nick}</a></td>
								<td>
									<c:choose>
										<c:when test="${projectList.project_board_category eq 'p'}">
											사진																						
										</c:when>
										<c:when test="${projectList.project_board_category eq 'i'}">
											일러스트
										</c:when>
									</c:choose>
								</td>
								<td>${projectList.project_comment_cnt}</td>
								<td>${projectList.project_board_views}</td>
								<td>${projectList.project_board_like}</td>
								<td><fmt:formatDate value="${projectList.project_board_cre_date}" 
									pattern="yyyy.MM.dd"/><br>
									<fmt:formatDate value="${projectList.project_board_cre_date}" 
									pattern="hh:mm"/></td>
							</tr>
						</c:forEach>				
					</table>
				</form>										
			</div> 
<!-- 			innerPage End ( 테이블 ) -->
<!-- 		===================================== 페이징 -->
			<div id="pagingArea">
				<jsp:include page="/WEB-INF/views/common/paging.jsp">
					<jsp:param value="${pagingMap}" name="projectBoardPaging"/>
				</jsp:include>
			</div>
	
			<form action="./management.do" id='pagingForm' method="get">
				<input type="hidden" id='curPage' name='curPage' 
					value="${pagingMap.paging.curPage}">
				<input type="hidden" id='searchOption' name="searchOption" value="${listOptionMap.searchOption}">
				<input type="hidden" id='keyword' name="keyword" value="${listOptionMap.keyword}">
			</form>
			
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>