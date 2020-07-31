<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style type="text/css">
#navList > ul {
 	list-style-type: none; 
    padding: 0;
    overflow: hidden;
    background-color: #333333; 
    display: table; /* table을 주면  요소의 내용에 맞게 자동으로 크기 */ 
    margin-left: auto;
    margin-right: auto;
    
}

#navList > ul > li {
	float: left;
}

#navList > ul > li > a {
    display: block;
    color: white;  
    text-align: center;
    padding: 16px;
    text-decoration: none;
} 

#navList > ul > li > a:hover { 
     color: #FFD9EC; 
     background-color: #5D5D5D; 
     font-weight: bold; 
 }  
 
.active {
	color: #FFD9EC;
	background-color: #5D5D5D;
	font-weight: bold;  
}
</style>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
<script type="text/javascript">
	function goPageFnc(pageNumber, chkPage){

		var curPage = $('#curPage');

		curPage.val(pageNumber);
		
		var pagingForm = $('#pagingForm');
		
		if(chkPage == "list"){
			pagingForm.attr('action', './list.do#navList')	
		}else if(chkPage == "my"){
			pagingForm.attr('action', './myBoard.do#navList')
		}
		
		pagingForm.submit();
	}
</script>
<nav id='navList'>
	<ul>
		<li>
		<c:choose>
			<c:when test="${projectBoardPaging.curPage < projectBoardPaging.totPage}">
				<a href="#"
					onclick="goPageFnc(${projectBoardPaging.curPage + 1}, '<%=request.getParameter("chkPage")%>');">
					<span>더보기</span>
				</a>
			</c:when>
		</c:choose>

		</li>
	</ul>
</nav>