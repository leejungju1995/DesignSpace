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
		#innerWrap{
			padding-bottom: -180px;
		}
		#topMenu{
			display: inline-flex;
		}
		#topMenu select{
			width: 130px;
		 	height: 50px;
		 	vertical-align: middle;
		 	font-size: 17px;
		 	margin: auto;
		 	text-align-last: center; 
		}
		#topMenu input{
			width: 420px;
			height: 50px;
			box-sizing: border-box;
		}
		#topMenu select{
			cursor: pointer;
		}
		#topCategory{
			margin-left: 100px;
			margin-right: 550px;
		}
		#topCategory button{
			width: 100px;
			height: 50px;
			border-style: none;			
			border-radius: 5px;
			background-color: #60524E;
			font-size: 13px;
			color: #fff;
			cursor: pointer;
		}
		#topCategory button:hover{
			background-color: #4AD674;
		}
		#searchBtn{
		 	width: 50px;
		 	height: 50px;
		 	background-color: #60524E;
		 	border-style: none;
		 	border-radius: 5px;
		 	vertical-align: middle;
		}
		#projectView{
			display: inline-table;
			margin-top: 20px;
		}
		.projectList{
			margin: 0px 10px 20px;
			display: inline-block;
			width: 320px;
		}
		.projectList .thumbnailPic{
			position: relative;
			overflow: hidden;
			width: 320px;
			height: 250px;
			border-radius: 5px;
			background-repeat: no-repeat;
			background-position: center;
			background-size: cover;
			cursor: pointer;
		}
		.projectList .thumbnailPic div{
			position: absolute;
			left: 0px;
			bottom: 0px;
			width: 100%;
			height: 60px;
			box-sizing: border-box;
			color: #fff;
			font-weight: bold;
			padding-top: 30px;
			padding-left: 10px;
			background: -webkit-gradient(linear, left top, left bottom, from(transparent), color-stop(81%, rgba(0, 0, 0, 0.6)));
    		background: linear-gradient(to bottom, transparent 0%, rgba(0, 0, 0, 0.6) 81%);
    		opacity: 0;
    		transition: all 0.3s;
		}
		.projectList .thumbnailPic img{
			position: absolute;
			right: 10px;
			top: 10px;
			width: 32px;
			height: 32px;
    		opacity: 0;
    		transition: all 0.3s;
		}
		.projectList img{
			vertical-align: middle;
		}
		.projectList .profilePic{
			width: 30px;
			height: 30px;
			border-radius: 50%;
			margin: 5px auto;
			background-repeat: no-repeat;
			background-position: center;
			background-size: cover;
			display: inline-block;
			vertical-align: middle;
		}
		.projectList .profileNic{
			display: inline-block;
			vertical-align: middle;
			font-weight: bold;
			width: 150px;
			overflow: hidden;
			white-space: nowrap;
			text-overflow: ellipsis;
		}
		.projectList .thumbnailPic .hoverTitle{
			opacity: 1.0;
		}
		.profileNic a{
			text-decoration: none;
			color: #000;
		}
		.profileNic a:hover{
			text-decoration: underline;
		}
	</style>
	
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-3.5.1.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/script.js"></script>
	
	<script type="text/javascript">
		$(document).ready(function() {
			$('.thumbnailPic').hover(function() {
				$(this).children().addClass('hoverTitle');
			}, function() {
				$(this).children().removeClass('hoverTitle');
			});
		});	
		
		function sortOptionChangeFnc(e) {
			var sortOption = document.getElementById('sortOption');
			
			if(e.value == "project_board_no"){
				sortOption.value = e.value;
			}else if(e.value == "project_board_like"){
				sortOption.value = e.value;
			}else if(e.value == "project_board_views"){
				sortOption.value = e.value;
			}
			
			var curPage = document.getElementById('curPage');
			curPage.value = 1;
			
			var pagingForm = document.getElementById('pagingForm'); 
			pagingForm.submit();						
		}
		
		function categoryOptionChangeFnc(obj) {
			var categoryOption = document.getElementById('categoryOption');
			var searchOption = document.getElementById('searchOption');
			var keyword = document.getElementById('keyword');
			
			categoryOption.value = obj.value;
			searchOption.value = "member_nick";
			keyword.value = "";
			
			var curPage = document.getElementById('curPage');
			curPage.value = 1;
			
			var pagingForm = document.getElementById('pagingForm'); 
			pagingForm.submit();					
		}
		
		function detailViewFnc(projectBoardNo) {
			var projectBoardNo = projectBoardNo;
			var curPageObj = document.getElementById('curPage');
			var categoryOptionObj = document.getElementById('categoryOption');
			var sortOptionObj = document.getElementById('sortOption');
			var searchOptionObj = document.getElementById('searchOption');
			var keywordObj = document.getElementById('keyword');
			
			
			var str = "./projectView.do";			
			str += "?project_board_no=" + projectBoardNo;
			str += "&curPage=" + curPageObj.value;
			str += "&categoryOption=" + categoryOptionObj.value;
			str += "&sortOption=" + sortOptionObj.value;
			str += "&searchOption=" + searchOptionObj.value;
			str += "&keyword=" + keywordObj.value;
			str += "&chkPage=0";
			
			
			location.href = str;
		}
	</script>
</head>

<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>	
	
	<div id="wrap">
		<div id="innerWrap">	
			
<!-- 			검색, 카테고리 선택, 정렬방법 -->
			<div id="topMenu">
				<form action="./list.do" method="get" style="display: table;">
					<select name="searchOption">
						<c:choose>
							<c:when test="${listOptionMap.searchOption eq 'member_nick'}">
								<option value="member_nick" selected="selected">작성자</option>
								<option value="project_board_title">제목</option>
							</c:when>
							<c:when test="${listOptionMap.searchOption eq 'project_board_title'}">
								<option value="member_nick">작성자</option>
								<option value="project_board_title" selected="selected">제목</option>
							</c:when>
						</c:choose>						
					</select>
					<input type="text" name="keyword" value="${listOptionMap.keyword}">
					<button id="searchBtn" type="submit"><img src="<%=request.getContextPath()%>/resources/img/iconSearch.png"></button>
				</form>
				
				<div id="topCategory">
					<button onclick="categoryOptionChangeFnc(this);" value="all">전체</button>
					<button onclick="categoryOptionChangeFnc(this);" value="pic">사진</button>
					<button onclick="categoryOptionChangeFnc(this);" value="ill">일러스트</button>
				</div>
				
				<select onchange="sortOptionChangeFnc(this);">
					<c:choose>
						<c:when test="${listOptionMap.sortOption eq 'project_board_like'}">
							<option value="project_board_no">최신순</option>
							<option value="project_board_like" selected="selected">좋아요</option>
							<option value="project_board_views">조회수</option>
						</c:when>
						<c:when test="${listOptionMap.sortOption eq 'project_board_views'}">
							<option value="project_board_no">최신순</option>
							<option value="project_board_like">좋아요</option>
							<option value="project_board_views" selected="selected">조회수</option>
						</c:when>
						<c:otherwise>
							<option value="project_board_no" selected="selected">최신순</option>
							<option value="project_board_like">좋아요</option>
							<option value="project_board_views">조회수</option>
						</c:otherwise>					
					</c:choose>					
				</select>
			</div>
			
<!-- 			프로젝트 조회 -->		
			<div id="projectView">
				<c:if test="${empty projectBoardList}">
					작품이 존재하지 않습니다.
				</c:if>
				<c:forEach var="projectBoardDto" items="${projectBoardList}">
					<div class="projectList">
						<div class="thumbnailPic" onclick="detailViewFnc(${projectBoardDto.project_board_no});"
							 style="background-image: url(<c:url value='/projectImg/${projectBoardDto.FILE_TABLE_STORED_FILE_NAME}'/>);">
							<c:choose>
								<c:when test="${projectBoardDto.project_board_category eq 'p'}">
									<img src="<%=request.getContextPath()%>/resources/img/pIcon.png">
								</c:when>
								<c:when test="${projectBoardDto.project_board_category eq 'i'}">
									<img src="<%=request.getContextPath()%>/resources/img/iIcon.png">
								</c:when>
							</c:choose>
							<div>
								<a>${projectBoardDto.project_board_title}</a>
							</div>
						</div>						
						<div style="float: left;">
							<div class="profilePic" style="background-image: url(<c:url value='/profileImg/${projectBoardDto.PROFILE_TABLE_STORED_NAME}'/>);"></div>						
							<span class="profileNic"><a href="../member/myBoard.do?mno=${projectBoardDto.project_board_mno}">${projectBoardDto.member_nick}</a></span>
						</div>												
						<div style="float: right; padding-top: 10px;">
							<img src="<%=request.getContextPath()%>/resources/img/iconLike.png">
							<span>${projectBoardDto.project_board_like}</span>
							<img src="<%=request.getContextPath()%>/resources/img/iconView.png">
							<span>${projectBoardDto.project_board_views}</span>
						</div>						
					</div>
				</c:forEach>
			</div>	
<!-- 			프로젝트 페이징 -->

			<div id="paging">
				<jsp:include page="/WEB-INF/views/common/projectBoardPaging.jsp">
					<jsp:param value="${projectBoardPaging}" name="projectBoardPaging"/>
					<jsp:param name="chkPage" value="list"/>
				</jsp:include>				
				
				<form action="./list.do" id='pagingForm' method="get">
					<input type="hidden" id='curPage' name='curPage' 
						value="${projectBoardPaging.curPage}">
					<input type="hidden" id='categoryOption' name="categoryOption" 
						value="${listOptionMap.categoryOption}">
					<input type="hidden" id='sortOption' name='sortOption'
						value="${listOptionMap.sortOption}">										
					<input type="hidden" id='searchOption' name="searchOption" 
						value="${listOptionMap.searchOption}">
					<input type="hidden" id='keyword' name='keyword'
						value="${listOptionMap.keyword}">										
				</form>
			</div>
			
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>