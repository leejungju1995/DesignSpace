<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

	#errorTitle{
		 margin-top: 30px; 
		 margin-bottom: 30px;
		 font-weight: bold;
		 font-size: 30px;
		 color: #FF0000;
		 text-align: center;
	}
	
	#backBtn{
		width : 100px;
		height : 40px;
		margin: auto;
	}
	
	#errorContext{
		padding-left : 50px;
		line-height: 20px;
		margin-bottom: 30px;
	}
	
	#backBtn{
		margin : auto;
		text-align: center;
		color: white;
		width: 120px;
		height: 40px;
		font-size: 15px;
		background-color: #7D7471;
		border-radius: 5px;
		border: none;
		cursor: pointer;
	}
	
	#backBtn:hover{
		color: #fff;
		background-color: #4AD674;
	}
</style>


<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resources/js/script.js"></script>

<script type="text/javascript">

	function backBtnFnc() {
		history.back();
	}
	
</script>


</head>

<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<div id="wrap">
		<div id="innerWrap">
			<div id="innerPage" style="padding : 80px 0px;">
				
				<div style=" width: 600px; margin: auto;" >
				
					
					<img alt="error" src="<%=request.getContextPath()%>/resources/error/dreamBug.jpeg"
						style="width: 600px;">
					<div id="errorTitle">
						<p>페이지를 찾을 수 없습니다</p>
					</div>
					<div id="errorContext">
						방문하시려는 페이지의 주소가 잘못 입력되었거나,<br>
						페이지의 주소가 변경 혹은 삭제되어 요청하신 페이지를 찾을 수 없습니다.<br>
						입력하신 주소가 정확한지 다시 한번 확인해 주시기 바랍니다.
					</div>
					<div style="width: 120px; margin: auto;">
					<button id="backBtn" onclick="backBtnFnc();">이전 페이지로</button>
					</div>
					
					
				</div>
				
			</div>	
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
</html>