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
		height: 800px;
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
	#requestTable {
		width: 50%;
		margin: 10px auto;
		font-size: 18px;
		font-weight: bold;
		text-align: left;
		border-spacing: 0;
		border-collapse: collapse;
	}
	#requestTable td {
		font-size: 12px;
		font-weight: normal;
		border-bottom: 1px solid #C5C5C5;
		height: 70px;
	}
	#requestTable td.link {
		width: 30px !important;
		height: 20px !important;
	
	}
	#requestTable th {
		height: 70px;
		width: 20%;
		border-bottom: 1px solid #C5C5C5;
	}
	.ui.input {
		width: 100%;
		height: 40px;
	}
	.menu.transition.visible {
		height: auto;
	}
	button:focus {
		outline: none;
	}
	.row {
		float: left;
	}
	ul {
	  list-style: none;
	  margin: 0;
	  padding: 0;
	  display: inline-block;
	}
	
	li {
	  position: relative;
	  float: left;
	  margin-right: 20px;
	  width: 100px;
	  height: 40px;
 	  background: #E7E7E7;
 	  text-align: center;
 	  line-height: 40px;
	}
	
	li label {
	  position: relative;
	  width: 100px;
	  height: 40px;
	  margin-left: 10px;
	  margin-right: 10px;
	  color: #aaa;
	  font-weight: 600;
	  cursor: pointer;
	  z-index: 1;
	}
	
	input[type="radio"] {
	  position: absolute;
	  visibility: hidden;
	}
	
	input[type="radio"]:checked ~ label {
	  color: white;
	}
	li:hover {
		cursor: pointer;
	}
	#standard_calendar, #standard_calendar2 {
		width: 35%;
	}
	.ui.calendar .ui.table tr td, .ui.calendar .ui.table tr th {
	    padding: 1em !important;
	    padding-top: 0.5em !important;
	    padding-bottom: 0.5em !important;
	    
	    white-space: nowrap;
	}
	.ui.calendar .ui.table.day tr:nth-child(2) th {
	    padding-top: 0 !important;
	    padding-bottom: 0 !important;
	    height: 35px !important;
	}
	.ui.calendar .ui.table.day tr:first-child th {
    	border: none;
    	padding-top: 0 !important;
    	padding-bottom: 0 !important;
    	height: 35px !important;
	}
	button:hover{
		cursor: pointer;
	}
	@media screen and (max-width: 1530px){
		#requestTable {
			width: 70%;
		}
	}
	@media screen and (max-width: 1100px){
		#requestTable {
			width: 90%;
		}
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
						<div class="onMenu">01. 기본정보</div>
					</td>
					<td>
						<div>02. 설문작성</div>
					</td>
				</tr>
			</table>
		</div>
		<form action="requestResearch.corpResearch" method="post" id="requestResearchForm" onsubmit="return validate();">
			<table id="requestTable">
				<tr>
					<th>프로젝트 제목</th>
					<td>
						<div class="ui input">
							<input type="text" placeholder="프로젝트 제목을 입력해주세요" id="researchName" name="researchName">
							<input type="hidden" value="${ sessionScope.loginUser.mno }" name="companyNo">
						</div>
					</td>
				</tr>
				<tr>
					<th>조사 목적</th>
					<td style="height: 200px;">
						<div class="ui corner labeled input" style="height: 160px;">
					        <div class="ui corner label">
					            <i class="asterisk icon"></i>
					        </div>
					        <textarea id="researchPerpose" name="researchPerpose" style="margin-top: 0px; margin-bottom: 0px; height: 163px; width: 100%; resize: none;"></textarea>
					    </div>
					</td>
				</tr>
				<tr>
					<th>목표 인원</th>
					<td>
						<select class="ui dropdown" id="researchEngagementGoals" name="researchEngagementGoals">
							<option value="">목표 인원 수</option>
							<option value="3">3명(시연용)</option>
							<option value="100">100명</option>
							<option value="200">200명</option>
							<option value="300">300명</option>
							<option value="400">400명</option>
							<option value="500">500명</option>
						</select>
						
						<span style="font-size: 10px; margin-left: 20px; color: #646464;">(*예상완료시간이 지나도 목표인원이 채워져야 투표가 종료됩니다.)</span>
						<button id="expectCost" onclick="return false;" style="background: #00679A; color: white; border: 0; width: 70px; height: 25px; margin-left: 20px;">예상 비용</button>
					</td>
				</tr>
				<tr>
					<th rowspan="2">기본 설정</th>
					<td style="padding-bottom: 10px; padding-top: 10px; border-bottom: 0;">
						<div class="row">
							<ul>
								<li>
									<input type="radio" id="all" value="A" name="targetGender" checked>
									<label for="all">설정 안함</label>
								</li>
								<li>
									<input type="radio" id="female" value="F" name="targetGender">
									<label for="female">여성</label>
								</li>
								<li>
									<input type="radio" id="male" value="M" name="targetGender">
									<label for="male">남성</label>
								</li>
							</ul>
						</div>
						<div id="genderText" style="float: right; line-height: 40px; margin-right: 30px; color: #425DA1; font-size: 13px; font-weight: bold;"></div> 
					</td>
				</tr>
				<tr>
					<td style="padding-top: 10px; padding-bottom: 10px;">
						<div class="row">
							<ul>
								<li>
									<input type="radio" id="all2" value="all" name="targetAgeRange" checked>
									<label for="all2">설정 안함</label>
								</li>
								<li>
									<input type="radio" id="config" value="config" name="targetAgeRange">
									<label for="config">연령 설정</label>
								</li>
							</ul>
						</div>
						<div id="rangeAge" style="display: none;">
							<div style="display: inline-block; float: right; padding-top: 10px; margin-left: 68px;">
								<p>
								  <span id="amount" style="border:0; color:#00679A; font-weight:bold;"></span>
								  <input type="hidden" name="targetAgeRangeAmount" id="targetAgeRangeAmount">
								</p>
							</div>
							<div style="display: inline-block; float: right; padding-top: 10px; margin-left: 40px;">
								<div id="slider-range" style="display: inline-block; width: 150px;"></div>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th>조사 지역</th>
					<td>
						<div class="row">
							<ul>
								<li>
									<input type="radio" id="all3" value="all" name="targetLocation" checked>
									<label for="all">설정 안함</label>
								</li>
								<li style="width: 150px;">
									<input type="radio" id="metropolitan" value="metropolitan" name="targetLocation">
									<label for="metropolitan">서울 및 수도권</label>
								</li>
								<li style="width: 200px;">
									<input type="radio" id="city" value="city" name="targetLocation">
									<label for="city">서울, 경기 및 9대 광역시</label>
								</li>
							</ul>
						</div>
					</td>
				</tr>
				<tr>
					<th>조사 직업군</th>
					<td>
						<select class="ui dropdown" id="occupationNo" name="occupationNo">
							<option value="">조사 직업 대상</option>
							<option value="13">전체</option>
							<option value="1">자영업</option>
							<option value="2">판매/영업 서비스직</option>
							<option value="3">기능/직업직</option>
							<option value="4">사무/기술직</option>
							<option value="5">경영/관리직</option>
							<option value="6">자유/전문직</option>
							<option value="7">농업/임업/어업/축산업</option>
							<option value="8">전업주부</option>
							<option value="9">중/고등학생</option>
							<option value="10">대학(원)생</option>
							<option value="11">무직</option>
							<option value="12">기타</option>
						</select>
						
						<span style="font-size: 10px; margin-left: 20px; color: #646464;">(*원하는 조사 직업에 대해 추가 가격이 상이할 수 있습니다.)</span>
					</td>
				</tr>
				<tr>
					<th>조사 시작 날짜</th>
					<td>
						<div class="ui calendar" id="standard_calendar">
							<div class="ui input left icon">
								<i class="calendar icon"></i>
								<input type="text" autocomplete="off" name="startDate" id="startDate" placeholder="Date" class="visible">
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th>예상 완료 날짜</th>
					<td>
						<div class="ui calendar" id="standard_calendar2">
							<div class="ui input left icon">
								<i class="calendar icon"></i>
								<input type="text" autocomplete="off" name="endDate" id="endDate" placeholder="Date">
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th>추가 요구사항</th>
					<td style="height: 200px;">
						<div class="ui corner labeled input" style="height: 160px;">
					        <textarea id="additionaltEtc" name="additionaltEtc" style="margin-top: 0px; margin-bottom: 0px; height: 163px; width: 100%; resize: none;"></textarea>
					    </div>
					</td>
				</tr>
				<tr>
					<td colspan="2" style="border-bottom: 0;">
						<input type="button" onclick="location.href='previousResearchMain.corp'" style="float:left; width: 80px; height: 30px; background: #EFEFEF; color: #717171; border: 0;" value="목록">
						<input type="submit" style="float:right; width: 80px; height: 30px; background: #00679A; color: white; border: 0;" value="저장" >
					</td>
				</tr>
			</table>
		</form>
	</div>
	<div style="margin-top: 290px;">
		<jsp:include page="/WEB-INF/views/panel/common/footer.jsp"/>
	</div>
	<script>
		$(".row li").on("click", function(){
			$(this).children("input[type=radio]").prop("checked", true);
			isChecked();
		})
		$(function(){
			isChecked();
		})
		function isChecked() {
			$("input[type=radio]").each(function(){
				if($(this).prop("checked")){
					$(this).parent().css({"background":"#00679A", "color":"white"});
					if($(this).prop("id") == "all"){
						$("#genderText").text("전체");
					}
					else if($(this).prop("id") == "male"){
						$("#genderText").text("남성");
					}
					else if($(this).prop("id") == "female"){
						$("#genderText").text("여성");
					}
					if($("#config").prop("checked")){
						$("#rangeAge").css("display", "inline-block");
					}else {
						$("#rangeAge").css("display", "none");
					}
				}else {
					$(this).parent().css({"background":"#E7E7E7", "color":"#aaa"});
				}
			});
		}
		
		$("#researchMenu td div").eq(1).addClass("on");
		$(".ui.dropdown").dropdown();
		var today = new Date();
		$('#standard_calendar').calendar({
			minDate: new Date(today.getFullYear(), today.getMonth(), today.getDate()),
			type: 'date',
			formatter: {
				date: function (date, settings) {
			        if (!date) return '';
			        var day = date.getDate();
			        if(day < 10){
			        	day = '0' + day;
			        }
			        var month = date.getMonth() + 1;
			        if(month < 10){
			        	month = '0' + month;
			        }
			        var year = date.getFullYear();
			        return year + '-' + month + '-' + day;
				}
	      	}
		});
		$('#standard_calendar2').calendar({
			minDate: new Date(today.getFullYear(), today.getMonth(), today.getDate()),
			type: 'date',
			formatter: {
				date: function (date, settings) {
			        if (!date) return '';
			        var day = date.getDate();
			        if(day < 10){
			        	day = '0' + day;
			        }
			        var month = date.getMonth() + 1;
			        if(month < 10){
			        	month = '0' + month;
			        }
			        var year = date.getFullYear();
			        return year + '-' + month + '-' + day;
				}
	      	}
		});
	</script>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
		$( function() {
	    	$( "#slider-range" ).slider({
	      		range: true,
	     		min: 20,
	      		max: 60,
	      		values: [ 20, 30 ],
	      		slide: function( event, ui ) {
	        		$( "#amount" ).text(ui.values[ 0 ] + "세 이상 " + ui.values[ 1 ] + "세 이하" );
	        		$("#targetAgeRangeAmount").val(ui.values[ 0 ] + "-" + ui.values[ 1 ]);
	      		}
	    	});
	    	$("#targetAgeRangeAmount").val($( "#slider-range" ).slider( "values", 0 ) + "-" + $( "#slider-range" ).slider( "values", 1 ));
	    	$( "#amount" ).text($( "#slider-range" ).slider( "values", 0 ) + "세 이상   " + $( "#slider-range" ).slider( "values", 1 ) + "세 이하");
	  	});
		
		function validate() {
			if($("#researchName").val() == "" || $("#researchPerpose").val() == "" || $("#researchEngagementGoals").val() == "" || $("#startDate").val() == "" || $("#endDate").val() == ""){
				Swal.fire(
				      '오류',
				      '모든 내용을 작성해주세요',
				      'warning'
				);
				return false;
			}else {
				return true;
			}
			return false;
		}
  </script>
</body>
</html>