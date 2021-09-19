<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/views/panel/common/head.jsp"/>
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
	<c:if test="${ loginUser != null }">
		<div class="wrap">
			<jsp:include page="/WEB-INF/views/panel/common/header.jsp"/>
			<section class="container">
			<br />
			<table id="titleTable" height="10px;" width="99%;">
				<tr>
					<td id="menuTitle">내 정보 관리</td>
					<td id="pagePath">
						<div class="ui breadcrumb">
							<a class="section" id="depth1" href="panelMain.panel">Home</a>
							<i class="right angle icon divider"></i>
							<a class="section" id="depth2" href="myInfo.panel">마이페이지</a>
							<i class="right angle icon divider"></i>
							<div class="active section" id="depth3">내 정보 관리</div>
						</div>  <!-- .ui .breadcrumb end -->
					</td>
				</tr>
			</table>  <!-- #titleTable end -->
			
			<div class="sectionLine">
				<hr>
			</div>  <!-- .sectionLine end -->
			
			<form action="checkPassword.me" method="post">
				<div id="passwordconfirm" style="width: 100%;">
					<div style="height:250px;">
						<div style="text-align:center; margin-top: 60px; margin-bottom:40px;">
							<span style="font-size:1vw; font-weight:bold; line-height:150%;">
								회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한 번 확인합니다.<br>
								비밀번호가 타인에게 노출되지 않도록 항상 주의해 주세요.
							</span>
						</div>
						<div style="text-align:center; margin-bottom:0px;">
							<span style="font-size:0.9vw;">비밀번호 : </span>
							<div class="ui input">
								<input type="password" name="userPwd" id="userPwd" style="margin-left: 10px;">
							</div>
						</div>
					</div>
					<hr>
					<div style="text-align:right; margin-top:40px;">
						<button class="ui blue button" type="submit">다음단계</button>
						<button class="ui blue button" type="button" onclick="location.href='panelMain.panel'">메인으로</button>
					</div>
				</div>  <!-- #passwordconfirm end -->
			</form>
			<br />
			</section>  <!-- container end -->
			<jsp:include page="/WEB-INF/views/panel/common/footer.jsp"/>
		</div>  <!-- wrap end -->
	</c:if>
	<c:if test="${ loginUser == null }">
		<script>
			location.href="panelResult.panel?message=notLoginAccess";
		</script>
	</c:if>
</body>
</html>












