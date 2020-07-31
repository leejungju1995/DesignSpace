<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Designer's Space</title>

	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/reset.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/style.css">
	
	<style type="text/css">
		#innerWrap{
			padding: 230px 0px 50px;
		}
		
		#buttonWrap{
			width: 1300px;
			text-align: center;
			padding: 50px 0px;
			margin: 0px auto;			
		}
		
		#buttonWrap button{
			width: 390px;
			height: 150px;
			border: 1px solid #60524E;
			border-radius: 5px;
			vertical-align: top;
			margin: 30px 10px;
			display: inline-block;
			outline: none;
			font-size: 22px;
			font-weight: bold;
			color: #60524E;
			cursor: pointer;
			background-color: #fff;
			position: relative;
		}
		
		#buttonWrap img{
			vertical-align: middle;
			padding-right: 15px; 
		}
		
		#buttonWrap span{
			position: absolute;
			bottom: 15px;
			right: 30px;
			font-size: 15px;
			font-weight: bold;
			color: red;			
		}
	</style>
	
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-3.5.1.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/script.js"></script>
	
</head>

<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>	
	
	<div id="wrap">
		<div id="innerWrap">
			<div id="buttonWrap">
				<button onclick="location.href='<%=request.getContextPath()%>/projectBoard/management.do'"><img src="<%=request.getContextPath()%>/resources/img/editIcon.png" style="width: 32px; vertical-align: -7px;">
				작품 관리
				<span>전체 작품 : ${infoListMap.PBLIST}</span></button>
				<button onclick="location.href='<%=request.getContextPath()%>/freeBoard/free.do'"><img src="<%=request.getContextPath()%>/resources/img/iconImage.png">
				자유게시판 관리
				<span>전체 게시글 : ${infoListMap.FBLIST}</span></button>
				<button onclick="location.href='<%=request.getContextPath()%>/admin/listAdmin.do'"><img src="<%=request.getContextPath()%>/resources/img/userIcon.png">
				회원 관리
				<span>전체 회원 : ${infoListMap.MLIST}</span></button>
				<button onclick="location.href='<%=request.getContextPath()%>/qnaBoard/list.do'"><img src="<%=request.getContextPath()%>/resources/img/iconBox.png">
				QnA 관리
				<span>접수중 문의 : ${infoListMap.QBLIST}</span></button>
				<button onclick="location.href='<%=request.getContextPath()%>/reportBoard/list.do'"><img src="<%=request.getContextPath()%>/resources/img/iconInfo.png">
				신고글 관리
				<span>접수중 신고 : ${infoListMap.RBLIST}</span></button>
				<button onclick="location.href='<%=request.getContextPath()%>/member/info.do'"><img src="<%=request.getContextPath()%>/resources/img/iconProfile.png">
				관리자정보 수정</button>
			</div>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>