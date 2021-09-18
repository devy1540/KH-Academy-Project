<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	#approvalBtnArea {
		position: relative;
		right: 10px;
		height: 30px;
		float: right;
		margin-bottom: 10px;
	}
	#approvalBtnArea button {
		width: 130px;
		height: 30px;
		background: #EDEBEB;
		font-size: 10pt;
	}
	#searchInput {
		margin-top: 10px;
	}
	#searchInput, .ui.action.input {
		width: 200px;
		height: 37px;
		font-size: 11pt;
		position: relative;
		right: 10px;
		float: right;
	}
	#adminBoxTable {
		width: 100%;
	}
	#listTable {
		width: 100%;
		border-spacing: 0;
		border-collapse: collapse;
		margin-top: 10px;
		
		/* 드래그 방지용 소스*/
		-ms-user-select: none; 
		-moz-user-select: -moz-none; 
		-webkit-user-select: none; 
		-khtml-user-select: none; 
		user-select:none;
		/* 드래그 방지용 소스*/
	}
	#listTable th {
		font-size: 11pt;
		height: 40px;
	}
	#listTable td {
		font-size: 11pt;
		height: 50px;
	}
	#tableTitle {
		background: #DBDBDB;
		border-top: 1px solid #454545;
	}
	.tableContext {
		border-top: 1px solid #AEAEAE;
		border-bottom: 1px solid #AEAEAE;
		text-align: center;
	}
	#pagingArea {
		margin-top: 40px;
		
		/* 드래그 방지용 소스*/
		-ms-user-select: none; 
		-moz-user-select: -moz-none; 
		-webkit-user-select: none; 
		-khtml-user-select: none; 
		user-select:none;
		/* 드래그 방지용 소스*/
	}
	#pagingArea span {
		margin-left: 5px;
		margin-right: 5px;
		color: black;
		font-size: 10pt;
	}
	#pagingArea span:hover {
		margin-left: 5px;
		margin-right: 5px;
		font-size: 10pt;
		color: dodgerblue;
		cursor: pointer;
	}
	.detail, .detail2 {
		font-size: 9pt;
		background: #EDEBEB;
		width: 80px;
		height: 30px;
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
  	#outbreak {
  		margin: 20px auto;
  		width: 70%;
  		height: 10%;
  		border-radius: 7px;
  		border: 1px solid #C5C5C5;
  		background: #F6F6F6;
  		padding: 15px;
  		margin-top: 30px;
  	}
  	
  	#corpTable {
  		width: 70%;
  		margin: 0 auto;
  		border-spacing: 0;
		border-collapse: collapse;
  	}
  	#corpTable th {
  		width: 20%;
  		height: 70px;
  		border-bottom: 1px solid #C5C5C5;
  	}
  	#corpTable td {
  		width: 80%;
  		border-bottom: 1px solid #C5C5C5;
  	}
  	#choice, .choice {
  		margin-left: 20%;
  		margin-top: 20px;
  		width: fit-content;
  	}
  	.choiceInput {
  		width: 100px;
  	}
  	.ui.input {
  		margin-right: 5px;
  	}
  	#nextBtn, #nextBtn2, #nextBtn3 {
  		background: #00679A;
  		color: white;
  	}
  	#approvalBtn, #approvalBtn2 {
  		background: #00679A;
  		color: white;
  	}
  	#referBtn {
  		background: #C1332A;
  		color: white;
  	}
  	.add, .delete {
  		display:inline-block; 
  		width: 25px;
  	}
  	.add {
  		margin-right: 2px;
  	}
  	.add:hover, .delete:hover {
  		cursor: pointer;
  	}
  	#surveyQuizAccordion {
  		margin: 0 auto;
  		font-size: 13pt;
  	}
  	.surveyQuizTitle, .surveyQuizContext {
  		background: none;
  		border: none;
  		width: 80%;
  		
  	}
  	.surveyQuizTitle:focus, .surveyQuizContext:focus {
		outline: none;  		
  	}
  	#addQuiz {
  		width: 150px;
  		height: 50px;
  		font-size: 16pt;
  		text-align: center;
  		margin: 0 auto;
  		margin-top: 30px;
  	}
  	#addQuiz:hover {
  		cursor: pointer;
  	}
  	#researchName {
  		width: 65%;
    	margin: 20px auto;
    	display: block;
  	}
  	.questionForm {
		width: 100%;
		height: 20px;
		text-align: right;
		font-size: 11pt;
	}
	.questionImage, .questionVideo {
		width: 80%;
		height: 100px;
		margin: 10px auto;
	}
	.mediaExplain {
		width: 50%;
		text-align: left;
		margin: 0 auto;
		margin-top: 10px;
	}
	.questionVideo {
		margin-bottom: 65px;
	}
	input[name=questionOrder]:focus {
		outline: none;
	}
</style>
</head>
<body>
	<jsp:include page="../common/adminMenuBar.jsp"/>
	
	<div id="adminBox">
		<table id="adminBoxTable">
			<tr>
				<td>
					<div id="approvalBtnArea">
						<!-- <button onclick="location.href='researchWaitingPayment.admin'">협의중</button>
						<button onclick="location.href='researchConsultationCompleted.admin'">협의완료</button> -->
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div id="adminTitle">
						서베이 문항 재구성 대기 목록
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div id="searchInput">
						<div class="ui action input">
			  				<input type="text" placeholder="Search...">
							<button class="ui icon button">
								<i class="search icon"></i>
							</button>
						</div>
					</div>
				</td>
			</tr>
		</table>
		<table id="listTable">
			<tr id="tableTitle">
				<th style="width: 10%;">리서치 번호</th>
				<th style="width: 20%;">기업명</th>
				<th style="width: 30%;">리서치 제목</th>
				<th style="width: 10%;">최근 작업일</th>
				<th style="width: 15%;">상태</th>
				<th style="width: 15%;">재구성하기</th>
			</tr>
			<c:forEach var="research" items="${surveyReconstructionList}">
				<tr class="tableContext">
					<td>${research.researchNo }</td>
					<td>${research.companyName }</td>
					<td>${research.researchName }</td>
					<td>${research.changeDate }</td>
					<td>${research.researchState }</td>
					<td>
						<c:if test="${research.researchState == '질문 재구성 대기' || research.researchState == '질문 재구성 협의중'}">
							<button class="detail">재구성하기</button>
						</c:if>
						<c:if test="${research.researchState == '검토 대기'}">
							<button class="detail2">내용 확인</button>
						</c:if>
					</td>
				</tr>
			</c:forEach>
		</table>
		<div id="pagingArea" align="center">
			<c:url var="researchFirst" value="surveyReconstructionList.adminResearch">
				<c:param name="currentPage" value="${1}"/>
			</c:url>
			<a href="${researchFirst}"><span>[처음]</span></a>&nbsp;
			
			<c:if test="${pi.currentPage <= 1}">
				<span>[이전]</span> &nbsp;
			</c:if>
			<c:if test="${pi.currentPage > 1}">
				<c:url var="researchBack" value="surveyReconstructionList.adminResearch">
					<c:param name="currentPage" value="${pi.currentPage - 1}"/>
				</c:url>
				<a href="${researchBack}"><span>[이전]</span></a>&nbsp;
			</c:if>
			
			<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
				<c:if test="${p eq pi.currentPage }">
					<span style="color: #4169E1; font-weight: bold; font-size: 15pt;">${ p }</span>
				</c:if>
				<c:if test="${p ne pi.currentPage }">
					<c:url var="researchCheck" value="surveyReconstructionList.adminResearch">
						<c:param name="currentPage" value="${ p }"/>
					</c:url>
					<a href="${ researchCheck }"><span>${ p }</span></a>
				</c:if>
				
			</c:forEach>
			
			<c:if test="${pi.currentPage < pi.maxPage}">
				<c:url var="researchNext" value="surveyReconstructionList.adminResearch">
					<c:param name="currentPage" value="${pi.currentPage + 1}"/>
				</c:url>
				&nbsp;<a href="${researchNext}"><span>[다음]</span></a>
			</c:if>
			<c:if test="${pi.currentPage >= pi.maxPage}">
				&nbsp; <span>[다음]</span>
			</c:if>
			
			<c:url var="researchEnd" value="surveyReconstructionList.adminResearch">
				<c:param name="currentPage" value="${pi.maxPage}"/>
			</c:url>
			<a href="${researchEnd}"><span>[마지막]</span></a>&nbsp;
		</div>
	</div>
		
	<div class="ui modal" id="research">
		<div class="header">리서치 제목</div>
		<div class="scrolling content">
			<div>
				<div style="width: fit-content; margin: 0 auto;"><h1>패널용 리서치 명</h1></div>
				<div class="ui input" id="researchName">
					<input type="text" id="researchNamePanel" name="researchNamePanel" placeholder="패널용 리서치 명" style="width: 100%">
				</div>
				<ul id="sortable">
					
				</ul>
				
			</div>
		</div>
		<div class="actions">
			<div class="ui approve button" id="nextBtn2">Next</div>
			<div class="ui approve button" id="nextBtn3">Next</div>
		    <div class="ui cancel button">Cancel</div>
  		</div>
	</div>
	<div class="ui modal" id="corp">
		<div class="header">기업 명</div>
		<div class="scrolling content">
			<div>
				<table id="corpTable">
					<tr>
						<th>프로젝트 명</th>
						<td>피자 선호도 조사</td>
					</tr>
					<tr>
						<th>목적</th>
						<td>우리 브랜드 피자 선호도는 얼마나 되는가 궁금한 점과 앞으로 나아갈 피자의 방향</td>
					</tr>
					<tr>
						<th>목표 인원</th>
						<td>200명</td>
					</tr>
					<tr>
						<th>조사 대상 성별</th>
						<td>전체</td>
					</tr>
					<tr>
						<th>조사 대상 연령</th>
						<td>20~29</td>
					</tr>
					<tr>
						<th>조사 대상 지역</th>
						<td>서울 및 수도권</td>
					</tr>
					<tr>
						<th>조사 예상 기간</th>
						<td>2020-01-20 ~ 2020-01-27</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="actions">
		    <div class="ui approve button" id="nextBtn">Next</div>
		    <div class="ui cancel button">Cancel</div>
  		</div>
	</div>
	
	<div class="ui modal" id="surveyQuiz">
		<div class="header">조사 대상자 퀴즈</div>
		<div class="scrolling content">
			<div>
				<div class="ui styled accordion" id="surveyQuizAccordion">
					<div class="title">
						<i class="dropdown icon"></i>
						Q1<input type='hidden' class='discriminationQuestionOrder' value='1' readonly style='width: 10px; background: none; border: 0;'>. 
						<input type='text' placeholder='질문 작성' class='surveyQuizTitle'>
					</div>
					<div class="content">
						<div style="float: right; width: fit-content;">
							정답 보기 번호 : <div class='ui input' style='width: 80px;'>
											<input type='text' class="correctAnswer" maxlength="1"  onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
										</div> 번
						</div>
						<p class="transition hidden">
							<div class="choiceArea">
								<div class="choice">
									<div class="ui input" style="width: 300px;">
		 	 							<input type='text' placeholder='보기 작성' class='choiceInput'>
		 	 							<input type='hidden' class='discriminationChoiceOrder' value='1'>
									</div>
									<span class="add">
										<i class="plus circle icon"></i>
									</span><span class="delete"><i class="minus circle icon"></i></span>
								</div>
							</div>
						</p>
					</div>
				</div>
				<div>
					<div id="addQuiz">
						<i class="primary large plus circle icon"></i>질문  추가
					</div>
				</div>
			</div>
		</div>
		<div class="actions">
		    <div class="ui approve button" id="approvalBtn">Approve</div>
		    <div class="ui cancel button">Cancel</div>
  		</div>
	</div>
	<div class="ui modal" id="surveyQuiz2">
		<div class="header">조사 대상자 퀴즈</div>
		<div class="scrolling content">
			<div>
				<div class="ui styled accordion" id="surveyQuizAccordion">
					
				</div>

			</div>
		</div>
		<div class="actions">
			<div class="ui approve button" id="approvalBtn2">Approve</div>
			<div class="ui approve button" id="referBtn">Refer</div>
		    <div class="ui cancel button">Cancel</div>
  		</div>
	</div>
	<script>
		choiceIndex = 2;
		questionIndex = 2;
		$("#addQuiz").on("click", function(){
			var $quiz = $("<div class='title'> <i class='dropdown icon'></i>Q" + questionIndex + "<input type='hidden' class='discriminationQuestionOrder' value='" + questionIndex++ + "' readonly style='width: 10px; background: none; border: 0;'>. <input type='text' placeholder='질문 작성' class='surveyQuizTitle'> </div> <div class='content'> <div style='float: right; width: fit-content;'> 정답 보기 번호 : <div class='ui input' style='width: 80px;'> <input type='text' class='correctAnswer' maxlength='1'  onKeyup='this.value=this.value.replace(/[^0-9]/g,'');'> </div> 번 </div><p class='transition hidden'> <div class='choiceArea'> <div class='choice'><div class='ui input' style='width: 300px;'> <input type='text' placeholder='보기 작성' class='choiceInput'><input type='hidden' class='discriminationChoiceOrder'  value='1'> </div> <span class='add'> <i class='plus circle icon'></i> </span> <span class='delete'> <i class='minus circle icon'></i> </span> </div> </div> </p> </div>")
			var $accordian = $(this).parent().find("#surveyQuizAccordion");
			$accordian.append($quiz);
			
			choiceIndex = 2;
			
		});
		$("#addQuiz2").on("click", function(){
			var $quiz = $("<div class='title'> <i class='dropdown icon'></i>Q" + questionIndex + "<input type='hidden' class='discriminationQuestionOrder' value='" + questionIndex++ + "' readonly style='width: 10px; background: none; border: 0;'>. <input type='text' placeholder='질문 작성' class='surveyQuizTitle'> </div> <div class='content'> <div style='float: right; width: fit-content;'> 정답 보기 번호 : <div class='ui input' style='width: 80px;'> <input type='text' class='correctAnswer' maxlength='1'  onKeyup='this.value=this.value.replace(/[^0-9]/g,'');'> </div> 번 </div><p class='transition hidden'> <div class='choiceArea'> <div class='choice'><div class='ui input' style='width: 300px;'> <input type='text' placeholder='보기 작성' class='choiceInput'><input type='hidden' class='discriminationChoiceOrder'  value='1'> </div> <span class='add'> <i class='plus circle icon'></i> </span> <span class='delete'> <i class='minus circle icon'></i> </span> </div> </div> </p> </div>")
			var $accordian = $(this).parent().find("#surveyQuizAccordion");
			$accordian.append($quiz);
			
			choiceIndex = 2;
			
		});
		$(document).on("click", ".add", function(){
			var $choice = $("<div class='ui input' style='width: 300px;'><input type='text' placeholder='보기 작성' class='choiceInput'><input type='hidden' class='discriminationChoiceOrder' value='" + choiceIndex++ + "'></div>");
			var $add = $("<span class='add'><i class='plus circle icon'></i></span>&nbsp;");
			var $delete = $("<span class='delete'><i class='minus circle icon'></i></span>");
			
			var $choiceDiv = $("<div class='choice'>");
			$choiceDiv.append($choice);
			$choiceDiv.append($add);
			$choiceDiv.append($delete);
			
			$(this).parent().parent().append($choiceDiv);
		});
		
		$('.ui.accordion').accordion();
		
		$(document).on("click", ".delete", function(){
			$(this).parent().remove();
		})
		$("#nextBtn").on("click", function(){
			$('#research').modal('show');
		});
		$("#nextBtn2").on("click", function(){
			$('#surveyQuiz').modal('show');
			researchNamePanel = $("#researchNamePanel").val();
			$("input[name=questionOrder]").each(function(){
				questionOrder.push($(this).val());
			})
			$("input[name=rquestionContext]").each(function(){
				rquestionContext.push($(this).val());
			})
			
			
		});
		$("#nextBtn3").on("click", function(){
			$('#surveyQuiz2').modal('show');
			researchNamePanel = $("#researchNamePanel").val();
			$("input[name=questionOrder]").each(function(){
				questionOrder.push($(this).val());
			})
			$("input[name=rquestionContext]").each(function(){
				rquestionContext.push($(this).val());
			})
		});
		
		questionOrder = [];
		rquestionContext = [];
		
		$(document).on("click", ".detail", function(){
			var researchState = $(this).parent().parent().find("td").eq(4).text();
			$("#etc").remove();
			$("#conference").remove();
			$("#approvalBtn2").show();
			$("#referBtn").show();
			if(researchState == '질문 재구성 대기'){
				$("#referBtn").hide();
				$("#nextBtn2").show();
				$("#nextBtn3").hide();
			}else if(researchState == '질문 재구성 협의중'){
				$("#referBtn").show();
				$("#nextBtn2").hide();
				$("#nextBtn3").show();
			}
			researchNoStr = $(this).parent().siblings().eq(0).text();
			var companyName = $(this).parent().siblings().eq(1).text();
			
			$("#surveyQuizAccordion").html('<div class="title"> <i class="dropdown icon"></i> Q1<input type="hidden" class="discriminationQuestionOrder" value="1" readonly style="width: 10px; background: none; border: 0;">. <input type="text" placeholder="질문 작성" class="surveyQuizTitle"> </div> <div class="content"> <div style="float: right; width: fit-content;"> 정답 보기 번호 : <div class="ui input" style="width: 80px;"> <input type="text" class="correctAnswer" maxlength="1"  onKeyup="this.value=this.value.replace(/[^0-9]/g,"");"> </div> 번 </div> <p class="transition hidden"> <div class="choiceArea"> <div class="choice"> <div class="ui input" style="width: 300px;"> <input type="text" placeholder="보기 작성" class="choiceInput"> <input type="hidden" class="discriminationChoiceOrder" value="1"> </div> <span class="add"> <i class="plus circle icon"></i> </span><span class="delete"><i class="minus circle icon"></i></span> </div> </div> </p> </div>')
			$("#researchNamePanel").val("");
			choiceIndex = 2;
			questionIndex = 2;
			
			
			if(researchState == '질문 재구성 대기'){
				$.ajax({
					url:"researchApprovalDetail.adminResearch",
					type:"post",
					data:{researchNoStr:researchNoStr},
					success:function(data){
						$("#sortable").text("");
						$("#research").find("input[type=text]").each(function(){
							$(this).prop("readonly", false);
						});
						var researchDetail = data.researchDetail[0];
						var gender = "";
						var location = "";
						console.log(researchDetail)
						$("#corp").find(".header").text(companyName);
						$("#corpTable").find("td").eq(0).text(researchDetail.researchName);
						$("#corpTable").find("td").eq(1).text(researchDetail.researchPerpose);
						$("#corpTable").find("td").eq(2).text(researchDetail.researchEngagementGoals + '명');
						engagementGoals = researchDetail.researchEngagementGoals;
						if(researchDetail.targetGender == 'A') {
							gender = "전체";
						}else if(researchDetail.targetGender == 'M') {
							gender = "남성";
						}else if(researchDetail.targetGender == 'F') {
							gender = "여성";
						}
						$("#corpTable").find("td").eq(3).text(gender);
						$("#corpTable").find("td").eq(4).text(researchDetail.targetAgeRange);
						if(researchDetail.targetLocation == 'all'){
							location = "전체";
						}else if(researchDetail.targetLocation == 'metropolitan'){
							location = "서울 및 수도권";
						}else if(researchDetail.targetLocation == 'city'){
							location = "서울, 경기 및 9대 광역시";
						}
						$("#corpTable").find("td").eq(5).text(location);
						var startDate = researchDetail.researchPeriod.split("~")[0].substr(0, 4) + "-" + researchDetail.researchPeriod.split("~")[0].substr(4, 2) + "-" + researchDetail.researchPeriod.split("~")[0].substr(6, 2);
						var endDate = researchDetail.researchPeriod.split("~")[1].substr(0, 4) + "-" + researchDetail.researchPeriod.split("~")[1].substr(4, 2) + "-" + researchDetail.researchPeriod.split("~")[1].substr(6, 2);
						$("#corpTable").find("td").eq(6).text(startDate + " ~ " + endDate);
	
						if(researchDetail.additionalEtc != null && researchDetail.additionalEtc != ""){
							var $etcTr = $("<tr id='etc'><th>추가 요구 사항</th><td>" + researchDetail.additionalEtc + "</td></tr>");
							$("#corpTable").append($etcTr);
						}
						var questionList = data.researchDetail[0].questionList;
						qCount = questionList.length;
						$("#research").find(".header").text(data.researchDetail[0].researchName);
						for(var i = 0; i < questionList.length; i++){
							var $question = $('<li class="ui-state-default">Q<input type="text" readonly name="questionOrder" style="width:10px; border:0; background: none;" value="' + questionList[i].questionOrder + '">. <div class="ui input" style="width: 90%;"><input type="text" name="rquestionContext" value="' + questionList[i].rquestionContext + '"></div></li>');
							var choiceList = questionList[i].requestChoiceList;
							var questionForm = "";
							
							if(questionList[i].questionFormNo == 1){
								questionForm = "객관식";
							}else if(questionList[i].questionFormNo == 2){
								questionForm = "주관식";
							}else if(questionList[i].questionFormNo == 3){
								questionForm = "객관식 & 이미지";
							}else if(questionList[i].questionFormNo == 4){
								questionForm = "리커트 척도";
							}else if(questionList[i].questionFormNo == 5){
								questionForm = "숫자 합계형";
							}else if(questionList[i].questionFormNo == 6){
								questionForm = "객관식(다중선택)";
							}else if(questionList[i].questionFormNo == 7){
								questionForm = "주관식(서술형)";
							}else {
								questionForm = "문항 형식 불러오기 오류";
							}
							var $questionFormDiv = $('<input type="hidden" name="questionFormNo" value="' + questionList[i].questionFormNo + '"><div class="questionForm"> ' + questionForm + '</div>');
							$question.append($questionFormDiv);
							
							if(questionList[i].image != null && questionList[i].image != ""){
								$questionImage = $('<div class="questionImage"><img src="${contextPath}/resources/uploadFiles/' + questionList[i].image.changeName +'"></div>');
								$mediaExplain = $('<div class="mediaExplain">' + questionList[i].mediaExplain + '</div><input type="hidden" name="mediaExplain" value="' + questionList[i].mediaExplain + '">');
								$question.append($questionImage);
								$question.append($mediaExplain);
							}else {
								if(questionList[i].mediaExplain != null && questionList[i].mediaExplain != ""){
									var video = questionList[i].questionVideoLink.substr(questionList[i].questionVideoLink.lastIndexOf("/", questionList[i].questionVideoLink.length), 12);
									$questionVideo = $('<div class="questionVideo"><iframe style="width: 100%;" src="https://www.youtube.com/embed' + video + '" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></div>')
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
	
						$('#corp').modal('show'); 
					},
					error:function(status){
						console.log(status);
					}
				});
			}else if(researchState == '질문 재구성 협의중'){
				
				$.ajax({
					url:"researchWaitingReviewDetail.adminResearch",
					type:"post",
					data:{researchNoStr:researchNoStr},
					success:function(data){
						$("#sortable").text("");
						var researchDetail = data.researchDetail[0];
						var gender = "";
						var location = "";
						$("#researchNamePanel").val();
						$("#corp").find(".header").text(companyName);
						$("#corpTable").find("td").eq(0).text(researchDetail.researchName);
						$("#corpTable").find("td").eq(1).text(researchDetail.researchPerpose);
						$("#corpTable").find("td").eq(2).text(researchDetail.researchEngagementGoals + '명');
						engagementGoals = researchDetail.researchEngagementGoals;
						if(researchDetail.targetGender == 'A') {
							gender = "전체";
						}else if(researchDetail.targetGender == 'M') {
							gender = "남성";
						}else if(researchDetail.targetGender == 'F') {
							gender = "여성";
						}
						$("#corpTable").find("td").eq(3).text(gender);
						$("#corpTable").find("td").eq(4).text(researchDetail.targetAgeRange);
						if(researchDetail.targetLocation == 'all'){
							location = "전체";
						}else if(researchDetail.targetLocation == 'metropolitan'){
							location = "서울 및 수도권";
						}else if(researchDetail.targetLocation == 'city'){
							location = "서울, 경기 및 9대 광역시";
						}
						$("#corpTable").find("td").eq(5).text(location);
						var startDate = researchDetail.researchPeriod.split("~")[0].substr(0, 4) + "-" + researchDetail.researchPeriod.split("~")[0].substr(4, 2) + "-" + researchDetail.researchPeriod.split("~")[0].substr(6, 2);
						var endDate = researchDetail.researchPeriod.split("~")[1].substr(0, 4) + "-" + researchDetail.researchPeriod.split("~")[1].substr(4, 2) + "-" + researchDetail.researchPeriod.split("~")[1].substr(6, 2);
						$("#corpTable").find("td").eq(6).text(startDate + " ~ " + endDate);

						if(researchDetail.additionalEtc != null && researchDetail.additionalEtc != ""){
							var $etcTr = $("<tr id='etc'><th>추가 요구 사항</th><td>" + researchDetail.additionalEtc + "</td></tr>");
							$("#corpTable").append($etcTr);
						}
						
						var questionList = data.researchDetail[0].questionList;
						qCount = questionList.length;
						$("#research").find(".header").text(data.researchDetail[0].researchName);
						for(var i = 0; i < questionList.length; i++){
							var $question = $('<li class="ui-state-default">Q<input type="text" name="questionOrder" style="width:10px; border: 0; background: none;" readonly value="' + questionList[i].questionOrder + '">. <div class="ui input" style="width: 90%;"><input type="text" name="rquestionContext" value="' + questionList[i].rquestionContext + '"></div></li>');
							var choiceList = questionList[i].requestChoiceList;
							var questionForm = "";
							
							if(questionList[i].questionFormNo == 1){
								questionForm = "객관식";
							}else if(questionList[i].questionFormNo == 2){
								questionForm = "주관식";
							}else if(questionList[i].questionFormNo == 3){
								questionForm = "객관식 & 이미지";
							}else if(questionList[i].questionFormNo == 4){
								questionForm = "리커트 척도";
							}else if(questionList[i].questionFormNo == 5){
								questionForm = "숫자 합계형";
							}else if(questionList[i].questionFormNo == 6){
								questionForm = "객관식(다중선택)";
							}else if(questionList[i].questionFormNo == 7){
								questionForm = "주관식(서술형)";
							}else {
								questionForm = "문항 형식 불러오기 오류";
							}
							var $questionFormDiv = $('<input type="hidden" name="questionFormNo" value="' + questionList[i].questionFormNo + '"><div class="questionForm"> ' + questionForm + '</div>');
							$question.append($questionFormDiv);
							
							if(questionList[i].image != null && questionList[i].image != ""){
								$questionImage = $('<div class="questionImage"><img src="${contextPath}/resources/uploadFiles/' + questionList[i].image.changeName +'"></div>');
								$mediaExplain = $('<div class="mediaExplain">' + questionList[i].mediaExplain + '</div><input type="hidden" name="mediaExplain" value="' + questionList[i].mediaExplain + '">');
								$question.append($questionImage);
								$question.append($mediaExplain);
							}else {
								if(questionList[i].mediaExplain != null && questionList[i].mediaExplain != ""){
									var video = questionList[i].questionVideoLink.substr(questionList[i].questionVideoLink.lastIndexOf("/", questionList[i].questionVideoLink.length), 12);
									$questionVideo = $('<div class="questionVideo"><iframe style="width: 100%;" src="https://www.youtube.com/embed' + video + '" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></div>')
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
						
						if(DiscriminationDetail.conferenceContext){
							var $discrim = $("<tr id='conference'><th>재구성 협의 내용</th><td>" + DiscriminationDetail.conferenceContext + "</td></tr>");
							$("#corpTable").append($discrim);
						}
						$("#surveyQuiz2").find("#surveyQuizAccordion").html("");
						$("#researchNamePanel").val(DiscriminationDetail.researchName);
						var discrimQuizIndex = 1;
						var discrimChoiceIndex = 1;
						for(var i = 0; i < DiscriminationDetail.questionList.length; i++){
							var $discrimQuizTitle = $('<div class="title"><i class="dropdown icon"></i>Q' + discrimQuizIndex + '.<input type="hidden" class="discriminationQuestionOrder" value="' + discrimQuizIndex++ + '" readonly style="width: 10px; background: none; border: 0;"><input type="text" placeholder="질문 작성" class="surveyQuizTitle" value="' + DiscriminationDetail.questionList[i].rquestionContext + '"></div>');
							var $content = $('<div class="content"></div>');
							var $correctAnswer = $('<div style="float: right; width: fit-content;">정답 보기 번호 : <div class="ui input" style="width: 80px;"><input type="text" class="correctAnswer" maxlength="1"  onKeyup="this.value=this.value.replace(/[^0-9]/g,"");" value="' + DiscriminationDetail.questionList[i].correctAnswer + '"></div> 번</div>');
							
							$content.append($correctAnswer);
							var $p = $('<p class="transition hidden"></p>');
							var $choiceArea = $('<div class="choiceArea"></div>');
							for(var j = 0; j < DiscriminationDetail.questionList[i].requestChoiceList.length; j++){
								var $discrimQuizChoice = $('<div class="choice"><div class="ui input" style="width: 300px;"><input type="text" placeholder="보기 작성" class="choiceInput" value="' + DiscriminationDetail.questionList[i].requestChoiceList[j].choiceContext + '"><input type="hidden" class="discriminationChoiceOrder" value="' + discrimChoiceIndex++ + '"></div><span class="add"> <i class="plus circle icon"></i> </span><span class="delete"><i class="minus circle icon"></i></span></div>');
								$choiceArea.append($discrimQuizChoice);
							}
							$p.append($choiceArea);
							$content.append($p);
							$("#surveyQuiz2").find("#surveyQuizAccordion").append($discrimQuizTitle);
							$("#surveyQuiz2").find("#surveyQuizAccordion").append($content);
						}
						
						$('#corp').modal('show'); 
					},
					error:function(status){
						console.log(status);
					}
				});
			}
		});
		$("#approvalBtn").on("click", function(){
			var discriminationQuestionOrder = [];
			var surveyQuizTitle = [];
			var discriminationChoiceOrder = [];
			var choiceInput = [];
			var correctAnswer = [];
			$(".discriminationQuestionOrder").each(function(){
				discriminationQuestionOrder.push($(this).val());
			})
			$(".surveyQuizTitle").each(function(){
				surveyQuizTitle.push($(this).val());
			})
			$(".discriminationChoiceOrder").each(function(){
				discriminationChoiceOrder.push($(this).val());
			})
			$(".choiceInput").each(function(){
				choiceInput.push($(this).val());
			})
			$(".correctAnswer").each(function(){
				correctAnswer.push($(this).val());
			})
			
			$("#surveyQuizAccordion").html('<div class="title"> <i class="dropdown icon"></i> Q1<input type="hidden" class="discriminationQuestionOrder" value="1" readonly style="width: 10px; background: none; border: 0;">. <input type="text" placeholder="질문 작성" class="surveyQuizTitle"> </div> <div class="content"> <p class="transition hidden"> <div class="choiceArea"> <div class="choice"> <div class="ui input" style="width: 300px;"> <input type="text" placeholder="보기 작성" class="choiceInput"> <input type="hidden" class="discriminationChoiceOrder" value="1"> </div> <span class="add"> <i class="plus circle icon"></i> </span><span class="delete"><i class="minus circle icon"></i></span> </div> </div> </p> </div>')
			
			choiceIndex = 2;
			questionIndex = 2;
			
			Swal.fire({
			  title: '재구성을 완료하시겠습니까?',
			  text: "이 구성내용은 기업에게 전달됩니다!",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: 'Yes'
			}).then((result) => {
			  	if (result.value) {
				  	$.ajax({
						url:"researchReconstruction.adminResearch",
						type:"post",
						traditional : true,
						data:{
							discriminationQuestionOrder:discriminationQuestionOrder,
							surveyQuizTitle:surveyQuizTitle,
							discriminationChoiceOrder:discriminationChoiceOrder,
							choiceInput:choiceInput,
							correctAnswer:correctAnswer,
							researchNoStr:researchNoStr,
							questionOrder:questionOrder,
							rquestionContext:rquestionContext,
							researchNamePanel:researchNamePanel
						},
						success:function(data){
							console.log(data);
							Swal.fire(
								'재구성 완료!',
								'구성 내용이 기업에게 전달되었습니다.',
								'success'
						    )
						    setTimeout(function(){
						        location.reload();
						    },1500)

						},
						error:function(data){
						
						}
				  	});
				    
			  	}else {
				  $('#research').modal('show');
			  	}
			})
		});
		
		$("#approvalBtn2").on("click", function(){
			var discriminationQuestionOrder = [];
			var surveyQuizTitle = [];
			var discriminationChoiceOrder = [];
			var choiceInput = [];
			var correctAnswer = [];
			$("#surveyQuiz2").find(".discriminationQuestionOrder").each(function(){
				discriminationQuestionOrder.push($(this).val());
			})
			$("#surveyQuiz2").find(".surveyQuizTitle").each(function(){
				surveyQuizTitle.push($(this).val());
			})
			$("#surveyQuiz2").find(".discriminationChoiceOrder").each(function(){
				discriminationChoiceOrder.push($(this).val());
			})
			$("#surveyQuiz2").find(".choiceInput").each(function(){
				choiceInput.push($(this).val());
			})
			$("#surveyQuiz2").find(".correctAnswer").each(function(){
				correctAnswer.push($(this).val());
			})
			
			$("#surveyQuizAccordion").html('<div class="title"> <i class="dropdown icon"></i> Q1<input type="hidden" class="discriminationQuestionOrder" value="1" readonly style="width: 10px; background: none; border: 0;">. <input type="text" placeholder="질문 작성" class="surveyQuizTitle"> </div> <div class="content"> <p class="transition hidden"> <div class="choiceArea"> <div class="choice"> <div class="ui input" style="width: 300px;"> <input type="text" placeholder="보기 작성" class="choiceInput"> <input type="hidden" class="discriminationChoiceOrder" value="1"> </div> <span class="add"> <i class="plus circle icon"></i> </span><span class="delete"><i class="minus circle icon"></i></span> </div> </div> </p> </div>')
			
			choiceIndex = 2;
			questionIndex = 2;
			
			Swal.fire({
			  title: '재구성을 완료하시겠습니까?',
			  text: "이 구성내용은 기업에게 전달됩니다!",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: 'Yes'
			}).then((result) => {
			  	if (result.value) {
				  	$.ajax({
						url:"researchReconstruction.adminResearch",
						type:"post",
						traditional : true,
						data:{
							discriminationQuestionOrder:discriminationQuestionOrder,
							surveyQuizTitle:surveyQuizTitle,
							discriminationChoiceOrder:discriminationChoiceOrder,
							choiceInput:choiceInput,
							correctAnswer:correctAnswer,
							researchNoStr:researchNoStr,
							questionOrder:questionOrder,
							rquestionContext:rquestionContext,
							researchNamePanel:researchNamePanel
						},
						success:function(data){
							console.log(data);
							Swal.fire(
								'재구성 완료!',
								'구성 내용이 기업에게 전달되었습니다.',
								'success'
						    )
						    setTimeout(function(){
						        location.reload();
						    },1500)

						},
						error:function(data){
						
						}
				  	});
				    
			  	}else {
				  $('#research').modal('show');
			  	}
			})
		});
		$(document).on("click", ".detail2", function(){
			$("#nextBtn3").show();
			$("#nextBtn2").hide();
			$("#approvalBtn2").hide();
			$("#referBtn").hide();
			$("#etc").remove();
			$("#conference").remove();
			researchNoStr = $(this).parent().siblings().eq(0).text();
			var companyName = $(this).parent().siblings().eq(1).text();
			
			$.ajax({
				url:"researchWaitingReviewDetail.adminResearch",
				type:"post",
				data:{researchNoStr:researchNoStr},
				success:function(data){
					console.log(data);
					$("#sortable").text("");
					var researchDetail = data.researchDetail[0];
					var gender = "";
					var location = "";
					$("#researchNamePanel").val();
					$("#corp").find(".header").text(companyName);
					$("#corpTable").find("td").eq(0).text(researchDetail.researchName);
					$("#corpTable").find("td").eq(1).text(researchDetail.researchPerpose);
					$("#corpTable").find("td").eq(2).text(researchDetail.researchEngagementGoals + '명');
					engagementGoals = researchDetail.researchEngagementGoals;
					if(researchDetail.targetGender == 'A') {
						gender = "전체";
					}else if(researchDetail.targetGender == 'M') {
						gender = "남성";
					}else if(researchDetail.targetGender == 'F') {
						gender = "여성";
					}
					$("#corpTable").find("td").eq(3).text(gender);
					$("#corpTable").find("td").eq(4).text(researchDetail.targetAgeRange);
					if(researchDetail.targetLocation == 'all'){
						location = "전체";
					}else if(researchDetail.targetLocation == 'metropolitan'){
						location = "서울 및 수도권";
					}else if(researchDetail.targetLocation == 'city'){
						location = "서울, 경기 및 9대 광역시";
					}
					$("#corpTable").find("td").eq(5).text(location);
					var startDate = researchDetail.researchPeriod.split("~")[0].substr(0, 4) + "-" + researchDetail.researchPeriod.split("~")[0].substr(4, 2) + "-" + researchDetail.researchPeriod.split("~")[0].substr(6, 2);
					var endDate = researchDetail.researchPeriod.split("~")[1].substr(0, 4) + "-" + researchDetail.researchPeriod.split("~")[1].substr(4, 2) + "-" + researchDetail.researchPeriod.split("~")[1].substr(6, 2);
					$("#corpTable").find("td").eq(6).text(startDate + " ~ " + endDate);

					if(researchDetail.additionalEtc != null && researchDetail.additionalEtc != ""){
						var $etcTr = $("<tr><th>추가 요구 사항</th><td>" + researchDetail.additionalEtc + "</td></tr>");
						$("#corpTable").append($etcTr);
					}
					var questionList = data.researchDetail[0].questionList;
					qCount = questionList.length;
					$("#research").find(".header").text(data.researchDetail[0].researchName);
					for(var i = 0; i < questionList.length; i++){
						var $question = $('<li class="ui-state-default">Q<input type="text" readonly name="questionOrder" style="width:10px; border:0; background: none;" value="' + questionList[i].questionOrder + '">. <div class="ui input" style="width: 90%;"><input type="text" name="rquestionContext" value="' + questionList[i].rquestionContext + '"></div></li>');
						var choiceList = questionList[i].requestChoiceList;
						var questionForm = "";
						
						if(questionList[i].questionFormNo == 1){
							questionForm = "객관식";
						}else if(questionList[i].questionFormNo == 2){
							questionForm = "주관식";
						}else if(questionList[i].questionFormNo == 3){
							questionForm = "객관식 & 이미지";
						}else if(questionList[i].questionFormNo == 4){
							questionForm = "리커트 척도";
						}else if(questionList[i].questionFormNo == 5){
							questionForm = "숫자 합계형";
						}else if(questionList[i].questionFormNo == 6){
							questionForm = "객관식(다중선택)";
						}else if(questionList[i].questionFormNo == 7){
							questionForm = "주관식(서술형)";
						}else {
							questionForm = "문항 형식 불러오기 오류";
						}
						
						var $questionFormDiv = $('<input type="hidden" name="questionFormNo" value="' + questionList[i].questionFormNo + '"><div class="questionForm"> ' + questionForm + '</div>');
						$question.append($questionFormDiv);
						
						if(questionList[i].image != null && questionList[i].image != ""){
							$questionImage = $('<div class="questionImage"><img src="${contextPath}/resources/uploadFiles/' + questionList[i].image.changeName +'"></div>');
							$mediaExplain = $('<div class="mediaExplain">' + questionList[i].mediaExplain + '</div><input type="hidden" name="mediaExplain" value="' + questionList[i].mediaExplain + '">');
							$question.append($questionImage);
							$question.append($mediaExplain);
						}else {
							if(questionList[i].mediaExplain != null && questionList[i].mediaExplain != ""){
								var video = questionList[i].questionVideoLink.substr(questionList[i].questionVideoLink.lastIndexOf("/", questionList[i].questionVideoLink.length), 12);
								$questionVideo = $('<div class="questionVideo"><iframe style="width: 100%;" src="https://www.youtube.com/embed' + video + '" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></div>')
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
					$("#surveyQuiz2").find("#surveyQuizAccordion").html("");
					$("#researchNamePanel").val(DiscriminationDetail.researchName);
					var discrimQuizIndex = 1;
					for(var i = 0; i < DiscriminationDetail.questionList.length; i++){
						var $discrimQuizTitle = $('<div class="title"><i class="dropdown icon"></i>Q' + discrimQuizIndex++ + '.' + DiscriminationDetail.questionList[i].rquestionContext + '</div>');
						var $content = $('<div class="content"></div>');
						var $correctAnswer = $('<div style="float: right; width: fit-content;">정답 보기 번호 : ' + DiscriminationDetail.questionList[i].correctAnswer + ' 번</div>');
						
						$content.append($correctAnswer);
						var $p = $('<p class="transition hidden"></p>');
						var $choiceArea = $('<div class="choiceArea"></div>');
						for(var j = 0; j < DiscriminationDetail.questionList[i].requestChoiceList.length; j++){
							var $discrimQuizChoice = $('<div class="choice"><div class="ui input" style="width: 300px;"><input type="text" placeholder="보기 작성" class="choiceInput" readonly value="' + DiscriminationDetail.questionList[i].requestChoiceList[j].choiceContext + '"><input type="hidden" class="discriminationChoiceOrder" value="1"></div></div>');
							$choiceArea.append($discrimQuizChoice);
						}
						$p.append($choiceArea);
						$content.append($p);
						$("#surveyQuiz2").find("#surveyQuizAccordion").append($discrimQuizTitle);
						$("#surveyQuiz2").find("#surveyQuizAccordion").append($content);
					}
					
					$("#research").find("input[type=text]").each(function(){
						$(this).prop("readonly", true);
					});
					
					$("#surveyQuiz2").find("input[type=text]").each(function(){
						$(this).prop("readonly", true);
					});
					
					$('#corp').modal('show'); 
				},
				error:function(status){
					console.log(status);
				}
			});
		});
		
		$("#referBtn").on("click", function(){
			const start = async function() {
				const { value: text } = await Swal.fire({
					  input: 'textarea',
					  inputPlaceholder: '반려 사유를 적어주세요..',
					  inputAttributes: {
					    'aria-label': 'Type your message here'
					  },
					  showCancelButton: true,
					  inputValidator: (value) => {
					    if (!value) {
					      return '반려 사유를 꼭 적어주세요!'
					    }
					  }
				});
	
				if (text) {
					Swal.fire({
					  title: '정말 반려하시겠습니까?',
					  text: "이 결정은 되돌릴 수 없습니다!",
					  icon: 'warning',
					  showCancelButton: true,
					  confirmButtonColor: '#3085d6',
					  cancelButtonColor: '#d33',
					  confirmButtonText: 'Yes'
					}).then((result) => {
					  if (result.value) {
						  $.ajax({
								url:"reconstructureRefer.adminResearch",
								type:"post",
								data:{
									researchNoStr:researchNoStr,
									referReason : text
								},
								success:function(data){
									Swal.fire(
								      		'반려!',
								      		'이 협의는 반려되었습니다.',
								      		'success'
								    		)
								},
								error:function(status){
									console.log(status);
								}
							});
					  }else {
						  $('#research').modal('show');
					  }
					})
				}
			}
			start();
		});
		$(".topMenu:nth-child(2)").addClass("active");
		$(".topMenu:nth-child(2)").find(".innerMenu:nth-child(3)").addClass("on");
	</script>
</body>
</html>