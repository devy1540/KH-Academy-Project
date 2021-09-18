<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/views/panel/common/head.jsp" />
</head>
<style>

#contentDiv {
	height:350px;
}

.ui.placeholder {
	background-image:none;
}

.ui.placeholder.segment {
	background:white;
	-webkit-box-shadow:none;
	box-shadow:none;
}

</style>
<body>
	<div class="wrap">
		<jsp:include page="/WEB-INF/views/panel/common/header.jsp"/>
		<section class="container">
		<br />
			<table id="titleTable" height="10px;" width="99%;">
				<tr>
					<td id="menuTitle">회원가입</td>
				</tr>
			</table>
			
			<div class="hr">
				<hr>
			</div>
			
			
			
			
			<div class="ui placeholder segment" id="contentDiv" style="border:none;">
				<div class="ui two column stackable center aligned grid">
					<div class="ui vertical divider">Or</div>
					<div class="middle aligned row">
						<div class="column">
							<img src="${contextPath}/resources/images/panelImage.png" style="width: 30%; margin-bottom: 10px;"><br>
							<span style="font-size:12pt;">설문참여 서비스를 이용하고자 하시나요?</span>
							<br>
							<button class="ui button"  id="goPanelSignup" onclick="location.href='panelSignup1.panel'" style="margin-top: 15px;">패널 회원가입하기</button>
						</div>
						<div class="column">
							<img src="${contextPath}/resources/images/branch.png" style="width: 30%; margin-bottom: 10px;"><br>
							<span style="font-size:12pt;">리서치 작성 서비스를 이용하고자 하시나요?</span>
							<br>
							<button class="ui button" id="goPanelSignup" onclick="location.href='corpSignup1.corp'" style="margin-top: 15px;">기업 회원가입하기</button>
						</div>
					</div>
				</div>
			</div>
			
			<div class="hr bottomHr">
				<hr>
			</div>			


		</section>  <!-- container end -->
		<jsp:include page="/WEB-INF/views/panel/common/footer.jsp"/>
	</div>  <!-- wrap end -->
</body>
</html>












