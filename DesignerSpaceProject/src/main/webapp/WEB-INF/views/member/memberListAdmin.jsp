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
	#innerPage{
		margin-top: 100px;
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
		font-size: 20px;
		background-color: #7D7471;
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
	#deleteBtn{
		color: red;
		font-weight: bold;
		position: absolute;
		right: 180px;
		top: 70px;	
	}
	.cell2 a{
		text-decoration: none;
		color: #000;
	}
	.cell2 a:hover{
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
     
		function removeMemberFnc() {
			removeFormObj = document.getElementById('removeForm');
			
			removeFormObj.submit();
		}
	
	</script>

	
</head>



<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>	
	
	<div id="wrap">
		<div id="innerWrap" style="overflow: hidden;">
			<div style="position: relative;">
				<div id='boardTitle'>회원목록</div>
				<form id='searchingForm' action="./listAdmin.do" method="post">
						<select id='searchOption' name='searchOption'>
						<c:choose>
							<c:when test="${searchMap.searchOption eq 'all'}">
								<option value="all" selected="selected">전체</option>
								<option value="member_nick">닉네임</option>
								<option value="member_email">이메일</option>
							</c:when>
							
							<c:when test="${searchMap.searchOption eq 'member_nick'}">
								<option value="all">전체</option>
								<option value="member_nick" selected="selected">닉네임</option>
								<option value="member_email">이메일</option>
							</c:when>
				
							<c:when test="${searchMap.searchOption eq 'member_email'}">
								<option value="all">전체</option>
								<option value="member_nick">닉네임</option>
								<option value="member_email" selected="selected">이메일</option>
							</c:when>
						</c:choose>
						</select>
				<!-- 			<input type="hidden" id='curPage' name='curPage'  -->
				<%-- 			value="${pagingMap.memberPaging.curPage}"> --%>
						<input type="text" id='keyword' 
							name="keyword" value="${searchMap.keyword}"
							placeholder="회원이름 or 이메일 검색">
						<button id="searchButton" type="submit">
							<img src="<%=request.getContextPath()%>/resources/img/iconSearch.png">
						</button>
				</form>	
				
				<a id="deleteBtn" onclick="removeMemberFnc();">회원삭제</a>
				
			</div>
			
			<form action="../member/remove.do" id="removeForm" method="get">
			<div id="innerPage">
				<table id='projectListTable'>
					<colgroup>
						<col width="6%">
						<col width="6%">
						<col width="24%">
						<col width="22%">
						<col width="12%">
						<col width="12%">
						<col width="18%">
					</colgroup>
					<tr id='lineTitle' style="border: 1px solid #7D7471;">
						<th class="cell"><input type="checkbox" id="allCheck"></th>
						<th class="cell">회원번호</th>
						<th class="cell">닉네임</th>
						<th class="cell">이메일</th>
						<th class="cell">작품수</th>
						<th class="cell">좋아요</th>	
						<th class="cell">가입일자</th>	
							
				<c:choose>
					<c:when test="${empty memberList}">
						<tr>
							<td class="cell2" colspan="7" style="text-align: center;">
								일치하는 회원이 없습니다
							</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="memberBoardDto" items="${memberList}">
							<tr>
								<td class="cell2">
									<c:if test="${memberBoardDto.member_grade==0}">
										<input type="checkbox" name='member_chk' class="checkbox" value="${memberBoardDto.member_no}">
									</c:if>
								</td>
								<td class="cell2">
									${memberBoardDto.member_no}
								</td>
								<td class="cell2">
									<a href="./listOneAdmin.do?member_no=${memberBoardDto.member_no}&curPage=${pagingMap.paging.curPage}">
										${memberBoardDto.member_nick}</a></td>
								<td class="cell2">${memberBoardDto.member_email}</td>
								<c:choose>
									<c:when test="${empty memberBoardDto.board_cnt}">
										<td id="board_cnt" class="cell2">0</td>
									</c:when>
									<c:otherwise>
										<td id="board_cnt" class="cell2">${memberBoardDto.board_cnt}</td>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${empty memberBoardDto.like_cnt}">
										<td id="like_cnt" class="cell2">0</td>
									</c:when>
									<c:otherwise>
										<td id="like_cnt" class="cell2">${memberBoardDto.like_cnt}</td>
									</c:otherwise>
								</c:choose>
								
								<td class="cell2">
									<h5><fmt:formatDate value="${memberBoardDto.member_cre_date}" 
										pattern="yyyy.MM.dd"/></h5>
									<h5><fmt:formatDate value="${memberBoardDto.member_cre_date}" 
										pattern="hh:mm"/></h5>
								</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				</table>
			</div>
			</form>

			<jsp:include page="/WEB-INF/views/common/paging.jsp">
				<jsp:param value="${pagingMap}" name="pagingMap"/>
			</jsp:include>
		
			<form action="./listAdmin.do" id='pagingForm' method="get">
				<input type="hidden" id='curPage' name='curPage' 
					value="${pagingMap.paging.curPage}">
			</form>
			
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>