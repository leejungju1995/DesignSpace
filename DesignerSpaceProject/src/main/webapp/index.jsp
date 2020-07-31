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
	
		#indexPage{
			width: 1500px;
			margin: auto;
			background-color: #fff;
			box-shadow: 5px 5px 20px rgba(0,0,0,0.3);
			border-radius: 5px;
		}
		
		#goLoginBtn{
			width: 150px;
			height: 100px;
			margin-top: 100px;
			border-radius: 5px;
			border: none;
			cursor: pointer;
			font-size: 20px;
			font-weight: bold;
		}
		
		#goLoginBtn:hover{
			color: #fff;
			background-color: #4AD674;
		}
		
		#welcomeDiv{
			width: 440px;
			height : 340px;
   			color: #fff;
   			padding: 80px 30px;
   			text-align: center;
   			background-color: black;
   			float: left;
   			
   			font-size: 30px;
   			line-height: 60px;
   			font-weight: bold;
		}
		.img{
			 width: 500px; 
			 height:500px;  
			 vertical-align: bottom;
		}
	
	</style>



	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-3.5.1.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/script.js"></script>

	<script type="text/javascript">
	
		var imgArray = new Array ();
	
		
		imgArray[0] = "<%=request.getContextPath()%>/resources/img/index/index1.jpg";
		imgArray[1] = "<%=request.getContextPath()%>/resources/img/index/index2.jpg";
		imgArray[2] = "<%=request.getContextPath()%>/resources/img/index/index3.jpg";
		imgArray[3] = "<%=request.getContextPath()%>/resources/img/index/index4.jpg";
		imgArray[4] = "<%=request.getContextPath()%>/resources/img/index/index5.jpg";
		imgArray[5] = "<%=request.getContextPath()%>/resources/img/index/index6.jpg";
		imgArray[6] = "<%=request.getContextPath()%>/resources/img/index/index7.jpg";
		imgArray[7] = "<%=request.getContextPath()%>/resources/img/index/index8.jpg";
	
	
	
	
		function showImage(){
			
			for (var i = 1; i <= 2; i++) {
				
				var imgNum = Math.round(Math.random()*7);
				var objImg = document.getElementById("indexImg"+i);
				objImg.src = imgArray[imgNum];
			
			}
			
		}
	
	
	</script>



</head>


<body onload="showImage()">

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>	

	<div id="wrap">
		<div id="innerWrap">	
			<div id="indexPage">
			
			<img id = "indexImg1" class="img" style="float: left">
			
			<div id="welcomeDiv">
				<p>WELCOME</p>
				<p>DESIGNER'S SPACE</p>
				<input type="button" id="goLoginBtn" value="로그인" 
					onclick="location.href='<%=request.getContextPath()%>/login.do'">
			</div>
			
			<img id = "indexImg2" class="img">
			
			
			
			
			
			</div>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>	

</body>
</html>