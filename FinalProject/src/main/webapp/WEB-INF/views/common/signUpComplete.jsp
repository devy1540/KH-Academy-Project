<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/WEB-INF/views/panel/common/head.jsp"/>
<title>Insert title here</title>
<style>
body {
	font-family: Lato,'Helvetica Neue',Arial,Helvetica,sans-serif;
}
#title {
	font-weight: bold;
}

#stitle {
	color: lightgray;
}

h4 {
	font-weight: bold;
}
#completetable{
	margin-top: 50px;
	margin-bottom: 50px;
	width: 100%;
}
.ui.button {
	background: #00679A !important;
	margin: 0;
}
#titleTable {
	margin: 0 auto;
	margin-top: 20px;
}

#menuTitle {
	height: 30px;
	width: 40%;
	font-size: 16pt;
	text-align: left;
	vertical-align: bottom;
	font-weight: bold;
	color: #3D3D3D;
}

#pagePath {
	width: 60%;
	text-align: right;
	vertical-align: bottom;
	font-weight: bold;
}

#depth3 {
	color: #008499;
}

#depth1, #depth2 {
	color: #494949;
}
#depth1:hover,  #depth2:hover, #depth3:hover {
	cursor: default;
}
#depth1:hover, #depth2:hover {
	color: #494949;
}

</style>
</head>
<body>
	<div class="wrap">
		<jsp:include page="/WEB-INF/views/panel/common/header.jsp"/>
		<section class="container">
		<br />
			<table id="titleTable" height="10px;" width="99%;">
				<tr>
					<td id="menuTitle">회원가입</td>
					<td id="pagePath">
						<div class="ui breadcrumb">
							<a class="active section" id="depth1">이용약관</a>
							<i class="right angle icon divider"></i>
							<a class="active section" id="depth2">정보입력</a>
							<i class="right angle icon divider"></i>
							<div class="active section" id="depth3">가입완료</div>
						</div>
					</td>
				</tr>
			</table>
			
			<div class="sectionLine">
				<hr>
			</div>
			<div id="complete">
			<table id="completetable" align="center">
				<tr>
					<td colspan="6" align="center">
						<img src="resources/images/footerLogo.png" width="500px" >
					</td>
				</tr>
				<tr>
					<td><br></td>
				</tr>
				<tr>
					<td colspan="6" align="center"><h2>정회원 인증이 완료되었습니다.<br></h2>
													<h4 style="color: #4A4A4A;">이제부터 로그인이 가능합니다!</h4></td>
				</tr>
				<tr>
					<td><br></td>
				</tr>
				<tr>
					<td colspan="6"><hr></td>
				</tr>
				<tr>
					<td colspan="6" align="center">
						<button class="ui blue button" onclick="location.href='panelLogin.panel'">로그인</button>
						<button class="ui blue button" onclick="location.href='panelMain.panel'">메인으로</button>
					</td>
				</tr>
			</table> <!-- completetable end -->
		</div> <!-- complete end -->
		<br />
		</section>  <!-- container end -->
	</div><!-- wrap end -->
</body>
</html>