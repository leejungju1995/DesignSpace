<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>게시판등록</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/style.css">

<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/script.js"></script>

<style type="text/css">
	#boardTitle{
		font-size: 80px;
		font-weight: bold;
		color: #7D7471;
		text-align: center;
	}
	
	#listButton{
		margin-bottom: 50px;
		width: 150px; 
		height: 50px;
		margin-top: -40px; 
		text-align: center; 
		font-size: 20px; 
		background-color: #7D7471;
		color: white; 
		border-collapse: collapse;
	}
	
	#listButton:hover{
		margin-bottom: 50px;
		width: 150px; 
		height: 50px;
		margin-top: -40px; 
		text-align: center; 
		font-size: 20px; 
		background-color: #7D7500;
		color: white; 
		border-collapse: collapse;
	}
	
	
	hr{
		text-align: center;
		width: 80%;
	} 
	
	#writeCompleteButton{
		 text-align: center; 
		 width: 150px; 
		 height: 50px; 
		 background-color: #60524E; 
		 color: white;"
		 box-shadow: none;
	}
	
	#resetButton{
		 text-align: center; 
		 width: 150px; 
		 height: 50px; 
		 background-color: #60524E; 
		 color: white;"
		 box-shadow: none;
	}
	
	textarea {
		resize: none;
	}
	
</style>

<script type="text/javascript">
	
	function pageMoveListFnc(){
		location.href = './free.do';
	}
	
	function checkAddFnc() {
		if($('#title').val() == '') {
			alert('제목을 입력해주세요');
			return false;
		}else if($('#contents').val() == ''){
			alert('내용을 입력해주세요');
			return false;
		}else{	
			return true;
		}
	}
	
	$(document).ready(function () {
		
		$('#title').keyup(function(e) {
			var title = $(this).val();
			if(title.length > 50){
				alert('제목은 최대 50자까지입니다');
				$(this).val(title.substring(0, 50));
			}
		})
		
		
		
		$('#contents').keyup(function (e){
			var content = $(this).val();
			$('#numCount').html("("+content.length+" / 최대 1000자)");
			
			if(content.length > 1000){
				alert('내용은 최대 1000자까지입니다.');
				$(this).val(content.substring(0, 1000));
				$('#numCount').html("(1000 / 최대 1000자)");
			}
		});
	});
	
	
	
	
		
	
</script>

</head>

<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>	
	<div id="wrap">
		<div id="innerWrap">
			<div id='boardTitle'>자유게시판  글작성</div>
				<div id="innerPage" style="height: 809px; margin-top: 40px;">
					<form action='./freeBoardAddCtr.do' onsubmit="return checkAddFnc();" method='post' 
						enctype="multipart/form-data">
						<br>
						<br>
						<br>
						<br>
						<div style="margin-left: 200px;">
							<input type="hidden" id="mno" name="mno" value="${memberDto.member_no}">
							<span style="width: 200px;">작성자</span>
							<span id="writer" style="margin-left: 80px;">${memberDto.member_nick}</span>
						</div>
						<br>
						<hr>
						<br>
						<br>
						<div style="margin-left: 200px;">
							<span style="width: 200px;">제목</span>
							<input type='text' style="margin-left: 86px;
								width: 780px; height: 50px;"  placeholder="제목을 입력해 주세요" id="title" name='title'>
							
						</div>
						<br>
						<hr>
						<br>
						<br>
						<div style="margin-left: 200px; height: 400px;">
							<span style="width: 200px;">내용</span>
							<textarea id="contents" name='contents'
							placeholder="최대 1000자까지 입력해주세요" style="margin-left: 86px; 
								vertical-align: top;" cols="115" rows="25"></textarea>
							<br>
							<span id="numCount" style="margin-left: 123px">(0 / 최대 1000자)</span>
						</div>
						<br>
						<hr>
						<br>
						<br>
						<div style="text-align: center;">
							<input style="cursor: pointer;" type='submit' value='작성완료' id='writeCompleteButton'>
							<input style="cursor: pointer;" type='button' value='취소' id='resetButton' onclick="pageMoveListFnc();">
						</div>
					</form>
				</div>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>	
</body>
</html>

