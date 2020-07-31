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
		#wrap{
			background:none;
		}
		
		#buttonWrap{
			text-align: center;
			padding: 50px 0px;			
		}
		
		#buttonWrap button{
			width: 390px;
			height: 150px;
			border: 1px solid #60524E;
			border-radius: 5px;
			background: none;
			vertical-align: top;
			margin: 0px 10px;
			display: inline-block;
			outline: none;
			font-size: 22px;
			font-weight: bold;
			color: #60524E;
			cursor: pointer;
		}
		
		#buttonWrap img{
			vertical-align: middle;
			padding-right: 15px; 
		}
	</style>
	 
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-3.5.1.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/script.js"></script>

</head>

<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>	
	
	<div id="wrap">
		<img style="display: block; width: 100%; padding-top: 100px;" src="<%=request.getContextPath()%>/resources/img/mainBackground.png">
		
		<div id="buttonWrap">
			<button onclick="location.href='<%=request.getContextPath()%>/projectBoard/add.do?chkPage=0'"><img src="<%=request.getContextPath()%>/resources/img/editIcon.png" style="width: 32px; vertical-align: -7px;">작품작성</button>
			<button onclick="location.href='<%=request.getContextPath()%>/member/myBoard.do?mno=${memberDto.member_no}'"><img src="<%=request.getContextPath()%>/resources/img/userIcon.png">내 작품목록</button>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>	
	
</body>
</html>