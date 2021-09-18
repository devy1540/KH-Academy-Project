<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
		#corpMainArea {
		width: 100%;
		height:inherit;
		min-height: 700px;
		margin-top: 30px;
		display:table;
	}
	#sidebar {
		border-right: 1.5px solid #B7B7B7;
		width: 20%;
		float: left;
		height: inherit;
	}
	#sidebarText {
		width: fit-content;
		float: right;
		text-align: right;
		color: #737373;
		margin-top: 10px;
		font-size: 14pt;
		line-height: 50px;
		margin-right: 15px;
	}
	.on {
		color: black;
		font-weight: bold;
	}
	#mainBox {
		width: 54%;
		height: 530px;
		float:left;
		margin-left: 50px;
		display:table-row;
	}
	#corpSignTable {
		width: 75%;
		margin: 50px auto;
		border-spacing: 0;
		border-collapse: collapse;
	}
	#corpSignTable td {
		font-size: 12px;
		width: 55%;
		font-weight: normal;
		border-bottom: 1px solid #F0F0F0;
		height: 70px;
	}
	#corpSignTable th {
		height: 70px;
		width: 40%;
    	text-align: left;
    	border-bottom: 1px solid #F0F0F0;
    	padding-left: 30px;
	}
	.ui.selection.dropdown {
		min-width: 80px !important;
	}
	div[name=menu] {
	    color: #616161;
	    font-size: 18px;
	    height: fit-content !important;
	    line-height: 40px;
	}
	.ui.blue.button {
	background-color:#00679A !important;
	}
	.ui.blue.button:hover {
		background-color: #217BA7 !important;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/corporation/common/corpMenuBar.jsp"/>
	<img src="resources/images/emptyNav.png" style="width: 100%">
	<div id="corpMainArea">
		<div id="sidebar">
			<div id="sidebarText">
				<div>이용약관</div>
				<div>기업 정보 입력</div>
				<div class="on">인증 메일 발송</div>
				<div>회원 가입 완료</div>
			</div>
		</div>
		<div id="mainBox">
			<div style="margin-top: 200px;">
				<hr>
			</div>
			<div align="center" style="margin-top:140px; margin-bottom:140px;">
				<span style="font-size:1vw; font-weight:bold; line-height:150%;">
					회원가입 인증 이메일을 발송하였습니다.<br>
					이메일을 확인하여 정회원 인증하신 후에 로그인 하실 수 있습니다.
				</span>
			</div>
			<hr>
			<div style="text-align:center; margin-top:40px; margin-bottom:100px; text-align:right;">
				<input type="button" class="ui blue button" value="메인으로" onclick="location.href='panelMain.panel'">
			</div>
		</div>
	</div>
	<div style="margin-top: 80px;">
		<jsp:include page="/WEB-INF/views/panel/common/footer.jsp"/>
	</div>
</body>
</html>