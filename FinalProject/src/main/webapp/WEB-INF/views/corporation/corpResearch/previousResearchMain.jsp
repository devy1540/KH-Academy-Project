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
	#listArea {
		width: 90%;
		margin: 0 auto;
		margin-top: 50px;
	}
	#listArea div {
		margin: 20px auto;
		width: fit-content;
	}
	#mainTitle {
		font-size: 30px;
	}
	#subTitle {
		font-size: 20px;
	}
	#searchArea {
		width: 80%;
		margin: 50px auto;
		margin-bottom: 100px;
	}
	#statusSelect {
		width: fit-content;
		float: left;
	}
	#selectBoxArea {
		width: fit-content;
		float: right;
	}
	#listMainArea {
		width: 100%;
		height: 800px;
	}
	.menu.transition.visible {
		height: 150px;
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
	#researchTable {
		margin: 40px auto;
		margin-top: 150px;
		width: 80%;
		border-spacing: 0;
		border-collapse: collapse;
		text-align: center;
	}
	#researchTable th {
		background: #F0F0F0;
  		height: 50px;
  		border-top: 1px solid #C5C5C5;
  		border-bottom: 1px solid #C5C5C5;
  	}
  	#researchTable td {
  		height: 70px;
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
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/corporation/common/corpMenuBar.jsp"/>
	<jsp:include page="/WEB-INF/views/corporation/common/corpMenuBar2.jsp"/>
	<c:if test="${ empty sessionScope.loginUser or sessionScope.loginUser.userType ne '기업' }">
		<c:set var="msg" value="기업회원만 접근 가능합니다." scope="request"/>
		<jsp:forward page="/WEB-INF/views/common/errorPage.jsp"/>
	</c:if>
	<div id="listMainArea">
		<div id="listArea">
			<div id="mainTitle">리서치 의뢰 이력</div>
			<div id="subTitle">리서치 이력 확인 및 리서치 결과를 활용할 수 있습니다.</div>
		</div>
		
		<div id="searchArea">
			<form action="previousResearchMain.corpResearch" method="get">
				<div id="statusSelect">
					<div class="ui clearable multiple selection dropdown">
					  	<input type="hidden" name="researchState">
					  	<i class="dropdown icon"></i>
					  	<div class="default text">Select Status</div>
					  	<div class="menu">
					    	<div class="item" value="승인 대기">승인 대기</div>
					    	<div class="item" value="납부 대기">납부 대기</div>
					    	<div class="item" value="질문 재구성 대기">질문 재구성 대기</div>
					    	<div class="item" value="검토 대기">검토 대기</div>
					    	<div class="item" value="메일링 대기">메일링 대기</div>
					    	<div class="item" value="리서치 배포중">리서치 배포중</div>
					    	<div class="item" value="리서치 완료">리서치 완료</div>
					    	<div class="item" value="반려">반려</div>
					  	</div>
					</div>
				</div>
				<div id="selectBoxArea">
					<div class="ui action input">
		  				<input type="text" name="researchName" placeholder="프로젝트 명">
						<button class="ui icon button">
							<i class="search icon"></i>
						</button>
					</div>
				</div>
			</form>
		</div>
		<table id="researchTable">
			<tr>
				<th style="width: 10%;">번호</th>
				<th style="width: 40%;">프로젝트명</th>
				<th style="width: 10%;">진행상태</th>
				<th style="width: 10%;">결제금액</th>
				<th style="width: 10%;">결제상태</th>
				<th style="width: 10%;">조사기간</th>
				<th style="width: 10%;">설문내용</th>
			</tr>
			<c:forEach var="research" items="${ researchList }">
				<tr>
					<td>${ research.researchNo }</td>
					<td>${ research.researchName }</td>
					<td>${ research.researchState }</td>
					<td><c:if test="${ research.researchPrice == 0}">
							-
						</c:if>
						<c:if test="${ research.researchPrice != 0}">
							${ research.researchPrice }
						</c:if> 
					</td>
					<td>${ research.isBill }</td>
					<td>${ research.additionaltEtc }<br>
						${ research.researchPeriod }</td>
					<td><c:if test="${ research.researchState == '승인 대기'}">
							-
						</c:if>
						<c:if test="${ research.researchState == '가격 협의중'}">
							-
						</c:if>
						<c:if test="${ research.researchState == '납부 대기'}">
							-
						</c:if>
						<c:if test="${ research.researchState == '질문 재구성 대기'}">
							-
						</c:if>
						<c:if test="${ research.researchState != '승인 대기' && research.researchState != '가격 협의중' && research.researchState != '납부 대기' && research.researchState != '질문 재구성 대기'}">
							<input type="button" value="미리 보기">
						</c:if> 
					</td>
				</tr>
			</c:forEach>
		</table>
		<div id="pagingArea" align="center">
			<c:url var="researchFirst" value="previousResearchMain.corpResearch">
				<c:param name="currentPage" value="${1}"/>
				<c:if test="${ !empty param.researchState }">
					<c:param name="researchState" value="${param.researchState}"/>
				</c:if>
				<c:if test="${ !empty param.researchName }">
					<c:param name="researchName" value="${param.researchName}"/>
				</c:if>
			</c:url>
			<a href="${researchFirst}"><span>[처음]</span></a>&nbsp;
			
			<c:if test="${pi.currentPage <= 1}">
				<span>[이전]</span> &nbsp;
			</c:if>
			<c:if test="${pi.currentPage > 1}">
				<c:url var="researchBack" value="previousResearchMain.corpResearch">
					<c:param name="currentPage" value="${pi.currentPage - 1}"/>
					<c:if test="${ !empty param.researchState }">
						<c:param name="researchState" value="${param.researchState}"/>
					</c:if>
					<c:if test="${ !empty param.researchName }">
						<c:param name="researchName" value="${param.researchName}"/>
					</c:if>
				</c:url>
				<a href="${researchBack}"><span>[이전]</span></a>&nbsp;
			</c:if>
			
			<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
				<c:if test="${p eq pi.currentPage }">
					<span style="color: #4169E1; font-weight: bold; font-size: 15pt;">${ p }</span>
				</c:if>
				<c:if test="${p ne pi.currentPage }">
					<c:url var="researchCheck" value="previousResearchMain.corpResearch">
						<c:param name="currentPage" value="${ p }"/>
						<c:if test="${ !empty param.researchState }">
							<c:param name="researchState" value="${param.researchState}"/>
						</c:if>
						<c:if test="${ !empty param.researchName }">
							<c:param name="researchName" value="${param.researchName}"/>
						</c:if>
					</c:url>
					<a href="${ researchCheck }"><span>${ p }</span></a>
				</c:if>
				
			</c:forEach>
			
			<c:if test="${pi.currentPage < pi.maxPage}">
				<c:url var="researchNext" value="previousResearchMain.corpResearch">
					<c:param name="currentPage" value="${pi.currentPage + 1}"/>
					<c:if test="${ !empty param.researchState }">
						<c:param name="researchState" value="${param.researchState}"/>
					</c:if>
					<c:if test="${ !empty param.researchName }">
						<c:param name="researchName" value="${param.researchName}"/>
					</c:if>
				</c:url>
				&nbsp;<a href="${researchNext}"><span>[다음]</span></a>
			</c:if>
			<c:if test="${pi.currentPage >= pi.maxPage}">
				&nbsp; <span>[다음]</span>
			</c:if>
			
			<c:url var="researchEnd" value="previousResearchMain.corpResearch">
				<c:param name="currentPage" value="${pi.maxPage}"/>
				<c:if test="${ !empty param.researchState }">
					<c:param name="researchState" value="${param.researchState}"/>
				</c:if>
				<c:if test="${ !empty param.researchName }">
					<c:param name="researchName" value="${param.researchName}"/>
				</c:if>
			</c:url>
			<a href="${researchEnd}"><span>[마지막]</span></a>&nbsp;
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/panel/common/footer.jsp"/>
	<script>
		$('.clearable.example .ui.selection.dropdown').dropdown({
			clearable: true
		});
		$('.multiple.selection.dropdown').dropdown({
		    allowAdditions: true,
		    maxSelections: 3
		  });
		
		$("#researchMenu td div").eq(2).addClass("on");
		
		$(document).on("click", "#researchTable tr", function(){
			var researchNo = $(this).find("td").eq(0).text();
			location.href = "previousResearchDetail.corpResearch?researchNo=" + researchNo;
		});
		$(document).on("mouseenter", "#researchTable tr", function(){
			$(this).css({"background":"#FAFAFA", "cursor":"pointer"});
		});
		$(document).on("mouseleave", "#researchTable tr", function(){
			$(this).css("background","white");
		});
	</script>

</body>
</html>