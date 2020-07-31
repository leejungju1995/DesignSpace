<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Designer's Space</title>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/style.css">


<style type="text/css">
	
	#innerPage {
		font-size: 20px;
		font-weight: bold;
		color: #60524E;
	}
	.input {
		padding : 0px 10px;
		width: 277px;
		height: 30px;
		margin-top : 10px;
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
		border: none;
		border-radius: 5px;
	}
	#cancel{
		width: 300px;
		height: 35px;
		margin-bottom: 10px;
		font-weight: bold;
		border: 1px solid #60524E;
		border-radius: 5px;
		cursor: pointer;
		background-color: #fff;
		color: #000
	}
	
	#exit{
		width: 300px;
		height: 35px;
		margin-bottom: 10px;
		font-weight: bold;
		border: none;
		border-radius: 5px;
		cursor: pointer;
		background-color: #FF0000;
		color: #fff
	}
	
	#button:hover{
		background-color: #4AD674;
	}
	#cancel:hover{
		color: #fff;
		background-color: #4AD674;
		border: none;
	}
	#exit:hover{
		color: #fff;
		background-color: #4AD674;
	}
	
	.input_span{
		color: #60524E;
		font-size: 20px;
		font-weight: bold;
	}
	#select{
		width: 298px;
		height: 35px;
		border-radius: 5px;
		margin-top: 10px;
		padding: 5px;
	}
	#join_div{
		width : 300px;
		text-align: left; 
		margin: auto;
	}	
	#p_image{
		width: 100px;
		height: 100px;
		border-radius: 50%;
	}
	
	#image_container{
		width: 100px; 
		height: 100px; 
		border: 1px solid black;
		margin: auto;
		border-radius: 50%;
		margin-bottom: 10px;
		margin-top: 20px;
	}
	#profile_btn{
		width: 80px;
		height: 32px;
		border: 1px solid #60524E;
		cursor: pointer;
		border-radius: 5px;
	}
	.overlap{
		width: 83px;
		height: 35px;
		border-radius: 5px;
		border: 1px solid #60524E;
		cursor: pointer;
	}
	.file_input label{
		position: relative;
		cursor: pointer;
		display: inline-block;
		vertical-align: middle;
		overflow: hidden;
		width: 80px;
		height: 30px;
		background: #e9e9e9;
		border : 1px solid #60524E;
		color: #777;
		text-align: center;
		line-height: 30px;
		border-radius: 5px;
		font-size: 13px;
	}
	
	.file_input label input{
		position: absolute;
		width: 0;
		height: 0;
		overflow: hidden;
		border: 0;
		
	}
	.file_input input[type=text]
	{
		vertical-align: middle;
		display: inline-block;
		width: 120px;
		height: 28px;
		line-height: 28px;
		font-size: 11px;
		border: 1px solid #777;
		padding: 0;
		margin: 0;
	}
	.overlap_div{
		font-size: 10px;
		margin-bottom: 30px;
	}
	
	input[type=checkbox]{
		width: 15px;
		height: 15px;
	}
	
	#textarea {
		padding: 10px;
		width: 277px;
		resize: none;
		border-radius: 5px;
		margin-top: 10px;
		margin-bottom: 40px;
	}

</style>

<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/script.js"></script>
	
<script type="text/javascript">
	var originalNick ="";//기존의 비밀번호
	var originalPhone ="";//기존의 비밀번호
	var nickPass ="";//중복확인 할때 저장되는 닉네임값
	var nickFlag = "Y";//중복햇나안햇나
	var pwdFlag  = "Y";//비밀번호 패스
	var pwdChkFlag  = "N";//비밀번호 패스
	var phoneFlag = "Y";//전화번호 패스
	
$(function(){
		
	originalNick = $('#member_nick').val();
	nickPass = $('#member_nick').val();
	originalPhone = $('#member_phone').val();
		
		$("#check_nick").click(function() {
			
		   var nickObj = $('#member_nick').val();
		   
		   $.ajax({
		      url : "./checkNick.do",
		      type : "GET",
		      data : "nick=" + nickObj,
		      success : function(data) {
		         console.log("1 = 중복o / 0 = 중복x : "+ data);                     
		         
		         if(originalNick != nickObj){
		        	 
		        	 if (data == 1) {
			        	 $('#member_nick').css('border', '2px solid #ff0000');
			        	 $('#nick_div').css('color', '#ff0000');
			        	 $('#nick_div').html("사용중인 닉네임입니다.");
			        	 
			        	 nickFlag = "N";
			        	 
			         }else{
			        	 $('#member_nick').css('border', '2px solid #4B89DC');
			        	 $('#nick_div').css('color', '#4B89DC');
			        	 $('#nick_div').html('사용가능한 닉네임입니다.');
			        	 
			        	 nickFlag = "Y";
			        	 nickPass =$('#member_nick').val();
			         }  
		    	 }else {
		    		 $('#member_nick').css('border', '2px solid #4B89DC');
		        	 $('#nick_div').css('color', '#4B89DC');
		        	 $('#nick_div').html("현재 닉네임입니다.");
		        	 nickFlag = "Y";
				 }
		      },
		      error : function() {
				  console.log("닉네임 실패");
			  } 
		        
		   });
		   
	    });
		
		
		$("#member_pwd").change(function() {
			
			var pwdObj = $('#member_pwd').val();
			var num = pwdObj.search(/[0-9]/g);
			var eng = pwdObj.search(/[a-z]/ig);
			var spe = pwdObj.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
			
			
			if(pwdObj.length < 8 || pwdObj.length > 20){
				
				$('#member_pwd').css('border', '2px solid #ff0000');
	        	$('#pwd_div').css('color', '#ff0000');
	        	$('#pwd_div').html("8자리 ~ 16자리 이내로 입력해주세요");
	        	pwdFlag = "N";
	        	
		   }else if(pwdObj.search(/\s/) != -1){
			    $('#member_pwd').css('border', '2px solid #ff0000');
	        	$('#pwd_div').css('color', '#ff0000');
	        	$('#pwd_div').html("비밀번호는 공백 없이 입력해주세요");
	        	pwdFlag = "N";
	        	
		   }else if(num < 0 || eng < 0 || spe < 0 ){
			    $('#member_pwd').css('border', '2px solid #ff0000');
	        	$('#pwd_div').css('color', '#ff0000');
	        	$('#pwd_div').html("영문,숫자, 특수문자를 혼합하여 입력해주세요");
	        	pwdFlag = "N";
	        	
		   }else {
			   $('#member_pwd').css('border', '2px solid #4B89DC');
			   $('#pwd_div').css('color', '#4B89DC');
			   $('#pwd_div').html('사용가능한 비밀번호입니다.');
			   console.log("통과"); 
			   pwdFlag = "Y";
			   return true; 	
		   }
		   
		   
	    });
		
		//비밀번호 체크
		$("#pwd_check").blur(function() {
			
			var pwdObj = $('#member_pwd').val();
			var pwdChkObj = $('#pwd_check').val();			
			
			if(pwdObj!=pwdChkObj){
				
				$('#pwd_check').css('border', '2px solid #ff0000');
	        	$('#pwd_chk_div').css('color', '#ff0000');
	        	$('#pwd_chk_div').html("비밀번호와 일치하지 않습니다");
	        	
	        	pwdChkFlag="N";
	        	
	        	return false;
				
		   }else {
			   $('#pwd_check').css('border', '2px solid #4B89DC');
			   $('#pwd_chk_div').css('color', '#4B89DC');
			   $('#pwd_chk_div').html('비밀번호와 일치합니다');
			   
			   pwdChkFlag="Y";

			   return true; 	
		   } 
	    });
		
		//휴대폰번호 확인
		$("#member_phone").change(function() {
		   var phoneObj = $('#member_phone').val();
		   
		   $.ajax({
		      url : "./checkPhone.do",
		      type : "GET",
		      data : "phone=" + phoneObj,
		      success : function(data) {
		         console.log("1 = 중복o / 0 = 중복x : "+ data);                     
		         
		        if (originalPhone != phoneObj) {
		        	if (data == 1) {
			        	 $('#member_phone').css('border', '2px solid #ff0000');
			        	 $('#phone_div').css('color', '#ff0000');
			        	 $('#phone_div').html("사용중인 번호입니다.");
			        	 
			        	 phoneFlag="N";
			        	 
			         }else{
			        	 $('#member_phone').css('border', '2px solid #4B89DC');
			        	 $('#phone_div').css('color', '#4B89DC');
			        	 $('#phone_div').html('사용가능한 번호입니다.');
			        	 
			        	 phoneFlag="Y";
			        	 
			         }   
				}else {
					 $('#member_phone').css('border', '2px solid #4B89DC');
		        	 $('#phone_div').css('color', '#4B89DC');
		        	 $('#phone_div').html("현재 휴대폰번호입니다.");
		        	 phoneFlag="Y";
				}  
		      },
		      error : function() {
		    	  console.log("번호 실패");
		      }
		   });
		   
	    });
		
	});
	
	
	function modiOrderFnc() {//로그인 버튼 
		
		var nick = document.getElementById("member_nick");
		var pwd = document.getElementById("member_pwd");
		var pwdCheck = document.getElementById("pwd_check");
		var phone = document.getElementById("member_phone");
		var answer = document.getElementById("member_answer");
		
		if(!(nick.value==nickPass && nickFlag=="Y")) {
			alert('닉네임을 확인해주세요');
			nick.focus();
			return false;
			
		}else if(pwdFlag=="N"){
			alert('비밀번호를 확인해주세요');
			pwd.focus();
			return false;
			
		}else if (pwdChkFlag=="N") {
			alert('비밀번호확인을 확인해주세요');
			pwdCheck.focus();
			return false;
			
		}else if(!(phoneFlag=="Y")){
			alert('휴대폰번호를 확인해주세요');
			phone.focus();
			return false;
		}else if (answer.value=="" || answer.value==null) {
			alert('본인확인을 확인해주세요');
			answer.focus();
			return false;
		}else {
			return true;
		}
		
	}
	


	function setThumbnailFnc(event) { 
		
		
		$("#chang_flag").attr('value', 'Y');
// 		$("#file_name").setAttribute("name", "file");
		
		document.getElementById("file_route").value =  $("#file_name").val();
		
		var reader = new FileReader(); 
		
		reader.onload = function(event) { 
			var img = document.getElementById("p_image"); 
			img.setAttribute("src", event.target.result); 
	// 		document.querySelector("div#image_container").appendChild(img); 
		}; 
		
		reader.readAsDataURL(event.target.files[0]); }

	
	function defaultProfileFnc(){
		
		$("#chang_flag").attr('value', 'Y');
// 		$("#file_name").setAttribute("name", "file");
		
	    $("#file_name").val("");
	    $("#file_route").val("");
	    
	    $("#p_image").attr('src', '<%=request.getContextPath()%>/resources/img/defaultProfile.png');

 	}
	
	function exitMemberFnc() {
		if(confirm("정말 탈퇴하시겠습니까?")==true){
			
			var remove_no = $('#member_no').val();
			
			location.href='./remove.do?member_no='
				+remove_no;	
		}else {
			alert("탈퇴가 취소되었습니다");
		}
	}
	
</script>


</head>


<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<div id="wrap">
		<div id="innerWrap">
			<div id="innerPage" style="padding: 60px 0px;">
				
				<div style="margin-bottom: 80px; text-align: center;">
					<span style="font-size: 50px;">회원정보 수정</span>
				</div> 
				
				<div id="join_div">
					<form action="modInfoDetailCtr.do" method="post" enctype="multipart/form-data" onsubmit="return modiOrderFnc();">
						<input type="hidden" id="member_no" name="member_no" value="${memberDto.member_no}">
						
						<span>성명</span> 
						<input type="text" class="input" name="member_name" style="background-color: #EAEAEA" 
							value="${memberDto.member_name}" readonly="readonly"> 
						<div id="name_div" class="overlap_div"></div>
							
						<span>닉네임</span> 
						<div>
							<input type="text" class="input" id="member_nick" name="member_nick" maxlength="10"
								value="${memberDto.member_nick}" style="width: 185px;">
							<input type="button" id="check_nick" class="overlap" value="중복확인">
						</div>
						<div id="nick_div" class="overlap_div"></div>
						
						<span>이메일</span> 
						<input type="email" class="input" id="member_email" name="member_email" style="background-color: #EAEAEA"
							value="${memberDto.member_email}" readonly="readonly"> 
						<div id="email_div" class="overlap_div"></div>
							
						<span>비밀번호</span> 
						<input type="password" id="member_pwd" class="input" name="member_pwd" maxlength="16"
							value="${memberDto.member_pwd}">
						<div id="pwd_div" class="overlap_div"></div>
							
						<span>비밀번호 확인</span>  
						<input type="password" id="pwd_check" class="input" value="" maxlength="16"> 
						<div id="pwd_chk_div" class="overlap_div"></div>
						
						<span>휴대폰 번호</span> 
						<input type="text" id="member_phone" class="input" name="member_phone" value="${memberDto.member_phone}"
							onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="15">
						<div id="phone_div" class="overlap_div"></div>
						
						<span>본인확인</span>
						<select id="select" name="member_check_question">
							<c:choose>
								<c:when test="${memberDto.member_check_question eq 1}">
									<option value="1" selected="selected">나의 보물1호는?</option>
								</c:when>
								<c:otherwise>
									<option value="1">나의 보물1호는?</option>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${memberDto.member_check_question eq 2}">
									<option value="2" selected="selected">내가 태어난 고향은?</option>
								</c:when>
								<c:otherwise>
									<option value="2">내가 태어난 고향은?</option>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${memberDto.member_check_question eq 3}">
									<option value="3" selected="selected">가장 친한 친구 이름은?</option>
								</c:when>
								<c:otherwise>
									<option value="3">가장 친한 친구 이름은?</option>
								</c:otherwise>
							</c:choose>
						</select> <br> 
						<input class="input" id="member_answer" name="member_check_answer" maxlength="30"
							value="${memberDto.member_check_answer}"><br>
						<div id="answer_div" class="overlap_div"></div>
						
						
						<span>프로필사진</span>
						<div id="image_container">
							<c:choose>
								<c:when test="${empty memberDto.profile_table_stored_name}">
									<img id="p_image" alt="기본 프로필 이미지"  src="<%=request.getContextPath()%>/resources/img/defaultProfile.png">
								</c:when>
								<c:otherwise>
									<img id="p_image" alt="프로필 이미지" 
										src="<c:url value='/profileImg/${memberDto.profile_table_stored_name}'/>">
								</c:otherwise>
							</c:choose>
						</div>
						
						<div class="file_input" style="margin: 20px 0px 30px 0px;">
						  <input type = "text" readonly="readonly" id="file_route" placeholder="기본프로필 이미지.jpg" 
						  	value="${memberDto.profile_table_original_name}" style="
						  	width:110px; border-radius: 5px; height: 29px; padding: 0px 5px;">
							
							<label>
								첨부파일
								<input type="file" id="file_name" name="file" accept="image/*" onchange="setThumbnailFnc(event);"
							style="width: 35px;"/> 
							</label>
							
							<input type="button" id="profile_btn" value="기본프로필" onclick="defaultProfileFnc()" style="width: 80px;">
						</div>
						<input type="hidden" id="chang_flag" name="change" value="N">
						
						<span>소개</span>
						<textarea id="textarea" rows="8" cols="38" name="member_comments" 
						maxlength="100">${memberDto.member_comments}</textarea>
						
						<button id="button">확인</button>
					</form>
					<c:if test="${memberDto.member_grade}==0">
						<button id="exit" onclick="exitMemberFnc();">탈퇴</button>
					</c:if>
					
					<button id="cancel" onclick="location.href='info.do;'">취소</button>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>

</html>