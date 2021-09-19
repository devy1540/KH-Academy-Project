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
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/corporation/common/corpMenuBar.jsp"/>
	<img src="resources/images/emptyNav.png" style="width: 100%">
	<div id="corpMainArea">
		<div id="sidebar">
			<div id="sidebarText">
				<div class="off" onclick="location.href='panelBigData.corp'">패널 빅데이터</div>
				<div class="on">리서치 빅데이터</div>
			</div>
		</div>
		<div id="mainBox">
			<div class="section">
				◈ 리서치 검색 순위 (금일)
			</div>
			<div class="sectionLine">
				<hr>
			</div>
			<div style="height:600px; border:1px solid red;">
			</div>
			<div class="section" style="margin-top:60px;">
				◈ 날짜별 정상응답 대비 불량응답 비율
			</div>
			<div class="sectionLine">
				<hr>
			</div>
			<div style="height:600px; border:1px solid red;">
			</div>
		</div>
	</div>
	<div style="margin-top: 80px;">
		<jsp:include page="/WEB-INF/views/panel/common/footer.jsp"/>
	</div>
</body>
</html>