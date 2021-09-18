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
  	
  	.box { 
  		display: block; width: 350px; height: 350px;
		padding: 30px; box-sizing: border-box;
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
</style>
</head>
<body>
	<jsp:include page="../common/adminMenuBar.jsp"/>
	
	<div id="adminBox">
		<table id="adminBoxTable">
			<tr>
				<td>
					<div id="approvalBtnArea">
						<button onclick="location.href='researchReportStandbyList.admin'">통계 처리 목록</button>
						<button onclick="location.href='researchReportWriteList.admin'">보고서 작성 목록</button>
						<button onclick="location.href='researchReportSendList.admin'" id="clickBtn">결과 전송 목록</button>						
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div id="adminTitle">
						리서치 결과 전송 목록
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
			<thead id="listThead">
				<tr id="tableTitle">
					<th style="width: 15%;">리서치번호</th>
					<th style="width: 20%;">기업명</th> 
					<th style="width: 35%;">리서치제목</th>
					<th style="width: 20%;">보고서 작성 완료일</th>
					<th style="width: 10%;">상세보기</th>
				</tr>
			</thead>
			<tbody id="listTbody">
				<c:forEach var="list" items="${ researchReportList }">
					<tr class="tableContext">
						<td>${ list.researchNo }</td>
						<td>${ list.companyName }</td>
						<td>${ list.researchName }</td>
						<td>${ list.endPeriod }</td>
						<td><button class="detail">상세보기</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div id="pagingArea" align="center">
			<span>[처음]</span>
			<span>[이전]</span>
			<c:forEach var="i" begin="1" end="1">
				<span><c:out value="${ i }"/></span>
			</c:forEach>
			<span>[다음]</span>
			<span>[마지막]</span>
		</div>
	</div>
		
	<div class="ui modal" id="corp">
		<div class="header">기업 명</div>
		<div class="scrolling content">
			<div>
				<table id="corpTable">
					<tr>
						<th>프로젝트 명</th>
						<td id="projectName"></td>
					</tr>
					<tr>
						<th>목적</th>
						<td id="projectPurpose"></td>
					</tr>
					<tr>
						<th>목표 인원</th>
						<td id="projectCount"></td>
					</tr>
					<tr>
						<th>조사 대상 성별</th>
						<td id="projectGender"></td>
					</tr>
					<tr>
						<th>조사 대상 연령</th>
						<td id="projectAge"></td>
					</tr>
					<tr>
						<th>조사 대상 지역</th>
						<td id="projectLocation"></td>
					</tr>
					<tr>
						<th>조사 예상 기간</th>
						<td id="projectPeriod"></td>
					</tr>
				</table>
				
				<div class="scrolling content">
					<div>
						<ul id="sortable"></ul>
					</div>
				</div>
				<div id="uploadFileName" style="width: fit-content; margin: 10px auto;">파일 명</div>
			</div>
		</div>
		<div class="actions">
		    <div class="ui approve button" id="approvalBtn">Complete</div>
		    <div class="ui cancel button">Cancel</div>
  		</div>
	</div>
	
	<div class="ui tiny modal" id="sendMailModal">
		<div class="header">메일 전송중</div>
		<div class="content" style="margin: 0 auto; width: fit-content;">
			<img alt="sendMail.gif" src="${ contextPath }/resources/images/sendMail.gif" style="width: 400px;">
		</div>
	</div>
	
	<script>
		$(".detail").on("click", function(){
			researchNo = $(this).parent().parent().children().eq(0).text();
			var num = $(this).parent().siblings().eq(0).text();
			$.ajax({
				url: "selectResearchOne.adminResearch",
				type: "post",
				data: {
					researchNo: researchNo
				},
				success: function(data) {
					$("#projectName").text(data.r.researchName);
					$("#projectPurpose").text(data.r.researchPerpose);
					$("#projectCount").text(data.r.researchEngagementGoals + "명");
					if(data.r.targetGender == 'A') {
						$("#projectGender").text("성별무관");
					} else if(data.r.targetGender == 'M') {
						$("#projectGender").text("남자");
					} else {
						$("#projectGender").text("여자");
					}
					$("#projectAge").text(data.r.targetAgeRange);
					if(data.r.targetLocation == "city") {
						$("#projectLocation").text("서울 경기 및 9대 광역시");
					} else if(data.r.targetLocation == "metropolitan") {
						$("#projectLocation").text("서울 및 수도권");
					} else {
						$("#projectLocation").text("전지역");
					}
					$("#projectPeriod").text(data.r.researchPeriod);
				},
				error: function(data) {
					
				}
			});
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
						$("#sortable").append('<div align="center"><div class="box"><canvas id="' + data.question[i].rquestionNo + '" width="100%" height="100%"></canvas></div></div>');
						
						drawChart(data.question[i].rquestionNo, chartLabels, chartData);
					}
				},
				error: function(data) {
					console.log("ajax실패");
				}
			});
			$('#corp').modal('show');
			//console.log(num);
		});
		$("#approvalBtn").on("click", function(){
			Swal.fire({
			  title: '이대로 반영하시겠습니까?',
			  text: "이 결정은 되돌릴 수 없습니다!",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: 'Yes'
			}).then((result) => {
			  if (result.value) {
// 			    Swal.fire(
// 			      '반영!',
// 			      '기업에게 결과를 전달하였습니다.',
// 			      'success'
// 			    )
				  $("#sendMailModal").modal("show");
				  $.ajax({
					  url: "researchReportMailing.adminResearch",
					  type: "post",
					  data: {
						  researchNo: researchNo
					  },
					  success: function(data) {
						  if(data.result) {
							  $("#sendMailModal").modal("hide");
						  		Swal.fire('반영!', '기업에게 결과를 전달하였습니다.', 'success').then(function(){
						  			location.reload()
						  		});
						  } else {
							  $("#sendMailModal").modal("hide");
						  		Swal.fire('실패!', '기업에게 결과를 전달하지 못했습니다.', 'error').then(function(){
						  			location.reload()
						  		});
						  }
					  },
					  error: function(data) {
						  console.log("ajax 실패");
					  }
				  });
			  }else {
				  $('#research').modal('show');
			  }
			})
		});
		
		$(".topMenu:nth-child(2)").addClass("active");
		$(".topMenu:nth-child(2)").find(".innerMenu:nth-child(7)").addClass("on");
		
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
	</script>
</body>
</html>