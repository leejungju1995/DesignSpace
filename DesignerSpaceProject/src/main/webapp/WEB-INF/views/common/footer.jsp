<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.btn_gotop {
	display:none;
	position:fixed;
	bottom:30px;
	right:30px;
	z-index:999;
	outline:none;
	background-color:white;
	cursor:pointer;
	border-radius:100%;
}
</style>
<script>
$(window).scroll(function(){
	if ($(this).scrollTop() > 300){
		$('.btn_gotop').show();
	} else{
		$('.btn_gotop').hide();
	}
});
$('.btn_gotop').click(function(){
	$('html, body').animate({scrollTop:0},400);
	return false;
});
</script> 
<div id="footer">
   <div id="footer_inner">
      <span id="f_corp_area">
         COPYRIGHT ⓒ SINCE 2020 DESIGNERSSPACE.CO.KR CO., LTD. ALL RIGHTS RESERVED.
      </span> 
   </div>
</div>
<!-- 상단 이동하기 버튼 -->
<a href="#" >
  <img class="btn_gotop" src="<%=request.getContextPath()%>/resources/img/topBtn.png" style="width:50px"> 
</a>
