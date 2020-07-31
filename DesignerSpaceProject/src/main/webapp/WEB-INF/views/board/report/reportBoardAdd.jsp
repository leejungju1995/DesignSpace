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
		var noObj = $('#report_board_no').val();
		
		location.href = '../projectBoard/detail.do?project_board_no=' + noObj;
	}
	
	function checkAddFnc() {
		if($('#title').val() == '') {
			alert('신고사유 입력해주세요');
			return false;
		}else if($('#contents').val() == ''){
			alert('신고내용을 입력해주세요');
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
				신고하기
			</div>
			
			<div id="innerPage" style="height: 809px; margin-top: 40px;">
				<form action='./addCtr.do' onsubmit="return checkAddFnc();" method='post'>
					<br>
					<br>
					<br>
					<br>
					<div style="margin-left: 200px;">
						<span style="width: 200px;">작성자</span>
						<span style="margin-left: 100px;">${memberDto.member_nick}</span>
						<span style="width: 200px; margin-left: 300px;">신고대상</span>
						<span style="margin-left: 100px;">${projectBoardDto.member_nick}</span>
					</div>
					<br>
					<hr>
					<br>
					<br>
					<div style="margin-left: 200px;">
						<span style="width: 200px;">신고작품</span>
						<span style="margin-left: 84px;">${projectBoardDto.project_board_title}</span>
					</div>
					<br>
					<hr>
					<br>
					<br>
					<div style="margin-left: 200px;">
						<span style="width: 200px;">신고사유</span>
						<input type="text" id="title" name="report_board_reason" 
							placeholder="신고사유를 적어주세요"
							style="margin-left: 87px; width: 850px; height: 50px;">
					</div>
					<br>
					<hr>
					<br>
					<br>
					<div style="margin-left: 200px; height: 400px;">
						<span style="width: 200px; margin-top: 0px;">신고내용</span>
						<textarea id="contents" name="report_board_contents" style="margin-left: 86px; 
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
						<input type="hidden" value="${memberDto.member_no}" 
							 name="report_board_mno">
						<input type="hidden" value="${memberDto.member_nick}" 
							 name="member_nick">
<%-- 						<input type="hidden" value="${projectBoardDto.project_board_mno}" --%>
<!-- 							 name="project_board_mno"> -->
						<input type="hidden" value="${projectBoardDto.project_board_title}"
							 name="report_board_title">
						<input type="hidden" value="${projectBoardDto.member_nick}"
							 name="report_board_name">
						<input type="hidden" value="${project_board_no}"
							 id="report_board_no" name="report_board_no">
						
					</div>
				</form>	
			</div>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>