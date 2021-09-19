<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/views/panel/common/head.jsp" />
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
</head>
<style>
#inquiryTableArea {
	border-top: 1px solid #3C3C3C;
	border-collapse: collapse;
}

.newInquiryTableArea, .inquiryDetailTableArea {
	border-collapse: collapse;
	border: 1px solid #b4b4b4;
	margin-left: auto !important;
}

.newInquiryTableArea>tbody>tr>td, .inquiryDetailTableArea>tbody>tr>td {
	border-top: 1px solid #b4b4b4;
	border-bottom: 1px solid #b4b4b4;
	text-align: center;
}

#inquiryTheadArea {
	background-color: #DBDBDB;
}

#inquiryTheadArea>tr>th {
	height: 25px;
}

#inquiryTbodyArea {
	text-align: center;
}

#inquiryTbodyArea>tr {
	border-top: 1px solid #C4C4C4;
	border-bottom: 1px solid #C4C4C4;
}

#inquiryTbodyArea>tr>td {
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

#newInquiryBtn {
	background-color: #00679A;
	border-radius: 5px;
	width: 120px;
	height: 35px;
	color: white;
	border: none;
	cursor: pointer;
}

.ui.selection.dropdown {
	min-width: 80px;
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

#searchInquiry {
	margin-top: 10px;
	margin-left: 10px;
}

#searchInquiry, .ui.action.input {
	width: 240px;
	height: 37px;
	font-size: 11pt;
	right: 10px;
	float: right;
}

#userType, .ui.dropdown {
	float: right !important;
	margin-right: 15px;
	width: 100px;
	min-width: 100px !important;
	padding-right: 10px !important;
}
/* 페이징 css end */
</style>
<body>
	<div class="wrap">
		<jsp:include page="/WEB-INF/views/panel/common/header.jsp" />
		<section class="container">
			<br />
			<table id="titleTable" height="10px;" width="99%;">
				<tr>
					<td id="menuTitle">내 1:1 문의</td>
					<td id="pagePath">
						<div class="ui breadcrumb">
							<a class="section" id="depth1" href="panelMain.panel">Home</a> <i
								class="right angle icon divider"></i> <a class="section"
								id="depth2" href="notice.panel">고객센터</a> <i
								class="right angle icon divider"></i>
							<div class="active section" id="depth3">내 1:1 문의</div>
						</div> <!-- .ui .breadcrumb end -->
					</td>
				</tr>
			</table>
			<!-- #titleTable end -->

			<div class="sectionLine">
				<hr>
			</div>
			<!-- .sectionLine end -->

			<div class="inquiryContentsArea" style="width: 100%;">
				<div class="inquirySearchArea" align="right">

					<table style="width: 100%;">
						<tr>
							<td style="height: fit-content;">
								<form action="panelInquiryList.customerCenter" method="get">
									<div id="searchInput">
										<div class="ui action input">
											<input type="text" name="inquiryTitle"
												placeholder="제목을 입력하세요"> <input type="hidden"
												value="${loginUser.mno}" name="mno">
											<button class="ui icon button" type="submit">
												<i class="search icon"></i>
											</button>
										</div>
									</div>

									<select class="ui dropdown" name="inquiryCategoryNo"
										id="userType" style="float: right;">
										<option value="0">전체</option>
										<option value="1">가입</option>
										<option value="2">조사</option>
										<option value="3">리워드</option>
										<option value="4">기타</option>
									</select>
								</form>
							</td>
						</tr>
					</table>

				</div>
				<!-- inquirySearchArea end -->
				<br />
				<div class="inquiryArea ui styled fluid accordion"
					style="width: inherit;">
					<table id="inquiryTableArea" align="center" style="width: inherit;">
						<thead id="inquiryTheadArea">
							<tr>
								<th style="width: 10%;">문의번호</th>
								<th style="width: 20%;">카테고리</th>
								<th style="width: 40%;">문의제목</th>
								<th style="width: 20%;">문의일자</th>
								<th style="width: 10%;">답변일자</th>

							</tr>
						</thead>
						<!-- #inquiryTheadArea end -->
						<tbody id="inquiryTbodyArea">
							<c:forEach var="Inquiry" items="${list }">
								<tr class="title"
									style="color: black !important; font-weight: normal;">
									<td>${ Inquiry.inquiryNo }</td>
									<td><c:if test="${Inquiry.inquiryCategoryNo == 1 }">
                           					가입
                           				</c:if> <c:if
											test="${Inquiry.inquiryCategoryNo == 2 }">
                           					조사
                           				</c:if> <c:if
											test="${Inquiry.inquiryCategoryNo == 3 }">
                           					리워드
                           				</c:if> <c:if
											test="${Inquiry.inquiryCategoryNo == 4 }">
                           					기타
                           				</c:if></td>
									<td><c:out value="${Inquiry.inquiryTitle }" /></td>
									<td><c:out value="${Inquiry.inquiryDate }" /></td>
									<td><c:if test="${Inquiry.inquiryAnswerDate == null}"> 
                           			 		답변 대기 
                           		 		</c:if> <c:if
											test="${Inquiry.inquiryAnswerDate != null }">
											<c:out value=" ${Inquiry.inquiryAnswerDate  }" />
										</c:if></td>
								</tr>
								<tr class="content">
									<td colspan="5">
										<div style="width: 100%; padding: 50px;">
											<span style="text-align: center;"> <c:out
													value="${Inquiry.inquiryContext }" />
											</span>
										</div> <c:if test="${Inquiry.inquiryAnswer != null}">
											<div style="width: 100%; padding: 50px;">
												<h4 class="ui horizontal divider header">
													<i class="comments icon"></i> 답변
												</h4>
												<div align="left" style="width: 100%; margin-left: 110px;">
												<c:out value="${Inquiry.inquiryAnswer }" />
												</div>
											</div>
										</c:if> <c:if test="${sessionScope.loginUser.userType eq '관리자' }">

											<div class="ui form" style="width: 100%; padding: 50px;">
												<div class="field">
													<textarea id="answerArea"></textarea>
												</div>
												<c:if test="${Inquiry.inquiryAnswer == null}">
													<div>
														<input type="hidden" value="${Inquiry.inquiryNo }"
															id="answerNo">
														<button class="ui icon button answerBtn">답변하기</button>
													</div>
												</c:if>
												<c:if test="${Inquiry.inquiryAnswer != null}">
													<div>
														<input type="hidden" value="${Inquiry.inquiryNo }"
															id="answerNo">
														<button class="ui icon button answerBtn">수정하기</button>
														<button class="ui icon button deleteAnswerBtn">답변
															삭제하기</button>
													</div>
												</c:if>
											</div>
										</c:if>
									</td>
								</tr>
							</c:forEach>

						</tbody>
						<!-- #inquiryTbodyArea end -->
					</table>
					<!-- #inquiryTableArea end -->
				</div>
				<!-- .inquiryArea end -->
				<c:if test="${sessionScope.loginUser.userType eq '패널' }">
					<div class="inquiryBtnArea" align="right" style="margin-top: 15px;">
						<button id="newInquiryBtn">1:1 문의하기</button>
					</div>
				</c:if>
				<!-- inquiryBtnArea end -->
				<div id="pagingArea" align="center">
					<c:url var="inquiryListFirst"
						value="panelInquiryList.customerCenter">
						<c:param name="currentPage" value="${1}" />
						<c:if test="${ !empty param.inquiryTitle }">
							<c:param name="inquiryTitle" value="${param.inquiryTitle}" />
						</c:if>
						<c:if test="${ !empty param.inquiryCategoryNo }">
							<c:param name="inquiryCategoryNo"
								value="${param.inquiryCategoryNo}" />
						</c:if>
					</c:url>
					<a href="${inquiryListFirst}"><span>[처음]</span></a>&nbsp;

					<c:if test="${pi.currentPage <= 1}">
						<span>[이전]</span> &nbsp;
			</c:if>
					<c:if test="${pi.currentPage > 1}">
						<c:url var="inquiryListBack"
							value="panelInquiryList.customerCenter">
							<c:param name="currentPage" value="${pi.currentPage - 1}" />
							<c:if test="${ !empty param.inquiryTitle }">
								<c:param name="inquiryTitle" value="${param.inquiryTitle}" />
							</c:if>
							<c:if test="${ !empty param.inquiryCategoryNo }">
								<c:param name="inquiryCategoryNo"
									value="${param.inquiryCategoryNo}" />
							</c:if>
						</c:url>
						<a href="${inquiryListBack}"><span>[이전]</span></a>&nbsp;
			</c:if>

					<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
						<c:if test="${p eq pi.currentPage }">
							<span style="color: #4169E1; font-weight: bold; font-size: 15pt;">${ p }</span>
						</c:if>
						<c:if test="${p ne pi.currentPage }">
							<c:url var="inquiryListCheck"
								value="panelInquiryList.customerCenter">
								<c:param name="currentPage" value="${ p }" />
								<c:if test="${ !empty param.inquiryTitle }">
									<c:param name="inquiryTitle" value="${param.inquiryTitle}" />
								</c:if>
								<c:if test="${ !empty param.inquiryCategoryNo }">
									<c:param name="inquiryCategoryNo"
										value="${param.inquiryCategoryNo}" />
								</c:if>
							</c:url>
							<a href="${ inquiryListCheck }"><span>${ p }</span></a>
						</c:if>

					</c:forEach>

					<c:if test="${pi.currentPage < pi.maxPage}">
						<c:url var="inquiryListNext"
							value="panelInquiryList.customerCenter">
							<c:param name="currentPage" value="${pi.currentPage + 1}" />
							<c:if test="${ !empty param.inquiryTitle }">
								<c:param name="inquiryTitle" value="${param.inquiryTitle}" />
							</c:if>
							<c:if test="${ !empty param.inquiryCategoryNo }">
								<c:param name="inquiryCategoryNo"
									value="${param.inquiryCategoryNo}" />
							</c:if>
						</c:url>
				&nbsp;<a href="${inquiryListNext}"><span>[다음]</span></a>
					</c:if>
					<c:if test="${pi.currentPage >= pi.maxPage}">
				&nbsp; <span>[다음]</span>
					</c:if>

					<c:url var="inquiryListEnd" value="panelInquiryList.customerCenter">
						<c:param name="currentPage" value="${pi.maxPage}" />
						<c:if test="${ !empty param.inquiryTitle }">
							<c:param name="inquiryTitle" value="${param.inquiryTitle}" />
						</c:if>
						<c:if test="${ !empty param.inquiryCategoryNo }">
							<c:param name="inquiryCategoryNo"
								value="${param.inquiryCategoryNo}" />
						</c:if>
					</c:url>
					<a href="${inquiryListEnd}"><span>[마지막]</span></a>&nbsp;
				</div>
				<!-- #pagingArea end -->
			</div>
			<!-- .inquiryContentsArea end -->
			<br />
		</section>
		<!-- container end -->
		<jsp:include page="/WEB-INF/views/panel/common/footer.jsp" />
	</div>
	<!-- wrap end -->

	<div class="ui modal" id="newInquiryModal">
		<i class="close icon"></i>
		<div class="header">문의하기</div>
		<form action="inquirywrite.customerCenter" method="post" id="inquery">
			<div class="newInquiryArea" style="width: 90%; height: 510px;"
				align="center">
				<table class="newInquiryTableArea"
					style="width: inherit; height: inherit;">
					<tbody id="newInquiryTbodyArea">
						<tr>
							<td style="height: 50px;">구분</td>
							<td>:</td>
							<td style="text-align: left;">
								<div class="ui selection dropdown"
									style="margin-left: 31px; float: left !important;">
									<input type="hidden" name="inquiryCategoryNo"> <i
										class="dropdown icon"></i>
									<div class="default text" data-value="0">선택</div>
									<div class="menu">
										<div class="item" data-value="1">가입</div>
										<div class="item" data-value="2">조사</div>
										<div class="item" data-value="3">리워드</div>
										<div class="item" data-value="4">기타</div>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td style="text-align: center; height: 50px;">성명</td>
							<td>:</td>
							<td style="text-align: left; padding-left: 25px;">
								${loginUser.userName } <input type="hidden" name="mno"
								value="${loginUser.mno}">
							</td>
						</tr>
						<tr>
							<td style="text-align: center; height: 50px;">제목</td>
							<td>:</td>
							<td><input class="ui input" type="text" name="inquiryTitle"
								style="width: 90%;" /></td>
						</tr>
						<tr>
							<td
								style="height: 350px; vertical-align: top; padding-top: 20px;">내용</td>
							<td style="vertical-align: top; padding-top: 20px;">:</td>
							<td style="vertical-align: top; padding-top: 20px;"><textarea
									name="inquiryContext" id=""
									style="width: 90%; height: 90%; resize: none;"></textarea></td>
						</tr>
					</tbody>
					<!-- newInquiryTbodyArea end -->
				</table>
				<!-- newInquiryTableArea end -->
			</div>
			<!-- newInquiryArea end -->
		</form>
		<!-- form end -->
		<div class="actions">
			<div class="ui positive right button" id="question">문의하기</div>
			<div class="ui black deny button">취소하기</div>
		</div>
		<!-- #actions end -->
	</div>
	<!-- newInquiryModal end -->




	<script>
		$('.ui.accordion').accordion();
		$("#userType").dropdown();
		$("#newInquiryBtn").click(function() {
			$("#newInquiryModal").modal("show");
		});
		
		 $("#question").click(function(){
			 $("#inquery").submit();
			 Swal.fire(
		               '완료!',
		               '1:1 문의 등록이 완료 되었습니다',
		               'success'
		             )
		}); 
		var isActivated = "false";
		$('.ui.dropdown').mouseenter(function(){
			if(isActivated == "false"){
				$(this).dropdown();
			}
			isActivated = "true";
		})
		
		$(document).on("click",".answerBtn", function(){
			var answerNo = $(this).parent().find("#answerNo").val();
			var answer = $(this).parent().parent().find("#answerArea").val();
			
			$.ajax({
				url:"answerInquiry.customerCenter",
				type:"post",
				data:{
					answerNo:answerNo,
					answer:answer
				},
				success:function(data){
					
					 Swal.fire(
				               '완료!',
				               '1:1 문의 답변이 완료 되었습니다',
				               'success'
				             )
				               setTimeout(function(){
    							location.reload();
								},1500); 
				},
				error:function(){
					console.log("에러");
				}
			});
			
		});
		
		$(document).on("click",".deleteAnswerBtn",function(){
			var answerNo = $(this).parent().find("#answerNo").val();
			console.log(answerNo);
			$.ajax({
				url:"deleteAnswerInquiry.customerCenter",
				type:"post",
				data:{
					answerNo:answerNo
				},
				success:function(data){
					console.log(data.num);
					 Swal.fire(
				               '완료!',
				               '1:1 문의 답변이 삭제 되었습니다',
				               'success'
				             )
				               setTimeout(function(){
  							location.reload();
								},1500); 
				},error:function(){
					console.log("에러");
				}
			});
		});
		</script>


</body>
</html>











