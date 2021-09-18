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
		height:auto;
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
	th {
		font-size:1vw;
	}
	.infoTd {
		font-size:1vw;
		padding-left:30px;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/corporation/common/corpMenuBar.jsp"/>
	<img src="resources/images/emptyNav.png" style="width: 100%">
	<div id="corpMainArea">
		<div id="sidebar">
			<div id="sidebarText">
				<div class="on">SURVWAY 소개</div>
				<div class="off" onclick="location.href='survwayBusiness.corp'">SURVWAY 사업</div>
			</div>
		</div>
		<div id="mainBox">
			<div class="section">
				◈ SURVWAY 개요
			</div>
			<div class="sectionLine">
				<hr>
			</div>
			<div style="width:68%; margin:0 auto;">
				<img src="resources/images/companyPic.png" style="width:100%; margin-top:20px;">
			</div>
			<div style="margin-top:40px; margin-bottom:100px;">
				<table style="margin:0 auto; line-height:250%;">
					<tr>
						<th>설 립</th>
						<td class="infoTd">1998.10</td>
					</tr>
					<tr>
						<th>대 표</th>
						<td class="infoTd">오수민 (KH정보교육원 수료)</td>
					</tr>
					<tr>
						<th>매 출</th>
						<td class="infoTd">201억 (2019년)</td>
					</tr>
					<tr>
						<th>직 원</th>
						<td class="infoTd">123명 (2020년 1월 현재)</td>
					</tr>
					<tr>
						<th>본 사</th>
						<td class="infoTd">서울특별시 강남구 테헤란로 14길 6 남도빌딩 2층</td>
					</tr>
				</table>
			</div>
			<div class="section">
				◈ SURVWAY 매출 및 프로젝트 수 추이
			</div>
			<div class="sectionLine">
				<hr>
			</div>
			<div style="width:68%; margin:0 auto; margin-bottom:80px;">
				<img src="resources/images/companySales.png" style="width:100%; margin-top:20px;">
			</div>
		</div>
	</div>
	<div style="margin-top: 80px;">
		<jsp:include page="/WEB-INF/views/panel/common/footer.jsp"/>
	</div>
</body>
</html>