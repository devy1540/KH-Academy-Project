<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="resources/images/favicon.ico" type="image/x-icon" />
<link rel="shortcut icon" href="resources/images/favicon.ico" type="image/x-icon">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<style>

	#listArea {
		width: 90%;
		margin: 0 auto;
		margin-top: 50px;
	}
	#listArea div {
		margin: 20px auto;
		width: fit-content;
	}
	#mainTitle {
		font-size: 30px;
	}
	#subTitle {
		font-size: 20px;
	}
	#searchArea {
		width: 80%;
		margin: 50px auto;
		margin-bottom: 100px;
	}
	#listMainArea {
		width: 100%;
		height: auto;
	}
	.menu.transition.visible {
		height: 150px;
	}
	#corpTable, #priceConferenceTable, #referTable, #questionTable {
  		width: 70%;
  		margin: 0 auto;
  		border-spacing: 0;
		border-collapse: collapse;
  	}
  	#corpTable th, #priceConferenceTable th, #referTable th, #questionTable th {
  		width: 20%;
  		height: 70px;
  		border-bottom: 1px solid #C5C5C5;
  	}
  	#corpTable td, #priceConferenceTable td, #referTable td, #questionTable td {
  		width: 80%;
  		border-bottom: 1px solid #C5C5C5;
  	}
	#payTable {
		width: 70%;
  		margin: 0 auto;
  		border-spacing: 0;
		border-collapse: collapse;
  	}
  	#payTable th {
  		border-bottom: 1px solid #C5C5C5;
  	}
  	#payTable td {
  		height: 70px;
  		border-bottom: 1px solid #C5C5C5;
  	}
  	.arrow {
  		margin: 20px auto;
  		width: fit-content;
  	}
  	#completeBtn {
  		width: 60%;
  		height: 40px;
  		float: right;
  	}
  	.payStatus {
		width: 170px;
		height: 50px;
		font-size: 15pt;
		color: #B4B4B4;
		border-radius: 13px;
		border: 1px solid #B4B4B4;
		margin: 20px auto;
		padding: 5px;
		text-align: center;
		vertical-align: middle;
		line-height: 35px;
	}
	#completePayment {
		color: #0F83BD;
		border: 2px solid #0F83BD;
	}
	.thDiv {
		text-align: left;
		width: 150px;
		float: right;
	}
	.disabledArrow {
		color: #B4B4B4 !important;
	}
	.disabledStatus {
		color: #B4B4B4 !important;
		border: 1px solid #B4B4B4 !important;
	}
	input[type=button]:focus, textarea:focus {
		outline: none;
	}
	.swal2-input[type=number] {
   		max-width: 16em !important;
	}	
	#surveyQuizAccordion {
  		margin: 50px auto;
  		font-size: 13pt;
  		width: 60%;
  		margin-top: 0;
  	}
  	.surveyQuizTitle, .surveyQuizContext {
  		background: none;
  		border: none;
  		width: 80%;
  		
  	}
  	.surveyQuizTitle:focus, .surveyQuizContext:focus {
		outline: none;  		
  	}
	.questionForm {
		width: 100%;
		height: 20px;
		text-align: right;
		font-size: 11pt;
	}
	.questionImage, .questionVideo {
		width: 80%;
		height: auto;
		margin: 10px auto;
	}
	.questionVideo {
		height: 220px;
	}
	.mediaExplain {
		width: fit-content;
		text-align: left;
		margin: 0 auto;
		margin-top: 10px;
	}
	.questionVideo {
		margin-bottom: 20px;
	}
	input[type=text]:focus{
		outline: none;
	}
	#sortable { 
  		list-style-type: none; 
  		margin: 0; 
  		padding: 0; 
  		width: 60%;
  		margin: 0 auto; 
  		margin-bottom: 30px;
  	}
  	#sortable li { 
  		margin: 0 5px 12px 5px;
  		padding: 10px; 
  		font-size: 1.2em; 
  		height: fit-content;
  		border-radius: 7px;
  	}
 	html>body #sortable li { 
	  	height: fit-content;
	  	line-height: 1.2em; 
	}
  	.ui-state-highlight { 
  		height: 3.5em; 
  		line-height: 1.2em; 
  	}
  	.ui-sortable-placeholder {
  		background: white !important;
  		border-color: white !important;
  	}
  	#researchName {
  		width: 60%;
    	margin: 20px auto;
    	display: block;
  	}
  	#choice, .choice {
  		margin-left: 10%;
  		margin-top: 20px;
  		width: fit-content;
  	}
  	.box { 
  		display: block; width: 350px; height: 350px;
		padding: 30px; box-sizing: border-box;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/corporation/common/corpMenuBar.jsp"/>
	<jsp:include page="/WEB-INF/views/corporation/common/corpMenuBar2.jsp"/>
	<c:if test="${ empty sessionScope.loginUser or sessionScope.loginUser.userType ne '??????' }">
		<c:set var="msg" value="??????????????? ?????? ???????????????." scope="request"/>
		<jsp:forward page="/WEB-INF/views/common/errorPage.jsp"/>
	</c:if>
	<div id="listMainArea">
		<div id="listArea">
			<div id="mainTitle">????????? ?????? ??????</div>
			<div id="subTitle">????????? ???????????? ?????? ????????? ????????? ??? ????????????.</div>
		</div>
		
		<div id="searchArea">
			<table id="corpTable">
				<tr>
					<th><div class="thDiv">???????????? ???</div></th>
					<td>${ research.researchName }</td>
				</tr>
				<tr>
					<th><div class="thDiv">??????</div></th>
					<td>${ research.researchPerpose }</td>
				</tr>
				<tr>
					<th><div class="thDiv">?????? ??????</div></th>
					<td>${ research.researchEngagementGoals }???</td>
				</tr>
				<tr>
					<th><div class="thDiv">?????? ?????? ??????</div></th>
					<td>
						<c:if test="${ research.targetGender == 'A' }">
							??????
						</c:if>
						<c:if test="${ research.targetGender == 'M' }">
							??????
						</c:if>
						<c:if test="${ research.targetGender == 'F' }">
							??????
						</c:if>
					</td>
				</tr>
				<tr>
					<th><div class="thDiv">?????? ?????? ??????</div></th>
					<td>${ research.targetAgeRange }</td>
				</tr>
				<tr>
					<th><div class="thDiv">?????? ?????? ??????</div></th>
					<td>
						<c:if test="${ research.targetLocation == 'all' }">
							??????
						</c:if>
						<c:if test="${ research.targetLocation == 'metropolitan' }">
							?????? ??? ?????????
						</c:if>
						<c:if test="${ research.targetLocation == 'city' }">
							??????, ?????? ??? 9??? ?????????
						</c:if>
					</td>
				</tr>
				<tr>
					<th><div class="thDiv">?????? ?????? ?????????</div></th>
					<td>${ research.occupationNo }</td>
				</tr>
				<tr>
					<th><div class="thDiv">?????? ?????? ??????</div></th>
					<td>${ research.researchPeriod }</td>
				</tr>
			</table>
			<c:if test="${ research.researchState != '??????' }">
				<table id="payTable">
						<tr>
							<td rowspan="5" style="width: 50%; /* ????????? ????????? ??????*/ -ms-user-select: none; -moz-user-select: -moz-none; -webkit-user-select: none; -khtml-user-select: none; user-select:none; /* ????????? ????????? ??????*/">
								<div id="paymentStatus" style="padding-top: 20px; padding-bottom: 20px;">
									<div class="payStatus" id="completePayment">?????? ?????????</div>
									<div class="arrow" id="completeArrow"><i class="large primary chevron down icon"></i></div>
									<div class="payStatus" id="completePayment">?????? ?????????</div>
									<div class="arrow" id="completeArrow"><i class="large primary chevron down icon"></i></div>
									<div class="payStatus" id="completePayment">?????? ??????</div>
								</div>
							</td>
							<th>?????? ???</th>
							<td>${ questionCount }???</td>
						</tr>
						<tr>
							<th>?????? ??????????????????</th>
							<td>
								<c:choose>
									<c:when test="${ questionCount <= 10 }">
										5???(10?????? ??????)
									</c:when>
									<c:when test="${ questionCount > 10 and questionCount <= 30 }">
										10???(11~30?????? ??????)
									</c:when>
									<c:when test="${ questionCount > 30 and questionCount <= 50 }">
										15???(31~50?????? ??????)
									</c:when>
									<c:when test="${ questionCount > 50 and questionCount <= 70 }">
										20???(51~70?????? ??????)
									</c:when>
									<c:otherwise>
										20??? ??????(70?????? ??????)
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
						<tr>
							<th>?????? ??????</th>
							<td>${ research.researchEngagementGoals }???</td>
						</tr>
						<tr>
							<th>
								<c:if test="${ research.researchPrice == 0 }">
									?????? ??????
								</c:if>
								<c:if test="${ research.researchPrice != 0 }">
									<c:if test="${ researchState == '?????? ?????????' }">
										????????? ?????? ??????
									</c:if>
									<c:if test="${ researchState != '?????? ?????????' }">
										?????? ??????
									</c:if>
								</c:if>
							</th>
							<td>
								<c:if test="${ research.researchState == '?????? ??????' }">
									<c:choose>
										<c:when test="${ questionCount <= 10 }">
											<c:choose>
												<c:when test="${ research.researchEngagementGoals == 100}">
													<fmt:formatNumber value="${ research.researchEngagementGoals * 4500 }"/>
												</c:when> 
												<c:when test="${ research.researchEngagementGoals == 200}">
													<fmt:formatNumber value="${ research.researchEngagementGoals * 3800 }"/>
												</c:when> 
												<c:when test="${ research.researchEngagementGoals == 300}">
													<fmt:formatNumber value="${ research.researchEngagementGoals * 3400 }"/>
												</c:when> 
												<c:when test="${ research.researchEngagementGoals == 400}">
													<fmt:formatNumber value="${ research.researchEngagementGoals * 3000 }"/>
												</c:when> 
												<c:when test="${ research.researchEngagementGoals == 500}">
													<fmt:formatNumber value="${ research.researchEngagementGoals * 2800 }"/>
												</c:when> 
											</c:choose>
										</c:when>
										<c:when test="${ questionCount > 10 and questionCount <= 30 }">
											<c:choose>
												<c:when test="${ research.researchEngagementGoals == 100}">
													<fmt:formatNumber value="${ research.researchEngagementGoals * 5100 }"/>
												</c:when> 
												<c:when test="${ research.researchEngagementGoals == 200}">
													<fmt:formatNumber value="${ research.researchEngagementGoals * 4500 }"/>
												</c:when> 
												<c:when test="${ research.researchEngagementGoals == 300}">
													<fmt:formatNumber value="${ research.researchEngagementGoals * 3800 }"/>
												</c:when> 
												<c:when test="${ research.researchEngagementGoals == 400}">
													<fmt:formatNumber value="${ research.researchEngagementGoals * 3400 }"/>
												</c:when> 
												<c:when test="${ research.researchEngagementGoals == 500}">
													<fmt:formatNumber value="${ research.researchEngagementGoals * 2800 }"/>
												</c:when> 
											</c:choose>
										</c:when>
										<c:when test="${ questionCount > 30 and questionCount <= 50 }">
											<c:choose>
												<c:when test="${ research.researchEngagementGoals == 100}">
													<fmt:formatNumber value="${ research.researchEngagementGoals * 6700 }"/>
												</c:when> 
												<c:when test="${ research.researchEngagementGoals == 200}">
													<fmt:formatNumber value="${ research.researchEngagementGoals * 5500 }"/>
												</c:when> 
												<c:when test="${ research.researchEngagementGoals == 300}">
													<fmt:formatNumber value="${ research.researchEngagementGoals * 4700 }"/>
												</c:when> 
												<c:when test="${ research.researchEngagementGoals == 400}">
													<fmt:formatNumber value="${ research.researchEngagementGoals * 4200 }"/>
												</c:when> 
												<c:when test="${ research.researchEngagementGoals == 500}">
													<fmt:formatNumber value="${ research.researchEngagementGoals * 3700 }"/>
												</c:when> 
											</c:choose>
										</c:when>
										<c:when test="${ questionCount > 50 and questionCount <= 70 }">
											<c:choose>
												<c:when test="${ research.researchEngagementGoals == 100}">
													<fmt:formatNumber value="${ research.researchEngagementGoals * 8400 }"/>
												</c:when> 
												<c:when test="${ research.researchEngagementGoals == 200}">
													<fmt:formatNumber value="${ research.researchEngagementGoals * 7000 }"/>
												</c:when> 
												<c:when test="${ research.researchEngagementGoals == 300}">
													<fmt:formatNumber value="${ research.researchEngagementGoals * 6300 }"/>
												</c:when> 
												<c:when test="${ research.researchEngagementGoals == 400}">
													<fmt:formatNumber value="${ research.researchEngagementGoals * 5800 }"/>
												</c:when> 
												<c:when test="${ research.researchEngagementGoals == 500}">
													<fmt:formatNumber value="${ research.researchEngagementGoals * 4500 }"/>
												</c:when> 
											</c:choose>
										</c:when>
										<c:otherwise>
											<c:choose>
												<c:when test="${ research.researchEngagementGoals == 100}">
													<fmt:formatNumber value="${ research.researchEngagementGoals * 9400 }"/>
												</c:when> 
												<c:when test="${ research.researchEngagementGoals == 200}">
													<fmt:formatNumber value="${ research.researchEngagementGoals * 8000 }"/>
												</c:when> 
												<c:when test="${ research.researchEngagementGoals == 300}">
													<fmt:formatNumber value="${ research.researchEngagementGoals * 7300 }"/>
												</c:when> 
												<c:when test="${ research.researchEngagementGoals == 400}">
													<fmt:formatNumber value="${ research.researchEngagementGoals * 6500 }"/>
												</c:when> 
												<c:when test="${ research.researchEngagementGoals == 500}">
													<fmt:formatNumber value="${ research.researchEngagementGoals * 5700 }"/>
												</c:when> 
											</c:choose>
										</c:otherwise>
									</c:choose>
									 ??? + ??? (?????? ??????)
								</c:if>
								<c:if test="${ research.researchState != '?????? ??????' }">
									<c:if test="${ research.researchState == '?????? ?????????' }">
										<fmt:formatNumber value="${ research.researchPrice }"/> ??? (?????? ???)
									</c:if>
									<c:if test="${ research.researchState != '?????? ?????????' }">
										<fmt:formatNumber value="${ research.researchPrice }"/> ???
									</c:if>
								</c:if>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<div style="width: 45%; margin: 0 auto;">
									<input type="button" id="payment" value="???  ???" disabled style="border: 0; width: 100%; height: 50px;">
								</div>
							</td>
						</tr>
					</table>
				</c:if>
				<c:if test="${ research.researchState == '??????' }">
					<table id="referTable">
						<tr>
							<th><div class="thDiv">?????? ??????</div></th>
							<td>${ research.referReason }</td>
						</tr>
					</table>
				</c:if>
				<c:if test="${ research.researchState == '????????? ??????' || research.researchState == '????????? ????????? ??????'}">
					<ul id="sortable" style="margin-top: 30px; margin-bottom: 30px;">
					
					</ul>
				</c:if>
				<c:if test="${ research.researchState == '?????? ????????? ?????????' || research.researchState == '?????? ??????' }">
					<table id="questionTable">
						<tr>
							<td colspan="2">
								<div id="surveyQuiz2" style="width: 100%;">
									<div style="width: fit-content; margin: 50px auto; margin-bottom: 20px;"><h1>?????? ????????? ??????</h1></div>
									<div class="ui styled accordion" id="surveyQuizAccordion">
									
									</div>
									
									<div style="width: fit-content; margin: 0 auto;"><h1>????????? ????????? ???</h1></div>
									<div class="ui input" id="researchName">
										<input type="text" id="researchNamePanel" name="researchNamePanel" placeholder="????????? ????????? ???" style="width: 100%">
									</div>
									<ul id="sortable">
										
									</ul>
								</div>
								<div style="width: fit-content; margin: 20px auto;">
									<input type="button" id="reconsturctionBtn" value="?????? ????????? ??????" style="border: 0; background:#BDBDBD; color: white; width: 270px; height: 50px;">
									<input type="button" id="reconsturctionAcceptBtn" value="???  ???" style="margin-left: 20px;border: 0; background:#BDBDBD; color:white; width: 270px; height: 50px;">
								</div>
							</td>
						</tr>
						<c:if test="${ !empty research.conferenceContext }">
							<tr>
								<th><div class="thDiv">?????? ????????? ?????? ??????</div></th>
								<td><textarea readonly style="width: 90%; height: 70px; background: none; border: 0; resize: none; margin-top: 15px; margin-bottom: 15px;">${research.conferenceContext}</textarea></td>
							</tr>
						</c:if>
					</table>
				</c:if>
				<c:if test="${ research.researchState == '?????? ?????????' || research.researchState == '?????? ??????' }">
					<table id="priceConferenceTable">
						<tr>
							<th><div class="thDiv">?????? ?????? ??????</div></th>
							<td><fmt:formatNumber value="${ research.conferencePrice }"/> ???</td>
						</tr>
						<tr>
							<th><div class="thDiv">?????? ??????</div></th>
							<td><fmt:formatNumber value="${ research.researchPrice }"/> ???</td>
						</tr>
						<c:if test="${ !empty research.conferenceContext }">
							<tr>
								<th><div class="thDiv">?????? ?????? ????????????</div></th>
								<td><textarea readonly style="width: 90%; height: 70px; background: none; border: 0; resize: none; margin-top: 15px; margin-bottom: 15px;">${research.conferenceContext}</textarea></td>
							</tr>
						</c:if>
						<tr>
							<th colspan="2">
								<div style="width: 40%; margin: 0px auto;">
									<input type="hidden" id="priceConference" value="??????  ??????" style="border: 0; width: 100%; height: 50px;">
								</div>
							</th>
						</tr>
					</table>
				</c:if>
				<div style="width: fit-content; margin: 30px auto;">
					<input type="button" onclick="location.href='previousResearchMain.corpResearch'" value="????????????" style="color: white; background: #00679A; border: 0; width: 270px; height: 50px;">
				</div>
			</div>
	</div>
	<div style="margin-top: 100px;">
		<jsp:include page="/WEB-INF/views/panel/common/footer.jsp"/>
	</div>
	<script>
	function drawChart(idStr, chartLabels, chartData) {
		var ctx = document.getElementById(idStr);
		var myChart = new Chart(ctx, {
			type: 'doughnut',
			data: {
				labels: chartLabels,
				datasets: [{
					label: '# of Votes',
					data: chartData,
					backgroundColor: [
                          'rgba(204, 51, 153, 0.7)',
                          'rgba(242, 242, 242, 0.7)',
                          'rgba(231, 230, 230, 0.7)',
                          'rgba(217, 217, 217, 0.7)',
                          'rgba(203, 203, 203, 0.7)',
                          'rgba(191, 191, 191, 0.7)',
                          'rgba(182, 182, 182, 0.7)',
                          'rgba(174, 174, 174, 0.7)',
                          'rgba(166, 166, 166, 0.7)',
                          'rgba(159, 159, 159, 0.7)'
                          
                        ],
                        borderColor: [
                            'rgba(204, 51, 153, 1)',
                            'rgba(242, 242, 242, 1)',
                            'rgba(231, 230, 230, 1)',
                            'rgba(217, 217, 217, 1)',
                            'rgba(203, 203, 203, 1)',
                            'rgba(191, 191, 191, 1)',
                            'rgba(182, 182, 182, 1)',
                            'rgba(174, 174, 174, 1)',
                            'rgba(166, 166, 166, 1)',
                            'rgba(159, 159, 159, 1)'
                          ],
						borderWidth: 1
					}]
				},
				options: {
					scales: {
						
					}
				}
			});
		} //drawChart() end
		$(function(){
			var researchState = "${research.researchState}";
			
			if(researchState == '?????? ??????'){
				$(".payStatus").eq(1).addClass("disabledStatus");
				$(".payStatus").eq(2).addClass("disabledStatus");
				$(".arrow i").eq(0).addClass("disabledArrow");
				$(".arrow i").eq(1).addClass("disabledArrow");
				$("#payment").css({"background":"#EFEFEF", "color":"#808080"});
			}else if(researchState == '?????? ?????????') {
				$(".payStatus").eq(1).addClass("disabledStatus");
				$(".payStatus").eq(2).addClass("disabledStatus");
				$(".arrow i").eq(1).addClass("disabledArrow");
				$("#priceConference").prop("type", "button");
				$("#priceConference").val("?????? ?????????");
				$("#payment").prop("type", "hidden");
				$("#priceConference").css({"background":"#EFEFEF", "color":"#808080", "margin":"auto;"});
				$("#payment").css({"background":"#EFEFEF", "color":"#808080"});
			}else if(researchState == '?????? ??????') {
				$(".payStatus").eq(2).addClass("disabledStatus");
				$(".arrow i").eq(1).addClass("disabledArrow");
				$("#payment").css({"background":"#00679A", "color":"white"});
				$("#priceConference").prop("type", "button");
				$("#payment").prop("disabled", false);
				$("#priceConference").prop("disabled", false);
			}else {
				$("#payment").css({"background":"#EFEFEF", "color":"#808080"});
				$("#payment").val("??????  ??????");
			}
			
			if(researchState == '?????? ????????? ?????????'){
				$("#reconsturctionBtn").prop("disabled", true);
				$("#reconsturctionAcceptBtn").prop("disabled", true);
				$("#reconsturctionBtn").val("?????? ????????? ?????????");
				$("#reconsturctionBtn").css({"background":"#EFEFEF", "color":"#808080", "margin":"auto;"});
				$("#reconsturctionAcceptBtn").css({"background":"#EFEFEF", "color":"#808080", "margin":"auto;"});
			}
		});
		
		$(document).on("click", "#payment", function(){
			payment();
		});
		researchNo = ${research.researchNo}
		$(document).on("click", "#priceConference", function(){
			
			const start = async function() {
				const { value: text } = await Swal.fire({
					  input: 'number',
					  inputPlaceholder: '???????????? ????????? ???????????????',
					  inputAttributes: {
					    'aria-label': 'Type your message here'
					  },
					  showCancelButton: true,
					  inputValidator: (value) => {
					    if (!value) {
					      return '??????????????? ???????????????!'
					    }
					  }
				});
	
				if (text) {
					Swal.fire({
					  title: '?????? ????????? ?????????????????????????',
					  text: "????????? ?????? ????????? ???????????? ??? ????????????.",
					  icon: 'question',
					  showCancelButton: true,
					  confirmButtonColor: '#3085d6',
					  cancelButtonColor: '#d33',
					  confirmButtonText: 'Yes'
					}).then((result) => {
					  	if (result.value) {
					  		
						  	$.ajax({
								url:"priceConference.corpResearch",
								type:"post",
								data:{
									researchNoStr:researchNo,
									priceStr : text
								},
								success:function(data){
									Swal.fire(
							      		'????????????!',
							      		'???????????? ???????????? ????????? ?????????????????????.',
							      		'success'
						    		)
								  	setTimeout(function(){
									  location.reload();
									},1500)
								},
								error:function(status){
									console.log(status);
								}
							});
					  }
					})
				}
			}
			start();
		});
		
		$(document).on("click", "#reconsturctionBtn", function(){
			
			const start = async function() {
				const { value: text } = await Swal.fire({
					  input: 'textarea',
					  inputPlaceholder: '?????? ????????? ?????? ????????? ???????????????',
					  inputAttributes: {
					    'aria-label': 'Type your message here'
					  },
					  showCancelButton: true,
					  inputValidator: (value) => {
					    if (!value) {
					      return '?????? ????????? ?????? ????????? ???????????????!'
					    }
					  }
				});
	
				if (text) {
					Swal.fire({
					  title: '????????? ????????? ?????????????????????????',
					  text: "?????? ????????? ????????? ?????? ????????? ????????? ?????? ??? ???????????????.",
					  icon: 'question',
					  showCancelButton: true,
					  confirmButtonColor: '#3085d6',
					  cancelButtonColor: '#d33',
					  confirmButtonText: 'Yes'
					}).then((result) => {
					  	if (result.value) {
					  		
						  	$.ajax({
								url:"recontructionConference.corpResearch",
								type:"post",
								data:{
									researchNoStr:researchNo,
									conferenceContext : text
								},
								success:function(data){
									Swal.fire(
							      		'?????? ????????? ??????!!',
							      		'???????????? ???????????? ?????? ????????? ????????? ?????????????????????!',
							      		'success'
						    		)
								  	setTimeout(function(){
									  location.reload();
									},1500)
								},
								error:function(status){
									console.log(status);
								}
							});
					  }
					})
				}
			}
			start();
		});
		
		$(document).on("click", "#reconsturctionAcceptBtn", function(){
			Swal.fire({
				  title: '???????????? ?????????????????????????',
				  text: "????????? ????????? ????????? ?????? ????????? ???????????????.",
				  icon: 'question',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: 'Yes'
				}).then((result) => {
				  	if (result.value) {
				  		
					  	$.ajax({
							url:"recontructionApproved.corpResearch",
							type:"post",
							data:{
								researchNoStr:researchNo,
							},
							success:function(data){
								Swal.fire(
						      		'?????? ??????!!',
						      		'???????????? ????????? ????????? ?????????????????????!',
						      		'success'
					    		)
							  	setTimeout(function(){
								  location.reload();
								},1500)
							},
							error:function(status){
								console.log(status);
							}
						});
				  }
				})
		});
	</script>
	<c:if test="${ research.researchState == '?????? ????????? ?????????' || research.researchState == '?????? ??????' }">
	<script>
		$(function(){
			$('.ui.accordion').accordion();
			
			$.ajax({
				url:"researchWaitingReviewDetail.adminResearch",
				type:"post",
				data:{researchNoStr:${ research.researchNo }},
				success:function(data){
					console.log(data);
					$("#sortable").text("");
					
					var questionList = data.researchDetail[0].questionList;
					qCount = questionList.length;
					$("#research").find(".header").text(data.researchDetail[0].researchName);
					for(var i = 0; i < questionList.length; i++){
						var $question = $('<li class="ui-state-default">Q<input type="text" readonly name="questionOrder" style="width:10px; border:0; background: none;" value="' + questionList[i].questionOrder + '">. <div class="ui input" style="width: 90%;"><input type="text" name="rquestionContext" value="' + questionList[i].rquestionContext + '"></div></li>');
						var choiceList = questionList[i].requestChoiceList;
						var questionForm = "";
						
						if(questionList[i].questionFormNo == 1){
							questionForm = "?????????";
						}else if(questionList[i].questionFormNo == 2){
							questionForm = "?????????";
						}else if(questionList[i].questionFormNo == 3){
							questionForm = "????????? & ?????????";
						}else if(questionList[i].questionFormNo == 4){
							questionForm = "????????? ??????";
						}else if(questionList[i].questionFormNo == 5){
							questionForm = "?????? ?????????";
						}else if(questionList[i].questionFormNo == 6){
							questionForm = "?????????(????????????)";
						}else if(questionList[i].questionFormNo == 7){
							questionForm = "?????????(?????????)";
						}else {
							questionForm = "?????? ?????? ???????????? ??????";
						}
						var $questionFormDiv = $('<input type="hidden" name="questionFormNo" value="' + questionList[i].questionFormNo + '"><div class="questionForm"> ' + questionForm + '</div>');
						$question.append($questionFormDiv);
						
						if(questionList[i].image != null && questionList[i].image != ""){
							$questionImage = $('<div class="questionImage"><img style="width: 100%;" src="${contextPath}/resources/uploadFiles/' + questionList[i].image.changeName +'"></div>');
							$mediaExplain = $('<div class="mediaExplain">' + questionList[i].mediaExplain + '</div><input type="hidden" name="mediaExplain" value="' + questionList[i].mediaExplain + '">');
							$question.append($questionImage);
							$question.append($mediaExplain);
						}else {
							if(questionList[i].mediaExplain != null && questionList[i].mediaExplain != ""){
								var video = questionList[i].questionVideoLink.substr(questionList[i].questionVideoLink.lastIndexOf("/", questionList[i].questionVideoLink.length), 12);
								$questionVideo = $('<div class="questionVideo"><iframe style="width: 100%; height: 100%" src="https://www.youtube.com/embed' + video + '" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></div>')
								$mediaExplain = $('<div class="mediaExplain">' + questionList[i].mediaExplain + '</div>');
								$question.append($questionVideo);
								$question.append($mediaExplain);
							}
						}
						for(var j = 0; j < choiceList.length; j++){
							var $choice = $('<div class="choice">' + choiceList[j].choiceOrder + '. ' + choiceList[j].choiceContext + '</div></li>')
							if(choiceList[j].choiceImage != null){
								var $choiceimage = $('<br><img src="${contextPath}/resources/uploadFiles/' + choiceList[j].choiceImage.changeName +'" style="width: 200px; height: 90px;">')
								$choice.append($choiceimage);
							}
							$question.append($choice);
						}
						$("#sortable").append($question);
					}

					var DiscriminationDetail = data.DiscriminationDetail[0];
					console.log(DiscriminationDetail.questionList.length)
					$("#surveyQuizAccordion").html("");
					$("#researchNamePanel").val(DiscriminationDetail.researchName);
					var discrimQuizIndex = 1;
					for(var i = 0; i < DiscriminationDetail.questionList.length; i++){
						var $discrimQuizTitle = $('<div class="title"><i class="dropdown icon"></i>Q' + discrimQuizIndex++ + '.' + DiscriminationDetail.questionList[i].rquestionContext + '</div>');
						var $content = $('<div class="content"></div>');
						var $correctAnswer = $('<div style="float: right; width: fit-content;">?????? ?????? ?????? : ' + DiscriminationDetail.questionList[i].correctAnswer + ' ???</div>');
						
						$content.append($correctAnswer);
						var $p = $('<p class="transition hidden"></p>');
						var $choiceArea = $('<div class="choiceArea"></div>');
						for(var j = 0; j < DiscriminationDetail.questionList[i].requestChoiceList.length; j++){
							var $discrimQuizChoice = $('<div class="choice"><div class="ui input" style="width: 100%; height: 100%;"><input type="text" placeholder="?????? ??????" class="choiceInput" readonly value="' + DiscriminationDetail.questionList[i].requestChoiceList[j].choiceContext + '"><input type="hidden" class="discriminationChoiceOrder" value="1"></div></div>');
							$choiceArea.append($discrimQuizChoice);
						}
						$p.append($choiceArea);
						$content.append($p);
						$("#surveyQuizAccordion").append($discrimQuizTitle);
						$("#surveyQuizAccordion").append($content);
					}
					
					$("#surveyQuiz2").find("input[type=text]").each(function(){
						$(this).prop("readonly", true);
						$(this).css({"background":"none", "border":"0"});
					});
					
					$('#corp').modal('show'); 
				},
				error:function(status){
					console.log(status);
				}
			});
		});
	</script>
	</c:if>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/aes.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/sha256.js"></script>
	<c:if test="${ research.researchState == '????????? ??????' || research.researchState == '????????? ????????? ??????'}">
		<script>
			var researchNo = "${research.researchNo}";
			$.ajax({
				url: "selectResearchDetail.adminResearch",
				type: "post",
				data: {
					researchNo: researchNo
				},
				success: function(data) {
					console.log("jsonChoiceArr : " + data.jsonChoiceArr);
					$("#sortable").empty();
					for(var i = 0; i < data.question.length; i++) {
						var chartLabels = [];
	 					var chartData = [];
	 					console.log(data.jsonChoiceArr[i]);
						for(var j = 0; j < data.jsonArr[i].length; j++) {
							console.log(data.jsonChoiceArr[i][j]);
							if(data.jsonChoiceArr[i][j] == null) {
								chartLabels.push(data.jsonArr[i][j].rquestionResponse);
								chartData.push(data.jsonArr[i][j].count);
							} else {
								chartLabels.push(data.jsonChoiceArr[i][j].rchoiceContext);
								chartData.push(data.jsonArr[i][j].count);
							}
						}
						$("#sortable").append('<li class="ui-state-default">Q' + data.question[i].researchOrder + '<br>' + data.question[i].rquestionContext + '</li>');
						$("#sortable").append('<div align="center"><div class="box"><canvas id="' + data.question[i].rquestionNo + '" width="30%" height="30%"></canvas></div></div>');
						
						drawChart(data.question[i].rquestionNo, chartLabels, chartData);
					}
				},
				error: function(data) {
					console.log("ajax??????");
				}
			});
		</script>
	</c:if>
	<c:if test="${ !empty sessionScope.loginUser }">
		<script>
		function payment(){
			var address = '${sessionScope.loginUser.userAddress}';
			var passphrase = "1234";
	        var decrypted1 = CryptoJS.AES.decrypt(address, passphrase);
	        var address1 = decrypted1.toString(CryptoJS.enc.Utf8);
	        
			var phone = '${sessionScope.loginUser.userPhone}';
			var passphrase = "1234";
	        var decrypted1 = CryptoJS.AES.decrypt(phone, passphrase);
	        var phone1 = decrypted1.toString(CryptoJS.enc.Utf8);
	        
	        var IMP = window.IMP;
	        IMP.init('imp67558772');
	        var today = new Date();
	        var todayStr = today.getFullYear() + "-" + today.getMonth() + "-" + today.getDate();
	        var month = 
	        IMP.request_pay({
	            pg : 'inicis', // version 1.1.0?????? ??????.
	            pay_method : 'card',
	            merchant_uid : 'merchant_' + new Date().getTime(),
	            name : '????????? ??????',
	            amount : '100', //?????? ??????
	            buyer_email : '${sessionScope.loginUser.userEmail}',
	            buyer_name : '${sessionScope.loginUser.companyName}',
	            buyer_tel : phone1,
	            app_scheme : '${contextPath}/previousResearchMain.corpResearch'
	            /* buyer_addr : '??????????????? ????????? ?????????', // ??????
	            buyer_postcode : '123-456', //???????????? */
	        }, function(rsp) {
	            if (rsp.success) { //?????? ?????????????????? ??????
					var msg = '????????? ?????????????????????.\n';
					msg += '??????ID : ' + rsp.imp_uid+"\n";
					msg += '?????? ??????ID : ' + rsp.merchant_uid+"\n";
					msg += '?????? ?????? : ' + rsp.paid_amount+"\n";
					msg += '????????? : ' + rsp.name+"\n";
					msg += '???????????? : ' + rsp.status+"\n";
					msg += '?????? ???????????? : ' + rsp.apply_num+"\n"; // ???????????? (?????????????????? ?????????)
					msg += '??????????????? : ' + rsp.buyer_name+"\n";
					msg += '?????????email : ' + rsp.buyer_email+"\n";
					msg += '????????? ????????? : ' + rsp.buyer_tel+"\n";
					msg += '??????????????????  : ' + rsp.paid_at+"\n";
					msg += '?????? ???????????? : ' + rsp.receipt_url+"\n";
					
					var result = { 
					      paymentReason:rsp.name, //?????????
					      paymentAmountStr:'${research.researchPrice}', // ?????? ??????
					      paymentDateStr:todayStr, // ?????? ??????
					      mnoStr:'${ sessionScope.loginUser.mno }', //????????? ????????????
					      researchNoStr:researchNo
	              	};
	               
	              	console.log(result);   
	               
					$.ajax({
					    url:"researchPayment.corpResearch",
						data :result,
						type: "post",
						success:function(data){
				   			Swal.fire(
					      		'?????? ??????!',
					      		'?????? ???????????? ?????? ????????? ?????????????????????!',
					      		'success'
					    	)
					    	setTimeout(function(){
							    location.reload();
							},1500)
				         },
				         error:function(data){
				            console.log("??????!");
				         }
			      });
			   } else { //?????? ????????? ??????
			      var msg = '????????? ?????????????????????.';
			      msg += '???????????? : ' + rsp.error_msg;
			      alert(msg);
			   }
			});
      	}
	</script>
	</c:if>

</body>
</html>