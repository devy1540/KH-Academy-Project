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
	.detail2 {
		font-size: 9pt;
		background: #EDEBEB;
		width: 80px;
		height: 30px;
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
</style>
</head>
<body>
	<jsp:include page="../common/adminMenuBar.jsp"/>
	
	<div id="adminBox">
		<table id="adminBoxTable">
			<tr>
				<td>
					<div id="approvalBtnArea">
						<button onclick="location.href='researchWaitingPayment.adminResearch'">협의중</button>
						<button onclick="location.href='researchConsultationCompleted.adminResearch'" id="clickBtn">결제 완료</button>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div id="adminTitle">
						리서치 결제 완료 목록
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
				<th style="width: 10%;">결제 번호</th>
				<th style="width: 20%;">기업명</th>
				<th style="width: 40%;">리서치 명</th>
				<th style="width: 10%;">결제 금액</th>
				<th style="width: 10%;">결제일</th>
				<th style="width: 10%;">상세보기</th>
			</tr>
			<c:forEach var="bill" items="${paymentList}">
				<tr class="tableContext">
					<td>${ bill.billingHistoryNo }</td>
					<td>${ bill.companyName }</td>
					<td>${ bill.researchName }</td>
					<td>${ bill.paymentAmount }</td>
					<td>${ bill.paymentDate }</td>
					<td><button class="detail">상세 보기</button></td>
				</tr>
			</c:forEach>
		</table>
		<div id="pagingArea" align="center">
			<c:url var="researchFirst" value="researchConsultationCompleted.adminResearch">
				<c:param name="currentPage" value="${1}"/>
			</c:url>
			<a href="${researchFirst}"><span>[처음]</span></a>&nbsp;
			
			<c:if test="${pi.currentPage <= 1}">
				<span>[이전]</span> &nbsp;
			</c:if>
			<c:if test="${pi.currentPage > 1}">
				<c:url var="researchBack" value="researchConsultationCompleted.adminResearch">
					<c:param name="currentPage" value="${pi.currentPage - 1}"/>
				</c:url>
				<a href="${researchBack}"><span>[이전]</span></a>&nbsp;
			</c:if>
			
			<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
				<c:if test="${p eq pi.currentPage }">
					<span style="color: #4169E1; font-weight: bold; font-size: 15pt;">${ p }</span>
				</c:if>
				<c:if test="${p ne pi.currentPage }">
					<c:url var="researchCheck" value="researchConsultationCompleted.adminResearch">
						<c:param name="currentPage" value="${ p }"/>
					</c:url>
					<a href="${ researchCheck }"><span>${ p }</span></a>
				</c:if>
				
			</c:forEach>
			
			<c:if test="${pi.currentPage < pi.maxPage}">
				<c:url var="researchNext" value="researchConsultationCompleted.adminResearch">
					<c:param name="currentPage" value="${pi.currentPage + 1}"/>
				</c:url>
				&nbsp;<a href="${researchNext}"><span>[다음]</span></a>
			</c:if>
			<c:if test="${pi.currentPage >= pi.maxPage}">
				&nbsp; <span>[다음]</span>
			</c:if>
			
			<c:url var="researchEnd" value="researchConsultationCompleted.adminResearch">
				<c:param name="currentPage" value="${pi.maxPage}"/>
			</c:url>
			<a href="${researchEnd}"><span>[마지막]</span></a>&nbsp;
		</div>
	</div>
	<div class="ui modal" id="payment">
		<div class="header">결제 내역</div>
		<div class="scrolling content">
			<div>
				<table id="payTable">
					<tr>
						<td rowspan="4">
							<div id="paymentStatus">
								<div class="payStatus" id="completePayment">결제 대기중</div>
								<div class="arrow" id="completeArrow"><i class="large primary chevron down icon"></i></div>
								<div class="payStatus" id="completePayment">결제 완료</div>
							</div>
						</td>
						<th>문항 수</th>
						<td></td>
					</tr>
					<tr>
						<th>설문 예상소요시간</th>
						<td></td>
					</tr>
					<tr>
						<th>목표 인원</th>
						<td></td>
					</tr>
					<tr>
						<th>결제 금액</th>
						<td></td>
					</tr>
				</table>
			</div>
		</div>
		<div class="actions">
		    <div class="ui cancel button">Cancel</div>
  		</div>
	</div>	
	
	<script>
		$(".detail").on("click", function(){
			var billingHistoryNo = $(this).parent().siblings().eq(0).text();
			
			$.ajax({
				url:"billsDetail.adminResearch",
				type:"post",
				data:{
					billingHistoryNoStr:billingHistoryNo
				},
				success:function(data){
					var billsDetail = data.billsDetail[0];
					$("#payTable").find("td").eq(1).text(billsDetail.qCount + " 개");
					var count = "";
					if(billsDetail.qCount <= 10){
						count = "5 분";
					}else if(billsDetail.qCount <= 30) {
						count = "10 분";
					}else if(billsDetail.qCount <= 50) {
						count = "15 분";
					}else if(billsDetail.qCount <= 70) {
						count = "20 분";
					}else {
						count = "20 분 이상";
					}
					$("#payTable").find("td").eq(2).text(count);
					$("#payTable").find("td").eq(3).text(billsDetail.researchEngagementGoals + " 명");
					$("#payTable").find("td").eq(4).text(comma(billsDetail.paymentAmount) + "원");
					
					$('#payment').modal('show');
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
		
		$(".topMenu:nth-child(2)").addClass("active");
		$(".topMenu:nth-child(2)").find(".innerMenu:nth-child(2)").addClass("on");
	</script>
</body>
</html>