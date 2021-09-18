<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html;">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>Insert title here</title>
<link  rel="stylesheet" type="text/css" href="css/header.css">
</head>
<body>
	<div id="header">
		<div id="header_box">
			<ul>
				<li><a href="admin_mainPage.jsp">메인 화면</a></li>
				<li>회사 관리</li>
				<li id="up">회원 정보</li>
				<li>물품 관리</li>
				<li>경매 관리</li>
				<li id="up">매출 관리</li>
				<li><a href="admin_Notice.jsp">게시판 관리</a></li>
				<li>문의 및 신고</li>
			</ul>
		</div>
	</div>
	<div id="bottom">
		<div id="bottom_box">
			<ul id="usermit">
				<li id="up"><a href="admin_userInformation.jsp">회원정보 관리</a></li>
				<li id="up"><a href="admin_blackUser.jsp">블랙리스트</a></li>
			</ul>
			<ul id="revenueManagement">
				<li id="up">기간별 매출</li>
				<li id="up">순수이익</li>
			</ul>
		</div>
	</div>
	<script type="text/javascript" src="script/header.js">
		
	</script>
</body>
</html>