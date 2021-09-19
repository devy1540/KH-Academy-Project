<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/views/panel/common/head.jsp" %>
</head>
<meta charset="UTF-8">
<link href="${ contextPath }/resources/css/accordion.min.css" rel="stylesheet">
<script src="${ contextPath }/resources/js/accordion.min.js"></script>
<style>
#titleTable {
	margin: 0 auto;
	margin-top: 20px;
}

#menuTitle {
	height: 30px;
	width: 40%;
	font-size: 16pt;
	text-align: left;
	vertical-align: bottom;
	font-weight: bold;
	color: #3D3D3D;
}

#pagePath {
	width: 60%;
	text-align: right;
	vertical-align: bottom;
	font-weight: bold;
}

#depth1 {
	color: #008499;
}

#depth2, #depth3 {
	color: #494949;
}
#depth1:hover,  #depth2:hover, #depth3:hover {
	cursor: default;
}
#depth2:hover, #depth3:hover {
	color: #494949;
}

.sectionLine {
	padding-bottom: 40px;
}
/* 여기까지 페이지제목 및 경로 영역 */
.on {
	color: black;
	font-weight: bold;
}

#mainBox {
	height: 500px;
	float: left;
}
div.wrap {
	background: white;
}
.accordion-container {
	width: 80%;
	margin: 30px auto;
	display: block;
	border: 1px solid lightgray;
	border-radius: 4px !important;
	margin-top: 20px;
}

.innerContent {
	max-height: 300px;
	min-height: 200px;
	overflow-y: auto;
	width: 100%;
}
.heading:hover {
	cursor:pointer;
}
.ui.blue.button {
	background-color:#00679A;
}
.ui.blue.button:hover {
	background-color: #217BA7;
}
</style>
<body>
	<div class="wrap">
		<%@ include file="/WEB-INF/views/panel/common/header.jsp" %>
		<section class="container">
		<br />
		
		
			<table id="titleTable" height="10px;" width="99%;">
				<tr>
					<td id="menuTitle">회원가입</td>
					<td id="pagePath">
						<div class="ui breadcrumb">
							<a class="active section" id="depth1">이용약관</a>
							<i class="right angle icon divider"></i>
							<a class="active section" id="depth2">정보입력</a>
							<i class="right angle icon divider"></i>
							<div class="active section" id="depth3">가입완료</div>
						</div>
					</td>
				</tr>
			</table>
			
			<div class="sectionLine">
				<hr>
			</div>


			<div id="mainBox">
			<div class="accordion-container">
				<div class="panel">
					<div class="heading">01. 이용약관 동의</div>
					<div class="content">
						<div class="innerContent">
							<jsp:include page="/WEB-INF/views/panel/signPanel/provision.jsp"></jsp:include>
						</div>
					</div>
  				</div>
				<div class="panel">
					<div class="heading">02. 수집하는 개인정보 항목 약관</div>
					<div class="content">
						<div class="innerContent">
							<jsp:include page="/WEB-INF/views/panel/signPanel/personalInfo1.jsp"></jsp:include>
						</div>
					</div>
  				</div>
				<div class="panel">
					<div class="heading">03. 개인정보 수집목적 약관</div>
					<div class="content">
						<div class="innerContent">
							<jsp:include page="/WEB-INF/views/panel/signPanel/personalInfo2.jsp"></jsp:include>
						</div>
					</div>
				</div>
				<div class="panel">
					<div class="heading">04. 개인정보 보유 및 이용기간 약관</div>
					<div class="content">
						<div class="innerContent">
							<jsp:include page="/WEB-INF/views/panel/signPanel/personalInfo3.jsp"></jsp:include>
						</div>
					</div>
				</div>
				<div class="panel">
					<div class="heading">05. 개인정보 파기 또는 분리저장 및 관리기간 약관</div>
					<div class="content">
						<div class="innerContent">
							<jsp:include page="/WEB-INF/views/panel/signPanel/personalInfoPeriod.jsp"></jsp:include>
						</div>
					</div>
				</div>
			</div>
			<div style="margin: 0 auto; margin-top: 50px; margin-bottom: 40px; width: 80%;">
				<div class="ui checkbox">
					<input type="checkbox" class="agreement">
					<label>위의 모든 약관에 동의합니다.</label>
				</div>
			</div>
			<hr>
			<div style="width: fit-content;margin: 30px auto; float:right;">
				<input type="button" id="signupBtn" class="ui disabled button" value="다음">
				<input type="hidden" id="signupBtn2" class="ui blue button" value="다음" onclick="location.href='panelSignup2.panel'">
			</div>
			
			
		</div>
		
		<script>
			var accordion = new Accordion('.accordion-container',{
			    // hides all answers
			    hideAll: false,
			    // shows all answers
			    showAll: false,
			    // shows the first answer
			    showFirst: false,
			    // panel ID you want to show at first time
			    panelId: null
			});
		 
			$(".ui.checkbox").checkbox();
			
			$(".agreement").change(function() {
				checked = $(".agreement:checked").length;
				if (checked == 1) {
					$("#signupBtn2").prop("type", "submit");
					$("#signupBtn").prop("type", "hidden");
				}else {
					$("#signupBtn2").prop("type", "hidden");
					$("#signupBtn").prop("type", "button");
				}
			});

			$("#signupBtn").click(function() {
				alert("약관에 동의해주세요.");
			});
		</script>
			
			
			
			
		<br />
		</section>  <!-- container end -->
		<%@ include file="/WEB-INF/views/panel/common/footer.jsp" %>
	</div>  <!-- wrap end -->
</body>
</html>















