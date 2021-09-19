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
  		margin: 0 auto;
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
</style>
</head>
<body>
	<jsp:include page="../common/adminMenuBar.jsp"/>
	
	<div id="adminBox">
		<table id="adminBoxTable">
			<tr>
				<td>
					<div id="approvalBtnArea">
						<button onclick="location.href='manageCashoutApplication.reward'">신청 목록</button>
						<button onclick="location.href='manageCashoutComplete.reward'" id="clickBtn">완료 목록</button>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div id="adminTitle">
						리워드 캐시아웃 완료 목록
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
				<th style="width: 10%">캐시아웃 번호</th>
				<th style="width: 10%;">패널번호</th>
				<th style="width: 20%;">캐시아웃 신청 금액</th>
				<th style="width: 30%;">신청 계좌</th>
				<th style="width: 15%;">신청일</th>
				<th style="width: 15%;">캐시아웃 일</th>
			</tr>
			<c:forEach var="rc" items="${rewardCompleteHistoryList}">
				<tr class="tableContext">
					<td>${ rc.cashoutHistoryNo }</td>
					<td>${ rc.mno }</td>
					<td><fmt:formatNumber value="${ rc.cashoutAmount }" type="number" /> <i class="won sign icon"></i></td>
					<td>${ rc.account }</td>
					<td>${ rc.applicantDate }</td>
					<td>${ rc.confrimDate }</td>
				</tr>
			</c:forEach>
		</table>
		<div id="pagingArea" align="center">
			<c:url var="blistFirst" value="manageCashoutComplete.reward">
				<c:param name="currentPage" value="${1}"/>
			</c:url>
			<a href="${blistFirst}"><span>[처음]</span></a>&nbsp;
			
			<c:if test="${pi.currentPage <= 1}">
				<span>[이전]</span> &nbsp;
			</c:if>
			<c:if test="${pi.currentPage > 1}">
				<c:url var="blistBack" value="manageCashoutComplete.reward">
					<c:param name="currentPage" value="${pi.currentPage - 1}"/>
				</c:url>
				<a href="${blistBack}"><span>[이전]</span></a>&nbsp;
			</c:if>
			
			<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
				<c:if test="${p eq pi.currentPage }">
					<span style="color: #4169E1; font-weight: bold; font-size: 15pt;">${ p }</span>
				</c:if>
				<c:if test="${p ne pi.currentPage }">
					<c:url var="blistCheck" value="manageCashoutComplete.reward">
						<c:param name="currentPage" value="${ p }"/>
					</c:url>
					<a href="${ blistCheck }"><span>${ p }</span></a>
				</c:if>
				
			</c:forEach>
			
			<c:if test="${pi.currentPage < pi.maxPage}">
				<c:url var="blistNext" value="manageCashoutComplete.reward">
					<c:param name="currentPage" value="${pi.currentPage + 1}"/>
				</c:url>
				&nbsp;<a href="${blistNext}"><span>[다음]</span></a>
			</c:if>
			<c:if test="${pi.currentPage >= pi.maxPage}">
				&nbsp; <span>[다음]</span>
			</c:if>
			
			<c:url var="blistEnd" value="manageCashoutComplete.reward">
				<c:param name="currentPage" value="${pi.maxPage}"/>
			</c:url>
			<a href="${blistEnd}"><span>[마지막]</span></a>&nbsp;
		</div>
	</div>
	
</body>
</html>