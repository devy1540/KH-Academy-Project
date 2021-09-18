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
				<div class="on">설문지 작성 단계</div>
				<div class="off" onclick="location.href='mailingStrategy.corp'">메일 발송 단계</div>
				<div class="off" onclick="location.href='onlineStrategy.corp'">온라인 실사 단계</div>
				<div class="off" onclick="location.href='dataCheckStrategy.corp'">데이터 검증 단계</div>
			</div>
		</div>
		<div id="mainBox">
			<div class="section">
				◈ 설문지 작성 단계 신뢰성 확보 방안
			</div>
			<div class="sectionLine">
				<hr>
			</div>
			<div style="width:90%; margin:0 auto; margin-top:20px; margin-bottom:80px;">
				<img src="resources/images/reliabilityProcess.png" style="width:100%;">
			</div>
			<div class="section">
				◆ 특정 제품 이용자 선정 방법
			</div>
			<div class="sectionLine" style="margin-bottom:20px; padding-bottom:0px;">
				<hr>
			</div>
			<table id="explainTable" style="font-size:0.9vw; line-height:200%;">
				<tr>
					<th style="width:auto;"><div class="iconDiv"><i class="caret right icon"></i></div></th>
					<td>특정 제품 이용자를 찾는 경우, 해당 제품 이용 여부만 묻지 않고 여러 제품에 대한 이용여부로 설문을 구성하여 부적격 응답자의 참여를 방지할 수 있습니다.</td>
				</tr>
			</table>
			<div style="width:90%; margin:0 auto; margin-top:40px; margin-bottom:80px;">
				<img src="resources/images/specificUserPanel.png" style="width:100%; margin-top:20px;">
			</div>
			<div class="section">
				◆ 이미지 동시 제기
			</div>
			<div class="sectionLine" style="margin-bottom:20px; padding-bottom:0px;">
				<hr>
			</div>
			<table id="explainTable" style="font-size:0.9vw; line-height:200%;">
				<tr>
					<th style="width:auto;"><div class="iconDiv"><i class="caret right icon"></i></div></th>
					<td>소비자가 직접 제품을 보고 선택하는 제품군 조사에서는 “Visual 자료”를 적극 활용하여 응답자의 오인지 가능성을 줄일 수 있습니다.</td>
				</tr>
			</table>
			<div style="width:90%; margin:0 auto; margin-top:40px; margin-bottom:80px;">
				<img src="resources/images/showImage.png" style="width:100%; margin-top:20px;">
			</div>
			<div class="section">
				◆ QUIZ
			</div>
			<div class="sectionLine" style="margin-bottom:20px; padding-bottom:0px;">
				<hr>
			</div>
			<table id="explainTable" style="font-size:0.9vw; line-height:200%;">
				<tr>
					<th style="width:auto;"><div class="iconDiv"><i class="caret right icon"></i></div></th>
					<td>컨셉에 대한 이해를 전제로 설문이 진행되는 경우, 퀴즈를 통해 이해도를 확인한 후 퀴즈를 맞추지 못하면 다시 컨셉을 제시하여 이해도를 높인 후 설문을 진행할 수 있습니다.</td>
				</tr>
			</table>
			<div style="width:90%; margin:0 auto; margin-top:40px; margin-bottom:80px;">
				<img src="resources/images/quiz.png" style="width:100%; margin-top:20px;">
			</div>
			<div class="section">
				◆ 다단계 조사
			</div>
			<div class="sectionLine" style="margin-bottom:20px; padding-bottom:0px;">
				<hr>
			</div>
			<table id="explainTable" style="font-size:0.9vw; line-height:200%;">
				<tr>
					<th style="width:auto;"><div class="iconDiv"><i class="caret right icon"></i></div></th>
					<td>설문길이가 길 경우 응답피로로 인해 Data Quality에 문제가 발생될 수 있기에, 조사품질 향상을 위해 설문을 여러 개로 나누어 조사를 수행할 수 있습니다.</td>
				</tr>
			</table>
			<div style="width:90%; margin:0 auto; margin-top:40px; margin-bottom:80px;">
				<img src="resources/images/stepByStep.png" style="width:100%; margin-top:20px;">
			</div>
		</div>
	</div>
	<div style="margin-top: 80px;">
		<jsp:include page="/WEB-INF/views/panel/common/footer.jsp"/>
	</div>
</body>
</html>