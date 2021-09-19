<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/views/panel/common/head.jsp" />
</head>
<style>
	#title{
		color:#00679A; !important;
	}
	#howto{
		background-color: #2878A5 !important;
		width:900px;
		height: 350px;
	}
	.white{
		color:white !important;
	}
	.ui.button {
		background: #00679A !important;
		margin: 0;
	}
	.yellow{
		background-color: yellow;
		width: 100px;
		height:50px;
		border-radius: 5%;
	}
	#co{
		font-size: 100px !important;
	}
</style>
<body>
	<div class="wrap">
		<jsp:include page="/WEB-INF/views/panel/common/header.jsp" />
		<section class="container">
		<br />
		
		
			<table id="titleTable" height="10px;" width="99%;">
				<tr>
					<td id="menuTitle">혜택 안내</td>
					<td id="pagePath">
						<div class="ui breadcrumb">
							<a class="section" id="depth1" href="panelMain.panel">Home</a>
							<i class="right angle icon divider"></i>
							<a class="section" id="depth2" href="benefitInfo.panel">안내</a>
							<i class="right angle icon divider"></i>
							<div class="active section" id="depth3">혜택 안내</div>
						</div>
					</td>
				</tr>
			</table>
			
			<div class="sectionLine">
				<hr>
			</div>
			
			<div>
				<table style="margin-bottom:40px;">
					<tr>
						<td style="width:13%;"><img src="resources/images/blackLogo.png" style="width:100%;"></td>
						<td><span style="font-size:1.1vw; font-weight:bold;">리서치는 ,</span></td>
					</tr>
					<tr>
						<td style="width:100%; padding-left:20px; padding-right:20px; padding-top:0px;" colspan="2">
							<span style="font-size:1vw; line-height:150%; color:#404040;"><b>
								서로 다른 색을 가진 5명이 설립한 회사로서
								<br>패널들에게 리서치를 진행하며 그에 따른 보상 리워드를 제공하고 리워드에 따른 보상을 얻을 수 있으며
								<br>누구나 쉽게 참여할 수 있는 설문조사나 서베이를 통해 소소한 용돈벌이를 하실 수 있는 사이트입니다.
							</b></span>
						</td>
					</tr>
				</table>
			</div>
			<div style="background-color:#2878A5; height:auto; width:100%;">
				<img src="resources/images/signupInfoPic.png" style="width:100%;">
			</div>
			<div style="background-color:#2878A5; height:auto; width:100%; text-align:center;">
				<a href="panelSignup1.panel"><img src="resources/images/signupBtnPic.png" style="width:20%; margin:30px;"></a>
			</div>
			
			<div style="width:100%; margin-top:40px; margin-bottom:40px;">
				<img src="resources/images/cashOutProcessPic.png" style="width:100%;">
			</div>
			<div style="width:100%; margin-bottom:100px;">
				<img src="resources/images/recommendRewardPic.png" style="width:100%">
			</div>


			<br />
		</section>  <!-- container end -->
		<jsp:include page="/WEB-INF/views/panel/common/footer.jsp" />
	</div>  <!-- wrap end -->
</body>
</html>















