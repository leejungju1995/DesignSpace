<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>        
<!-- ====================================  비로그인 헤더  ================================================= -->
<c:choose>
	<c:when test="${memberDto eq null}">
		<div id="h_noneHeader">
		   <div id="header_inner">		   		   	
		   		<div id="h_bigLogo_area">
		   			<a class="h_reset_hyperLink" href="<%=request.getContextPath()%>">
		   				<img id="h_bigLogo_img" src="<%=request.getContextPath()%>/resources/img/butterfly.png">
		   			</a>	
		   			<a class="h_reset_hyperLink" href="<%=request.getContextPath()%>"><span id="h_bigLabel">Designer's Space</span></a>	
		   		</div>   			
		   </div>
		</div>
	</c:when>
	
	<c:when test="${memberDto.member_grade eq 0}">
		<!-- ======================================  회원 헤더  =============================================== -->
		<div id="header">
		   <div id="header_inner">
		   
		      <div id="h_logo_area">
		         <span>
		            Designer's Space
		         </span>
		      </div>
		      
		      <div id="h_areaLine"></div>
		      
		      <nav id="h_service_area">
		         <ul>
		         	<li><a class="h_menuLink" href='<%=request.getContextPath()%>/main/member.do'><img id="h_logo_img" src="<%=request.getContextPath()%>/resources/img/butterfly.png"></a></li>
		         	<li class="h_menu_line"></li>
		         	<li><a class="h_menuLink" href='<%=request.getContextPath()%>/projectBoard/list.do'>작품</a></li>
		         	<li class="h_menu_line"></li>
		         	<li><a class="h_menuLink" href='<%=request.getContextPath()%>/freeBoard/free.do'>자유게시판</a></li>
		         	<li class="h_menu_line"></li>
		         	<li><a class="h_menuLink" href='<%=request.getContextPath()%>/qnaBoard/list.do'>QnA</a></li>
		         </ul>
		      </nav>
		      
		      <a href="#none">
		      	<img id="h_profile" src="<%=request.getContextPath()%>/resources/img/profile.png" 
		      		onmouseover="this.src='<%=request.getContextPath()%>/resources/img/profileC.png'"
		      		onmouseout="this.src='<%=request.getContextPath()%>/resources/img/profile.png'">
		      </a>
		      
		   </div>
		</div>
		
		<div id="h_myPage">
			<div id="h_inner_myPage">
				<a id="h_myPage_back" href="#none"><img class="h_myPage_icon" src="<%=request.getContextPath()%>/resources/img/backIcon.png"></a>
				<span id="h_myPage_logo">Designer's Space</span>
					
				<div id="h_myPage_profile">
					<c:choose>
						<c:when test="${empty memberDto.profile_table_stored_name}">
							<div id="h_myPage_profileImg" 
                        		style="background-image: url(<c:url value='/resources/img/defaultProfile.png'/>);"></div>
                        </c:when>
                        <c:otherwise>
                        	<div id="h_myPage_profileImg" 
                        		style="background-image: url(<c:url value='/profileImg/${memberDto.profile_table_stored_name}'/>);"></div>
                        </c:otherwise>
					</c:choose>
					<h6 id="h_myPage_profileName">${memberDto.member_nick}</h6>
				</div>
						
				<div class="h_myPage_areaLine"></div>
				
				<nav id="h_myPage_link">
					<ul>
						<li><img class="h_myPage_icon" src="<%=request.getContextPath()%>/resources/img/myPage1.png"><a href='<%=request.getContextPath()%>/member/info.do'>회원정보조회</a></li>
						<li><img class="h_myPage_icon" src="<%=request.getContextPath()%>/resources/img/myPage2.png"><a href='<%=request.getContextPath()%>/member/myBoard.do?mno=${memberDto.member_no}'>내 작품목록</a></li>
						<li><img class="h_myPage_icon" src="<%=request.getContextPath()%>/resources/img/myPage3.png"><a href='<%=request.getContextPath()%>/member/myQna.do?mno=${memberDto.member_no}'>QnA 조회</a></li>
						<li><img class="h_myPage_icon" src="<%=request.getContextPath()%>/resources/img/myPage4.png"><a href='<%=request.getContextPath()%>/member/myReport.do?mno=${memberDto.member_no}'>신고글 조회</a></li>
					</ul>
				</nav>
				
				<div class="h_myPage_areaLine"></div>
				
				<a onclick="if(confirm('정말로 로그아웃하시겠습니까?')){location.href='<%=request.getContextPath()%>/member/logout.do';}else{return false;}"><img id="h_myPage_logout" class="h_myPage_icon" src="<%=request.getContextPath()%>/resources/img/logoutIcon.png"></a>
			</div>
		</div>
	</c:when>
	
	<c:when test="${memberDto.member_grade eq 1}">
		<!-- =======================================  관리자 헤더  ==============================================  -->
		<div id="header">
		   <div id="header_inner">
		   
		      <div id="h_logo_area">
		         <span>
		            Designer's Space
		         </span>
		      </div>
		      
		      <div id="h_areaLine"></div>
		      
		      <nav id="h_admin_service_area">
		         <ul>
		         	<li><a class="h_menuLink" href='<%=request.getContextPath()%>/main/admin.do'><img id="h_logo_img" src="<%=request.getContextPath()%>/resources/img/flower.png"></a></li>
		         	<li class="h_menu_line"></li>
		         	<li><a class="h_menuLink" href='<%=request.getContextPath()%>/projectBoard/list.do'>작품</a></li>
		         	<li class="h_menu_line"></li>
		         	<li><a class="h_menuLink" href='<%=request.getContextPath()%>/freeBoard/free.do'>자유게시판</a></li>
		         	<li class="h_menu_line"></li>
		         	<li><a class="h_menuLink" href='<%=request.getContextPath()%>/admin/listAdmin.do'>회원관리</a></li>
		         	<li class="h_menu_line"></li>
		         	<li><a class="h_menuLink" href='<%=request.getContextPath()%>/qnaBoard/list.do'>QnA</a></li>
		         	<li class="h_menu_line"></li>
		         	<li><a class="h_menuLink" href='<%=request.getContextPath()%>/reportBoard/list.do'>신고관리</a></li>
		         </ul>
		      </nav>
		      
		      <a onclick="if(confirm('정말로 로그아웃하시겠습니까?')){location.href='<%=request.getContextPath()%>/member/logout.do';}else{return false;}">
		      	<img id="h_profile" src="<%=request.getContextPath()%>/resources/img/logoutIcon.png">
		      </a>
		      
		   </div>
		</div>
	</c:when>
</c:choose>