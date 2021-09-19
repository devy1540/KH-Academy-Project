<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/views/panel/common/head.jsp" />
</head>
<style>
.researchType {
	background-color: white;
	height: 150px;
	width: 200px;
	margin-left: 80px;
	margin-top: 50px;
	color: black;
}

.ui.teal.inverted.segment {
	display: inline-flex;
	margin-bottom: 70px;
}
.onlineResearch{
	margin-bottom: 70px;
}
.onlineResearchImg{
	display: inline-flex;
}
</style>
<body>
	<div class="wrap">
		<jsp:include page="/WEB-INF/views/panel/common/header.jsp" />
		<section class="container">
			<br />


			<table id="titleTable" height="10px;" width="99%;">
				<tr>
					<td id="menuTitle">조사 참여 가이드</td>
					<td id="pagePath">
						<div class="ui breadcrumb">
							<a class="section" id="depth1" href="panelMain.panel">Home</a> <i
								class="right angle icon divider"></i> <a class="section"
								id="depth2" href="benefitInfo.panel">안내</a> <i
								class="right angle icon divider"></i>
							<div class="active section" id="depth3">조사 참여 가이드</div>
						</div>
					</td>
				</tr>
			</table>

			<div class="sectionLine">
				<hr>
			</div>

			<div class="ui teal inverted segment"
				style="width: 100%; height: 250px;" align="center">
				<h2 class="ui grey header"
					style="color: white !important; margin-left: 20px; margin-top: 5px;">조사종류</h2>
				<div style="margin-left: 30px;"></div>
				<div class="researchType" align="center">
					<img src="resources/images/researchType1.PNG" style="width: 100%">
				</div>

				<div class="researchType" align="center">
					<img src="resources/images/researchType2.PNG" style="width: 100%">
				</div>
			</div>

			<div style="width: 100%" class="onlineResearch">
				<h2 class="ui blue header" style="margin-left: 20px;">온라인 조사</h2>
				<ul class="ui list" style="margin-left: 40px;">
					<li>PC를 통해 참여하실 수 있습니다.</li>
					<li>조사 응답시간, 난이도에 따라 적립금이 달라집니다.</li>
					<li>조사 대상이 아닌 분은 중간에 중단될 수 있습니다.</li>
				</ul>
				<div style="height:30px;"></div>
				<div class="onlineResearchImg" style="margin-left:20px;">
					<img src="resources/images/research1.png" style="width: 50%">
					<img src="resources/images/research2.png" style="width: 50%">
				</div>
				<div style="height:30px;"></div>
				<div class="ui list" style="margin-left: 20px;">
					<div class="item">
						<i class="plus icon"></i>
						<div class="content">1.조사기간:참여자가 많은 경우 미리 종료될 수 있습니다.</div>
					</div>
					<div class="item">
						<i class="minus icon"></i>
						<div class="content">2.예상 응답시간</div>
					</div>
					<div class="item">
						<i class="times icon"></i>
						<div class="content">3.조사 완료 적립금 : 조사 완료 시 받으며, 즉시적립과 사후적립으로
							나눠집니다. (사후적립은 10~15일 소요)</div>
					</div>
					<div class="item">
						<i class="divide icon"></i>
						<div class="content">4.보상 적립금 : 조사 대상이 아니거나 초과한 경우 받는
							적립금입니다.</div>
					</div>
				</div>
			</div>
			<div class="mobileResearch">
				<table>
				<tr>
				<td>
				<h2 class="ui blue header" style="margin-left: 20px;">모바일 조사</h2>
				<ul class="ui list" style="margin-left: 40px;">
					<li>스마트폰이나 태블릿PC를 통해 참여하실 수 있습니다.</li>
					<li>조사 응답 시간, 나이도에 따라 적립금이 달라집니다.</li>
					<li>조사 대상이 아닌 분은 중간에 중단될 수 있습니다.</li>
				</ul>
				</td>
				<td style="width:20%;"></td>
				<td>
				<img src="resources/images/why.PNG" style="width: 150px;heigh:150px;">
				</td>
				</tr>
				</table>
			 </div>
			<br />
		</section>
		<!-- container end -->
		<jsp:include page="/WEB-INF/views/panel/common/footer.jsp" />
	</div>
	<!-- wrap end -->
</body>
</html>















