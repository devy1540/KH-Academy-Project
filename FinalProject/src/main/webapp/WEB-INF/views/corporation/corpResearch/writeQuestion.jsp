<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="resources/images/favicon.ico" type="image/x-icon" />
<link rel="shortcut icon" href="resources/images/favicon.ico" type="image/x-icon">
<style>
	#requestMainArea {
		width: 100%;
		height: fit-content;
	}
	#requestHeader {
		width: 100%;
		border-bottom: 1px solid black;
		font-size: 20px;
		height: 50px;
		color: #A0A0A0;
		margin: 0 auto;
		
	}
	#requestHeaderTable {
	 width: fit-content;
	 text-align: center;
	 margin: 0 auto;
	 line-height: 42px;
	 margin-top: 15px;
	}
	#requestHeaderTable td {
		padding-left: 60px;
		padding-right: 60px;
	}
	.onMenu{
		color: black;
		border-bottom: 2px solid black;
	}
	button:hover{
		cursor: pointer;
	}
	#editingTools{
		float: left;
		width: 80%;
		height: 100%;
		background: #F1F1F1; 
		padding-top: 10px;
	}
	#editingTools div, #editingOption div{
		width: 100%;
		text-align: center;
	}
	#editingOption{
		float: right;
		width: 80%;
		height: 100%;
		background: #F1F1F1; 
		padding-top: 10px;
	}
	#editingMain{
		width: 100%;
		height: 100%;
		margin-top: 50px;
	}
	.editTable {
		width: 100%;
		height: 700px;
		margin: 70px auto;
		margin-top: 0;
	}
	#sortable { 
  		list-style-type: none; 
  		margin: 0; 
  		padding: 0; 
  		width: 90%;
  		margin: 0 auto; 
  		margin-bottom: 30px;
  	}
  	#sortable li { 

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
  		background: none !important;
  		border-color: white !important;
  	}
  	.choiceNameInput:focus {
  		border: 0 !important;
  	}
  	.plusBtn {
		margin: 0 0px 12px 0px;
  		text-align: center;
	    font-size: 0.5em;
	    border-radius: 7px;
	    border: 1px solid #c5c5c5;
	    line-height: 60px;
	    background: #f6f6f6;
		right: 5px;
		bottom: 2px;
	    position: absolute;
	    padding-left: 4px;
	    cursor: pointer;
  	}
  	.plusMain {
  		z-index: 2;
  		position: absolute;
  		margin: 0 5px 12px 0px;
  		padding: 10px;
  		padding-left: 0; 
  		font-size: 0.8em;
  		height: fit-content;
  		border-radius: 7px !important;
	    background: #f6f6f6;
	    border: 1px solid #c5c5c5;
    	background: #f6f6f6;
    	font-weight: normal;
    	color: #454545;
  	}
  	.ui-state-default {
  		min-height: 80px;
  		position: relative;
  		border: 0 !important;
    	background: none !important;
  	}
  	#quizHead {
  		width: 100%;
  		height: 70px;
  		background: rgba(57, 42, 76, 0.54);
  		text-align: left;
  		padding-left: 40px; 
  		padding-right: 20px;
  		line-height: 67px;
    	font-size: 14pt;
    	color: #ECECEC;
  	}
  	.quizTable {
  		width: 80%;
  		margin: 0 auto;
  		border-spacing: 0;
		border-collapse: collapse;
  	}
  	.quizTable th, .quizTable td {
  		border: 1px solid #9A9A9A;
  		height: 70px;
  	}
  	#mediaArea {
  		text-align: center;
  	}
  	.mediaAdd {
  		color: #900583;
  		text-decoration: underline;
  		font-weight: 600;
  		text-underline-position: under;
  		cursor: pointer;
  	}
  	#imageTable {
  		width: 90%;
  		margin: 0 auto;
  	}
  	#imageTable td {
  		height: 30px;
  		border: 0;
  	}
  	#imageArea {

  	}
  	#choiceArea {
  		width: 100%;
  		height:	300px;
  	}
  	.deleteQuiz {
  		cursor: pointer;
  	}
  	.choice {
  		width: 100%;
  		height: 100px;
  		background: #F4F4F4;
  		border-bottom: 1px solid #909090;
  		position: relative;
  		font-size: 12pt;
  		line-height: 85px;
  	}
  	#multipleChoiceArea {
  		width: 100%; 
  		height: 300px; 
  		overflow-y: auto;
  	}
  	#multipleImageChoiceArea {
  		width: 100%; 
  		height: 500px; 
  		overflow-y: auto;
  	}
  	#sumOfChoiceArea {
  		width: 100%; 
  		height: 300px; 
  		overflow-y: auto;
  	}
  	.choiceContext {
  		width: 80%;
  	}
  	.sumChoiceContext {
  		width: 60%;
  	}
  	.choiceNo {
  		width: 25px;
	    text-align: center;
	    height: 25px;
	    background: white;
	    border: 1px solid gray;
	    margin-left: 4%;
	    margin-right: 10px;
  	}
  	.choiceNo:focus {
  		outline: none;
  	}
  	#plusChoice, #plusImageChoice, #plusSumChoice {
  		margin-left: 5%; 
  		width: fit-content; 
  		cursor:pointer;
  	}
  	.deleteChoice {
  		cursor: pointer;
  	}
  	.choiceImage {
  		width: 100%;
  		background: #F4F4F4;
  		border-bottom: 1px solid #909090;
  		position: relative;
  		font-size: 12pt;
  		line-height: 40px;
  	}
	.sumChoice {
  		width: 100%;
  		background: #F4F4F4;
  		border-bottom: 1px solid #909090;
  		position: relative;
  		font-size: 12pt;
  		line-height: 75px;
  		height: 83.5px;
  	}
  	#sum {
  		text-align: center;
  		width: 100%;
  		background: white;
  		height: 50px;
  		border-bottom: 1px solid #909090;
  		line-height: 50px;
  	}
  	#sum div {
  		display: inline-block;
  	}
  	#questionArea {
  		display: none;
  	}
  	.hide {
  		display: none;
  	}
  	#questionOrder {
  		width: 12px;
  		background: none;
  		border: 0;
  		color: white;
  	}
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/corporation/common/corpMenuBar.jsp"/>
	<jsp:include page="/WEB-INF/views/corporation/common/corpMenuBar2.jsp"/>
	<c:if test="${ empty sessionScope.loginUser or sessionScope.loginUser.userType ne '기업' }">
		<c:set var="msg" value="기업회원만 접근 가능합니다." scope="request"/>
		<jsp:forward page="/WEB-INF/views/common/errorPage.jsp"/>
	</c:if>
	<div id="requestMainArea">
		<div id="requestHeader">
			<table id="requestHeaderTable">
				<tr>
					<td>
						<div>01. 기본정보</div>
					</td>
					<td>
						<div class="onMenu">02. 설문작성</div>
					</td>
				</tr>
			</table>
		</div>
		
		<table class="editTable">
			<tr>
				<td style="width: 20%">
					<div id="editingTools">
						<div style="font-size: 20px; font-weight: bold;">문항 편집 도구</div>
						<div style="margin-top: 10px; border-bottom: 1px solid #9C9C9C; padding-bottom: 5px;">전체 <span id="quizAmount"></span>문항</div>
						<div style="color: #666666; font-size: 11px; text-align: left; margin: 10px auto; width: fit-content;">
							※ 각 문항 사이 [+]버튼을 통해 문항 추가가 가능합니다.<br>
							※ 아래 문항을 Drag & Drop하여 문항 순서를 <br>
							  이동할 수 있습니다.
						</div>
						<div style="width: 100%; overflow: auto; height: 500px;">
							<ul id="sortable">
								<li class="ui-state-default">
									<input type="hidden" class="nodeData" value="1">
									<div class="plusBtn" style=" width: 30px; height: 40px;"><i class="plus icon"></i></div>
									<div class="plusMain">
										<div class="ui input" style="width: 85%;">
											<input type="text" readonly class="choiceNameInput" name="questionNo" style="background: none; border: 0; width: 45px;" value="Q1">
											<input type="text" class="choiceHead" readonly style="width: 80%; background: none; cursor: pointer; border: 0;">
											
										</div>
										<div style="width: fit-content; float: right;" class="deleteQuiz">
											<i class="large times icon"></i>
										</div>
									</div>
								</li>
							</ul>
						</div>
						<!-- <div style="width: 100%; background: #DEDEDE; border-top: 1px solid #9C9C9C; height: 53px; padding: 15px 10px;">
						</div> -->
					</div>
				</td>
				<td style="width: 60%">
					<form action="insertResearch.corpResearch" id="submitQuiz" method="post" style="height: 100%;" enctype="multipart/form-data">
						<input type="hidden" value="${ research.researchNo }" name="researchNo">
						<input type="hidden" value="${ research.researchName }" name="researchName">
						<input type="hidden" value="${ research.researchEngagementGoals }" name="researchEngagementGoals">
						<input type="hidden" value="${ research.researchPeriod }" name="researchPeriod">
						<input type="hidden" value="${ research.mno }" name="mno">
						<input type="hidden" value="${ research.researchPerpose }" name="researchPerpose">
						<input type="hidden" value="${ research.targetNo }" name="targetNo">
						<input type="hidden" value="${ research.targetGender }" name="targetGender">
						<input type="hidden" value="${ research.targetAgeRange }" name="targetAgeRange">
						<input type="hidden" value="${ research.targetLocation }" name="targetLocation">
						<input type="hidden" value="${ research.occupationNo }" name="occupationNo">
						<input type="hidden" value="${ research.additionaltEtc }" name="additionaltEtc">
						<div id="editingMain">
							<table class="quizTable">
								<tr>
									<th id="quizHead" colspan="3">
										<div>
											<span id="quizNum">Q<input type="text" id="questionOrder" name="questionOrder" value="1"></span>.
											<input type="hidden" class="nodeData" value="1">
											<div class="ui input" style="width: 85%;">
												<input type="text" name="rquestionContext" name="rquestionContext" class="quizTitle" style="background: none; border: 0; border-bottom: 1px solid gray; border-radius: 0;" placeholder="질문 제목">
											</div>
											<input type="hidden" id="questionFormNo" name="questionFormNo">
											<span style="float: right; font-size: 20pt;">
												<i class="times icon"></i>
											</span>
										</div>
									</th>
								</tr>
								<tr>
									<td colspan="3">
										<input type="hidden" name="mediaExist" id="mediaExist" value="false">
										<div id="mediaArea">
											설명 : 질문에 대한 설명 또는 이미지, 동영상이 필요한 경우 <span class="mediaAdd">여기를 클릭</span>해 주세요.
											
										</div>
									</td>
								</tr>
								<tr>
									<td colspan="3" style="padding: 0;">
										<div id="choiceArea">
											<div style="width: fit-content; margin: 0 auto;"><i class="plus icon" style="color: #BD45B1; margin-top: 150px;"></i>우측 옵션패널에서 문항형식을 선택해주세요.</div>
											
										</div>
									</td>
								</tr>
								<tr>
									<td style="border: 0; width: 40%"><hr></td>
									<td style="border: 0; width: 20%"><div class="plusBtn2" style="margin: 0 auto; cursor:pointer; width: fit-content; font-size: 16pt;"><span style="color: #BD45B1"><i class="plus circle icon"></i></span>문항 추가</div></td>
									<td style="border: 0; width: 40%"><hr></td>
								</tr>
								<tr>
									<td colspan="3" style="border: 0;">
										<div style="float: right; width: 90px; height:40px; cursor: pointer; background: #600050; color: white; text-align: center; line-height: 37px;" class="submit">완 료</div>
									</td>
								</tr>
							</table>
						</div>
					</form>
				</td>
				<td style="width: 20%">
					<div id="editingOption">
						<div style="font-size: 20px; font-weight: bold;">문항 옵션 선택</div>
						<div style="margin-top: 10px; border-bottom: 1px solid #9C9C9C; padding-bottom: 5px;">문항 형식</div>
						
						<div class="ui vertical buttons">
							<button type="button" class="ui button" id="multipleChoice">객관식</button>
							<button type="button" class="ui button" id="multiplyChoice">객관식(다중선택)</button>
							<button type="button" class="ui button" id="shortAnswer">주관식</button>
							<button type="button" class="ui button" id="multipleImageChoice">객관식 & 이미지</button>
							<button type="button" class="ui button" id="likertScale">리커트 척도</button>
							<button type="button" class="ui button" id="sumOfChoice">숫자 합계형</button>
						</div>
					</div>
				</td>
			</tr>
		</table>
	</div>
	<div style="">
		<jsp:include page="/WEB-INF/views/panel/common/footer.jsp"/>
	</div>
	<script>
		nodeIndex = 2; // node의 시작 default 테이블이 1
		
		$(document).on("click", ".submit", function(){
			$("#submitQuiz").submit();
		})
		/* 문항 선택 */
		$(document).on("click", "#multipleChoice", function(){
			$(".quizTable:not(.hide)").find("#questionFormNo").val(1);
			var $choiceArea = $('<div id="multipleChoiceArea"> <div class="choice"> <div style="width: 100%; height: fit-content;"><i class="large times icon deleteChoice" style="float: right; margin: 2px;"></i></div> <input type="text" readonly value="1" name="choiceNo" class="choiceNo"><input type="text" class="choiceContext" name="choiceContext" style="background: none; border: 0; border-bottom: 1px solid gray; border-radius: 0;" placeholder="보기 내용"> </div> <div class="choice"> <div style="width: 100%; height: fit-content;"><i class="large times icon deleteChoice" style="float: right; margin: 2px;"></i></div> <input type="text" readonly value="2" name="choiceNo" class="choiceNo"><input type="text" class="choiceContext" name="choiceContext" style="background: none; border: 0; border-bottom: 1px solid gray; border-radius: 0;" placeholder="보기 내용"> </div> <div class="choice"> <div id="plusChoice" style=""><i class="plus icon"></i> 보기추가</div> </div> </div>');
			$(".quizTable:not(.hide)").find("#choiceArea").css("height", "300px");
			$(".quizTable:not(.hide)").find("#choiceArea").html($choiceArea);
		});
		$(document).on("click", "#multiplyChoice", function(){
			$(".quizTable:not(.hide)").find("#questionFormNo").val(6);
			var $choiceArea = $('<div id="multipleChoiceArea"> <div class="choice"> <div style="width: 100%; height: fit-content;"><i class="large times icon deleteChoice" style="float: right; margin: 2px;"></i></div> <input type="text" readonly value="1" name="choiceNo" class="choiceNo"><input type="text" class="choiceContext" name="choiceContext" style="background: none; border: 0; border-bottom: 1px solid gray; border-radius: 0;" placeholder="보기 내용"> </div> <div class="choice"> <div style="width: 100%; height: fit-content;"><i class="large times icon deleteChoice" style="float: right; margin: 2px;"></i></div> <input type="text" readonly value="2" name="choiceNo" class="choiceNo"><input type="text" class="choiceContext" name="choiceContext" style="background: none; border: 0; border-bottom: 1px solid gray; border-radius: 0;" placeholder="보기 내용"> </div> <div class="choice"> <div id="plusChoice" style=""><i class="plus icon"></i> 보기추가</div> </div> </div>');
			$(".quizTable:not(.hide)").find("#choiceArea").css("height", "300px");
			$(".quizTable:not(.hide)").find("#choiceArea").html($choiceArea);
		});
		$(document).on("click", "#shortAnswer", function(){
			$(".quizTable:not(.hide)").find("#questionFormNo").val(2);
			$(".quizTable:not(.hide)").find("#choiceArea").css("height", "0px");
			$(".quizTable:not(.hide)").find("#choiceArea").html("");
		});
		$(document).on("click", "#multipleImageChoice", function(){
			$(".quizTable:not(.hide)").find("#questionFormNo").val(3);
			var $choiceArea = $('<div id="multipleImageChoiceArea"> <div class="choice" style="height: 200px;; line-height: 40px;"> <div style="width: 100%; height: fit-content;"><i class="large times icon deleteChoice" style="float: right; margin: 2px;"></i></div> <input type="text" readonly value="1" name="choiceNo" style="margin-top: 35px;" class="choiceNo"> <input type="text" class="choiceContext" name="choiceContext" style="background: none; border: 0; border-bottom: 1px solid gray; border-radius: 0;" placeholder="보기 내용"> <div style="width: 65%; display: inline-block;"> <input type="file" id="imageChoiceUpload" name="imageChoiceUpload" style="margin-left: 5%;" value="파일 선택"> <div style="font-size: 10pt; text-align: left; margin-left: 20%;"> 이미지 사이즈 : <span style="color: #7A0075;">700px X 100 ~ 600px, 1MB</span>이하<br> 미풍양속을 해치는 이미지를 쓸 경우 큰 불이익을 당할 수 있습니다. </div> </div> <div style="width: 25%; height: 110px; margin-bottom: 20px; display: inline-block;" id="imageArea"><img src="resources/images/imageBackground.png" class="image" style="width: 100%; height:110px;"></div> </div> <div class="choice" style="height: 200px; line-height: 40px;"> <div style="width: 100%; height: fit-content;"><i class="large times icon deleteChoice" style="float: right; margin: 2px;"></i></div> <input type="text" readonly value="2" name="choiceNo" style="margin-top: 35px;" class="choiceNo"> <input type="text" class="choiceContext" name="choiceContext" style="background: none; border: 0; border-bottom: 1px solid gray; border-radius: 0;" placeholder="보기 내용"> <div style="width: 65%; display: inline-block;"> <input type="file" id="imageChoiceUpload" name="imageChoiceUpload" style="margin-left: 5%;" value="파일 선택"> <div style="font-size: 10pt; text-align: left; margin-left: 20%;"> 이미지 사이즈 : <span style="color: #7A0075;">700px X 100 ~ 600px, 1MB</span>이하<br> 미풍양속을 해치는 이미지를 쓸 경우 큰 불이익을 당할 수 있습니다. </div> </div> <div style="width: 25%; height: 110px; margin-bottom: 20px; display: inline-block;" id="imageArea"><img src="resources/images/imageBackground.png" class="image" style="width: 100%; height:110px;"></div> </div> <div class="choice"> <div id="plusImageChoice"><i class="plus icon"></i> 보기추가</div> </div> </div>');
			$(".quizTable:not(.hide)").find("#choiceArea").css("height", "500px");
			$(".quizTable:not(.hide)").find("#choiceArea").html($choiceArea);
		});
		$(document).on("click", "#likertScale", function(){
			$(".quizTable:not(.hide)").find("#questionFormNo").val(4);
			$(".quizTable:not(.hide)").find("#choiceArea").css("height", "0px");
			$(".quizTable:not(.hide)").find("#choiceArea").html("<div style='margin: 0 auto; width: fit-content;  line-height: 0px;'>리커트 척도는 매우 부정부터 매우 긍정까지 5가지로 구성되어있습니다.</div>");
		});
		$(document).on("click", "#sumOfChoice", function(){
			$(".quizTable:not(.hide)").find("#questionFormNo").val(5);
			$(".quizTable:not(.hide)").find("#choiceArea").css("height", "300px");
			$(".quizTable:not(.hide)").find("#choiceArea").html('<div id="sumOfChoiceArea"> <div id="sumChoiceArea"> <div class="sumChoice"> <div style="width: 100%; height: fit-content;"><i class="large times icon deleteChoice" style="float: right; margin: 2px;"></i></div> <input type="text" readonly value="1" name="choiceNo" class="choiceNo"> <input type="text" class="sumChoiceContext" name="choiceContext" style="background: none; border: 0; border-bottom: 1px solid gray; border-radius: 0;" placeholder="보기 내용"> <div style="width: 100px; height: 30px; display: inline-block; margin-left: 50px; background: white; vertical-align: middle; border: 1px solid #E7E7E7"></div> </div> <div class="sumChoice"> <div style="width: 100%; height: fit-content;"><i class="large times icon deleteChoice" style="float: right; margin: 2px;"></i></div> <input type="text" readonly value="2" name="choiceNo" class="choiceNo"> <input type="text" class="sumChoiceContext" name="choiceContext" style="background: none; border: 0; border-bottom: 1px solid gray; border-radius: 0;" placeholder="보기 내용"> <div style="width: 100px; height: 30px; display: inline-block; margin-left: 50px; background: white; vertical-align: middle; border: 1px solid #E7E7E7"></div> </div> </div> <div id="sum"> <div style="width: 59%">합계</div> <div style="width: 40%">100</div> </div> <div class="sumChoice"> <div id="plusSumChoice"><i class="plus icon"></i> 보기추가</div> </div> </div>');
		});
		/*---------*/
		
		$(document).on("keyup", ".quizTitle", function(){
			var num = "Q" + $(this).parent().parent().find("#questionOrder").val();
			var title = $(this).val();
			$("#editingTools").find(".choiceNameInput").each(function(){
				if($(this).val() == num){
					$(this).parent().find(".choiceHead").val(title);
				}
			});
		});
		
		$(function(){
			orderQuizAmount();
		});
		
		$(document).on("click", ".deleteQuiz", function(){
			if($(".deleteQuiz").length == 1){
				Swal.fire({
					icon: 'error',
					title: 'Oops...',
					text: '문항은 최소 1개 이상이어야 합니다.',
				})
			}else {
				var nodeData = $(this).parent().parent().find(".nodeData").val();
				
				$(this).parent().parent().remove();
				
				$("#editingMain").find(".nodeData").each(function(){
					console.log("val : " + $(this).val());
					console.log("nodeData : " + nodeData);
					if($(this).val() == nodeData){
						$(this).parent().parent().parent().parent().remove();
					}
				});
				index--;
			}
			orderQuizAmount();
			quizIndex();
			connectedNodes();
		});
		
		$(document).on("click", ".deleteChoice", function(){
			if($(".quizTable:not(.hide)").find(".deleteChoice").length == 2){
				Swal.fire({
					icon: 'error',
					title: 'Oops...',
					text: '보기는 최소 2개 이상이어야 합니다.',
				})
			}else {
				$(this).parent().parent().remove();
				index--;
			}
			choiceIndex();
		});
		
		$(document).on("click", "#plusChoice", function(){
			if($(".quizTable:not(.hide)").find(".deleteChoice").length == 10){
				Swal.fire({
					icon: 'error',
					title: 'Oops...',
					text: '보기는 최대 10개까지 가능합니다.',
				})
			}else {
				$(this).parent().remove();
				var $choice = $('<div class="choice"> <div style="width: 100%; height: fit-content;"><i class="large times icon deleteChoice" style="float: right; margin: 2px;"></i></div> <input type="text" readonly value="2" name="choiceNo" class="choiceNo"><input type="text" class="choiceContext" name="choiceContext" style="background: none; border: 0; border-bottom: 1px solid gray; border-radius: 0;" placeholder="보기 내용"> </div> <div class="choice"> <div id="plusChoice" style=""><i class="plus icon"></i> 보기추가</div> </div>');
				$(".quizTable:not(.hide)").find("#multipleChoiceArea").append($choice);
				choiceIndex();
			}
		});
		
		$(document).on("click", "#plusImageChoice", function(){
			if($(".quizTable:not(.hide)").find(".deleteChoice").length == 10){
				Swal.fire({
					icon: 'error',
					title: 'Oops...',
					text: '보기는 최대 10개까지 가능합니다.',
				})
			}else {
				$(this).parent().remove();
				var $choice = $('<div class="choice" style="height: 200px;; line-height: 40px;"> <div style="width: 100%; height: fit-content;"><i class="large times icon deleteChoice" style="float: right; margin: 2px;"></i></div> <input type="text" readonly value="1" name="choiceNo" style="margin-top: 35px;" class="choiceNo"> <input type="text" class="choiceContext" name="choiceContext" style="background: none; border: 0; border-bottom: 1px solid gray; border-radius: 0;" placeholder="보기 내용"> <div style="width: 65%; display: inline-block;"> <input type="file" id="imageChoiceUpload" name="imageChoiceUpload" style="margin-left: 5%;" value="파일 선택"> <div style="font-size: 10pt; text-align: left; margin-left: 20%;"> 이미지 사이즈 : <span style="color: #7A0075;">700px X 100 ~ 600px, 1MB</span>이하<br> 미풍양속을 해치는 이미지를 쓸 경우 큰 불이익을 당할 수 있습니다. </div> </div> <div style="width: 25%; height: 110px; margin-bottom: 20px; display: inline-block;" id="imageArea"><img src="resources/images/imageBackground.png" class="image" style="width: 100%; height:110px;"></div> </div> <div class="choice"> <div id="plusImageChoice"><i class="plus icon"></i> 보기추가</div> </div>');
				$(".quizTable:not(.hide)").find("#multipleImageChoiceArea").append($choice);
				choiceIndex();
			}
		});
		$(document).on("click", "#plusSumChoice", function(){
			if($(".quizTable:not(.hide)").find(".deleteChoice").length == 10){
				Swal.fire({
					icon: 'error',
					title: 'Oops...',
					text: '보기는 최대 10개까지 가능합니다.',
				})
			}else {
				var $choice = $('<div class="sumChoice"> <div style="width: 100%; height: fit-content;"><i class="large times icon deleteChoice" style="float: right; margin: 2px;"></i></div> <input type="text" readonly value="1" name="choiceNo" class="choiceNo"> <input type="text" class="sumChoiceContext" name="choiceContext" style="background: none; border: 0; border-bottom: 1px solid gray; border-radius: 0;" placeholder="보기 내용"> <div style="width: 100px; height: 30px; display: inline-block; margin-left: 50px; background: white; vertical-align: middle; border: 1px solid #E7E7E7"></div> </div>');
				$(".quizTable:not(.hide)").find("#sumChoiceArea").append($choice);
				choiceIndex();
			}
		});
		
		$("#researchMenu td div").eq(1).addClass("on");
		$(".ui.dropdown").dropdown();
		
		var index = 2;
		
		$('#standard_calendar').calendar();
		$('#standard_calendar2').calendar();
		
		function plusQuiz() {
			var isEmpty = false;
			$(".quizTable:not(.hide)").find("input[type=text]").each(function(){
				if($(this).val() == ""){
					isEmpty = true;
				}
			})
			if($(".quizTable:not(.hide)").find("#questionFormNo").val() == ""){
				Swal.fire({
					icon: 'error',
					title: 'Oops...',
					text: '질문 문항을 선택해 주세요.',
				})
			}else if(isEmpty == true){
				console.log($(".quizTable").find("input[type=text]"));
				Swal.fire({
					icon: 'error',
					title: 'Oops...',
					text: '질문 내용을 작성해 주세요.',
				})
			}else {

				var num = $(".ui-state-default").length + 1;
				allQuizHide();
				$("#editingMain").append('<table class="quizTable"> <tr> <th id="quizHead" colspan="3"> <div> <span id="quizNum">Q<input type="text" id="questionOrder" name="questionOrder" value="' + num + '"></span>. <input type="hidden" class="nodeData" value="' + (nodeIndex++) + '"> <div class="ui input" style="width: 85%;"> <input type="text" name="rquestionContext" class="quizTitle" style="background: none; border: 0; border-bottom: 1px solid gray; border-radius: 0;" placeholder="질문 제목"> </div> <input type="hidden" id="questionFormNo" name="questionFormNo"> <span style="float: right; font-size: 20pt;"> <i class="times icon"></i> </span> </div> </th> </tr> <tr> <td colspan="3"> <input type="hidden" name="mediaExist" id="mediaExist" value="false"> <div id="mediaArea"> 설명 : 질문에 대한 설명 또는 이미지, 동영상이 필요한 경우 <span class="mediaAdd">여기를 클릭</span>해 주세요. </div> </td> </tr> <tr> <td colspan="3" style="padding: 0;"> <div id="choiceArea"> <div style="width: fit-content; margin: 0 auto;"><i class="plus icon" style="color: #BD45B1; margin-top: 150px;"></i>우측 옵션패널에서 문항형식을 선택해주세요.</div> </div> </td> </tr> <tr> <td style="border: 0; width: 40%"><hr></td> <td style="border: 0; width: 20%"><div class="plusBtn2" style="margin: 0 auto; cursor:pointer; width: fit-content; font-size: 16pt;"><span style="color: #BD45B1"><i class="plus circle icon"></i></span>문항 추가</div></td> <td style="border: 0; width: 40%"><hr></td> </tr> <tr> <td colspan="3" style="border: 0;"> <div style="float: right; width: 90px; height:40px; cursor: pointer; background: #600050; color: white; text-align: center; line-height: 37px;" class="submit">완 료</div> </td> </tr> </table>');
				var $quiz = $('<li class="ui-state-default"> <input type="hidden" class="nodeData" value="' + num + '"> <div class="plusBtn" style=" width: 30px; height: 40px;"><i class="plus icon"></i></div> <div class="plusMain"> <div class="ui input" style="width: 85%;"> <input type="text" readonly class="choiceNameInput" name="questionNo" style="background: none; border: 0; width: 45px;" value="Q' + num + '"> <input type="text" class="choiceHead" readonly style="width: 80%; background: none; cursor: pointer; border: 0;"> </div> <div style="width: fit-content; float: right;" class="deleteQuiz"> <i class="large times icon"></i> </div> </div> </li>');
				$("#sortable").append($quiz);
				orderQuizAmount();
				quizIndex();
			}
		}

		$(document).on("click", ".plusBtn", function(){
			plusQuiz();
		});
		$(document).on("click", ".plusBtn2", function(){
			plusQuiz();
		});
		$(document).on("click", ".choiceHead", function() {
			allQuizHide();
			var nodeData = $(this).parent().parent().parent().find(".nodeData").val();
			console.log(nodeData)
			$(".hide").each(function(){
				if($(this).find(".nodeData").val() == nodeData){
					$(this).removeClass("hide");
				}
			});
			orderQuizAmount();
			quizIndex();
		});
		$(document).on("click", ".mediaAdd", function(){
			var $image = $('<table style="width: 90%; border: 0;" id="imageTable"> <tr> <td colspan="2"> <div style="float: right;"> <button class="imageBtn"><i class="images outline icon"></i></button> <button class="videoBtn"><i class="video icon"></i></button> </div> </td> </tr> <tr> <td colspan="2"> <textarea name="mediaExplain" style="width: 100%; height: 60px; resize: none; border-radius: 5px; padding: 7px;" placeholder="설명 글을 입력해주세요"></textarea> </td> </tr> <tr> <td style="text-align: left; width: 70%; vertical-align: top; padding-top: 20px;"> <input type="file" id="imageUpload" name="uploadImage" value="파일 선택"> <div style="font-size: 10pt; text-align: left; margin-left: 14%;"> 이미지 사이즈 : <span style="color: #7A0075;">700px X 100 ~ 600px, 1MB</span>이하<br> 미풍양속을 해치는 이미지를 쓸 경우 큰 불이익을 당할 수 있습니다. </div> </td> <td style="width: 30%;"> <div style="width: 100%; height: 110px; margin-bottom: 20px;" id="imageArea"><img src="resources/images/imageBackground.png" id="image" style="width: 100%; height:110px;"></div> </td> </tr> </table>');
			$(".quizTable:not(.hide)").find("#mediaArea").html($image);
			$(".quizTable:not(.hide)").find("#mediaExist").val("image");
		});
		$(document).on("click", ".imageBtn", function(){
			var $image = $('<table style="width: 90%; border: 0;" id="imageTable"> <tr> <td colspan="2"> <div style="float: right;"> <button class="imageBtn"><i class="images outline icon"></i></button> <button class="videoBtn"><i class="video icon"></i></button> </div> </td> </tr> <tr> <td colspan="2"> <textarea name="mediaExplain" style="width: 100%; height: 60px; resize: none; border-radius: 5px; padding: 7px;" placeholder="설명 글을 입력해주세요"></textarea> </td> </tr> <tr> <td style="text-align: left; width: 70%; vertical-align: top; padding-top: 20px;"> <input type="file" id="imageUpload" name="uploadImage" value="파일 선택"> <div style="font-size: 10pt; text-align: left; margin-left: 14%;"> 이미지 사이즈 : <span style="color: #7A0075;">700px X 100 ~ 600px, 1MB</span>이하<br> 미풍양속을 해치는 이미지를 쓸 경우 큰 불이익을 당할 수 있습니다. </div> </td> <td style="width: 30%;"> <div style="width: 100%; height: 110px; margin-bottom: 20px;" id="imageArea"><img src="resources/images/imageBackground.png" id="image" style="width: 100%; height:110px;"></div> </td> </tr> </table>');
			$(".quizTable:not(.hide)").find("#mediaArea").html($image);
			$(".quizTable:not(.hide)").find("#mediaExist").val("image");
		});
		$(document).on("click", ".videoBtn", function(){
			var $video = $('<table style="width: 90%; border: 0;" id="imageTable"> <tr> <td> <div style="float: right;"> <button class="imageBtn"><i class="images outline icon"></i></button> <button class="videoBtn"><i class="video icon"></i></button> </div> </td> </tr> <tr> <td> <textarea name="mediaExplain" style="width: 100%; height: 60px; resize: none; border-radius: 5px; padding: 7px;" placeholder="설명 글을 입력해주세요"></textarea> </td> </tr> <tr> <td style="text-align: left; width: 70%; vertical-align: top; padding-top: 20px; padding-bottom: 20px;"> <div class="ui labeled input"> <div class="ui label"> https:// </div> <input type="text" name="questionVideoLink" placeholder="youtu.be/..."> </div><span style="font-size: 9pt; margin-left: 30px;">미풍양속을 해치는 동영상을 쓸 경우 큰 불이익을 당할 수 있습니다.</span></td> </tr> </table>');
			$(".quizTable:not(.hide)").find("#mediaArea").html($video);
			$(".quizTable:not(.hide)").find("#mediaExist").val("video");
		});
		
		$(document).on("change", "#imageUpload", handleImgFileSelect);
		$(document).on("change", "#imageChoiceUpload", function(e){
			var files = e.target.files;
            var filesArr = Array.prototype.slice.call(files);
			var image = $(this).parent().parent().find(".image");
            filesArr.forEach(function (f) {
                if (!f.type.match("image.*")) {
                    alert("이미지 확장자 파일만 등록 가능합니다.");
                    return;
                }
                selFile = f;

                var reader = new FileReader();
                reader.onload = function (e) {
                	image.attr("src", e.target.result);
                }
                reader.readAsDataURL(f);
            });
		});
		function handleImgFileSelect(e) {
            var files = e.target.files;
            var filesArr = Array.prototype.slice.call(files);

            filesArr.forEach(function (f) {
                if (!f.type.match("image.*")) {
                    alert("이미지 확장자 파일만 등록 가능합니다.");
                    return;
                }
                selFile = f;

                var reader = new FileReader();
                reader.onload = function (e) {
                	$(".quizTable:not(.hide)").find("#image").attr("src", e.target.result);
                }
                reader.readAsDataURL(f);
            });
        }

		function orderQuizAmount() {
			var num = $(".ui-state-default").length;
			$("#quizAmount").text(num);
		} 
		function quizIndex() {
			var index = 1;
			$(".ui-state-default").each(function(){
				$(this).find(".choiceNameInput").val('Q' + index++);
			});
		}
		function choiceIndex(){
			var index = 1;
			$(".quizTable:not(.hide)").find(".choice").each(function(){
				$(this).find(".choiceNo").val(index++);
			})
			var index2 = 1;
			$(".quizTable:not(.hide)").find(".sumChoice").each(function(){
				$(this).find(".choiceNo").val(index2++);
			})
		}
		function allQuizHide(){
			$("#editingMain").find(".quizTable").each(function(){
				$(this).addClass("hide");
			})
		}
		
		function connectedNodes() {
			$("#sortable").find(".nodeData").each(function(){
				var sortableNode = $(this).val();
				var quizNum = $(this).parent().find(".choiceNameInput").val().substr(1, 1);
				
				console.log("soratableNode : " + sortableNode);
				console.log("quizNum : " + quizNum);
				$("#editingMain").find(".nodeData").each(function(){
					if(sortableNode == $(this).val()){
						$(this).parent().find("#questionOrder").val(quizNum);
					}
				})
			})
			
		}
	</script>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
		$(function() {
		 	$( "#sortable" ).sortable({
		 		cursor: "move",
		 		placeholder: "ui-state-highlight",
		 		
		 		/* start: function(event,ui){ 
	 		      	//get ID form draggable item 
	 		      	ui.item.data('start_pos', ui.item.index());
	 		    }, 
	 		   */ 
	 		   stop: function(event,ui){ 
	 		    	/* before = "Q" + (ui.item.data('start_pos') + 1);
	 		    	after = "Q" + (ui.item.index() + 1);
	 		    	value = ui.item[0].childNodes[1].value; 
	 		    	console.log(ui.item[0].childNodes[1].value);
	 		      	console.log("before : " + before)
	 		      	console.log("after : " + after);
	 		      	
	 		      	$(".quizTable").each(function(){
	 		      		if($(this).find(".nodeData").val() == value) {
	 		      			var num = after.substr(1, 1);
	 		      			console.log("afternum : " + num)
	 		      			$(this).find("#quizNum").html('Q<span id="questionOrder">' + num + '</span>')
	 		      			
	 		      		}else if($(this).find("#quizNum").text() == after) {
	 		      			var num = before.substr(1, 1);
	 		      			console.log("beforenum : " + num)
	 		      			$(this).find("#quizNum").html('Q<span id="questionOrder">' + num + '</span>')
	 		      			
	 		      		}
	 		      	}); */
	 		      	
	 			  	connectedNodes();
	 		    },
		 		update: function( event, ui ) {
		 			
		 			$(this).find(".choiceNameInput").each(function(index){
		 				$(this).val('Q' + (index + 1));
		 			});
		 		}
		 	});
		 	$( "#sortable" ).disableSelection();
		 });
  </script>
</body>
</html>