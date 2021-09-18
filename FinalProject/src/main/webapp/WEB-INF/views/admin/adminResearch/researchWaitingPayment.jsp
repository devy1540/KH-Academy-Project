<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	.detail {
		font-size: 9pt;
		background: #EDEBEB;
		width: 80px;
		height: 30px;
	}
	#corpTable, #priceTable {
  		width: 80%;
  		margin: 0 auto;
  		border-spacing: 0;
		border-collapse: collapse;
		text-align: center;
  	}
  	#corpTable th, #priceTable th {
  		width: 50%;
  		height: 70px;
  		border-bottom: 1px solid #C5C5C5;
  	}
  	#corpTable td, #priceTable td {
  		width: 50%;
  		border-bottom: 1px solid #C5C5C5;
  	}
  	#nextBtn {
  		background: #00679A;
  		color: white;
  	}
  	#approvalBtn {
  		background: #00679A;
  		color: white;
  	}
  	#referBtn {
  		background: #C1332A;
  		color: white;
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
						<button onclick="location.href='researchWaitingPayment.adminResearch'" id="clickBtn">협의중</button>
						<button onclick="location.href='researchConsultationCompleted.adminResearch'">결제 완료</button>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div id="adminTitle">
						리서치 협의중인 목록
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
				<th style="width: 10%;">승인일</th>
				<th style="width: 10%;">상태</th>
				<th style="width: 10%;">상세보기</th>
			</tr>
			<c:forEach var="research" items="${ researchWaitingPayment }">
				<tr class="tableContext">
					<td>${ research.researchNo }</td>
					<td>${ research.companyName }</td>
					<td>${ research.researchName }</td>
					<td><fmt:formatDate value="${ research.lastDate }"/></td>
					<td>${ research.researchState }</td>
					<td><button class="detail">상세 보기</button></td>
				</tr>
			</c:forEach>
		</table>
		<div id="pagingArea" align="center">
			<c:url var="researchFirst" value="researchWaitingPayment.adminResearch">
				<c:param name="currentPage" value="${1}"/>
			</c:url>
			<a href="${researchFirst}"><span>[처음]</span></a>&nbsp;
			
			<c:if test="${pi.currentPage <= 1}">
				<span>[이전]</span> &nbsp;
			</c:if>
			<c:if test="${pi.currentPage > 1}">
				<c:url var="researchBack" value="researchWaitingPayment.adminResearch">
					<c:param name="currentPage" value="${pi.currentPage - 1}"/>
				</c:url>
				<a href="${researchBack}"><span>[이전]</span></a>&nbsp;
			</c:if>
			
			<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
				<c:if test="${p eq pi.currentPage }">
					<span style="color: #4169E1; font-weight: bold; font-size: 15pt;">${ p }</span>
				</c:if>
				<c:if test="${p ne pi.currentPage }">
					<c:url var="researchCheck" value="researchWaitingPayment.adminResearch">
						<c:param name="currentPage" value="${ p }"/>
					</c:url>
					<a href="${ researchCheck }"><span>${ p }</span></a>
				</c:if>
				
			</c:forEach>
			
			<c:if test="${pi.currentPage < pi.maxPage}">
				<c:url var="researchNext" value="researchWaitingPayment.adminResearch">
					<c:param name="currentPage" value="${pi.currentPage + 1}"/>
				</c:url>
				&nbsp;<a href="${researchNext}"><span>[다음]</span></a>
			</c:if>
			<c:if test="${pi.currentPage >= pi.maxPage}">
				&nbsp; <span>[다음]</span>
			</c:if>
			
			<c:url var="researchEnd" value="researchWaitingPayment.adminResearch">
				<c:param name="currentPage" value="${pi.maxPage}"/>
			</c:url>
			<a href="${researchEnd}"><span>[마지막]</span></a>&nbsp;
		</div>
	</div>
	<div class="ui mini modal" id="research">
		<div class="header">리서치 제목</div>
		<div class="scrolling content">
			<div>
				<table id="priceTable">
					<tr>
						<th>이전 협상 금액</th>
						<td>2,700,000 원</td>
					</tr>
					<tr>
						<th>기업 희망 금액</th>
						<td>1,200,000 원</td>
					</tr>
				</table>
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
						<td></td>
					</tr>
					<tr>
						<th>조사 대상 연령</th>
						<td></td>
					</tr>
					<tr>
						<th>조사 대상 지역</th>
						<td></td>
					</tr>
					<tr>
						<th>조사 예상 기간</th>
						<td></td>
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
		$(".detail").on("click", function(){
			researchNoStr = $(this).parent().siblings().eq(0).text();
			var researchState = $(this).parent().siblings().eq(4).text();
			var companyName = $(this).parent().siblings().eq(1).text();
			
			if(researchState == '납부 대기'){
				$("#approvalBtn").hide();
				$("#referBtn").hide();
			}else {
				$("#approvalBtn").show();
				$("#referBtn").show();
			}
			$.ajax({
				url:"researchWaitPaymentDetail.adminResearch",
				type:"post",
				data:{researchNoStr:researchNoStr},
				success:function(data){
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
					
					$("#priceTable").find("td").eq(0).text(comma(researchDetail.researchPrice) + " 원");
					console.log(researchDetail.researchPrice + " " + researchDetail.conferencePrice)
					researchPrice = researchDetail.researchPrice;
					if(researchDetail.researchPrice == researchDetail.conferencePrice){
						$("#priceTable").find("td").eq(1).text('-');
					}else {
						$("#priceTable").find("td").eq(1).text(comma(researchDetail.conferencePrice) + " 원");
						conferencePrice = researchDetail.conferencePrice;
					} 
					$('#corp').modal('show'); 
				},
				error:function(status){
					console.log(status);
				}
			});
		});
		
		function comma(num){
			var len, point, str;  
			  
			num = num + "";  
			point = num.length % 3 ;
			len = num.length;  
		  
			str = num.substring(0, point);  
			while (point < len) {  
			    if (str != "") str += ",";  
			    str += num.substring(point, point + 3);  
			    point += 3;  
			}  
			return str;
		
		}
		
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
						url:"researchPaymentApproved.adminResearch",
						type:"post",
						data:{
							researchNoStr:researchNoStr,
							conferencePriceStr:conferencePrice
						},
						success:function(data){
							console.log(data);
							Swal.fire(
								'승인!',
								'금액 협상이 완료되었습니다.',
								'success'
						    )
							setTimeout(function(){
							    location.reload();
							},1500)
						},
						error:function(data){
							console.log(data);					
						}
					})
			    
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
					      return '반려 사유를 적어주세요!'
					    }
					  }
				})
	
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
								url:"researchPaymentRefer.adminResearch",
								type:"post",
								data:{
									researchNoStr:researchNoStr,
									researchPriceStr:researchPrice,
									referReason:text
								},
								success:function(data){
									console.log(data);
									Swal.fire(
							      		'협상 반려!',
							      		'가격 협상을 반려하였습니다.',
							      		'success'
						    		)	
									setTimeout(function(){
									    location.reload();
									},1500)
								},
								error:function(data){
									console.log(data);					
								}
							})
						 
					  }else {
						  $('#research').modal('show');
					  }
					})
				}
			}
			start();
		});
		$(".topMenu:nth-child(2)").addClass("active");
		$(".topMenu:nth-child(2)").find(".innerMenu:nth-child(2)").addClass("on");
	</script>
</body>
</html>