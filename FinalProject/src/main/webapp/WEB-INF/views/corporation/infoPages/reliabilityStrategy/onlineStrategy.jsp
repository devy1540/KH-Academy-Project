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
				<div class="off" onclick="location.href='mailingStrategy.corp'">메일 발송 단계</div>
				<div class="on">온라인 실사 단계</div>
				<div class="off" onclick="location.href='dataCheckStrategy.corp'">데이터 검증 단계</div>
			</div>
		</div>
		<div id="mainBox">
			<div class="section">
				◈ 온라인 실사 단계 신뢰성 확보 방안
			</div>
			<div class="sectionLine">
				<hr>
			</div>
			<div style="width:90%; margin:0 auto; margin-top:20px; margin-bottom:80px;">
				<img src="resources/images/reliabilityProcess.png" style="width:100%;">
			</div>
			<div class="section">
				◆ 사용자 환경 테스트
			</div>
			<div class="sectionLine" style="margin-bottom:20px; padding-bottom:0px;">
				<hr>
			</div>
			<table id="explainTable" style="font-size:0.9vw; line-height:200%;">
				<tr>
					<th style="width:auto;"><div class="iconDiv"><i class="caret right icon"></i></div></th>
					<td>광고효과조사 등 멀티미디어가 활용되는 조사 진행 시, 응답자가 멀티미디어를 보고 들을 수 있는 환경에 있는지 확인하기 위해 간단한 Test를 실시하여 적격 응답자만 조사에 참여할 수 있도록 합니다.</td>
				</tr>
			</table>
			<div style="width:90%; margin:0 auto; margin-top:40px; margin-bottom:80px;">
				<img src="resources/images/environmentTest.png" style="width:100%; margin-top:20px;">
			</div>
			<div class="section">
				◆ Open 문항 처리
			</div>
			<div class="sectionLine" style="margin-bottom:20px; padding-bottom:0px;">
				<hr>
			</div>
			<table id="explainTable" style="font-size:0.9vw; line-height:200%;">
				<tr>
					<th style="width:auto;"><div class="iconDiv"><i class="caret right icon"></i></div></th>
					<td>입력내용이 없으면 다음 Page로 넘어갈 수 없는 점 때문에 상기율 등이 높아지는 문제점을 해결하기 위하여 일정 시간 동안 입력이 없을 경우 ‘없음’을 입력할 수 있다는 알림창을 띄우는 방법을 활용하고 있습니다.</td>
				</tr>
			</table>
			<div style="width:90%; margin:0 auto; margin-top:40px; margin-bottom:80px;">
				<img src="resources/images/openChoices.png" style="width:100%; margin-top:20px;">
			</div>
			<div class="section">
				◆ 테이블형 Step by Step
			</div>
			<div class="sectionLine" style="margin-bottom:20px; padding-bottom:0px;">
				<hr>
			</div>
			<table id="explainTable" style="font-size:0.9vw; line-height:200%;">
				<tr>
					<th style="width:auto;"><div class="iconDiv"><i class="caret right icon"></i></div></th>
					<td>입력내용이 없으면 다음 Page로 넘어갈 수 없는 점 때문에 상기율 등이 높아지는 문제점을 해결하기 위하여, 일정 시간동안 입력이 없을 경우 ‘없음’을 입력할 수 있다는 알림창을 띄우는 방법을 활용하고 있습니다.</td>
				</tr>
			</table>
			<div style="width:90%; margin:0 auto; margin-top:40px; margin-bottom:80px;">
				<img src="resources/images/tableStepByStep.png" style="width:100%; margin-top:20px;">
			</div>
			<div class="section">
				◆ 수치형 자료 입력 제어
			</div>
			<div class="sectionLine" style="margin-bottom:20px; padding-bottom:0px;">
				<hr>
			</div>
			<table id="explainTable" style="font-size:0.9vw; line-height:200%;">
				<tr>
					<th style="width:auto;"><div class="iconDiv"><i class="caret right icon"></i></div></th>
					<td>수치형 자료를 주관식으로 묻는 경우, 응답자가 무의식적으로 수치 단위를 확인하지 않고 응답하여 오류가 발생하는 경우가 있습니다(예: 3만원을 3원으로 기록).</td>
				</tr>
				<tr>
					<th style="width:auto;"><div class="iconDiv"><i class="caret right icon"></i></div></th>
					<td>이러한 오류를 줄이기 위해 일정 범위를 벗어난 응답을 했을 경우 경고창을 띄워 본인의 답변내용을 재확인하도록 합니다.</td>
				</tr>
			</table>
			<div style="width:90%; margin:0 auto; margin-top:40px; margin-bottom:80px;">
				<img src="resources/images/numberAnswer.png" style="width:100%; margin-top:20px;">
			</div>
		</div>
	</div>
	<div style="margin-top: 80px;">
		<jsp:include page="/WEB-INF/views/panel/common/footer.jsp"/>
	</div>
</body>
</html>