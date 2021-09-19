<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/views/panel/common/head.jsp" />
</head>
<style>
#depth1, #depth2, #depth3, #depth4 {
	color: #494949;
}
#depth1:hover, #depth2:hover, #depth3:hover {
	color: #008499;
	cursor: pointer;
}
/* 여기까지 페이지제목 및 경로 영역 */

.ui.tabular.menu .active.item {
	width: 20%;
	padding-left: 6%;
	cursor: default;
}
.ui.tabular.menu .item {
	width: 20%;
	padding-left: 6%;
}
.usedTableArea {
	border-top: 1px solid #3C3C3C;
	border-collapse: collapse;
}
#usedTheadArea {
	background-color: #DBDBDB;
}

#usedTheadArea>tr>th {
	height: 25px;
}
#usedTbodyArea {
	text-align: center;
}

#usedTbodyArea>tr {
	border-top: 1px solid #C4C4C4;
	border-bottom: 1px solid #C4C4C4;
}

#usedTbodyArea>tr>td {
	height: 45px;
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
<script>
	$(function(){
		var list = '${list}';
		console.log(list);
	})
</script>
	<div class="wrap">
		<jsp:include page="/WEB-INF/views/panel/common/header.jsp" />
		<section class="container">
		<br />
		
		
			<table id="titleTable" height="10px;" width="99%;">
				<tr>
					<td id="menuTitle">상세내역</td>
					<td id="pagePath">
						<div class="ui breadcrumb">
							<a class="section" id="depth1" href="panelMain.panel">Home</a>
							<i class="right angle icon divider"></i>
							<a class="section" id="depth2" href="myInfo.panel">마이페이지</a>
							<i class="right angle icon divider"></i>
							<a class="section" id="depth3" href="myRewardMain.panel">내 리워드 관리</a>
							<i class="right angle icon divider"></i>
							<div class="active section" id="depth4">상세내역</div>
						</div>
					</td>
				</tr>
			</table>
			
			<div class="sectionLine">
				<hr>
			</div>
			
			<div class="ui tabular menu">
				<a class="item" onclick="location.href='myRewardDetail_saved.myPage'"> 적립내역 </a>
				<a class="item active"> 사용내역 </a>
			</div>
			
			<div class="contentsArea">
				<div class="usedArea" style="width: 100%;">
					<br />
					<table class="usedTableArea" style="width: inherit;">
						<thead id="usedTheadArea">
							<tr>
								<th style="width: 10%;">리워드번호</th>
								<th style="width: 20%;">신청내역</th>
								<th style="width: 20%;">신청날짜</th>
								<th style="width: 20%;">캐시아웃 상태</th>
								<th style="width: 15%;">신청 리워드</th>
								<th style="width: 15%;">잔여 리워드</th>
							</tr>
						</thead>  <!-- #usedTheadArea end -->
						<tbody  id="usedTbodyArea">
							<c:forEach var="reward" items="${list }">
							<tr>
								<td>${reward.rewardHistoryNo}</td>
								<c:if test="${reward.surveyNo !=0 }">
								<td>${reward.surveyTitle }</td>
								</c:if>
								<c:if test="${reward.cashoutHistoryNo !=0 }">
								<td>${reward.changeReason }</td>
								</c:if>
								
								
								<td>${reward.rewardChangeDate }</td>
								<td><c:if test="${reward.cashoutHistoryNo !=0 }">
										<c:if test="${reward.cashConfirmDate != null and reward.cashConfirmDate != ''}">
											완료
										</c:if>
										<c:if test="${reward.cashConfirmDate == null}">
											확인 중
										</c:if>
									</c:if>
									<c:if test="${reward.cashoutHistoryNo ==0 }">
									<c:if test="${reward.surveyNo !=0 }">-</c:if> 
									</c:if>
								</td>
								<td>${reward.changeAmount }</td>
								<td>${reward.afterChangePoint }</td>
							</tr>
						</c:forEach>
						</tbody>  <!-- #usedTbodyArea end -->
					</table>  <!-- .usedTableArea end -->
				</div>  <!-- .usedArea end -->
				<div id="pagingArea" align="center">
					<c:url var="rewardListFirst"
						value="myRewardDetail_used.myPage">
						<c:param name="currentPage" value="${1}" />
						
					</c:url>
					<a href="${rewardListFirst}"><span>[처음]</span></a>&nbsp;

					<c:if test="${pi.currentPage <= 1}">
						<span>[이전]</span> &nbsp;
			</c:if>
					<c:if test="${pi.currentPage > 1}">
						<c:url var="rewardListBack"
							value="myRewardDetail_used.myPage">
							<c:param name="currentPage" value="${pi.currentPage - 1}" />
							
						</c:url>
						<a href="${rewardListBack}"><span>[이전]</span></a>&nbsp;
			</c:if>

					<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
						<c:if test="${p eq pi.currentPage }">
							<span style="color: #4169E1; font-weight: bold; font-size: 15pt;">${ p }</span>
						</c:if>
						<c:if test="${p ne pi.currentPage }">
							<c:url var="rewardListCheck"
								value="myRewardDetail_used.myPage">
								<c:param name="currentPage" value="${ p }" />
								
							</c:url>
							<a href="${ rewardListCheck }"><span>${ p }</span></a>
						</c:if>

					</c:forEach>

					<c:if test="${pi.currentPage < pi.maxPage}">
						<c:url var="rewardListNext"
							value="myRewardDetail_used.myPage">
							<c:param name="currentPage" value="${pi.currentPage + 1}" />
							
						</c:url>
				&nbsp;<a href="${rewardListNext}"><span>[다음]</span></a>
					</c:if>
					<c:if test="${pi.currentPage >= pi.maxPage}">
				&nbsp; <span>[다음]</span>
					</c:if>

					<c:url var="rewardListEnd" value="myRewardDetail_used.myPage">
						<c:param name="currentPage" value="${pi.maxPage}" />
						
					</c:url>
					<a href="${rewardListEnd}"><span>[마지막]</span></a>&nbsp;
				</div>
				<!-- #pagingArea end -->
				
			</div>  <!-- .contentsArea end -->
		<br />
		</section>  <!-- container end -->
		<jsp:include page="/WEB-INF/views/panel/common/footer.jsp" />
	</div>  <!-- wrap end -->
</body>
</html>












