<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/views/panel/common/head.jsp" %>
</head>
<style>
	.ui.blue.button {
	background-color:#00679A;
	}
	.ui.blue.button:hover {
		background-color: #217BA7;
	}

</style>
<body>
	<div class="wrap">
		<%@ include file="/WEB-INF/views/panel/common/header.jsp" %>
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
			
			
		<div align="center" style=" margin-top:100px; margin-bottom:140px;">
			<span style="font-size:1vw; font-weight:bold; line-height:150%;">
				회원가입 인증 이메일을 발송하였습니다.<br>
				이메일을 확인하여 정회원 인증하신 후에 로그인 하실 수 있습니다.
			</span>
		</div>
		<hr>
		<div style="text-align:center; margin-top:40px; margin-bottom:100px; text-align:right;">
			<input type="button" class="ui blue button" value="메인으로" onclick="location.href='panelMain.panel'">
		</div>
			
			
		<br />
		</section>  <!-- container end -->
		<%@ include file="/WEB-INF/views/panel/common/footer.jsp" %>
	</div>  <!-- wrap end -->
</body>
</html>















