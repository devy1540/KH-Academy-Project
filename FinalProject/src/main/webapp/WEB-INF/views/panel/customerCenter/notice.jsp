<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/views/panel/common/head.jsp"/>
</head>
<style>
#noticeTableArea {
	border-top: 1px solid #3C3C3C;
	border-collapse: collapse;
}

#noticeTheadArea {
	background-color: #DBDBDB;
}

#noticeTheadArea>tr>th {
	height: 25px;
}

#noticeTbodyArea {
	text-align: center;
}

#noticeTbodyArea>tr {
	border-top: 1px solid #C4C4C4;
	border-bottom: 1px solid #C4C4C4;
}

#noticeTbodyArea>tr>td {
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

#write {
	float: right;
	margin-top: 2%;
	margin-right: 2%;
}

.insetBox {
	width: 100px;
	background: #FBFBFB;
	box-shadow: 0px 4px 4px #E2E2E2 inset;
}
#noticeTbodyArea textarea:focus {
	outline: none;
}
.noticeContext {
	/* 드래그 방지용 소스*/
	-ms-user-select: none; 
	-moz-user-select: -moz-none; 
	-webkit-user-select: none; 
	-khtml-user-select: none; 
	user-select:none;
	/* 드래그 방지용 소스*/
	
	border: 0;
	background: none;
}

	.actions{
		text-align: center !important;
	}
	
	#writeTb, #editTb {
		width: 60%;
		margin: 20px auto;
		
		border-spacing: 0px;
  		border-collapse: separate;
	}
	
	#writeTb td, #writeTb th, #editTb td, #editTb td{
		border-bottom: 1px solid lightgray;
		padding-top: 20px;
		padding-bottom: 20px;
		height: 50px;
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
					<td id="menuTitle">공지사항</td>
					<td id="pagePath">
						<div class="ui breadcrumb">
							<a class="section" id="depth1" href="panelMain.panel">Home</a> <i
								class="right angle icon divider"></i> <a class="section"
								id="depth2" href="notice.panel">고객센터</a> <i
								class="right angle icon divider"></i>
							<div class="active section" id="depth3">공지사항</div>
						</div>
					</td>
				</tr>
			</table>

			<div class="sectionLine">
				<hr>
			</div>

			<div class="noticeContentsArea" style="width: 100%;">
				<div class="noticeSearchArea" align="right">
					<form action="notice.customerCenter" method="get">
					<table>
						<tr>
							<td>
								<h4>검색어</h4>
							</td>
							<td></td>
							<td></td>
							<td>
								<div class="ui input">
									<input type="search" name="searchValue" />
								</div>
							</td>
							<td>
								<div>
								<button type="submit" id="searchBtn">검색</button>
								</div>
							</td>
						</tr>
					</table>
					</form>
				</div>
				<!-- noticeSearchArea end -->
				<br />
				<div class="noticeArea ui styled fluid accordion" style="width: inherit;">
					<table id="noticeTableArea" align="center" style="width: inherit;">
						<thead id="noticeTheadArea">
							<tr>
								<th style="width: 10%;">번호</th>
								<th style="width: 70%;">제목</th>
								<th style="width: 20%;">작성일</th>

							</tr>
						</thead>
						<!-- #noticeTheadArea end -->
							<tbody id="noticeTbodyArea">
								
								<c:forEach var="notice" items="${noticeList }">
									<tr class="title" style="color:black !important; font-weight:normal;">
										<td>${notice.noticeNo }</td>
										<td>${notice.noticeTitle }</td>
										<td>${notice.noticeDate }</td>
									</tr>
									<tr class="content insetBox">
										<td colspan="4" style="padding-top: 30px; padding-bottom: 30px;">
											<span style="text-align: center; padding-top: 20px; padding-bottom: 20px; margin: 10px auto;">
												<textarea class="noticeContext" id="writeNoticeContexts" readonly style="width: 60%; height: 400px; resize: none;">${notice.noticeContext }</textarea>
											</span>
											<c:if test="${ loginUser.userType eq'관리자' }">
												<div>
													<button class="ui primary button edit">
													  	수정하기
													</button>
													<button class="ui button delete">
													  	삭제하기
													</button>
												</div>
												</c:if>
										</td>
									</tr>
								
									
									
								</c:forEach>
								<%-- <c:if test="${ not empty param.noticeNo }">
									<script>
										console.log(${ param.noticeNo })
										var t1 = $("#noticeTbodyArea").children().children();
										console.log(t1);
										console.log($("t1:nth-child()"));
									</script>
								</c:if> --%>
								
							</tbody>
						<!-- #noticeTbodyArea end -->
					</table>
					<!-- #noticeTableArea end -->
				</div>
				<!-- .noticeArea end -->
				<c:if test="${loginUser.userType eq'관리자' }" >
					<button class="ui primary button" id="write">글쓰기</button>
				</c:if>
				
				<div id="pagingArea" align="center" style="margin-top: 50px;">
					<c:url var="noticeListFirst" value="notice.customerCenter">
						<c:param name="currentPage" value="${1}" />
						<c:if test="${ !empty param.searchValue }">
							<c:param name="searchValue" value="${param.searchValue}" />
						</c:if>
					</c:url>
					<a href="${noticeListFirst}"><span>[처음]</span></a>&nbsp;

					<c:if test="${pi.currentPage <= 1}">
						<span>[이전]</span> &nbsp;
					</c:if>
					<c:if test="${pi.currentPage > 1}">
						<c:url var="noticeListBack" value="notice.customerCenter">
							<c:param name="currentPage" value="${pi.currentPage - 1}" />
							<c:if test="${ !empty param.searchValue }">
							<c:param name="searchValue" value="${param.searchValue}" />
						</c:if>
						</c:url>
						<a href="${noticeListBack}"><span>[이전]</span></a>&nbsp;
					</c:if>

					<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
						<c:if test="${p eq pi.currentPage }">
							<span style="color: #4169E1; font-weight: bold; font-size: 15pt;">${ p }</span>
						</c:if>
						<c:if test="${p ne pi.currentPage }">
							<c:url var="noticeListCheck" value="notice.customerCenter">
								<c:param name="currentPage" value="${ p }" />
								<c:if test="${ !empty param.searchValue }">
							<c:param name="searchValue" value="${param.searchValue}" />
						</c:if>
							</c:url>
							<a href="${ noticeListCheck }"><span>${ p }</span></a>
						</c:if>

					</c:forEach>
					
					
				

					<c:if test="${pi.currentPage < pi.maxPage}">
						<c:url var="noticeListNext" value="notice.customerCenter">
							<c:param name="currentPage" value="${pi.currentPage + 1}" />
							<c:if test="${ !empty param.searchValue }">
							<c:param name="searchValue" value="${param.searchValue}" />
						</c:if>
						</c:url>
				&nbsp;<a href="${noticeListNext}"><span>[다음]</span></a>
					</c:if>
					<c:if test="${pi.currentPage >= pi.maxPage}">
				&nbsp; <span>[다음]</span>
					</c:if>

					<c:url var="noticeListEnd" value="notice.customerCenter">
						<c:param name="currentPage" value="${pi.maxPage}" />
						<c:if test="${ !empty param.searchValue }">
							<c:param name="searchValue" value="${param.searchValue}" />
						</c:if>
					</c:url>
					<a href="${noticeListEnd}"><span>[마지막]</span></a>&nbsp;
				</div>
				<!-- #pagingArea end -->
			</div>
			<!-- .noticeContentsArea end -->
			<br />

		</section>
		<!-- container end -->
		<jsp:include page="/WEB-INF/views/panel/common/footer.jsp" />
	</div>
	<!-- wrap end -->
	
	<div class="ui modal" id="writeNoice">
		<div class="header">공지사항</div>
		<div class="content">
			<table id="writeTb">
			<tr>
				<th>제목</th>
				<td><input type="text" id="writeNoticecTitle" style="width:100%" ></td>	
			</tr>
			<tr>
				<th style="border: 0;">내용</th>
				<td style="border: 0;"><textarea id="writeNoticeContext" style="width:100%; height: 300px; resize:none;"></textarea></td>
			</tr>
			
			</table>
	


		</div>
		<div class="actions">
			<div class="ui approve button">취소하기</div>
			<div class="ui blue button" id="register">등록하기</div>
		</div>
	</div>
	
	<!-- noticeedit -->
		<div class="ui modal" id="editNotice">
		<div class="header">공지사항</div>
		<div class="content">
			<table id="editTb">
			<tr>
				<th>제목</th>
				<td><input type="text" id="editNoticecTitle" style="width:100%" ></td>
							
			</tr>
			
		
			
			<tr>
				<th style="border: 0;">내용</th>
				<td style="border: 0;"><textarea id="editNoticecContext" style="width:100%; height: 300px; resize:none;"></textarea></td>
			</tr>
			
			</table>
	


		</div>
		<div class="actions">
			<div class="ui approve button">취소하기</div>
			<div class="ui blue button" id="reRegister">수정하기</div>
		</div>
	</div>
	
	
	

	<script>
		$('.ui.accordion').accordion();
		
// 		새로고침 시 쿼리스트링 제거
		window.onkeydown = function() { 
			var kcode = event.keyCode; 
			if(kcode == 116) { 
				history.replaceState({}, null, location.pathname); 
			} 
		}
		
		
		$(document).on("click","#write",function(){
			$("#writeNoice").modal("show");
		})		
		
		//글쓰기
		$(document).on("click", "#register", function(){
			var title=$("#writeNoticecTitle").val();
			var contexts=$("#writeNoticeContext").val();
			
			$.ajax({
				url:"noticeWrite.customerCenter",
				type:"post",
				data:{
					noticeTitle:title,
					noticeContext:contexts
				},
				success:function(data){
					console.log(data);
					Swal.fire(
			      		'작성완료!',
			      		'공지사항이 작성되었습니다.',
			      		'success'
		    		)
		    		//새로고침
		    		setTimeout(function(){
					    location.reload();
					},1500)
				},
				error:function(data){
					console.log(data);
				}
			});
		});
		
		
		$(document).on("click",".edit",function(){
			//var를 없애면 전역변수가 됨
			noticeNo=$(this).parent().parent().parent().prev().find("td").eq(0).text();
			console.log(noticeNo);
			$.ajax({
				url:"selectNotice.customerCenter",
				type:"post",
				data:{
					noticeNo:noticeNo
					
				},
				success:function(data){
					var notice = data.n;
					$("#editNoticecTitle").val(notice.noticeTitle);
					$("#editNoticecContext").val(notice.noticeContext);
					console.log(notice)
				},
				error:function(data){
				}
			})
			$("#editNotice").modal('show');
		})
		
		$(document).on("click","#reRegister",function(){
			var title=$("#editNoticecTitle").val();
			var contexts=$("#editNoticecContext").val();
			
			$.ajax({
				url:"noticeEdit.customerCenter",
				type:"post",
				data:{
					noticeTitle:title,
					noticeContext:contexts,
					noticeNo:noticeNo
					
				},
				success:function(data){
					
					console.log(data)
					Swal.fire(
			      		'작성완료!',
			      		'공지사항이 작성되었습니다.',
			      		'success'
		    		)
		    		//새로고침
		    		setTimeout(function(){
					    location.reload();
					},1500)
				},
				error:function(data){
					
				}
			})
		})
		
		
		$(document).on("click",".delete",function(){
			noticeNo=$(this).parent().parent().parent().prev().find("td").eq(0).text();

			Swal.fire({
				title: '정말 삭제하시겠습니까?',
				text: "이 결정은 되돌릴 수 없습니다!",
				icon: 'warning',
				showCancelButton: true,
				confirmButtonColor: '#3085d6',
				cancelButtonColor: '#d33',
				confirmButtonText: 'Yes'
			}).then((result) => {
			  	if (result.value) {
			  		$.ajax({
			  			url: "noticeDelete.customerCenter",
			  			type:"post",
			  			data:{
			  				noticeNo:noticeNo
			  			},
			  			success:function(data){
			  				Swal.fire(
					      		'삭제!',
					      		'공지사항이 삭제되었습니다.',
					      		'success'
				    		)
				    		
				    		setTimeout(function(){
							    location.reload();
							},1500)
			  			},
			  			error:function(data){
			  				
			  			}
			  		})
			  		
					/* Swal.fire(
			      		'삭제!',
			      		'이 게시물은 삭제되었습니다.',
			      		'success'
		    		) */
			  	}
			})
		})
		
		
		
	</script>
</body>
</html>