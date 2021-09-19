<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/views/panel/common/head.jsp"/>
</head>
<style>
.sectionLine {
	padding-bottom: 40px;
}
.ui.segment {
	border-radius: 0px;
}

.eachSurveyBox {
	height: 210px;
}
.eachSurveyBox:hover {
	cursor:pointer;
} 

.ui.segment {
	padding: 3px;
}

.icon {
	hieght: 16px;
	width: 16px;
}
.top, .middle, .bottom {
    width:100%;
}
.top-left {
	width: 30%;
}

.top-right {
	width: 70%;
	text-align: right;
	padding-top: 3px;
}

.middle {
	height: 75px;
	padding: 8px;
	padding-top: 15px;
}

.bottom {
	height: 96px;
	width: 99%;
	background-color: #EDEBEB;
	margin: 0 auto;
}

.bottom-top {
	height: 40%;
}

.bottom-middle {
	height: 30%;
	text-align: center;
	padding-top: 5%;
}

.bottom-bottom {
	height: 30%;
	text-align: center;
	padding-bottom: 5%;
}
#pagingArea {
		margin-top: 40px;
		
		/* 드래그 방지용 소스*/
		-ms-user-select: none; 
		-moz-user-select: -moz-none; 
		-webkit-user-select: none; 
		-khtml-user-select: none; 
		user-select:none;
		/* 드래그 방지용 소스*/
	}
#pagingArea span {
	margin-left: 5px;
	margin-right: 5px;
	font-size: 10pt;
}

#pagingArea span:hover {
	margin-left: 5px;
	margin-right: 5px;
	font-size: 10pt;
	cursor: pointer;
}
.cards:hover {
	transform:translateY(-3px);
}
.ui.segment.cards.eachSurveyBox {
	background-color:white;
}

</style>
<body>
	<div class="wrap">
		<jsp:include page="/WEB-INF/views/panel/common/header.jsp"/>
		<section class="container">
			<img src="resources/images/panelMain.png" style="width:100%; margin-top:40px; margin-bottom:20px;">
			<table style="width:100%; margin-top:30px; background-color:#E2F4F7; padding:10px; height:100px;">
				<tr>
					<td style="width:16%; padding-left:15px;">
						<a href="surveyList.survey"><img src="resources/images/panelMainSurvey.gif" style="height:inherit;"></a>
					</td>
					<td style="width:84%;">
						<a class="ui pink right ribbon label" id="moreBtn"><span style="font-size:0.7vw;">more</span></a>
						<div class="ui four column grid" id="surveyListArea" style="width:95%; margin: 0 auto;">
							<c:forEach var="list" items="${ researchList }" varStatus="status">
								<div class="column">
									<div id="eachSurveyBox" class="ui segment cards eachSurveyBox"> <!-- 설문조사 시작 페이지로 넘어갈때 이 div영역에 링크걸면됩니다. -->
										<div class="eachBox" style="width: 100%;">
											<div class="top">
												<table style="width: 100%;">
													<tr>
														<td class="top-left">
															<span style="font-size:0.9vw;">[</span>
															<span style="font-size:0.9vw;">${ list.researchNo }</span>
															<span style="font-size:0.9vw;">]</span>
														</td>
														<td class="top-right">
															<img src="resources/images/pc.png" alt="" class="icon"/>
															<img src="resources/images/mobile.png" alt="" class="icon"/>
														</td>
													</tr>
													<tr>
												</table>
											</div>
											<div class="middle">
												<span style="font-size:1vw;">${ list.researchName }</span>
											</div>
											<div class="bottom">
												<div class="bottom-top" style="text-align:center; padding-top:14px;">
													<span style="font-weight:bold; font-size:1vw; color:#005E8C;">${ list.researchReward }P</span>
												</div>
												<div class="bottom-middle">
													<span style="font-size:0.8vw; margin-right:7px;">시작일 :</span>
													<fmt:parseDate value="${ fn:split(list.researchPeriod, '~')[0] }" var="startDate" pattern="yyyyMMdd"/>
													<span style="font-size:0.8vw;">
														<fmt:formatDate value="${ startDate }" pattern="yyyy.MM.dd"/>
													</span>
												</div>
												<div class="bottom-bottom">
													<span style="font-size:0.8vw; margin-right:7px;">종료일 :</span>
													<fmt:parseDate value="${ fn:split(list.researchPeriod, '~')[1] }" var="endDate" pattern="yyyyMMdd"/>
													<span style="font-size:0.8vw;">
														<fmt:formatDate value="${ endDate }" pattern="yyyy.MM.dd"/>
													</span>
												</div>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</td>
				</tr>
			</table>
			
			<table style="margin-top:50px; margin-bottom:50px; background-color:#F0F0F0; height:200px; width:100%;">
				<tr>
					<td rowspan="2" style="width:40%; padding-left:15px; padding-top:15px; vertical-align:top;">
						<table style="width:100%; margin-top:5px; margin-bottom:11px;">
							<tr>
								<td style="width:22%;"><span style="font-size:0.9vw; font-weight:bold;">공지사항</span></td>
								<td><hr></td>
								<td style="width:20%; text-align:right;">
									<a href="notice.customerCenter">
									<i class="plus circle icon" style="color:#CC3399;"></i>
										<span style="font-size:0.8vw; color:grey; font-weight:bold;">more</span>
									</a>
								</td>
							</tr>
						</table>
						<div style="height:80%;">
							<table id="mainNoticeListTable" style="width:100%; table-layout:fixed;">
								<c:forEach var="list" items="${ noticeList }" varStatus="status">
									<tr>
										<td style="width:70%;text-overflow:ellipsis; overflow:hidden; white-space:nowrap;border:2px solid #F0F0F0;">
											<input type="hidden" value="${ list.noticeNo }"/>
											<i class="bell icon" style="color:#008499;"></i><span style="font-size:0.8vw;">${ list.noticeTitle }</span>
										</td>
										<td style="width:30%; text-align:right;">
											<span style="font-size:0.8vw;">${ list.noticeDate }</span>
										</td>
									</tr>
								</c:forEach>
							</table>
						</div>
					</td>
					<td style="width:30%; height:100px; text-align:center; padding-top:20px; padding-bottom:10px;">
						<a href="faq.customerCenter"><img src="resources/images/faq.png" style="margin-left:7%; height:100%; border:grey;"></a>
					</td>
					<td rowspan="2" style="width:35%; vertical-align:middle; text-align:right;">
						<img src="resources/images/callNumber.png" style="vertical-align:middle; height:150px;">
					</td>
				</tr>
				<tr>
					<td style="height:100px; text-align:center; padding-top:10px; padding-bottom:20px;">
						<a href="panelInquiryList.customerCenter" id="inquiryBtn"><img src="resources/images/inquiry.png" style="margin-left:7%; height:100%; border:grey;"></a>
					</td>
				</tr>
			</table>
			<c:if test="${ !empty param.message }">
				<script>
					Swal.fire(
					      '로그아웃',
					      '${ param.message }',
					      'success'
					);
				</script>
			</c:if>
			
		</section>  <!-- container end -->
		<jsp:include page="/WEB-INF/views/panel/common/footer.jsp"/>
	</div>  <!-- wrap end -->
<!-- 	<script>
		console.log($("#mainNoticeListTable").children().children());
		$("#mainNoticeListTable").children().children().mouseover(function() {
			$(this).css({"cursor":"pointer"});
		}).click(function() {
// 			공지사항 누르면 해당 공지사항의 no 가져오는 스크립트 구문 (지우지말것)
			console.log($(this).children().eq(0).children().eq(0).val());
			location.href="notice.customerCenter?noticeNo=" + $(this).children().eq(0).children().eq(0).val();
		});
	</script> -->
	<script>
//		새로고침 시 쿼리스트링 제거
		window.onkeydown = function() { 
			var kcode = event.keyCode; 
			if(kcode == 116) { 
				history.replaceState({}, null, location.pathname); 
			} 
		}
		$("#surveyListArea").children().click(function() {
// 			리서치 조사번호
			var researchNo = $(this).children().children().children().eq(0).children().children().children().eq(0).children().eq(0).children().eq(1).text();
// 			로그인한 패널등급번호
			var loginUserPanelLevel = "${ loginUser.panellevelNo }";
			console.log(researchNo);
			console.log(loginUserPanelLevel);
			if(loginUserPanelLevel == "1") {
				Swal.fire('안내', 'Thanks Survey 먼저 진행해주세요!', 'warning').then(function() {
					location.href="surveyList.survey";
				});
			} else if(loginUserPanelLevel == "") {
				Swal.fire('안내', '로그인 후 이용해주세요', 'warning').then(function(){
					location.href="panelLogin.panel";
				});
			}
		});
		$("#moreBtn").click(function() {
			var loginUserPanelLevel = "${ loginUser.panellevelNo }";
			if(${ loginUser == null }) {
				Swal.fire('안내', '로그인 후 이용해주세요', 'warning').then(function(){
					location.href="panelLogin.panel";
				});
			} else {
				location.href="surveyList.survey";
			}
		});
		$("#inquiryBtn").css("cursor","pointer").click(function() {
			if(${ loginUser == null }) {
				Swal.fire('안내', '로그인 후 이용해주세요', 'warning').then(function(){
					location.href="panelLogin.panel";
				});
			} else {
				location.href="panelInquiryList.panel";
			}
		});
	</script>
</body>
</html>






































