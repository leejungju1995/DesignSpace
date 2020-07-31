<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>회원 목록</title>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/reset.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/style.css">
	
	<style type="text/css">
		#innerPage{
			margin-top: 10px;
		}
		#boardTitle{
			font-size: 70px;
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
/* 			float: right; */
/* 			margin-right: 180px; */
			text-align: center;
			color: white;
			width: 150px;
			height: 50px;
/* 			margin-top: 40px; */
			font-size: 20px;
			background-color: #7D7471;
			border: 0;
			outline: 0;
			border-radius: 5px;
			cursor: pointer;
		}	
		#writeButton:hover{
			color: white;
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
		
		#projectListTable th:hover{
			cursor: pointer;
			color: #4AD674;
			font-size: 20px;
			font-weight: bold;
			height: 50px;
			vertical-align: middle;
		}		
		#projectListTable td{			
			height: 50px;
			vertical-align: middle;
		}	
		#admin{
			font-weight: bold;
			color: red;
		}
		a > #admin { 
			text-decoration:none;
			color: red;
		}	
		a{
			text-decoration:none;
			color: black;
		} 	
		.freeBoardTitle:hover{
			text-decoration: underline;
		}
	</style>
	
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-3.5.1.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/script.js"></script>

	<script type="text/javascript">
			
	function freeBoardListOnePageFnc(obj, event){
		
		var aTagObj = $(obj);
		
		event.preventDefault();
		
		var freeBoardNoObj = '';
		var keywordObj = $('#keyword');
		var searchOptionObj = $('#searchOption');
		var memberNoObj = $('#mno');
		var titleObj = '';
		var rnumObj = '';
	
		freeBoardNoObj = aTagObj.parent().parent().children('td').eq(0);
		rnumObj = aTagObj.parent().parent().children('td').eq(5).children('input');
		titleObj = aTagObj.parent().parent().children('td').eq(6).children('input');
		
		var url = '';
		
		url += './freeBoardView.do?';
		url += 'no=' + freeBoardNoObj.html();
		url += '&keyword=' + keywordObj.val();
		url += '&searchOption=' + searchOptionObj.val();
		url += '&mno=' + memberNoObj.val();
		url += '&lineTitle=' + titleObj.val();
		url += '&rnum=' + rnumObj.val();
				
		location.href = url;
	
		return false;
	}
	
		function sortFnc(sort) {
			var aTagObj = $(sort);
			var freeBoardNoObj = '';
			var keywordObj = $('#keyword');
			var searchOptionObj = $('#searchOption');
			var memberNoObj = $('#mno');
			var whatKindObj = $(sort).attr('id');		
	
			var url = '';
			
			url += './free.do?';
	
			url += 'keyword=' + keywordObj.val();
			url += '&searchOption=' + searchOptionObj.val();
			url += '&mno=' + memberNoObj.val();
			url += '&lineTitle=' + whatKindObj;
			
			location.href = url;
		}
		
		function freeBoardDeleteFnc(obj, event) {
			var aTagObj = $(obj);
			
			event.preventDefault();
			
			var freeBoardNoObj = '';
			var url = '';
			
			freeBoardNoObj = aTagObj.parent().parent().children('td').eq(0);
			
			var answer = confirm('회원 정보를 삭제하시겠습니까?');
	        if (answer) {
	           	url += './freeBoardDeleteCtr.do?';
	   			url += 'no=' + freeBoardNoObj.html();  			
	   			location.href = url;
	   			alert('성공적으로 삭제되었습니다.');
	           return true;
	        }else {
	           return false;
	        }
			
		}
		
	
		$(document).ready(function () {
			
			for (var i = 0; i < $('.freeBoardTitle').length; i++) {
				var freeBoardTitleStr = $('.freeBoardTitle').eq(i).text();
				if(freeBoardTitleStr.length >= 30){
					
					freeBoardTitleStr = freeBoardTitleStr.substring(0,30) + "...";	
				}
				$('.freeBoardTitle').eq(i).text(freeBoardTitleStr);
			};
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
			<div id='boardTitle'>자유게시판</div>
			
			<div style="overflow: hidden;">
				<div style="overflow: hidden; float: left;">
					<form id='searchingForm' action="./free.do" method="post">
						<select id='searchOption' name='searchOption'>
						<c:choose>
							<c:when test="${searchMap.searchOption eq 'all'}">
								<option value="all" selected="selected">제목+내용</option>
								<option value="free_board_title">제목</option>
								<option value="member_nick">작성자</option>
							</c:when>
							
							<c:when test="${searchMap.searchOption eq 'free_board_title'}">
								<option value="all">제목+내용</option>
								<option value="free_board_title" selected="selected">제목</option>
								<option value="member_nick">작성자</option>
							</c:when>
				
							<c:when test="${searchMap.searchOption eq 'member_nick'}">
								<option value="all">제목+내용</option>
								<option value="free_board_title">제목</option>
								<option value="member_nick" selected="selected">작성자</option>
							</c:when>
						</c:choose>
						</select>
				<!-- 			<input type="hidden" id='curPage' name='curPage'  -->
				<%-- 			value="${pagingMap.memberPaging.curPage}"> --%>
						<input type="text" id='keyword' 
							name="keyword" value="${searchMap.keyword}"
							placeholder="제목 or 내용 검색">
						<button id="searchBtn" type="submit"><img src="<%=request.getContextPath()%>/resources/img/iconSearch.png"></button>
					</form>	
				</div>
				
				<div style="overflow: hidden; float: right; margin: 40px 175px 0px 0px;">
					<div style="float: left;">
						<form action="./freeBoardAdd.do" method="post">
							<input type="submit" value="작성" id='writeButton'>
							<input type="hidden" id="mno" name="mno" value="${memberDto.member_no}">
						</form>
					</div>
					<c:if test="${memberDto.member_grade eq '1'}">
						<a type="submit" id="deleteBtn" onclick="projectDeleteFnc();" style="float: left; margin: 20px 0px 0px 20px; color: red; font-weight: bold;">게시물삭제</a>
					</c:if>
				</div>
			</div>
			
			<div id="innerPage">
			<form action="./freeBoardAdminDeleteCtr.do" id="deleteForm" method="get">
			<table id="projectListTable">
				<colgroup>
							<col width="5%">
							<col width="35%">
							<col width="15%">
							<col width="15%">
							<col width="15%">
							<col width="0%">
							<col width="0%">
							<col width="15%">
				</colgroup>
				<tr id='lineTitle' style="border: 1px solid #7D7471;" >
					<th class="cell" onclick="sortFnc(this);" id="free_board_no">글번호</th>
					<th class="cell" onclick="sortFnc(this);" id="free_board_title">제목</th>
					<th class="cell" onclick="sortFnc(this);" id="member_nick">작성자</th>
					<th class="cell" onclick="sortFnc(this);" id="free_board_views">조회수</th>
					<th class="cell" onclick="sortFnc(this);" id="nl">좋아요</th>
					<th class="cell"></th>
					<th class="cell"></th>
					<th class="cell" onclick="sortFnc(this);" id="free_board_cre_date">작성일</th>
					<c:if test="${memberDto.member_grade eq '1'}">
						<th class="cell"><input id="allCheck" type="checkbox"></th>
					</c:if>			
				</tr>
			<c:choose>
				<c:when test="${empty freeBoardList}">
					<tr>
						<td class="cell2" colspan="8" style="text-align: center;">
							등록된 게시글이 없습니다.
						</td>
					</tr>
				</c:when>
				<c:otherwise>
					
					<c:forEach var="freeBoardDto" items="${freeBoardList}">
					<input type="hidden" id="boardTitle" name="boardTitle" value="${freeBoardDto.freeBoardTitle}">
					<tr>
						<td class="cell2">${freeBoardDto.freeBoardNo}</td>
						<c:choose>
						<c:when test="${freeBoardDto.memberGrade eq '0'}">
						<td class="cell2" style="text-align: left;">
							<a href='#' class="freeBoardTitle" 
							onclick="freeBoardListOnePageFnc(this, event);">${freeBoardDto.freeBoardTitle}</a>
						</td>
						</c:when>
						<c:when test="${freeBoardDto.memberGrade eq '1'}">
						<td class="cell2" style="text-align: left;">
							<a id="admin" class="freeBoardTitle" href='#' 
							onclick="freeBoardListOnePageFnc(this, event);">${freeBoardDto.freeBoardTitle}</a>
						</td>
						</c:when>
						</c:choose>
						<c:choose>
						<c:when test="${freeBoardDto.memberGrade eq '0'}">
						<td class="cell2">${freeBoardDto.memberNick}</td>
						</c:when>
						<c:when test="${freeBoardDto.memberGrade eq '1'}">
						<td class="cell2" id="admin">${freeBoardDto.memberNick}</td>
						</c:when>
						</c:choose>
						<td class="cell2">${freeBoardDto.freeBoardViews}</td>				
		
						<td class="cell2">${freeBoardDto.freeBoardLike}</td>
						<td><input type="hidden" id="rnum" name="rnum" value="${freeBoardDto.freeBoardRownum}"></td>
						<td><input type="hidden" id="sortTitle" name="sortTitle" value="${lineTitle}"></td>
						<td class="cell2">
							<h6><fmt:formatDate value="${freeBoardDto.freeBoardCreDate}" 
								pattern="yyyy.MM.dd"/></h6>
							<h6><fmt:formatDate value="${freeBoardDto.freeBoardCreDate}" 
								pattern="HH:mm"/></h6>
						</td>
						
						
						<c:if test="${memberDto.member_grade eq '1'}">
							<td><input name="noCheck" type="checkbox" class='checkbox' 
                                    value="${freeBoardDto.freeBoardNo}"></td>
                        </c:if>
					</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			
			</table>
			</form>
			</div>
			
			<jsp:include page="/WEB-INF/views/common/paging.jsp">
				<jsp:param value="${pagingMap}" name="pagingMap"/>
			</jsp:include>
			
			<form action="./free.do" id='pagingForm' method="get">
				<input type="hidden" id='curPage' name='curPage' 
					value="${pagingMap.paging.curPage}">
				<input type="hidden" id='no' name="no" value="${freeBoardDto.freeBoardNo}">
				<input type="hidden" id='searchOption' name="searchOption" value="${searchMap.searchOption}">
				<input type="hidden" id='keyword' name="keyword" value="${searchMap.keyword}">
				<input type="hidden" id="lineTitle" name="lineTitle" value="${lineTitle}">
			</form>
			
		
		</div>
	</div>
	
	
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>