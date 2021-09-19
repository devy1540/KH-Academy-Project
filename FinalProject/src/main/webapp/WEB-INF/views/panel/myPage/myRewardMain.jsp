<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/views/panel/common/head.jsp" />
</head>
<style>
.ui.circular.segment {
	width: 230px;
	height: 230px;
	display: inline-block;
	margin: 0;
	margin-left: 20px;
	margin-right: 20px;
	padding-top: 80px;
	background-color: #F8F8F8;
}

.message, .segment {
	height: 150px;
	width: 290px;
}

.now {
	height: 150px;
	width: 290px;
	background-color: olive;
	border
}
#reward1,#reward2,#reward3{
	font-size: 15px;
	
}
#icon1,#icon2,#icon3{
	padding-top:20px;
	padding-left:10px;
	font-size: 70px !important;
}
.reward{
	font-size: 25px;
	font-weight: bold;
}

</style>
<body>
	<c:if test="${ loginUser != null }">
		<div class="wrap">
			<jsp:include page="/WEB-INF/views/panel/common/header.jsp" />
			<section class="container">
				<br />


				<table id="titleTable" height="10px;" width="99%;">
					<tr>
						<td id="menuTitle">내 리워드 관리</td>
						<td id="pagePath">
							<div class="ui breadcrumb">
								<a class="section" id="depth1" href="panelMain.panel">Home</a> <i
									class="right angle icon divider"></i> <a class="section"
									id="depth2" href="myInfo.panel">마이페이지</a> <i
									class="right angle icon divider"></i>
								<div class="active section" id="depth3">내 리워드 관리</div>
							</div>
						</td>
					</tr>
				</table>

				<div class="sectionLine">
					<hr>
				</div>
				<div style="margin-bottom: 60px;">
					<span style="font-size: 1vw; padding-left: 40px;"><b>회원님의
							현재 리워드 현황입니다.</b></span>
				</div>
				<table style="margin: 0 auto;" id="rewardTable">
					<tr>
						<td>
							<div class="ui teal segment">
								<table style="width:280px; height:120px;" id="reward1">
									<tr>
										<td rowspan="2"><i class="stack overflow icon" id="icon1"></i></td>
										<td><b>지금까지 모은 총 리워드</b></td>
									</tr>
									<tr >
										<td align="center"><p class="reward" >${totalReward }p</p></td>
									</tr>
								</table>
							</div>
						</td>
						<td></td>
						<td></td>
						<td></td>
						<td>
							<div class="ui green segment">
								<table style="width:280px; height:120px;" id="reward2">
									<tr>
										<td rowspan="2">
											<!-- <i class="hand holding usd icon" id="icon2"></i> -->
											<i class="donate icon" id="icon2"></i>
										</td>
										<td><b>지금까지 사용한 총 리워드</b></td>
									</tr>
									<tr >
										<td align="center"><p class="reward">${useReward }p</p></td>
									</tr>
								</table>
							</div>
						</td>
						<td></td>
						<td></td>
						<td></td>
						<td>
							<div class="ui teal inverted segment">
								<table style="width:280px; height:120px;" id="reward3">
									<tr>
										<td rowspan="2"><i class="coins icon" id="icon3"></i></td>
										<td><b>현재 보유 리워드</b></td>
									</tr>
									<tr >
										<td align="center"><p class="reward">${nowMyReward }p</p></td>
									</tr>
								</table>
							</div>
						</td>
					<tr>
				</table>



				<div align="center" style="margin-top: 80px;">
					<button class="ui blue button"
						onclick="location.href='myRewardDetail_saved.myPage'">리워드
						상세내역</button>
					<button class="ui blue button"
						onclick="location.href='myRewardCashOut.myPage'">리워드 신청하기</button>
				</div>


				<br />
			</section>
			<!-- container end -->
			<jsp:include page="/WEB-INF/views/panel/common/footer.jsp" />
		</div>
		<!-- wrap end -->
	</c:if>
	<c:if test="${ loginUser == null }">
		<script>
			location.href = "panelResult.panel?message=notLoginAccess";
		</script>
	</c:if>
</body>
</html>