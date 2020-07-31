<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Designer's Space</title>

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/reset.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resources/css/style.css">


<style type="text/css">

	#innerWrap {
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
		border : none;
	}
	
	.input_span{
		color: #60524E;
		font-size: 20px;
		font-weight: bold;
	}
	#select{
		padding : 0px 5px;
		width: 298px;
		height: 35px;
		border-radius: 5px;
		margin-top: 10px;
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
		height: 33px;
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
	margin-bottom: 20px;
	}
</style>

<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/script.js"></script>
	

<script type="text/javascript">
	
	var nickPass ="";//중복확인 할때 저장되는 닉네임값
	var nickFlag = "N";//중복햇나안햇나
	var emailPass=""; //이메일 저장되는 값
	var emailFlag = "N";//이메일 패스
	var pwdFlag  = "N";//비밀번호 패스
	var pwdChkFlag  = "N";//비밀번호 패스
	var phoneFlag = "N";//전화번호 패스
	
	$(function(){
		
		
		$("#check_nick").click(function() {
		   var nickObj = $('#member_nick').val();
		   
		   
		   $.ajax({
		      url : "./checkNick.do",
		      type : "GET",
		      data : "nick=" + nickObj,
		      success : function(data) {
		         console.log("1 = 중복o / 0 = 중복x : "+ data);                     
		         
		         if(data == 1) {
		        	 $('#member_nick').css('border', '2px solid #ff0000');
		        	 $('#nick_div').css('color', '#ff0000');
		        	 $('#nick_div').html("사용중인 닉네임입니다");
		        	 
		        	 nickFlag = "N";
		        	 
		         }else{
		        	 $('#member_nick').css('border', '2px solid #4B89DC');
		        	 $('#nick_div').css('color', '#4B89DC');
		        	 $('#nick_div').html('사용가능한 닉네임입니다');
		        	 
		        	 nickFlag = "Y";
		        	 nickPass =$('#member_nick').val();
		         }   
		      },
		      error : function() {
		    	  console.log("닉네임 실패");
		      }
		   });
		   
	    });
		
		
		$("#check_email").click(function() {//이메일 유효성 검사
		   var emailObj = $('#member_email').val();
		   
		   var indexSpace = emailObj.indexOf(" ");
		   var splitArr = emailObj.split("@"); 
		   var startChar = emailObj.charAt(0);
		   var lastChar = emailObj.charAt(emailObj.length - 1);
		   
		   
		   $.ajax({
		      url : "./checkEmail.do",
		      type : "GET",
		      data : "email=" + emailObj,
		      success : function(data) {
		         console.log("1 = 중복o / 0 = 중복x : "+ data);                     
		         
		         if (indexSpace != -1) {
					
		        	 $('#member_email').css('border', '2px solid #ff0000');
		        	 $('#email_div').css('color', '#ff0000');
		        	 $('#email_div').html("띄어쓰기를 제거해 주세요");
		        	 
		        	 emailFlag = "N";
		        	 
		        	 
				 }else if(splitArr.length != 2 ) {
		        	 
		        	 $('#member_email').css('border', '2px solid #ff0000');
		        	 $('#email_div').css('color', '#ff0000');
		        	 $('#email_div').html("올바르지 않은 이메일 형식입니다");
		        	 
		        	 emailFlag = "N";
		        	 
				 }else if (startChar=="@" || lastChar=="@") {
						
					 $('#member_email').css('border', '2px solid #ff0000');
		        	 $('#email_div').css('color', '#ff0000');
		        	 $('#email_div').html("올바르지 않은 이메일 형식입니다");
		        	 
		        	 emailFlag = "N";
					 
				 }else if (data == 1) {
		        	 $('#member_email').css('border', '2px solid #ff0000');
		        	 $('#email_div').css('color', '#ff0000');
		        	 $('#email_div').html("사용중인 이메일입니다");
		        	 
		        	 emailFlag = "N";
		        	 
		         }else{
		        	 $('#member_email').css('border', '2px solid #4B89DC');
		        	 $('#email_div').css('color', '#4B89DC');
		        	 $('#email_div').html('사용가능한 이메일입니다');
		        	 
		        	 emailFlag = "Y";
		        	 emailPass =$('#member_email').val();
		         }   
		      },
		      error : function() {
		    	  console.log("이메일 실패");
		      }
		   });
		   
	    });
		
		
		$("#member_pwd").change(function() { //비밀번호 유효성
			
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
			   $('#pwd_div').html('사용가능한 비밀번호입니다');
			   console.log("통과"); 
			   pwdFlag = "Y";
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
		         
		         
		         if (phoneObj.length < 11) {
					
		        	 $('#member_phone').css('border', '2px solid #ff0000');
		        	 $('#phone_div').css('color', '#ff0000');
		        	 $('#phone_div').html("번호는 최소 11글자를 입력해주세요");
		        	 
		        	 phoneFlag="N";
		        	 
				 }else if (data == 1) {
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
		      },
		      error : function() {
		    	  console.log("번호 실패");
		      }
		   });
		   
	    });
		
	});
	
	
	
	function setThumbnailFnc(event) { 
		
		document.getElementById("file_route").value = $("#file_name").val();
		
		var reader = new FileReader(); 
		
		reader.onload = function(event) { 
			var img = document.getElementById("p_image"); 
			img.setAttribute("src", event.target.result); 
	// 		document.querySelector("div#image_container").appendChild(img); 
		}; 
		
		reader.readAsDataURL(event.target.files[0]); 
	}

	
	function defaltProfileFnc(){
		
	    $("#file_name").val("");
	    
	    document.getElementById("file_route").value =  $("#file_name").val();
	    
	    $("#p_image").attr('src', '<%=request.getContextPath()%>/resources/img/defaultProfile.png');


 	}
	
	function backMoveFnc() {
		location.href='<%=request.getContextPath()%>/login.do';
	}
	
	function joinOrderFnc() {//로그인 버튼 
		
		
		var name = document.getElementById("member_name");
		var nick = document.getElementById("member_nick");
		var email = document.getElementById("member_email");
		var pwd = document.getElementById("member_pwd");
		var pwdCheck = document.getElementById("pwd_check");
		var phone = document.getElementById("member_phone");
		var answer = document.getElementById("member_answer");
		var checkbox = document.getElementById("checkbox");
		
		
		
		if (name.value=="" || name.value==null) {
			alert('성명을 확인해주세요');
			name.focus();
			return false;
			
		}else if(!(nick.value==nickPass && nickFlag=="Y")) {
			alert('닉네임을 확인해주세요');
			nick.focus();
			return false;
			
		}else if(!(email.value==emailPass && emailFlag=="Y")){
			alert('이메일을 확인해주세요');
			email.focus();
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
		}else if (!(checkbox.checked)) {
			alert('이용약관 동의를 해주세요');
			checkbox.focus();
			return false
			
		}else {
			return true;
		}
		
	}


	
</script>

</head>



<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<div id="wrap">
		<div id="innerWrap">

			

			<div style="margin-bottom: 80px; text-align: center;">
				<span style="font-size: 50px;">회원가입</span>
			</div> 
			
			<div id="join_div">
				<form action="joinCtr.do" method="post" enctype="multipart/form-data" onsubmit="return joinOrderFnc();">
					<span>성명</span>
					<input type="text" id="member_name" class="input" name="member_name" placeholder="성명을 입력해주세요"
						maxlength="10"> 
					<div class="overlap_div"></div>
					
					<span>닉네임</span><br>
					<input type="text" id="member_nick" class="input" name="member_nick" placeholder="닉네임을 입력해주세요"
						style="width: 185px;" maxlength="10">
					<input type="button" id="check_nick" class="overlap" value="중복확인">
					<div id="nick_div" class="overlap_div"></div>
					
					<span>이메일</span><br>
					<input type="email" id="member_email" class="input" name="member_email" placeholder="이메일을 입력해주세요"
						style="width: 185px;" maxlength="20">
					<input type="button" id="check_email" class="overlap" value="중복확인">
					<div id="email_div" class="overlap_div"></div>
					
					<span>비밀번호</span> 
					<input type="password" id="member_pwd" class="input" name="member_pwd" placeholder="특수문자 포함 8~16자 이내입니다"
						maxlength="16">
					<div id="pwd_div" class="overlap_div"></div>
					
					<span>비밀번호 확인</span> 
					<input type="password" class="input" id="pwd_check" placeholder="비밀번호와 똑같이 입력해주세요"
						maxlength="16"> 
					<div id="pwd_chk_div" class="overlap_div"></div>
					
					<span>휴대폰 번호</span>
					<input type="text" id="member_phone" class="input" name="member_phone" placeholder="'-'를 제외한 숫자만 입력해주세요"
						maxlength="15" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
					<div id="phone_div" class="overlap_div"></div>
					
					<span>본인확인</span>
					<select id="select" name="member_check_question">
						<option value="1">나의 보물1호는?</option>
						<option value="2">내가 태어난 고향은?</option>
						<option value="3">가장 친한 친구 이름은?</option>
					</select>
					<input name="member_check_answer" id="member_answer" class="input" placeholder="질문에 대한 답변을 적어주세요"
						maxlength="30">
					<div id="nick_div" class="overlap_div"></div>
					
					<span>프로필 사진</span>
					<div id="image_container">
						<c:if  test="${empty fileList}">
							<img id="p_image" src="<%=request.getContextPath()%>/resources/img/defaultProfile.png">
						</c:if>
					</div>
					
					<div class="file_input" style="margin: 20px 0px 30px 0px;">
					  <input type = "text" readonly="readonly" id="file_route" placeholder="기본프로필.jpg"
					  	style="width:110px; border-radius: 5px; height: 29px; padding: 0px 5px;">
						
						<label>
							첨부파일
							<input type="file" id="file_name" name="file" accept="image/*" 
								style="width: 35px;" onchange="setThumbnailFnc(event);"/> 
						</label>
						
						<input type="button" id="profile_btn" value="기본프로필" onclick="defaltProfileFnc()" >
					</div>
					
					
					<span>소개</span>
					<textarea id="textarea" rows="8" cols="38"  name="member_comments" 
						placeholder="자기소개글을 작성해 주세요(100자 이내)" maxlength="100"></textarea>
					
					<span>이용약관</span>
					<div style="overflow: auto;padding: 10px; width: 277px; height: 150px; 
						margin-top: 10px; border: 1px solid black; background-color: white; 
						border-radius: 5px; font-size: 12px;">
						
						
						<h2>제 1 장 총칙</h2><br>
						<h3> 제 1 조 (목적)</h3><br>
						<ol>
							<li>1. 본 약관은 기업마당 사이트가 제공하는 모든 서비스(이하 "서비스")의 이용조건 및 절차, 이용자와 기업마당 사이트의 권리, 의무, 책임사항과 기타 필요한 사항을 규정함을 목적으로 합니다.</li>
						</ol><br>
						<h3>제 2 조 (약관의 효력과 변경)</h3><br>
						<ol>
							<li>1. 기업마당 사이트는 귀하가 본 약관 내용에 동의하는 경우 기업마당 사이트의 서비스 제공 행위 및 귀하의 서비스 사용 행위에 본 약관이 우선적으로 적용됩니다.</li>
							<li>2. 기업마당 사이트는 본 약관을 사전 고지 없이 변경할 수 있고 변경된 약관은 기업마당 사이트 내에 공지하거나 e-mail을 통해 회원에게 공지하며, 공지와 동시에 그 효력이 발생됩니다.<br>
								이용자가 변경된 약관에 동의하지 않는 경우, 이용자는 본인의 회원등록을 취소 (회원탈락)할 수 있으며 계속 사용의 경우는 약관 변경에 대한 동의로 간주 됩니다.</li>
						</ol><br>
						<h3>제 3 조 (약관 외 준칙)</h3><br>
						<ol>
							<li>1. 본 약관에 명시되지 않은 사항은 전기통신기본법, 전기통신사업법, 정보통신윤리위원회심의규정, 정보통신 윤리강령, 프로그램보호법 및 기타 관련 법령의 규정에 의합니다.</li>
						</ol><br>
						<h3>제 4 조 (용어의 정의)</h3><br>
						<p>본 약관에서 사용하는 용어의 정의는 다음과 같습니다.</p>
						<ol>
							<li>1. 이용자 : 본 약관에 따라 기업마당 사이트가 제공하는 서비스를 받는 자.</li>
							<li>2. 가입 : 기업마당 사이트가 제공하는 신청서 양식에 해당 정보를 기입하고, 본 약관에 동의하여 서비스 이용계약을 완료시키는 행위.</li>
							<li>3. 회원 : 기업마당 사이트에 개인 정보를 제공하여 회원 등록을 한 자로서 기업마당 사이트가  제공하는 서비스를 이용할 수 있는 자.</li>
							<li>4. 비밀번호 : 이용자와 회원ID가 일치하는지를 확인하고 통신상의 자신의 비밀보호를 위하여 이용자 자신이 선정한 문자와 숫자의 조합.</li>
							<li>5. 탈퇴 : 회원이 이용계약을 종료시키는 행위.</li>
						</ol><br>
						<h2>제 2 장 서비스 제공 및 이용</h2><br>
						<h3>제 5 조 (이용계약의 성립)</h3><br>
						<ol>
							<li>1. 이용계약은 신청자가 온라인으로 기업마당 사이트에서 제공하는 소정의 가입신청 양식에서 요구하는 사항을 기록하여 가입을 완료하는 것으로 성립됩니다.</li>
							<li> 2. 기업마당 사이트는 다음 각 호에 해당하는 이용계약에 대하여는 가입을 취소할 수 있습니다.
								<ol>
									<li>① 다른 사람의 명의를 사용하여 신청하였을 때</li>
									<li>② 이용계약 신청서의 내용을 허위로 기재하였거나 신청하였을 때</li>
									<li>③ 다른 사람의 기업마당 사이트 서비스 이용을 방해하거나 그 정보를 도용하는 등의 행위를 하였을 때</li>
									<li>④ 기업마당 사이트를 이용하여 법령과 본 약관이 금지하는 행위를 하는 경우</li>
									<li>⑤ 기타 기업마당 사이트가 정한 이용신청요건이 미비 되었을 때</li>
								</ol>
							</li>
						</ol><br>
						<h3>제 6 조 (회원정보 사용에 대한 동의)</h3><br>
						<ol>
							<li>1. 회원의 개인정보는 공공기관의 개인정보보호에 관한 법률에 의해 보호됩니다.</li>
							<li>2. 기업마당 사이트의 회원 정보는 다음과 같이 사용, 관리, 보호됩니다.
								<ol>
									<li> ① 개인정보의 사용 : 기업마당 사이트는 서비스 제공과 관련해서 수집된 회원의 신상정보를 본인의 승낙 없이 제3자에게 누설, 배포하지 않습니다.<br>
											단, 전기통신기본법 등 법률의 규정에 의해 국가기관의 요구가 있는 경우, 범죄에 대한 수사상의 목적이 있거나 정보통신윤리 위원회의 요청이 있는 경우 또는 기타 관계법령에서 정한 절차에 따른 요청이 있는 경우, 귀하가 기업마당 사이트에 제공한 개인정보를 스스로 공개한 경우에는 그러하지 않습니다.</li>
									<li>② 개인정보의 관리 : 귀하는 개인정보의 보호 및 관리를 위하여 서비스의 개인정보관리에서 수시로 귀하의 개인정보를 수정/삭제할 수 있습니다.</li>
 									<li>③ 개인정보의 보호 : 귀하의 개인정보는 오직 귀하만이 열람/수정/삭제 할 수 있으며, 이는 전적으로 귀하의 ID와 비밀번호에 의해 관리되고 있습니다.<br>
										 따라서 타인에게 본인의 ID와 비밀번호를 알려주어서는 안되며, 작업 종료 시에는 반드시 로그아웃 해 주시기 바랍니다.</li>
								</ol><br>
							</li>
							<li>3. 회원이 본 약관에 따라 이용신청을 하는 것은, 기업마당 사이트가 신청서에 기재된 회원정보를 수집, 이용하는 것에 동의하는 것으로 간주됩니다.</li>
						</ol><br>
						<h3>제 7 조 (사용자의 정보 보안)</h3><br>
						<ol>
							<li>1. 가입 신청자가 기업마당 사이트 서비스 가입 절차를 완료하는 순간부터 귀하는 입력한 정보의 비밀을 유지할 책임이 있으며, 회원의 ID와 비밀번호를 사용하여 발생하는 모든 결과에 대한 책임은 회원 본인에게 있습니다.</li>
							<li>2. ID와 비밀번호에 관한 모든 관리의 책임은 회원에게 있으며, 회원의 ID나 비밀번호가 부정하게 사용 되었다는 사실을 발견한 경우에는 즉시 기업마당 사이트에 신고하여야 합니다. 신고를 하지 않음으로 인한 모든 책임은 회원 본인에게 있습니다. 종료하지 아니함으로써 제3자가 귀하에 관한 정보를 이용하게 되는 등의 결과로 인해 발생하는 손해 및 손실에 대하여 기업마당 사이트는 책임을 부담하지 아니합니다.</li>
						</ol><br>
						<h3>제 8 조 (서비스의 중지)</h3><br>
						<ol>
							<li>1. 기업마당 사이트는 이용자가 본 약관의 내용에 위배되는 행동을 한 경우, 임의로 서비스 사용을 제한 및 중지할 수 있습니다.</li>
						</ol><br>
						<h3>제 9 조 (서비스의 변경 및 해지)</h3><br>
						<ol>
							<li>1. 기업마당 사이트는 귀하가 서비스를 이용하여 기대하는 손익이나 서비스를 통하여 얻은 자료로 인한 손해에 관하여 책임을 지지 않으며, 회원이 본 서비스에 게재한 정보, 자료, 사실의 신뢰도, 정확성 등 내용에 관하여는 책임을 지지 않습니다. 의한 손해에 대하여 책임을 부담하지 아니합니다.</li>
						</ol><br>
						<h3> 제 10 조 (게시물의 저작권)</h3><br>
						<ol>
							<li>1. 귀하가 게시한 게시물의 내용에 대한 권리는 귀하에게 있습니다.</li>
							<li>2. 기업마당 사이트는 게시된 내용을 사전 통지 없이 편집, 이동할 수 있는 권리를 보유하며, 게시판운영 원칙에 따라 사전 통지 없이 삭제할 수 있습니다.</li>
 							<li>3. 귀하의 게시물이 타인의 저작권을 침해함으로써 발생하는 민, 형사상의 책임은 전적으로 귀하가 부담하여야 합니다.</li>
						</ol><br>
						<h2>제 3 장 의무 및 책임</h2><br>
						<h3>제 11 조 (기업마당 사이트의 의무)</h3><br>
						<ol>
							<li>1. 기업마당 사이트는 회원의 개인 신상 정보를 본인의 승낙없이 타인에게 누설, 배포하지 않습니다. 다만, 전기통신관련법령 등 관계법령에 의하여 관계 국가기관 등의 요구가 있는 경우에는 그러하지 아니합니다.</li>
						</ol><br>
						<h3>제 12 조 (회원의 의무)</h3><br>
						<ol>
							<li>1. 회원 가입 시에 요구되는 정보는 정확하게 기입하여야 합니다. 또한 이미 제공된 귀하에 대한  정보가 정확한 정보가 되도록 유지, 갱신하여야 하며, 회원은 자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는 안됩니다.</li>
							<li>2. 회원은 기업마당 사이트의 사전 승낙 없이 서비스를 이용하여 어떠한 영리행위도 할 수 없습니다.</li>
						</ol><br>
						<h2>제 4 장 기타</h2><br>
						<h3>제 13 조 (양도금지)</h3><br>
						<ol>
							<li>1. 회원이 서비스의 이용권한, 기타 이용계약 상 지위를 타인에게 양도, 증여할 수 없습니다.</li>
						</ol><br>
						<h3>제 14 조 (손해배상)</h3><br>
						<ol>
							<li>1. 기업마당 사이트는 무료로 제공되는 서비스와 관련하여 회원에게 어떠한 손해가 발생하더라도 기업마당 사이트가 고의로 행한 범죄행위를 제외하고 이에 대하여 책임을 부담하지 아니합니다.</li>
						</ol><br>
						<h3>제 15 조 (면책조항)</h3><br>
 						<ol>
							<li>1. 기업마당 사이트는 회원이나 제3자에 의해 표출된 의견을 승인하거나 반대하거나 수정하지 않습니다. 기업마당 사이트는 어떠한 경우라도 회원이 서비스에 담긴 정보에 의존해 얻은 이득이나 입은 손해에 대해 책임이 없습니다. 금전적 거래등과 관련하여 어떠한 책임도 부담하지 아니하고, 회원이 서비스의 이용과 관련하여 기대하는 이익에 관하여 책임을 부담하지 않습니다.</li>
						</ol><br>
						<h3>제 16 조 (재판관할)</h3><br>
 						<ol>
							<li>1. 기업마당 사이트와 이용자 간에 발생한 서비스 이용에 관한 분쟁에 대하여는 대한민국 법을 적용하며, 본 분쟁으로 인한 소는 대한민국의 법원에 제기합니다.</li>
						</ol>
						
											
					</div>
						
					<input type="checkbox" id="checkbox" name="member_sign_check" value='Y'
						style="margin: 10px 0px 30px 0px;">동의합니다
					<button id="button">가입하기</button>  
				</form>
				<button id="cancel" onclick="backMoveFnc()">취소</button>
			</div>
			
		</div>

	</div>


	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>

</html>