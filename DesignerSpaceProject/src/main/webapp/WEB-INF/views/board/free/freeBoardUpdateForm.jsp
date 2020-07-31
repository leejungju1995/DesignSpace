<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<title>게시판 수정</title>
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
		var mnoObj = $('#mno')
		var fbnoObj = $('#no');
		var keywordObj = $('#keyword');
		var searchOptionObj = $('#searchOption');
		var lineTitleObj = $('#lineTitle');
		var rnumObj = $('#rnum');
		
		var url = '';
		
		url += './freeBoardListOne.do?';
		url += 'no=' + fbnoObj.val();
		url += '&keyword=' + keywordObj.val();
		url += '&searchOption=' + searchOptionObj.val();
		url += '&mno=' + mnoObj.val();
		url += '&lineTitle=' + lineTitleObj.val();
		url += '&rnum=' + rnumObj.val();
		
		location.href = url;
	}
	
	function checkUpdateFnc() {
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
		
		$('#title').keydown(function(e) {
			var title = $(this).val();
			if(title.length > 50){
				alert('제목은 최대 50자까지입니다.');
				$(this).val(title.substring(0, 50));
			}
		});
		
		$('#contents').keydown(function (e){
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
			<div id="boardTitle">자유게시판 글수정</div>
				<div id="innerPage" style="height: 809px; margin-top: 40px;">
					<form action='./freeBoardUpdateCtr.do' onsubmit="return checkUpdateFnc();" method='post' 
						enctype="multipart/form-data">
					<br>
					<br>
					<br>
					<br>
					<div style="margin-left: 200px;">
						<span style="width: 200px;">작성자</span>
						<span id="writer" style="margin-left: 80px;">${map.writer}</span>
						<input type="hidden" id="rnum" name="rnum" value="${map.rnum}">
					</div>
					<br>
					<hr>
					<br>
					<br>
					<div style="margin-left: 200px;">
						<span style="width: 200px;">제목</span>
						<input type='text' style="margin-left: 86px;
							width: 780px; height: 50px;" value="${map.title}" id="title" name='title'>
					</div>
					<br>
					<hr>
					<br>
					<br>
					<div style="margin-left: 200px; height: 400px;">
								<span style="width: 200px;">내용</span>
								<textarea id="contents" name='contents'
								 style="margin-left: 86px; vertical-align: top;" cols="115" rows="25">${map.contents}</textarea>
								<br>
								<span id="numCount" style="margin-left: 123px"></span>
					</div>
					<br>
					<hr>
					<br>
					<br>
					<input type="hidden" id="no" name="no" value="${map.no}">
					<input type="hidden" id="rnum" name="rnum" value="${map.rnum}">
					<input type="hidden" id="lineTitle" name="lineTitle" value="${map.lineTitle}">
					<input type="hidden" id="mno" name="mno" value="${map.mno}">
					<input type="hidden" id='searchOption' 
							name="searchOption" value="${map.searchOption}">
					<input type="hidden" id='keyword' 
							name="keyword" value="${map.keyword}">
					<div style="text-align: center;">
						<input style="text-align: center; 
									 width: 150px;  height: 50px; 
									 background-color: #60524E;  color: white; cursor: pointer;" type='submit' value='수정완료'>
						<input style="text-align: center; 
									 width: 150px;  height: 50px; 
									 background-color: #60524E;  color: white; cursor: pointer;" type='button'
									 value='취소' onclick="pageMoveListFnc();">
					</div>
				</form>
			</div>
		</div>
	</div>
	
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>	
</body>
</html>