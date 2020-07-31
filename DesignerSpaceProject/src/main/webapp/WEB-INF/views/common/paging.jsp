<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<style type="text/css">
#navList > ul {
 	list-style-type: none; 
    padding: 0;
    overflow: hidden;
    background-color: #FFFFFF; 
    display: table; /* table을 주면  요소의 내용에 맞게 자동으로 크기 */ 
    margin-left: auto;
    margin-right: auto;
    
}

#navList > ul > li {
	float: left;
	width: 50px;
	height: 50px;
}

#navList > ul > li > a {
    display: block;
    color: black;  
    text-align: center;
    padding: 16px;
    text-decoration: none;
    border: 1px solid grey;
    font-weight: bold;
} 

#navList > ul > li > a:hover { 
     color: #FFFFFF; 
     background-color: #60524E; 
     font-weight: bold; 
 }  
 
.active {
	color: white;
	background-color: #60524E;
	font-weight: bold;  
}
.move:hover{
	color: white;
}

</style>

<!-- <script type="text/javascript"  -->
<!-- 	src="/DesignerSpaceProject/resources/js/jquery-3.5.1.js"></script> -->
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script type="text/javascript">
	function goPageFnc(pageNumber){
// 		alert(pageNumber);
		var curPage = $('#curPage');
		
// 		curPage.value = pageNumber;
		curPage.val(pageNumber);
		
		var pagingForm = $('#pagingForm');
		pagingForm.submit();
	}
	
	window.onload = function(){
		var curPage = document.getElementById('curPage');
		var pageButtonId = 'pageButton' + curPage.value;
		
		document.getElementById(pageButtonId)
			.setAttribute('class', 'active');
	}
</script>
	<nav id="navList" style="margin-top: 30px;">
		<ul>
			<c:choose>
				<c:when test="${pagingMap.paging.blockEnd ne 0}">
					<li>
						<a class="move" href="#" 
							onclick="goPageFnc(${pagingMap.paging.prevPage});">
							<span class="move">◀</span>
						</a>
					</li>	
				</c:when>
				<c:when test="${pagingMap.paging.blockEnd eq 0}">
					
				</c:when>
			</c:choose>

			<c:forEach var="num" 
				begin="${pagingMap.paging.blockBegin}" 
				end="${pagingMap.paging.blockEnd}">
				
				<li id='pageButton${num}'>
					<a href="#" onclick="goPageFnc(${num});">
						<c:out value="${num}"/>
					</a>
				</li>
				
			</c:forEach>
			
			<c:choose>
				<c:when test="${pagingMap.paging.blockEnd ne 0}">
					<li>
						<a class="move" href="#"
							onclick="goPageFnc(${pagingMap.paging.nextPage});">
							<span class="move">▶</span>
						</a>
					</li>	
				</c:when>
				<c:when test="${pagingMap.paging.blockEnd eq 0}">
					
				</c:when>
			</c:choose>
			
		</ul>
	</nav>

	
	
	