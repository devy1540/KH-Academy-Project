<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/registerEnd.css">
<title>LauXion</title>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	<%@ include file="../common/nav.jsp" %>

	<div id="Register"> 회원가입
		<span id="road"> 
		<span class="road"> 약관동의 </span> 
		<span class="arrow"> > </span> 
		<span class="road"> 정보입력 </span> 
		<span class="arrow"> > </span> 
		<span class="road"> 가입완료 </span>
		</span>
	</div>
	<div class="end">
		<h1>회원가입이 완료됐습니다.</h1>
		
		<h3>로그인을 진행해주세요.</h3>
		
		<button>로그인하러 가기</button>
	</div>

	<%@ include file="../common/footer.jsp" %>
</body>
</html>