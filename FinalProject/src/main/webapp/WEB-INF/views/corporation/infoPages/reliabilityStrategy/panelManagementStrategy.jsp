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
				<div class="on">패널 관리</div>
				<div class="off" onclick="location.href='surveyFormatStrategy.corp'">설문지 작성 단계</div>
				<div class="off" onclick="location.href='mailingStrategy.corp'">메일 발송 단계</div>
				<div class="off" onclick="location.href='onlineStrategy.corp'">온라인 실사 단계</div>
				<div class="off" onclick="location.href='dataCheckStrategy.corp'">데이터 검증 단계</div>
			</div>
		</div>
		<div id="mainBox">
			<div class="section">
				◈ 패널 관리 활동 요약
			</div>
			<div class="sectionLine">
				<hr>
			</div>
			<div style="width:90%; margin:0 auto; margin-bottom:80px;">
				<img src="resources/images/panelProcess.png" style="width:100%; margin-top:20px;">
			</div>
			<div class="section">
				◆ Thanks Survey (TS)
			</div>
			<div class="sectionLine" style="margin-bottom:20px; padding-bottom:0px;">
				<hr>
			</div>
			<table id="explainTable" style="font-size:0.9vw; line-height:200%;">
				<tr>
					<th style="width:auto;"><div class="iconDiv"><i class="caret right icon"></i></div></th>
					<td>One-click Away가 주요 특징인 인터넷 환경 하에서 패널들이 활발하게 활동할 수 있게 하기 위해서는 초기 관리가 매우 중요합니다.</td>
				</tr>
				<tr>
					<th style="width:auto;"><div class="iconDiv"><i class="caret right icon"></i></div></th>
					<td>이를 위해 신규가입 패널을 대상으로 2회의 Thanks Survey를 실시하고 있으며, 1차 조사는 가입 직후에 시작됩니다.</td>
				</tr>
				<tr>
					<th style="width:auto;"><div class="iconDiv"><i class="caret right icon"></i></div></th>
					<td>Thanks Survey를 통해 온라인 조사 응답 시 주의사항에 대해 교육함으로써 조사의 신뢰성을 높이고 있습니다.</td>
				</tr>
			</table>
			<div style="width:90%; margin:0 auto; margin-top:40px; margin-bottom:80px;">
				<img src="resources/images/tsProcess.png" style="width:100%; margin-top:20px;">
			</div>
			<div class="section">
				◆ Panel Survey (PS)
			</div>
			<div class="sectionLine" style="margin-bottom:20px; padding-bottom:0px;">
				<hr>
			</div>
			<table id="explainTable" style="font-size:0.9vw; line-height:200%;">
				<tr>
					<th style="width:auto;"><div class="iconDiv"><i class="caret right icon"></i></div></th>
					<td>패널의 개인정보 및 주요 항목에 대한 최신성 확보를 위해 전체 패널을 대상으로 연간 최소 1회의 Panel Survey를 진행하고 있습니다.</td>
				</tr>
				<tr>
					<th style="width:auto;"><div class="iconDiv"><i class="caret right icon"></i></div></th>
					<td>최신의 패널정보를 유지함으로써 Sampling Target의 정확도를 높여 실사시간과 비용을 최소화하고, 설문 응답의 탈락율을 최소화합니다.</td>
				</tr>
			</table>
			<div style="width:90%; margin:0 auto; margin-top:40px; margin-bottom:80px;">
				<img src="resources/images/psProcess.png" style="width:100%; margin-top:20px;">
			</div>
			<div class="section">
				◆ 패널 등급 제도
			</div>
			<div class="sectionLine" style="margin-bottom:20px; padding-bottom:0px;">
				<hr>
			</div>
			<table id="explainTable" style="font-size:0.9vw; line-height:200%;">
				<tr>
					<th style="width:auto;"><div class="iconDiv"><i class="caret right icon"></i></div></th>
					<td>패널 활성화를 위하여 패널을 ‘활성', ‘준활성', ‘비활성', ‘휴면' 4가지 등급으로 나누어 관리하고 있습니다.</td>
				</tr>
			</table>
			<div style="width:90%; margin:0 auto; margin-top:40px; margin-bottom:80px;">
				<img src="resources/images/panelLevel.png" style="width:100%; margin-top:20px;">
			</div>
			<div class="section">
				◆ 패널 3진아웃 제도
			</div>
			<div class="sectionLine" style="margin-bottom:20px; padding-bottom:0px;">
				<hr>
			</div>
			<table id="explainTable" style="font-size:0.9vw; line-height:200%;">
				<tr>
					<th style="width:auto;"><div class="iconDiv"><i class="caret right icon"></i></div></th>
					<td>불량응답을 3회 한 경우에는 직권탈퇴 처리함으로써 불성실 응답자를 제거하고 있습니다.</td>
				</tr>
			</table>
			<div style="width:90%; margin:0 auto; margin-top:40px; margin-bottom:80px;">
				<img src="resources/images/3out.png" style="width:100%; margin-top:20px;">
			</div>
		</div>
	</div>
	<div style="margin-top: 80px;">
		<jsp:include page="/WEB-INF/views/panel/common/footer.jsp"/>
	</div>
</body>
</html>