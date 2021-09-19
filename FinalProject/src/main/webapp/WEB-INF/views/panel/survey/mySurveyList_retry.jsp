<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/views/panel/common/head.jsp"/>
</head>
<style>
.ui.tabular.menu .active.item {
	width: 20%;
	padding-left: 6%;
	cursor: default;
}

.ui.tabular.menu .item {
	width: 20%;
	padding-left: 6%;
}

.searchArea {
	margin-top: 50px;
}

#tableArea {
	border-top: 1px solid #3C3C3C;
	border-collapse: collapse;
}

#tHeadArea {
	background-color: #DBDBDB;
}

#tHeadArea>tr>th {
	height: 25px;
}

#tBodyArea {
	text-align: center;
}

#tBodyArea>tr {
	border-top: 1px solid #C4C4C4;
	border-bottom: 1px solid #C4C4C4;
}

#tBodyArea>tr>td {
	height: 45px;
}

.ui.input {
	height: 30px;
}

#searchBtn {
	background-color: #00679A;
	border-radius: 5px;
	width: 65px;
	height: 30px;
	color: white;
}

#retryBtn {
	background-color: #00679A;
	border-radius: 4px;
	width: 100px;
	height: 25px;
	color: white;
	border: none;
	cursor: pointer;
	font-size:9pt;
}

#disableBtn {
	background-color: #C1332A;
	border-radius: 4px;
	width: 100px;
	height: 25px;
	color: white;
	border: none;
	cursor: pointer;
	font-size:9pt;
}

#overBtn {
	background-color: #494949;
	border-radius: 4px;
	width: 100px;
	height: 25px;
	color: white;
	border: none;
	cursor: pointer;
	font-size:9pt;
}
#disableBtn:hover,#overBtn:hover {
	cursor:default;
}

/*페이징 css */
#pagingArea {
	margin-top: 40px;
	/* 드래그 방지용 소스*/
	-ms-user-select: none;
	-moz-user-select: -moz-none;
	-webkit-user-select: none;
	-khtml-user-select: none;
	user-select: none;
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
/* 페이징 css end */
</style>
<body>
	<c:if test="${ loginUser != null }">
		<div class="wrap">
			<jsp:include page="/WEB-INF/views/panel/common/header.jsp"/>
			<section class="container">
				<br />
	
				<table id="titleTable" height="10px;" width="99%;">
					<tr>
						<td id="menuTitle">참여한 설문조사</td>
						<td id="pagePath">
							<div class="ui breadcrumb">
								<a class="section" id="depth1" href="panelMain.panel">Home</a>
								<i class="right angle icon divider"></i>
								<a class="section" id="depth2" href="surveyList.survey">서베이</a>
								<i class="right angle icon divider"></i>
								<div class="active section" id="depth3">참여한 설문조사</div>
							</div>
						</td>
					</tr>
				</table>
				
				<div class="sectionLine">
					<hr>
				</div>
	
	
	
				<div class="ui tabular menu">
					<a class="item" onclick="location.href='mySurveyList_complete.survey'"> 참여 완료 조사 </a>
					<a class="item active"> 참여 시도 조사 </a>
				</div>
	
	
				
				<div class="ContentsArea" style="width: 100%;">
					<div class="searchArea" align="right">
					<form action="mySurveyList_retry.survey" method="get" id="search">
						<table>
							<tr>
								<td>
									<h4>검색어</h4>
								</td>
								<td></td>
								<td></td>
								<td>
									<div class="ui input">
										<input type="search" name="searchResearch" />
									</div>
								</td>
								<td>
									<button id="searchBtn">검색</button>
								</td>
							</tr>
						</table>
						</form>
					</div>  <!-- inquirySearchArea end -->
					<br />
					<div class="listArea" style="width: inherit;">	
						<table id="tableArea" align="center" style="width: inherit;">
							<thead id="tHeadArea">
								<tr>
									<th style="width: 15%;">조사번호</th>
									<th style="width: 50%;">문의제목</th>
									<th style="width: 15%;">시도일자</th>
									
									
								</tr>
							</thead>  <!-- #inquiryTheadArea end -->
							<tbody id="tBodyArea">
							<c:forEach var="PanelResearchList" items="${list }" >
								<tr>
									<td><c:out value="${PanelResearchList.researchNo}" /></td>
									<td><c:out value="${PanelResearchList.researchName}" /></td>
									<td><c:out value="${PanelResearchList.attemptDate}" /></td>
								</tr>
							</c:forEach>
								
							</tbody>  <!-- #inquiryTbodyArea end -->
						</table>  <!-- #inquiryTableArea end -->
					</div>  <!-- .inquiryArea end -->
					<div id="pagingArea" align="center">
						<c:url var="inquiryListFirst" value="mySurveyList_complete.survey">
							<c:param name="currentPage" value="${1}" />
							<c:if test="${ !empty param.researchName }">
								<c:param name="inquiryTitle" value="${param.researchName}" />
							</c:if>

						</c:url>
						<a href="${inquiryListFirst}"><span>[처음]</span></a>&nbsp;

						<c:if test="${pi.currentPage <= 1}">
							<span>[이전]</span> &nbsp;
			</c:if>
						<c:if test="${pi.currentPage > 1}">
							<c:url var="inquiryListBack" value="mySurveyList_complete.survey">
								<c:param name="currentPage" value="${pi.currentPage - 1}" />
								<c:if test="${ !empty param.researchName }">
									<c:param name="researchName" value="${param.researchName}" />
								</c:if>

							</c:url>
							<a href="${inquiryListBack}"><span>[이전]</span></a>&nbsp;
			</c:if>

						<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
							<c:if test="${p eq pi.currentPage }">
								<span
									style="color: #4169E1; font-weight: bold; font-size: 15pt;">${ p }</span>
							</c:if>
							<c:if test="${p ne pi.currentPage }">
								<c:url var="inquiryListCheck"
									value="mySurveyList_complete.survey">
									<c:param name="currentPage" value="${ p }" />
									<c:if test="${ !empty param.researchName }">
										<c:param name="researchName" value="${param.researchName}" />
									</c:if>

								</c:url>
								<a href="${ inquiryListCheck }"><span>${ p }</span></a>
							</c:if>

						</c:forEach>

						<c:if test="${pi.currentPage < pi.maxPage}">
							<c:url var="inquiryListNext" value="mySurveyList_complete.survey">
								<c:param name="currentPage" value="${pi.currentPage + 1}" />
								<c:if test="${ !empty param.researchName }">
									<c:param name="researchName" value="${param.researchName}" />
								</c:if>

							</c:url>
				&nbsp;<a href="${inquiryListNext}"><span>[다음]</span></a>
						</c:if>
						<c:if test="${pi.currentPage >= pi.maxPage}">
				&nbsp; <span>[다음]</span>
						</c:if>

						<c:url var="inquiryListEnd" value="mySurveyList_complete.survey">
							<c:param name="currentPage" value="${pi.maxPage}" />
							<c:if test="${ !empty param.researchName }">
								<c:param name="researchName" value="${param.researchName}" />
							</c:if>

						</c:url>
						<a href="${inquiryListEnd}"><span>[마지막]</span></a>&nbsp;
					</div>
					<!-- #pagingArea end -->
				</div>  <!-- .inquiryContentsArea end -->
				
				
				
				
				
	
				<br />
			</section>
			<!-- container end -->
			<jsp:include page="/WEB-INF/views/panel/common/footer.jsp"/>
		</div>
		<!-- wrap end -->
	</c:if>
	<c:if test="${ loginUser == null }">
		<script>
			location.href="panelResult.panel?message=notLoginAccess";
		</script>
	</c:if>
	
	<script>
		$("#searchBtn").click(function(){
			 $("#search").submit();
		 }); 
	</script>
</body>
</html>









































