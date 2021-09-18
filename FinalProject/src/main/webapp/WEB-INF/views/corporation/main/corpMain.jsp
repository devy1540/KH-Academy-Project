<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	#mainArea {
		width: 100%;
		height: 100vh;
		background-image: url("resources/images/corpMain.png");
		background-repeat: no-repeat;
		background-size: cover;
		margin-top: 10px;
		padding-top: 30px;
	}
	#mainArea div {
		margin: 20px auto;
		width: fit-content;
		font-size: 22px;
		color: white;
	}
	#corpMainLetter {
		margin: 100px auto !important;
	}
	#btnArea {
		width: 60%;
		margin: 0 auto;
		text-align: center;
	}
	#btnArea td div:hover {
		background: rgba(196, 196, 196, 0.25);
		cursor: pointer;
	}
	#btnArea td div{
		width: fit-content;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/corporation/common/corpMenuBar.jsp"/>
	<c:if test="${ empty sessionScope.loginUser or sessionScope.loginUser.userType ne '기업' }">
		<c:set var="msg" value="기업회원만 접근 가능합니다." scope="request"/>
		<jsp:forward page="/WEB-INF/views/common/errorPage.jsp"/>
	</c:if>
	<div id="mainArea">
		<div id="corpName">Welcome! (주)OrangeRed</div>
		<div id="corpMainLetter"><img alt="corpMainLetter" src="${ contextPath }/resources/images/corpMainLetter.png"></div>
		
		<table id="btnArea">
			<tr>
				<td><div onclick="location.href='sampleResearchMain.corp'"><img alt="sampleResearch" src="${ contextPath }/resources/images/sampleResearch.png"></div></td>
				<td><div onclick="location.href='newResearchMain.corp'"><img alt="newResearch" src="${ contextPath }/resources/images/newResearch.png"></div></td>
				<td><div onclick="location.href='previousResearchMain.corpResearch'"><img alt="previousResearch" src="${ contextPath }/resources/images/previousResearch.png"></div></td>
			</tr>
		</table>
	</div>
	
	<jsp:include page="/WEB-INF/views/panel/common/footer.jsp"/>
</body>
</html>