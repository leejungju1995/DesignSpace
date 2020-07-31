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
		#innerWrap {
			font-size: 20px;
			font-weight: bold;
			color: #60524E;
		}
		.input {
			padding : 0px 10px;
			width: 276px;
			height: 30px;
			margin-top : 10px;
			margin-bottom: 30px;
			border-radius: 5px;
			border: 1px solid #60524E
		}
		#button {
			width: 300px;
			height: 35px;
			color: #FFFFFF;
			margin-bottom: 10px;
			background-color: #60524E;
			font-weight: bold;
			border: 0px;
			border-radius: 5px;
			cursor: pointer;
		}
		#cancel{
			width: 300px;
			height: 35px;
			margin-bottom: 10px;
			font-weight: bold;
			border: 1px solid #000;
			border-radius: 5px;
			cursor: pointer;
			background-color: #fff;
			color: #000
		}
		
		#button:hover{
			background-color: #4AD674;
		}
		#cancel:hover{
			color: #fff;
			background-color: #4AD674;
			border: none;
		}

		.input_span{
			color: #60524E;
			font-size: 20px;
			font-weight: bold;
		}
		#find_id_div{
			width : 300px;
 			text-align: left; 
			margin: auto;
		}	
	</style>


	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-3.5.1.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/script.js"></script>
	

	<script type="text/javascript">
		function backMoveFnc() {
			location.href='<%=request.getContextPath()%>/login.do';
		}
		
		function findIdOrderFnc() {
			
			var findIdForm = document.findIdForm;
			var name = document.getElementById("input_name");
			var phone = document.getElementById("input_phone");
			
		    

			if (name.value==""||name.value==null) {
				alert('성명을 입력해주세요');
				name.focus();
				return false;
			}else if(phone.value==""||phone.value==null){
				alert('전화번호를 입력해주세요');
				phone.focus();
				return false;
			}else{
				findIdForm.submit();
			}
		}
	</script>

</head>

<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>	
	
	<div id="wrap">
		<div id="innerWrap">
			
			
				
			<div style="margin-bottom: 80px; text-align: center;">
				<span style="font-size: 50px;">아이디찾기</span><br>
			</div>
			
			<div id="find_id_div">
				<form name="findIdForm" action="findIdCtr.do" method="post">
					<span class="input_span">이름</span>
					<input type="text" class="input" id="input_name" name="member_name"
						maxlength="10" placeholder="이름을 입력해주세요"><br>
					<span class="input_span">휴대폰번호</span>
					<input type="text" class="input" id="input_phone" name="member_phone" 
						placeholder=" '-'을 제외한 숫자만 입력" maxlength="15"
						onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/><br>
					<input type="button" id="button" value="아이디찾기" onclick="findIdOrderFnc()"
						style="margin-top: 50px;">
				</form>
					<input type="button" id="cancel" value="취소" onclick="backMoveFnc()">
					
			</div>
			
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>