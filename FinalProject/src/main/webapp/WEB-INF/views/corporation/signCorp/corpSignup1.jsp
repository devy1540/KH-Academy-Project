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
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/corporation/common/corpMenuBar.jsp"/>
	<img src="resources/images/emptyNav.png" style="width: 100%">
	<div id="corpMainArea">
		<div id="sidebar">
			<div id="sidebarText">
				<div class="on">이용약관</div>
				<div>기업 정보 입력</div>
				<div>인증 메일 발송</div>
				<div>회원 가입 완료</div>
			</div>
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
			<div style="margin: 0 auto; margin-top: 50px; width: 80%;">
				<div class="ui checkbox">
					<input type="checkbox" class="agreement">
					<label>위의 모든 약관에 동의합니다.</label>
				</div>
			</div>
			<div style="width: fit-content; margin: 30px auto;">
				<input type="button" id="signupBtn" class="ui disabled button" value="다음">
				<input type="hidden" id="signupBtn2" class="ui blue button" value="다음" onclick="location.href='corpSignup2.corp'">
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
	</div>
	<div style="margin-top: 80px;">
		<jsp:include page="/WEB-INF/views/panel/common/footer.jsp"/>
	</div>
</body>
</html>