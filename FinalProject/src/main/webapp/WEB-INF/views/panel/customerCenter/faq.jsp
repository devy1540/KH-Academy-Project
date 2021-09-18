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
	#faqTableArea {
		border-top: 1px solid #3C3C3C;
		border-collapse: collapse;
	}
	
	#faqTheadArea {
		background-color: #DBDBDB;
	}
	
	#faqTheadArea>tr>th {
		height: 25px;
	}
	
	#faqTbodyArea {
		text-align: center;
	}
	
	#faqTbodyArea>tr {
		border-top: 1px solid #C4C4C4;
		border-bottom: 1px solid #C4C4C4;
	}
	
	#faqTbodyArea>tr>td {
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
	/* 페이징 css end */
	.insetBox {
		width: 100px;
		background: #FBFBFB;
		box-shadow: 0px 4px 4px #E2E2E2 inset;
	}
	
	#searchFaq {
		margin-top: 10px;
		margin-left: 10px;
	}
	
	#searchFaq, .ui.action.input {
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
	.ui.selection.dropdown {
		float: left !important;
	}
</style>
<body>
	<div class="wrap">
		<jsp:include page="/WEB-INF/views/panel/common/header.jsp" />
		<section class="container">
			<br />
			<table id="titleTable" height="10px;" width="99%;">
				<tr>
					<td id="menuTitle">자주묻는 질문</td>
					<td id="pagePath">
						<div class="ui breadcrumb">
							<a class="section" id="depth1" href="panelMain.panel">Home</a> <i
								class="right angle icon divider"></i> <a class="section"
								id="depth2" href="notice.panel">고객센터</a> <i
								class="right angle icon divider"></i>
							<div class="active section" id="depth3">자주묻는 질문</div>
						</div>
					</td>
				</tr>
			</table>
			<!-- #titleTable end -->

			<div class="sectionLine">
				<hr>
			</div>
			<!-- .sectionLine end -->

			<div class="faqContentsArea" style="width: 100%;">
				<div class="faqSearchArea" align="right">

					<table style="width: 100%;">
						<tr>
							<td style="height: fit-content;">
								<form action="faq.customerCenter" method="get">
									<div id="searchInput">
										<div class="ui action input">
											<input type="text" name="faqTitle" placeholder="제목을 입력하세요">
											<input type="hidden" value="${loginUser.mno}" name="mno">
											<button class="ui icon button" type="submit">
												<i class="search icon"></i>
											</button>
										</div>
									</div>

									<select class="ui dropdown" name="faqCategoryNo" id="userType"
										style="float: right !important;">
										<option value="0">전체</option>
										<option value="1">가입</option>
										<option value="2">조사</option>
										<option value="3">리워드</option>
										<option value="4">이벤트</option>
										<option value="5">기타</option>
									</select>
								</form>
							</td>
						</tr>
					</table>

				</div>
				<!-- faqSearchArea end -->
				<br />
				<div class="faqArea ui styled fluid accordion"
					style="width: inherit;">
					<table id="faqTableArea" align="center" style="width: inherit;">
						<thead id="faqTheadArea">
							<tr>
								<th style="width: 10%;">글 번호</th>
								<th style="width: 60%;">제목</th>
								<th style="width: 10%;">카테고리</th>
							</tr>
						</thead>
						<!-- #faqTheadArea end -->
						<tbody id="faqTbodyArea">
							<c:forEach var="Faq" items="${list}">
								<tr class="title"
									style="color: black !important; font-weight: normal;">
									<td>${Faq.faqNo }</td>
									<td>${Faq.faqTitle }</td>
									<td><c:if test="${Faq.faqCategoryNo == 1 }">
                           					가입
                           				</c:if> <c:if test="${Faq.faqCategoryNo == 2 }">
                           					조사
                           				</c:if> <c:if test="${Faq.faqCategoryNo == 3 }">
                           					리워드
                           				</c:if> <c:if test="${Faq.faqCategoryNo == 4 }">
                           					이벤트
                           				</c:if> <c:if test="${Faq.faqCategoryNo == 5 }">
                           					기타
                           				</c:if></td>
								</tr>
								<tr class="content insetBox">
									<td colspan="4" style="padding: 100px;"><span
										style="text-align: center;"> <c:out
												value="${Faq.faqContext }" />
									</span>
										<div style="height: 50px;"></div> <c:if
											test="${sessionScope.loginUser.userType eq '관리자' }">
											<input type="hidden" class="faqNo" value="${Faq.faqNo }">
											<input type="hidden" class="faqTitle"
												value="${Faq.faqTitle }">
											<input type="hidden" class="faqContext"
												value="${Faq.faqContext }">
											<input type="hidden" class="faqCategoryNo"
												value="${Faq.faqCategoryNo}">
											<button class="ui icon button" id="updateFaq">수정하기</button>
											<button class="ui icon button" id="deleteFaq">삭제하기</button>
										</c:if></td>

								</tr>


							</c:forEach>

						</tbody>
						<!-- #faqTbodyArea end -->

					</table>
					<!-- #faqTableArea end -->
				</div>
				<c:if test="${sessionScope.loginUser.userType eq '패널' }">
					<div style="height: 50px;"></div>
					<div align="center">원하시는 답변을 찾을 수 없다면 1:1문의를 이용하여 주시기 바랍니다.</div>
				</c:if>
				<c:if test="${sessionScope.loginUser.userType eq '관리자' }">
					<div align="right" style="margin-top: 30px;">
						<button class="ui icon button" id="newFaqBtn">작성하기</button>
					</div>
				</c:if>
				<!-- .faqArea end -->
				<div id="pagingArea" align="center">
					<c:url var="FaqListFirst" value="faq.customerCenter">
						<c:param name="currentPage" value="${1}" />
						<c:if test="${ !empty param.faqTitle }">
							<c:param name="faqTitle" value="${param.faqTitle}" />
						</c:if>
						<c:if test="${ !empty param.faqCategoryNo }">
							<c:param name="faqCategoryNo" value="${param.faqCategoryNo}" />
						</c:if>
					</c:url>
					<a href="${faqListFirst}"><span>[처음]</span></a>&nbsp;

					<c:if test="${pi.currentPage <= 1}">
						<span>[이전]</span> &nbsp;
			</c:if>
					<c:if test="${pi.currentPage > 1}">
						<c:url var="faqListBack" value="faq.customerCenter">
							<c:param name="currentPage" value="${pi.currentPage - 1}" />
							<c:if test="${ !empty param.faqTitle }">
								<c:param name="faqTitle" value="${param.faqTitle}" />
							</c:if>
							<c:if test="${ !empty param.faqCategoryNo }">
								<c:param name="faqCategoryNo" value="${param.faqCategoryNo}" />
							</c:if>
						</c:url>
						<a href="${faqListBack}"><span>[이전]</span></a>&nbsp;
			</c:if>

					<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
						<c:if test="${p eq pi.currentPage }">
							<span style="color: #4169E1; font-weight: bold; font-size: 15pt;">${ p }</span>
						</c:if>
						<c:if test="${p ne pi.currentPage }">
							<c:url var="faqListCheck" value="faq.customerCenter">
								<c:param name="currentPage" value="${ p }" />
								<c:if test="${ !empty param.faqTitle }">
									<c:param name="faqTitle" value="${param.faqTitle}" />
								</c:if>
								<c:if test="${ !empty param.faqCategoryNo }">
									<c:param name="faqCategoryNo" value="${param.faqCategoryNo}" />
								</c:if>
							</c:url>
							<a href="${ faqListCheck }"><span>${ p }</span></a>
						</c:if>

					</c:forEach>

					<c:if test="${pi.currentPage < pi.maxPage}">
						<c:url var="faqListNext" value="faq.customerCenter">
							<c:param name="currentPage" value="${pi.currentPage + 1}" />
							<c:if test="${ !empty param.faqTitle }">
								<c:param name="faqTitle" value="${param.faqTitle}" />
							</c:if>
							<c:if test="${ !empty param.faqCategoryNo }">
								<c:param name="faqCategoryNo" value="${param.faqCategoryNo}" />
							</c:if>
						</c:url>
				&nbsp;<a href="${faqListNext}"><span>[다음]</span></a>
					</c:if>
					<c:if test="${pi.currentPage >= pi.maxPage}">
				&nbsp; <span>[다음]</span>
					</c:if>

					<c:url var="faqListEnd" value="faq.customerCenter">
						<c:param name="currentPage" value="${pi.maxPage}" />
						<c:if test="${ !empty param.faqTitle }">
							<c:param name="faqTitle" value="${param.faqTitle}" />
						</c:if>
						<c:if test="${ !empty param.faqCategoryNo }">
							<c:param name="faqCategoryNo" value="${param.faqCategoryNo}" />
						</c:if>
					</c:url>
					<a href="${faqListEnd}"><span>[마지막]</span></a>&nbsp;
				</div>
				<!-- #pagingArea end -->

			</div>
			<!-- .faqContentsArea end -->
			<br />
		</section>
		<!-- container end -->
		<jsp:include page="/WEB-INF/views/panel/common/footer.jsp" />
	</div>
	<!-- wrap end -->

	<div class="ui modal" id="newFaqModal">
		<i class="close icon"></i>
		<div class="header">faq등록하기</div>
		<form action="faqWrite.customerCenter" method="post" id="faq">
			<div class="newfaqArea" style="width: 90%; height: 510px;"
				align="center">
				<table class="newfaqTableArea"
					style="width: inherit; height: inherit;">
					<tbody id="newfaqTbodyArea">
						<tr>
							<td style="text-align: center; height: 50px;">구분</td>
							<td>:</td>
							<td style="text-align: left;">
								<select class="ui dropdown" name="faqCategoryNo" id="faqCategoryNo" style="margin-left: 8px; float: left !important;">
									<option value="0">전체</option>
									<option value="1">가입</option>
									<option value="2">조사</option>
									<option value="3">리워드</option>
									<option value="4">이벤트</option>
									<option value="5">기타</option>
								</select>
							</td>
						</tr>
						<tr>
							<td style="text-align: center; height: 50px;">성명</td>
							<td>:</td>
							<td style="text-align: left; padding-left: 25px;">관리자 <input
								type="hidden" name="mno" value="${loginUser.mno}">
							</td>
						</tr>
						<tr>
							<td style="text-align: center; height: 50px;">제목</td>
							<td>:</td>
							<td><input class="ui input" type="text" name="faqTitle"
								style="width: 90%;" /></td>
						</tr>
						<tr>
							<td
								style="height: 350px; vertical-align: top; padding-top: 20px; text-align: center;">내용</td>
							<td style="vertical-align: top; padding-top: 20px;">:</td>
							<td style="vertical-align: top; padding-top: 20px;"><textarea
									name="faqContext" id=""
									style="width: 90%; height: 90%; resize: none;"></textarea></td>
						</tr>
					</tbody>
					<!-- newfaqTbodyArea end -->
				</table>
				<!-- newfaqTableArea end -->
			</div>
			<!-- newfaqArea end -->
		</form>
		<!-- form end -->
		<div class="actions">
			<div class="ui positive right button" id="question">등록하기</div>
			<div class="ui black deny button">취소하기</div>
		</div>
		<!-- #actions end -->

		<!-- 자주묻는 질문 수정하는 모달창 -->
		<div class="ui modal" id="updateFaqModal">
			<i class="close icon"></i>
			<div class="header">faq 수정하기</div>
			<form action="faqUpdate.customerCenter" method="post" id="faqUpdate">
				<div class="updatefaqArea" style="width: 90%; height: 510px;"
					align="center">
					<table class="updatefaqTableArea"
						style="width: inherit; height: inherit;">
						<tbody id="updateFaqTbodyArea">
							<tr id="categoryTr">
								<td style="text-align: center; height: 50px;">구분</td>
								<td>:</td>
								<td style="text-align: left;">
									<select class="ui dropdown" name="faqCategoryNo" id="faqCategoryNo" style="margin-left: 8px; float: left !important;">
									<option value="0">전체</option>
									<option value="1">가입</option>
									<option value="2">조사</option>
									<option value="3">리워드</option>
									<option value="4">이벤트</option>
									<option value="5">기타</option>
								</select>
								</td>
							</tr>
							<tr>
								<td style="text-align: center; height: 50px;">성명</td>
								<td>:</td>
								<td style="text-align: left; padding-left: 25px;">관리자 <input
									type="hidden" name="mno" value="${loginUser.mno}">
								</td>
							</tr>
							<tr>
								<td style="text-align: center; height: 50px;">제목</td>
								<td>:<input type="hidden" value="" id="updateFaqNo" name="faqNo"></td>
								<td><input class="ui input" type="text" id="updateFaqTitle"
									name="faqTitle" style="width: 90%;" value=""
									 /></td>
							</tr>
							<tr>
								<td
									style="height: 350px; vertical-align: top; padding-top: 20px; text-align: center;">내용</td>
								<td style="vertical-align: top; padding-top: 20px;">:</td>
								<td style="vertical-align: top; padding-top: 20px;"><textarea
										name="faqContext" id="updateFaqText"
										style="width: 90%; height: 90%; resize: none;"></textarea></td>
							</tr>
						</tbody>
						<!-- updatefaqTbodyArea end -->

					</table>
				</div>
			</form>
			<!-- updatefaqTableArea end -->
			<div class="actions">
				<div class="ui positive right button" id="updateGo">수정하기</div>
				<div class="ui black deny button">취소하기</div>
			</div>
			<!-- #actions end -->
		</div>
		<!-- updatefaqArea end -->
	</div>
	<script>
		$('.ui.accordion').accordion();
		$("#userType").dropdown();
		//$(".ui.dropdown").dropdown();
		$("#newFaqBtn").click(function() {
			$("#newFaqModal").modal("show");
		});
		
		var isActivated = "false";
		$('.ui.dropdown').mouseenter(function(){
			isActivated = "true";
			if(isActivated == "false"){
				$(this).dropdown();
			}
		}).mouseleave(function(){
			isActivated = "false";
			$(this).dropdown({on: 'hover'});
		})
		$('ui.selection.dropdown').dropdown();
		$("#question").click(function(){
			$("#faq").submit();
			Swal.fire(
				'완료!',
				'자주묻는 질문 등록이 완료 되었습니다',
				'success'
			)
		})

		$(document).on("click", "#deleteFaq",function(){
			var faqNo = $(this).parent().find(".faqNo").val();
			
			console.log(faqNo);
			   $.ajax({
				url:"deleteFaq.customerCenter",
			    type:"post",
				data:{
					faqNo:faqNo
				},
				success: function(data){
					if(data.num >0){
						 Swal.fire(
							      '삭제완료!',
							      '자주묻는 질문 삭제를 완료하였습니다.',
							      'success'
							    )
							    setTimeout(function(){
    							location.reload();
								},1500)
					}else{
						Swal.fire(
							      '삭제실패!',
							      '자주묻는 질문 삭제에 실패하였습니다.',
							      'error'
							    )
					}
				},
				error: function(data){
					console.log("에러");
				}
				
			}); 
		})
		
		$(document).on("click", "#updateFaq",function(){
			var faqNo = $(this).parent().find(".faqNo").val();
			var faqTitle = $(this).parent().find(".faqTitle").val();
			var faqContext = $(this).parent().find(".faqContext").val();
			var faqCategoryNo = $(this).parent().find(".faqCategoryNo").val();
			$("#updateFaqModal").modal("show");
			console.log(faqTitle);
			console.log(faqContext);
			$("#updateFaqNo").val(faqNo);
			$("#updateFaqTitle").val(faqTitle);
			$("#updateFaqText").val(faqContext);
			
		})
		
		$("#updateGo").click(function(){
			$("#faqUpdate").submit();
			Swal.fire(
				      '수정완료!',
				      '자주묻는 질문 삭제를 완료하였습니다.',
				      'success'
				    )
		});
	</script>
	
					<script>
					$(document).on("change", ".ui.dropdown", function () {
						var value = $(this).find("select").val(); 
						console.log(value);
					});
				</script>
</body>
</html>









































