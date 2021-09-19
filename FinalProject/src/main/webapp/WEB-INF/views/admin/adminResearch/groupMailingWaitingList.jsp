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
		height: 30px;
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
</style>
</head>
<body>
	<jsp:include page="../common/adminMenuBar.jsp"/>
	
	<div id="adminBox">
		<table id="adminBoxTable">
			<tr>
				<td>
					<div id="approvalBtnArea">
						<!-- <button onclick="location.href='researchWaitingPayment.admin'">협의중</button>
						<button onclick="location.href='researchConsultationCompleted.admin'">협의완료</button> -->
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div id="adminTitle">
						단체 메일링 대기 목록
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
					<th style="width: 10%;">리서치 번호</th>
					<th style="width: 10%;">기업명</th>
					<th style="width: 30%;">리서치 제목</th>
					<th style="width: 10%;">응답인원/목표인원</th>
					<th style="width: 10%;">예상완료날짜</th>
					<th style="width: 10%;">최근전송날짜</th>
					<th style="width: 10%;">상태</th>
					<th style="width: 10%;">메일전송</th>
				</tr>
			</thead>
			<tbody id="listTbody">
				<c:forEach var="mailingList" items="${ mailingList }">
					<tr class="tableContext">
						<td>${ mailingList.researchNo }</td>
						<td>${ mailingList.companyName }</td>
						<td>${ mailingList.researchName }</td>
						<td>10 / ${ mailingList.researchEngagementGoals }</td>
						<td>${ mailingList.researchPeriod }</td>
						<td>${ mailingList.currentMailingDate }</td>
						<td>
							<c:if test="${ mailingList.researchStateNo == 5 }">
								리서치 대기중
							</c:if>
							<c:if test="${ mailingList.researchStateNo == 6 }">
								${ mailingList.researchStatus }차 배포중
							</c:if>
						</td>
						<td><input type="button" value="메일 전송" class="sendBtn"></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div id="pagingArea" align="center">
					<c:url var="MailingListFirst" value="groupMailingWaitingList.admin">
						<c:param name="currentPage" value="${1}" />
						<c:if test="${ !empty param.researchName }">
							<c:param name="researchName" value="${param.researchName}" />
						</c:if>
					</c:url>
					<a href="${ MailingListFirst }"><span>[처음]</span></a>&nbsp;

					<c:if test="${pi.currentPage <= 1}">
						<span>[이전]</span> &nbsp;
			</c:if>
					<c:if test="${pi.currentPage > 1}">
						<c:url var="MailingListBack" value="groupMailingWaitingList.admin">
							<c:param name="currentPage" value="${pi.currentPage - 1}" />
							<c:if test="${ !empty param.researchName }">
								<c:param name="researchName" value="${param.researchName}" />
							</c:if>
						</c:url>
						<a href="${MailingListBack}"><span>[이전]</span></a>&nbsp;
			</c:if>

					<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
						<c:if test="${p eq pi.currentPage }">
							<span style="color: #4169E1; font-weight: bold; font-size: 15pt;">${ p }</span>
						</c:if>
						<c:if test="${p ne pi.currentPage }">
							<c:url var="MailingListCheck" value="groupMailingWaitingList.admin">
								<c:param name="currentPage" value="${ p }" />
								<c:if test="${ !empty param.researchName }">
									<c:param name="researchName" value="${param.researchName}" />
								</c:if>
							</c:url>
							<a href="${ MailingListCheck }"><span>${ p }</span></a>
						</c:if>

					</c:forEach>

					<c:if test="${pi.currentPage < pi.maxPage}">
						<c:url var="MailingListNext" value="groupMailingWaitingList.admin">
							<c:param name="currentPage" value="${pi.currentPage + 1}" />
							<c:if test="${ !empty param.researchName }">
								<c:param name="researchName" value="${param.researchName}" />
							</c:if>
						</c:url>
				&nbsp;<a href="${MailingListNext}"><span>[다음]</span></a>
					</c:if>
					<c:if test="${pi.currentPage >= pi.maxPage}">
				&nbsp; <span>[다음]</span>
					</c:if>

					<c:url var="MailingListEnd" value="groupMailingWaitingList.admin">
						<c:param name="currentPage" value="${pi.maxPage}" />
						<c:if test="${ !empty param.researchName }">
							<c:param name="researchName" value="${param.researchName}" />
						</c:if>
					</c:url>
					<a href="${MailingListEnd}"><span>[마지막]</span></a>&nbsp;
				</div>
				<!-- #pagingArea end -->
	</div>
	
	<div class="ui tiny modal" id="sendMailModal">
		<div class="header">메일 전송중</div>
		<div class="content" style="margin: 0 auto; width: fit-content;">
			<img alt="sendMail.gif" src="${ contextPath }/resources/images/sendMail.gif" style="width: 400px;">
		</div>
	</div>
		
	
	<script>
	
	$(".sendBtn").on("click", function(){
		var researchNo = $(this).parent().parent().children().eq(0).text();
		console.log(researchNo);
		Swal.fire({
		  	title: '정말 메일을 보내시겠습니까?',
		  	text: "이 결정은 되돌릴 수 없습니다!",
		  	icon: 'warning',
		  	showCancelButton: true,
		  	confirmButtonColor: '#3085d6',
		  	cancelButtonColor: '#d33',
		  	confirmButtonText: 'Yes'
		}).then((result) => {
		  console.log(result.value);
		  if(result.value) {
			  $("#sendMailModal").modal("show");
			  $.ajax({
				  url: "researchTargetMailing.adminResearch",
				  type: "post",
				  data: {
					  researchNo: researchNo
				  },
				  success: function(data) {
					  		$("#sendMailModal").modal("hide");
					  		Swal.fire('메일 전송 완료!', '메일 전송을 완료 하였습니다.', 'success').then(function(){
					  			location.reload()
					  		});
				  },
				  error: function(data) {
					  console.log("ajax 실패");
				  }
			  });
		  }
		})
	});
	
	
	
	
		$(".topMenu:nth-child(2)").addClass("active");
		$(".topMenu:nth-child(2)").find(".innerMenu:nth-child(4)").addClass("on");
	</script>
</body>
</html>