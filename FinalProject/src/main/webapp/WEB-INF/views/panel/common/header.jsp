<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<style>
	 @media screen and (max-width: 1000px) { 
		.container {
			width: 95%;
		}
	}
	body, html {
		font-family: Lato,'Helvetica Neue',Arial,Helvetica,sans-serif !important;
	}
	
</style>
<header class="headerArea">
	<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>

	<table class="headerTableArea" align="center">
		<tr>
			<td class="headerLogoArea">
				<a href="panelMain.panel"><img src="resources/images/headerLogo.png" alt="" id="logoImg" /></a>
			</td>
			<td class="smallLogoArea">
				<a href="panelMain.panel"><img src="resources/images/smallLogo.png" alt="" id="logo2Img" /></a>
			</td>
			<td class="headerLoginArea">
				<c:choose>
					<c:when test="${ not empty sessionScope.loginUser }">
						<c:if test="${ sessionScope.loginUser.userType == '관리자' }">
							<a href="adminMain.admin" style="margin-right: 5%; font-size:0.8vw;">관리자 메인</a>
						</c:if>
						<a href="logout.me" style="margin-right: 5%; font-size:0.8vw;">로그아웃</a>
						<a href="myInfo.panel" style="font-size:0.8vw;">내 정보 관리</a>
					</c:when>
					<c:otherwise>
						<a href="panelLogin.panel" style="margin-right: 5%; font-size:0.8vw;">로그인</a>
						<a href="panelSignup.panel" style="font-size:0.8vw;">회원가입</a>
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
	</table>  <!-- headerTableArea end -->
</header>  <!-- headerArea end -->
<nav class="navArea">
	<div class="navContainer">
		<div class="ui four inverted item menu" id="nav">
			<div class="ui simple dropdown item" style="height: 100%; letter-spacing: 10px; font-size:0.8vw;">
				안내
				<div class="menu" style="letter-spacing: 0">
					<a href="benefitInfo.panel" class="item">혜택 안내</a>
			    	<a href="surveyGuide.panel" class="item">조사참여 가이드</a>
				</div>
			</div>
			<div class="ui simple dropdown item" style="height: 100%; font-size:0.8vw;">
		   		 서베이
		   		 <div class="menu">
			    	<a href="surveyList.survey" class="item">진행중인 설문조사</a>
			    	<a href="mySurveyList_complete.survey" class="item">참여한 설문조사</a>
			    	<a href="panelSurveyLists.survey" class="item">패널서베이</a>
		    	</div>
		  	</div>
			<div class="ui simple dropdown item" style="height: 100%; font-size:0.8vw;">
		   		 마이페이지
		    	<div class="menu">
			    	<a href="myInfo.panel" class="item">내 정보 관리</a>
			    	<a href="myRewardMain.myPage" class="item">내 리워드 관리</a>
			    	<a href="panelDrop.panel" class="item">패널 탈퇴</a>
		    	</div>
		  	</div>
			<div class="ui simple dropdown item" style="height: 100%; font-size:0.8vw;">
		   		 고객센터
		    	<div class="menu">
			    	<a href="notice.customerCenter" class="item">공지사항</a>
			    	<a href="faq.customerCenter" class="item">자주묻는 질문</a>
			    	<a href="panelInquiryList.customerCenter"class="item">내 1:1 문의</a>
		    	</div>
		  	</div>
		</div>
	</div>  <!-- navContainer end -->
</nav>  <!-- navArea end -->
<c:if test="${ sessionScope.loginUser.userType eq '기업' }">
	<c:set var="msg" value="기업회원은 접근 불가한 페이지 입니다." scope="request"/>
	<jsp:forward page="/WEB-INF/views/common/errorPage.jsp"/>
</c:if>
