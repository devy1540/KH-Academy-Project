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
				<div class="off" onclick="location.href='onlineStrategy.corp'">온라인 실사 단계</div>
				<div class="on">데이터 검증 단계</div>
			</div>
		</div>
		<div id="mainBox">
			<div class="section">
				◈ 데이터 검증 단계 신뢰성 확보 방안
			</div>
			<div class="sectionLine">
				<hr>
			</div>
			<div style="width:90%; margin:0 auto; margin-top:20px; margin-bottom:80px;">
				<img src="resources/images/reliabilityProcess.png" style="width:100%;">
			</div>
			<div class="section">
				◆ 패널 DB를 활용한 검증
			</div>
			<div class="sectionLine" style="margin-bottom:20px; padding-bottom:0px;">
				<hr>
			</div>
			<table id="explainTable" style="font-size:0.9vw; line-height:200%;">
				<tr>
					<th style="width:auto;"><div class="iconDiv"><i class="caret right icon"></i></div></th>
					<td>조사응답 성별/연령과 패널DB의 성별/연령이 다를 경우, 불량 응답으로 간주하여 데이터를 폐기합니다.</td>
				</tr>
			</table>
			<div style="width:90%; margin:0 auto; margin-top:40px; margin-bottom:80px;">
				<img src="resources/images/panelDBCheck.png" style="width:100%; margin-top:20px;">
			</div>
			<div class="section">
				◆ 검색 예상자 식별 및 제거
			</div>
			<div class="sectionLine" style="margin-bottom:20px; padding-bottom:0px;">
				<hr>
			</div>
			<table id="explainTable" style="font-size:0.9vw; line-height:200%;">
				<tr>
					<th style="width:auto;"><div class="iconDiv"><i class="caret right icon"></i></div></th>
					<td>응답자가 온라인 설문 도중 검색 예상 행동을 했는지 여부를 감식하는 분석 기술을 활용하여 검색 응답 예상자는 사후 분석에서 제외하는 규칙을 적용합니다.</td>
				</tr>
			</table>
			<div style="width:90%; margin:0 auto; margin-top:40px; margin-bottom:80px;">
				<img src="resources/images/searchExpected.png" style="width:100%; margin-top:20px;">
			</div>
			<div class="section">
				◆ 응답 시간 검증
			</div>
			<div class="sectionLine" style="margin-bottom:20px; padding-bottom:0px;">
				<hr>
			</div>
			<table id="explainTable" style="font-size:0.9vw; line-height:200%;">
				<tr>
					<th style="width:auto;"><div class="iconDiv"><i class="caret right icon"></i></div></th>
					<td>Pilot Test 결과 응답시간이 짧은 응답자와 그렇지 않은 응답자의 설문 결과에 큰 차이가 나타난다는 점을 감안하여 각 쿼터별로 응답시간이 짧은 5%의 응답 결과는 삭제합니다.</td>
				</tr>
			</table>
			<div style="width:90%; margin:0 auto; margin-top:40px; margin-bottom:80px;">
				<img src="resources/images/answerTime.png" style="width:100%; margin-top:20px;">
			</div>
		</div>
	</div>
	<div style="margin-top: 80px;">
		<jsp:include page="/WEB-INF/views/panel/common/footer.jsp"/>
	</div>
</body>
</html>