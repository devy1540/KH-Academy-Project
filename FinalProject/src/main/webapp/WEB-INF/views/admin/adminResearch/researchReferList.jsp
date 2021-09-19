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
	.reason {
  		width: 70%;
  		margin: 0 auto;
  		border-spacing: 0;
		border-collapse: collapse;
  	}
  	.reason th {
  		width: 20%;
  		height: 70px;
  		border-bottom: 1px solid #C5C5C5;
  	}
  	.reason td {
  		width: 80%;
  		border-bottom: 1px solid #C5C5C5;
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
						<button onclick="location.href='researchApprovalWaitList.adminResearch'">미처리 목록</button>
						<button onclick="location.href='researchReferList.adminResearch'" id="clickBtn">반려 목록</button>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div id="adminTitle">
						반려 목록
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
				<th style="width: 20%;">처리일</th>
				<th style="width: 10%;">상세보기</th>
			</tr>
			<c:forEach var="research" items="${ researchReferList }">
				<tr class="tableContext">
					<td>${ research.researchNo }</td>
					<td>${ research.companyName }</td>
					<td>${ research.researchName }</td>
					<td><fmt:formatDate value="${ research.lastDate }"/></td>
					<td><button class="detail">상세 보기</button></td>
				</tr>
			</c:forEach>
		</table>
		<div id="pagingArea" align="center">
			<c:url var="researchFirst" value="researchReferList.adminResearch">
				<c:param name="currentPage" value="${1}"/>
			</c:url>
			<a href="${researchFirst}"><span>[처음]</span></a>&nbsp;
			
			<c:if test="${pi.currentPage <= 1}">
				<span>[이전]</span> &nbsp;
			</c:if>
			<c:if test="${pi.currentPage > 1}">
				<c:url var="researchBack" value="researchReferList.adminResearch">
					<c:param name="currentPage" value="${pi.currentPage - 1}"/>
				</c:url>
				<a href="${researchBack}"><span>[이전]</span></a>&nbsp;
			</c:if>
			
			<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
				<c:if test="${p eq pi.currentPage }">
					<span style="color: #4169E1; font-weight: bold; font-size: 15pt;">${ p }</span>
				</c:if>
				<c:if test="${p ne pi.currentPage }">
					<c:url var="researchCheck" value="researchReferList.adminResearch">
						<c:param name="currentPage" value="${ p }"/>
					</c:url>
					<a href="${ researchCheck }"><span>${ p }</span></a>
				</c:if>
				
			</c:forEach>
			
			<c:if test="${pi.currentPage < pi.maxPage}">
				<c:url var="researchNext" value="researchReferList.adminResearch">
					<c:param name="currentPage" value="${pi.currentPage + 1}"/>
				</c:url>
				&nbsp;<a href="${researchNext}"><span>[다음]</span></a>
			</c:if>
			<c:if test="${pi.currentPage >= pi.maxPage}">
				&nbsp; <span>[다음]</span>
			</c:if>
			
			<c:url var="researchEnd" value="researchReferList.adminResearch">
				<c:param name="currentPage" value="${pi.maxPage}"/>
			</c:url>
			<a href="${researchEnd}"><span>[마지막]</span></a>&nbsp;
		</div>
	</div>
	<div class="ui modal">
	  	<div class="header">기업명</div>
  		<div class="scrolling content">
  			<table class="reason">
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
						<th>반려 사유</th>
						<td></td>
					</tr>
				</table>
  		</div>
  		<div class="actions">
		    <div class="ui cancel button">Close</div>
  		</div>
	</div>
		
	
	<script>
		$(document).on("click", ".detail", function(){
			researchNoStr = $(this).parent().siblings().eq(0).text();
			$.ajax({
				url:"researchReferDetail.adminResearch",
				type:"post",
				data:{researchNoStr:researchNoStr},
				success:function(data){
					console.log(data);
					
					var researchDetail = data.researchDetail[0];
					$(".reason").find("td").eq(0).text(researchDetail.researchName);
					$(".reason").find("td").eq(1).text(researchDetail.researchPerpose);
					$(".reason").find("td").eq(2).text(researchDetail.researchEngagementGoals + "명");
					$(".reason").find("td").eq(3).text(researchDetail.researchReferReason);
					
					$('.ui.modal').modal('show');
				},
				error:function(data){
					console.log(data);
				}
			});
			
		});
		$(".topMenu:nth-child(2)").addClass("active");
		$(".topMenu:nth-child(2)").find(".innerMenu:nth-child(1)").addClass("on");
	</script>
</body>
</html>