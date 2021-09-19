<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${ contextPath }/resources/css/accordion.min.css" rel="stylesheet">
<script src="${ contextPath }/resources/js/accordion.min.js"></script>

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
	.off:hover {
		cursor:pointer;
	}
	#mainBox {
		width: 54%;
		height: auto;
		min-height:750px;
		float:left;
		margin-left: 50px;
		display:table-row;
	}
	.heading:hover {
		cursor:pointer;
	}
	.accordion-container {
		width: 80%;
		margin: 30px auto;
		display: block;
		border: 1px solid lightgray;
		border-radius: 4px !important;
		margin-top: 100px;
	}
	.innerContent {
		max-height: 300px;
		min-height: 200px;
		overflow-y: auto;
		width: 100%;
	}
	.ui.blue.button {
	background-color:#00679A !important;
	}
	.ui.blue.button:hover {
		background-color: #217BA7 !important;
	}
	.section {
		height: 30px;
		width: 100%;
		font-size: 16pt;
		text-align: left;
		vertical-align: bottom;
		font-weight: bold;
		color: #3D3D3D;
		padding-top:7px;
		margin-top:20px;
	}
	.sectionLine {
		padding-bottom:40px;
	}
	.iconDiv {
		color:purple; 
		margin:0px;
		height: 100%;
		position: absolute;
		top: 0;
	}
	#explainTable {
		width:100%;
	}
	#explainTable th {
		position: relative;
		width: fit-content;
	}
	#explainTable td {
		position: relative;
		left: 20px;
		width: fit-content;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/corporation/common/corpMenuBar.jsp"/>
	<img src="resources/images/emptyNav.png" style="width: 100%">
	<div id="corpMainArea">
		<div id="sidebar">
			<div id="sidebarText">
				<div class="off" onclick="location.href='panelManagementStrategy.corp'">패널 관리</div>
				<div class="off" onclick="location.href='surveyFormatStrategy.corp'">설문지 작성 단계</div>
				<div class="on">메일 발송 단계</div>
				<div class="off" onclick="location.href='onlineStrategy.corp'">온라인 실사 단계</div>
				<div class="off" onclick="location.href='dataCheckStrategy.corp'">데이터 검증 단계</div>
			</div>
		</div>
		<div id="mainBox">
			<div class="section">
				◈ 메일 발송 단계 신뢰성 확보 방안
			</div>
			<div class="sectionLine">
				<hr>
			</div>
			<div style="width:90%; margin:0 auto; margin-top:20px; margin-bottom:80px;">
				<img src="resources/images/reliabilityProcess.png" style="width:100%;">
			</div>
			<div class="section">
				◆ 조사 참여 요청 메일
			</div>
			<div class="sectionLine" style="margin-bottom:20px; padding-bottom:0px;">
				<hr>
			</div>
			<table id="explainTable" style="font-size:0.9vw; line-height:200%;">
				<tr>
					<th style="width:auto;"><div class="iconDiv"><i class="caret right icon"></i></div></th>
					<td>조사참여 요청메일에서 조사 목적을 숨김으로써 Reward만을 노리는 허위 응답자를 방어할 수 있습니다.</td>
				</tr>
			</table>
			<div style="width:90%; margin:0 auto; margin-top:40px; margin-bottom:80px;">
				<img src="resources/images/invitationEmail.png" style="width:100%; margin-top:20px;">
			</div>
			<div class="section">
				◆ Mailing 규칙
			</div>
			<div class="sectionLine" style="margin-bottom:20px; padding-bottom:0px;">
				<hr>
			</div>
			<table id="explainTable" style="font-size:0.9vw; line-height:200%;">
				<tr>
					<th style="width:auto;"><div class="iconDiv"><i class="caret right icon"></i></div></th>
					<td>조사참여 회수를 제한하고, 최근 참여일 기준 Targeting Rule을 활용함으로써 Panel Contamination을 최소화할 수 있습니다.</td>
				</tr>
			</table>
			<div style="width:90%; margin:0 auto; margin-top:40px; margin-bottom:80px;">
				<img src="resources/images/mailingRule.png" style="width:100%; margin-top:20px;">
			</div>
		</div>
	</div>
	<div style="margin-top: 80px;">
		<jsp:include page="/WEB-INF/views/panel/common/footer.jsp"/>
	</div>
</body>
</html>