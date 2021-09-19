<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
		font-size: 10pt;
	}
	#pagingArea span:hover {
		margin-left: 5px;
		margin-right: 5px;
		font-size: 10pt;
		cursor: pointer;
	}
	.detail {
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
  	#choice, .choice {
  		margin-left: 20%;
  		margin-top: 20px;
  		width: fit-content;
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
	.mediaExplain {
		width: 50%;
		text-align: left;
		margin: 0 auto;
		margin-top: 10px;
	}
	.questionVideo {
		margin-bottom: 65px;
	}
	input[type=text]:focus{
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
						<button onclick="location.href='researchApprovalWaitList.adminResearch'" id="clickBtn">미처리 목록</button>
						<button onclick="location.href='researchReferList.adminResearch'">반려 목록</button>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div id="adminTitle">
						리서치 승인 대기 목록
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
				<th style="width: 40%;">리서치 제목</th>
				<th style="width: 20%;">신청일</th>
				<th style="width: 10%;">상세보기</th>
			</tr>
			<c:forEach var="r" items="${ researchApprovalWaitList }">
				<tr class="tableContext">
					<td>${ r.researchNo }</td>
					<td>${ r.companyName }</td>
					<td>${ r.researchName }</td>
					<td><fmt:formatDate value="${ r.lastDate }"/> </td>
					<td><button class="detail">상세 보기</button></td>
				</tr>
			</c:forEach>
		</table>
		<div id="pagingArea" align="center">
			<c:url var="researchFirst" value="researchApprovalWaitList.adminResearch">
				<c:param name="currentPage" value="${1}"/>
			</c:url>
			<a href="${researchFirst}"><span>[처음]</span></a>&nbsp;
			
			<c:if test="${pi.currentPage <= 1}">
				<span>[이전]</span> &nbsp;
			</c:if>
			<c:if test="${pi.currentPage > 1}">
				<c:url var="researchBack" value="researchApprovalWaitList.adminResearch">
					<c:param name="currentPage" value="${pi.currentPage - 1}"/>
				</c:url>
				<a href="${researchBack}"><span>[이전]</span></a>&nbsp;
			</c:if>
			
			<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
				<c:if test="${p eq pi.currentPage }">
					<span style="color: #4169E1; font-weight: bold; font-size: 15pt;">${ p }</span>
				</c:if>
				<c:if test="${p ne pi.currentPage }">
					<c:url var="researchCheck" value="researchApprovalWaitList.adminResearch">
						<c:param name="currentPage" value="${ p }"/>
					</c:url>
					<a href="${ researchCheck }"><span>${ p }</span></a>
				</c:if>
				
			</c:forEach>
			
			<c:if test="${pi.currentPage < pi.maxPage}">
				<c:url var="researchNext" value="researchApprovalWaitList.adminResearch">
					<c:param name="currentPage" value="${pi.currentPage + 1}"/>
				</c:url>
				&nbsp;<a href="${researchNext}"><span>[다음]</span></a>
			</c:if>
			<c:if test="${pi.currentPage >= pi.maxPage}">
				&nbsp; <span>[다음]</span>
			</c:if>
			
			<c:url var="researchEnd" value="researchApprovalWaitList.adminResearch">
				<c:param name="currentPage" value="${pi.maxPage}"/>
			</c:url>
			<a href="${researchEnd}"><span>[마지막]</span></a>&nbsp;
		</div>
	</div>
		
	<div class="ui modal" id="research">
		<div class="header">리서치 제목</div>
		<div class="scrolling content">
			<div>
				<ul id="sortable">
				</ul>
			</div>
		</div>
		<div class="actions">
		    <div class="ui approve button" id="approvalBtn">Approve</div>
		    <div class="ui approve button" id="referBtn">Refer</div>
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
						<td></td>
					</tr>
					<tr>
						<th>목적</th>
						<td></td>
					</tr>
					<tr>
						<th>목표 인원</th>
						<td></td>
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
	<script>
		$("#nextBtn").on("click", function(){
			$('#research').modal('show');
		});
		$(document).on("click", ".detail", function(){
			researchNoStr = $(this).parent().siblings().eq(0).text();
			var companyName = $(this).parent().siblings().eq(1).text();
			$.ajax({
				url:"researchApprovalDetail.adminResearch",
				type:"post",
				data:{researchNoStr:researchNoStr},
				success:function(data){
					console.log(data.researchDetail[0]);
					$("#sortable").text("");
					var researchDetail = data.researchDetail[0];
					var gender = "";
					var location = "";
					
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
						var $question = $('<li class="ui-state-default">Q' + questionList[i].questionOrder + '. ' + questionList[i].rquestionContext + '</li>');
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
						var $questionFormDiv = $('<div class="questionForm"> ' + questionForm + '</div>');
						$question.append($questionFormDiv);
						console.log(questionList)
						if(questionList[i].image != null && questionList[i].image != ""){
							$questionImage = $('<div class="questionImage"><img style="width: 100%" src="${contextPath}/resources/uploadFiles/' + questionList[i].image.changeName +'"></div>');
							$mediaExplain = $('<div class="mediaExplain">' + questionList[i].mediaExplain + '</div>');
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
			
			
			//console.log(num);
		});
		$("#approvalBtn").on("click", function(){
			Swal.fire({
			  title: '정말 승인하시겠습니까?',
			  text: "이 결정은 되돌릴 수 없습니다!",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: 'Yes'
			}).then((result) => {
			  if (result.value) {
				$.ajax({
					url:"researchApproved.adminResearch",
					type:"post",
					data:{
						researchNoStr:researchNoStr,
						engagementGoalsStr:engagementGoals,
						qCountStr:qCount
						},
					success:function(data){
						Swal.fire(
					      '승인!',
					      '이 리서치는 승인되었습니다.',
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
			    
			  }else {
				  $('#research').modal('show');
			  }
			})
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
								url:"researchRefer.adminResearch",
								type:"post",
								data:{
									researchNoStr:researchNoStr,
									referReason : text
								},
								success:function(data){
									Swal.fire(
								      		'반려!',
								      		'이 리서치는 반려되었습니다.',
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
		$(".topMenu:nth-child(2)").find(".innerMenu:nth-child(1)").addClass("on");
	</script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  	<script>
  		/* $(function() {
		 	$( "#sortable" ).sortable({
		 		placeholder: "ui-state-highlight"
		 	});
		 	$( "#sortable" ).disableSelection();
		 }); */
  	</script>
</body>
</html>