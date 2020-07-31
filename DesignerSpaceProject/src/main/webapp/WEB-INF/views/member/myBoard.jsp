<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Designer's Space</title>

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/style.css">

<style type="text/css">
#innerWrap {
	padding-bottom: -180px;
	overflow: hidden;
	position: relative;
	min-height: 1000px;
}

#topMenu {
	margin-left: 10px;
	display: inline-flex;
}

#topMenu select {
	width: 130px;
	height: 50px;
	vertical-align: middle;
	font-size: 17px;
	margin: auto;
	text-align-last: center;
}

#topMenu input {
	width: 420px;
	height: 50px;
	box-sizing: border-box;
}

#topCategory {
	margin-left: 50px;
	margin-right: 50px;
}

#topCategory button {
	width: 100px;
	height: 50px;
	border-style: none;
	border-radius: 5px;
	background-color: #60524E;
	font-size: 13px;
	color: #fff;
	cursor: pointer;
}

#topCategory button:hover {
	background-color: #4AD674;
}

#searchBtn {
	width: 50px;
	height: 50px;
	background-color: #60524E;
	border-style: none;
	border-radius: 5px;
	vertical-align: middle;
}

#projectView {
	display: inline-table;
	margin-top: 20px;
}

.projectList {
	margin: 0px 80px 20px 10px;
	display: inline-block;
	width: 320px;
}

.projectList .thumbnailPic {
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

.projectList .thumbnailPic div {
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
	background: -webkit-gradient(linear, left top, left bottom, from(transparent),
		color-stop(81%, rgba(0, 0, 0, 0.6)));
	background: linear-gradient(to bottom, transparent 0%, rgba(0, 0, 0, 0.6)
		81%);
	opacity: 0;
	transition: all 0.3s;
}

.projectList .thumbnailPic img {
	position: absolute;
	right: 10px;
	top: 10px;
	width: 32px;
	height: 32px;
	opacity: 0;
	transition: all 0.3s;
}

.projectList img {
	vertical-align: middle;
}

.projectList .profilePic {
	width: 30px;
	height: 30px;
	border-radius: 50%;
	margin: 5px auto;
	background-repeat: no-repeat;
	background-position: center;
	background-size: cover;
	vertical-align: middle;
	display: inline-block;
}

#myInfoArea .profilePic {
	width: 150px;
	height: 150px;
	border-radius: 50%;
	margin: 5px auto;
	background-repeat: no-repeat;
	background-position: center;
	background-size: cover;
	vertical-align: middle;
}

#myInfoArea span {
	display: block;
}

.projectList .profileNic {
	display: inline-block;
	vertical-align: middle;
	font-weight: bold;
	width: 150px;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}

.projectList .thumbnailPic .hoverTitle {
	opacity: 1.0;
}

#myInfoArea {
	width: 350px;
	height: 500px;
	float: left;
	background-color: #E2E2E2;
	border: 3px solid #fff;
	padding: 30px 50px;
	text-align: center;
	position: relative;
	box-sizing: border-box;
}

#myProjectArea {
	width: 1250px;
	float: right;
}

#paging {
	position: absolute;
	bottom: 50px;
	left: 50%;
}

#createBox {
	color: #C2C2C2;
	float: left;
	background-color: transparent;
	border: 5px dashed #7B8084;
	width: 350px;
	height: 150px;
	box-sizing: border-box;
	text-align: center;
	padding-top: 55px;
	position: absolute;
	top: 750px;
	cursor: pointer;
}

#createBox>a {
	font-size: 22px;
	font-weight: bold;
}
</style>

<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/script.js"></script>

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
		var searchOption = document.getElementById('searchOption');
		var searchOptionObj = document.getElementById('searchOptionObj');
		var keyword = document.getElementById('keyword');
		var keywordObj = document.getElementById('keywordObj');
		
		searchOption.value = searchOptionObj.value;
		keyword.value = keywordObj.value;

		if (e.value == "project_board_no") {
			sortOption.value = e.value;
		} else if (e.value == "project_board_like") {
			sortOption.value = e.value;
		} else if (e.value == "project_board_views") {
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
		var searchOptionObj = document.getElementById('searchOptionObj');
		var keyword = document.getElementById('keyword');
		var keywordObj = document.getElementById('keywordObj');

		categoryOption.value = obj.value;
		searchOption.value = searchOptionObj.value;
		keyword.value = keywordObj.value;

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
		
		
		var str = "../projectBoard/detail.do";			
		str += "?project_board_no=" + projectBoardNo;
		str += "&curPage=" + curPageObj.value;
		str += "&categoryOption=" + categoryOptionObj.value;
		str += "&sortOption=" + sortOptionObj.value;
		str += "&searchOption=" + searchOptionObj.value;
		str += "&keyword=" + keywordObj.value;
		str += "&chkPage=1";
		
		
		location.href = str;
	}
</script>

</head>

<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<div id="wrap">
		<div id="innerWrap">

			<div id="myInfoArea">
				<div class="profilePic"
					style="background-image: url(<c:url value='/profileImg/${myMemberDto.profile_table_stored_name}'/>);"></div>
				<span style="font-size: 22px; font-weight: bold; margin-top: 30px;">${myMemberDto.member_nick}</span>
				<span
					style="font-size: 18px; color: #A3A3A3; font-weight: bold; margin-top: 20px;">${myMemberDto.member_email}</span>
				<span style="font-size: 15px; margin-top: 40px; text-align: left;">${myMemberDto.member_comments}</span>
				<span
					style="font-size: 15px; margin-top: 40px; color: #707070; position: absolute; bottom: 30px; left: 80px;">가입일
					: <fmt:formatDate value="${myMemberDto.member_cre_date}"
						pattern="yyyy년 MM월 dd일" />
				</span>
			</div>
			<c:choose>
				<c:when test="${memberDto.member_no eq  mno}">
					<div id="createBox" onclick="location.href='../projectBoard/add.do?chkPage=1'">
						<a>작품작성</a>
					</div>	
				</c:when>
			</c:choose>			

			<div id="myProjectArea">
				<!-- 			검색, 카테고리 선택, 정렬방법 -->
				<div id="topMenu">
					<form action="./myBoard.do" method="get" style="display: table;">
					<input type="hidden" name="mno" value="${memberDto.member_no}">
						<select id="searchOptionObj" name="searchOption">
							<c:choose>
								<c:when
									test="${listOptionMap.searchOption eq 'project_board_title'}">
									<option value="project_board_title" selected="selected">제목</option>
									<option value="all">제목+내용</option>
									<option value="project_board_contents">내용</option>
								</c:when>
								<c:when test="${listOptionMap.searchOption eq 'all'}">
									<option value="project_board_title">제목</option>
									<option value="all" selected="selected">제목+내용</option>
									<option value="project_board_contents">내용</option>
								</c:when>
								<c:when
									test="${listOptionMap.searchOption eq 'project_board_contents'}">
									<option value="project_board_title">제목</option>
									<option value="all">제목+내용</option>
									<option value="project_board_contents" selected="selected">내용</option>
								</c:when>
							</c:choose>
						</select> <input type="text" id="keywordObj" name="keyword"
							value="${listOptionMap.keyword}">
						<button id="searchBtn" type="submit">
							<img
								src="<%=request.getContextPath()%>/resources/img/iconSearch.png">
						</button>
					</form>

					<div id="topCategory">
						<button onclick="categoryOptionChangeFnc(this);" value="all">전체</button>
						<button onclick="categoryOptionChangeFnc(this);" value="pic">사진</button>
						<button onclick="categoryOptionChangeFnc(this);" value="ill">일러스트</button>
					</div>

					<select onchange="sortOptionChangeFnc(this);">
						<c:choose>
							<c:when
								test="${listOptionMap.sortOption eq 'project_board_like'}">
								<option value="project_board_no">최신순</option>
								<option value="project_board_like" selected="selected">좋아요</option>
								<option value="project_board_views">조회수</option>
							</c:when>
							<c:when
								test="${listOptionMap.sortOption eq 'project_board_views'}">
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
					<c:forEach var="projectBoardDto" items="${projectBoardList}">
						<div class="projectList">
							<div class="thumbnailPic"
								onclick="detailViewFnc(${projectBoardDto.project_board_no});"
								style="background-image: url(<c:url value='/projectImg/${projectBoardDto.FILE_TABLE_STORED_FILE_NAME}'/>);">
								<c:choose>
									<c:when test="${projectBoardDto.project_board_category eq 'p'}">
										<img
											src="<%=request.getContextPath()%>/resources/img/pIcon.png">
									</c:when>
									<c:when test="${projectBoardDto.project_board_category eq 'i'}">
										<img
											src="<%=request.getContextPath()%>/resources/img/iIcon.png">
									</c:when>
								</c:choose>
								<div>
									<a>${projectBoardDto.project_board_title}</a>
								</div>
							</div>
							<div style="float: left;">
								<div class="profilePic"
									style="background-image: url(<c:url value='/profileImg/${projectBoardDto.PROFILE_TABLE_STORED_NAME}'/>);"></div>
								<span class="profileNic">${projectBoardDto.member_nick}</span>
							</div>
							<div style="float: right; padding-top: 10px;">
								<img
									src="<%=request.getContextPath()%>/resources/img/iconLike.png">
								<span>${projectBoardDto.project_board_like}</span> <img
									src="<%=request.getContextPath()%>/resources/img/iconView.png">
								<span>${projectBoardDto.project_board_views}</span>
							</div>
						</div>
					</c:forEach>
				</div>

			</div>

			<!-- 			프로젝트 페이징 -->
			<div id="paging">
				<jsp:include page="/WEB-INF/views/common/projectBoardPaging.jsp">
					<jsp:param value="${projectBoardPaging}" name="projectBoardPaging"/>
					<jsp:param name="chkPage" value="my"/>
				</jsp:include>

				<form action="./myBoard.do" id='pagingForm' method="get">
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
					<input type="hidden" name="mno" value="${mno}">
				</form>
			</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
</html>