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
	
	#titleSpace{
		margin-left: 117px;
		width: 850px; 
		height: 50px; 
		font-size: 20px;" 
	}
	
	#textSpace{
		margin-left: 86px; 
		vertical-align: top; 
		font-size: 20px;"
	}
</style>

	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-3.5.1.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/script.js"></script>

<script type="text/javascript">
	function pageMoveListFnc() {
		location.href = './list.do';
	}
</script>

</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
	<div id="wrap">
		<div id="innerWrap">
			<div id='boardTitle'>
				QnA 수정
			</div>
			
			<div id="innerPage" style="height: 809px; margin-top: 40px;">
				<form action='./updateCtr.do' method='post'>
					<br>
					<br>
					<br>
					<br>
					<div style="margin-left: 200px;">
						<span style="width: 200px;">작성자</span>
						<span style="margin-left: 100px;">${qnaBoardDto.member_nick}</span>
					</div>
					<br>
					<hr>
					<br>
					<br>
					<div style="margin-left: 200px;">
						<span style="width: 200px;">제목</span>
						<input type="text" value="${qnaBoardDto.qna_board_title}"
							 id='titleSpace' name="qna_board_title">
					</div>
					<br>
					<hr style="text-align: center; width: 80%;">
					<br>
					<br>
					<div style="margin-left: 200px; height: 400px;">
						<span style="width: 200px; margin-top: 0px;">질문내용</span>
						<textarea id='textSpace' cols="84" rows="17"
							 name="qna_board_contents">${qnaBoardDto.qna_board_contents}</textarea>
					</div>
					<br>
					<hr>
					<br>
					<br>
					<div style="text-align: center;">
						<input type="submit" value="수정완료" style="text-align: center; width: 150px; 
							height: 50px; background-color: #60524E; color: white;">
						<input type="button" value="취소" style="text-align: center; width: 150px; 
							height: 50px; background-color: #60524E; color: white;" onclick="pageMoveListFnc();">
						<input type="hidden" name="qna_board_no" value="${qnaBoardDto.qna_board_no}">
					</div>
				</form>	
			</div>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>