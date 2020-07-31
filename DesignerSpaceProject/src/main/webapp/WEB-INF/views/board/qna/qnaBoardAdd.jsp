<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/reset.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/style.css">

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
	}
	
	#resetButton{
		 text-align: center; 
		 width: 150px; 
		 height: 50px; 
		 background-color: #60524E; 
		 color: white;" 
	}
</style>

	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-3.5.1.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/script.js"></script>

<script type="text/javascript">
	function pageMoveListFnc() {
		location.href = './list.do';
	}
	
	function checkAddFnc() {
		if($('#title').val() == '') {
			alert('제목을 입력해주세용');
			return false;
		}else if($('#contents').val() == ''){
			alert('내용을 입력해주세용');
			return false;
		}else{	
			return true;
		}
	}
	
	$(document).ready(function () {
		
		$('#title').keyup(function(e) {
			var title = $(this).val();
			if(title.length > 30){
				alert('제목은 최대 30자까지입니다');
				$(this).val(title.substring(0, 20));
			}
		})
		
		$('#contents').keyup(function (e){
			var content = $(this).val();
			$('#numCount').html("("+content.length+" / 최대 200자)");
			
			if(content.length > 200){
				alert('내용은 최대 200자까지입니다');
				$(this).val(content.substring(0, 200));
				$('#numCount').html("(200 / 최대 200자)");
			}
		});
	});
</script>

</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
	<div id="wrap">
		<div id="innerWrap">
			<div id='boardTitle'>
				QnA 글작성
			</div>
			
			<div id="innerPage" style="height: 809px; margin-top: 40px;">
				<form action='./addCtr.do' name='qnaBoardDto' onsubmit="return checkAddFnc();" method='post'>
					<br>
					<br>
					<br>
					<br>
					<div style="margin-left: 200px;">
						<span style="width: 200px;">작성자</span>
						<span style="margin-left: 100px;">${memberDto.member_nick}</span>
						<input type="hidden" name="qna_board_mno" value="${memberDto.member_no}">
					</div>
					<br>
					<hr>
					<br>
					<br>
					<div style="margin-left: 200px;">
						<span style="width: 200px;">제목</span>
						<input type="text" id='title' name="qna_board_title" placeholder="제목을 입력해 주세요" 
							style="margin-left: 117px; width: 850px; height: 50px;">
					</div>
					<br>
					<hr>
					<br>
					<br>
					<div style="margin-left: 200px; height: 400px;">
						<span style="width: 200px; margin-top: 0px;">질문내용</span>
						<textarea id="contents" name="qna_board_contents" style="margin-left: 86px; 
							vertical-align: top;" cols="115" rows="25"></textarea>
						<br>
						<span id="numCount" style="margin-left: 123px">(0 / 최대 200자)</span>
					</div>
					<br>
					<hr>
					<br>
					<br>
					<div style="text-align: center;">
						<input type="submit" value="작성완료" id='writeCompleteButton'>
						<input type="button" value="취소" id='resetButton' onclick="pageMoveListFnc();">
					</div>
				</form>	
			</div>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>