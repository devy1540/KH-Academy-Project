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
						<button onclick="location.href='manageCashoutApplication.reward'" id="clickBtn">신청 목록</button>
						<button onclick="location.href='manageCashoutComplete.reward'">완료 목록</button>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div id="adminTitle">
						리워드 캐시아웃 신청 관리
					</div>
				</td>
			</tr>
			<tr>
				<td style="height: 49px;">
				</td>
			</tr>
		</table>
		<table id="listTable">
			<tr id="tableTitle">
				<th id="allCheck" style="width: 5%">전체 체크<br><input type="checkbox" id="allCheckMailing" style="display: none;"></th>
				<th style="width: 10%;">패널번호</th>
				<th style="width: 20%;">캐시아웃 신청 금액</th>
				<th style="width: 30%;">신청 계좌</th>
				<th style="width: 15%;">신청일</th>
				<th style="width: 20%;">개별 캐시아웃</th>
			</tr>
			<c:forEach var="pr" items="${panelRewardHistoryList}">
				<tr class="tableContext">
					<td><input type="checkbox" class="checkPoorMailing">
						<input type="hidden" id="cashoutHistoryNo" value="${ pr.cashoutHistoryNo }"></td>
					<td>${ pr.mno }</td>
					<td><fmt:formatNumber value="${ pr.cashoutAmount }" type="number" /> <i class="won sign icon"></i></td>
					<td>${ pr.account }</td>
					<td>${ pr.applicantDate }</td>
					<td><button class="detail">캐시아웃</button></td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="8"><input type="button" value="캐시아웃" id="cashOut"></td>
			</tr>
		</table>
		<div id="pagingArea" align="center">
			<c:url var="blistFirst" value="manageCashoutApplication.reward">
				<c:param name="currentPage" value="${1}"/>
			</c:url>
			<a href="${blistFirst}"><span>[처음]</span></a>&nbsp;
			
			<c:if test="${pi.currentPage <= 1}">
				<span>[이전]</span> &nbsp;
			</c:if>
			<c:if test="${pi.currentPage > 1}">
				<c:url var="blistBack" value="manageCashoutApplication.reward">
					<c:param name="currentPage" value="${pi.currentPage - 1}"/>
				</c:url>
				<a href="${blistBack}"><span>[이전]</span></a>&nbsp;
			</c:if>
			
			<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
				<c:if test="${p eq pi.currentPage }">
					<span style="color: #4169E1; font-weight: bold; font-size: 15pt;">${ p }</span>
				</c:if>
				<c:if test="${p ne pi.currentPage }">
					<c:url var="blistCheck" value="manageCashoutApplication.reward">
						<c:param name="currentPage" value="${ p }"/>
					</c:url>
					<a href="${ blistCheck }"><span>${ p }</span></a>
				</c:if>
				
			</c:forEach>
			
			<c:if test="${pi.currentPage < pi.maxPage}">
				<c:url var="blistNext" value="manageCashoutApplication.reward">
					<c:param name="currentPage" value="${pi.currentPage + 1}"/>
				</c:url>
				&nbsp;<a href="${blistNext}"><span>[다음]</span></a>
			</c:if>
			<c:if test="${pi.currentPage >= pi.maxPage}">
				&nbsp; <span>[다음]</span>
			</c:if>
			
			<c:url var="blistEnd" value="manageCashoutApplication.reward">
				<c:param name="currentPage" value="${pi.maxPage}"/>
			</c:url>
			<a href="${blistEnd}"><span>[마지막]</span></a>&nbsp;
		</div>
	</div>
		
	
	<script>
		$(document).on("click", "#cashOut", function(){
			var cnoArr = [];
			$('.checkPoorMailing:checked').each(function(i){//체크된 리스트 저장
				cnoArr.push($(this).parent().find("#cashoutHistoryNo").val());
            });
			
			Swal.fire({
			  	title: '캐시아웃 처리를 하시겠습니까?',
			  	text: "이 결정은 되돌릴 수 없습니다!",
			  	icon: 'warning',
			  	showCancelButton: true,
			  	confirmButtonColor: '#3085d6',
			  	cancelButtonColor: '#d33',
			  	confirmButtonText: 'Yes'
			}).then((result) => {
			  	if (result.value) {
			  		jQuery.ajaxSettings.traditional = true;

			  		$.ajax({
						url:"cashoutOnePeople.reward",
						type:"post",
						data:{cnoArr:cnoArr},
						success:function(data){
							Swal.fire({
								position: 'center',
								icon: 'success',
								title: '해당 회원에 대한 캐시아웃처리를 하였습니다.',
								width: 600,
								showConfirmButton: false,
								timer: 1500
							})
							setTimeout(function() {
								location.replace("manageCashoutApplication.reward");
							}, 1500);
							
						},
						error:function(status){
							console.log(status);
						}
					});
			  	}
			})
		});
		$(document).on("click", ".detail",  function(){
			var cno = $(this).parent().parent().children().find("#cashoutHistoryNo").val();
			var cnoArr = [];
			cnoArr.push(cno);
			
			Swal.fire({
			  	title: '캐시아웃 처리를 하시겠습니까?',
			  	text: "이 결정은 되돌릴 수 없습니다!",
			  	icon: 'warning',
			  	showCancelButton: true,
			  	confirmButtonColor: '#3085d6',
			  	cancelButtonColor: '#d33',
			  	confirmButtonText: 'Yes'
			}).then((result) => {
			  	if (result.value) {
			  		jQuery.ajaxSettings.traditional = true;

			  		$.ajax({
						url:"cashoutOnePeople.reward",
						type:"post",
						data:{cnoArr:cnoArr},
						success:function(data){
							Swal.fire({
								position: 'center',
								icon: 'success',
								title: '해당 회원에 대한 캐시아웃처리를 하였습니다.',
								width: 600,
								showConfirmButton: false,
								timer: 1500
							})
							setTimeout(function() {
								location.replace("manageCashoutApplication.reward");
							}, 1500);
							
						},
						error:function(status){
							console.log(status);
						}
					});
			  	}
			})
		});
		$(document).on("click", "#allCheck", function(){
			$('#allCheckMailing').prop('checked',function(){
		        return !$(this).prop('checked');
		    });
			if($("#allCheckMailing").prop("checked")){
	        	$(".checkPoorMailing").prop("checked",true);
	        }else{
	        	$(".checkPoorMailing").prop("checked",false);
	        }
		});
		$(".topMenu:nth-child(3)").addClass("active");
		$(".topMenu:nth-child(3)").find(".innerMenu:nth-child(2)").addClass("on");
	</script>
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  	<script>
  		/* $(function() {
		 	$( "#sortable" ).sortable({
		 		placeholder: "ui-state-highlight"
		 	});
		 	$( "#sortable" ).disableSelection();
		 }); */
  	</script>
</body>
</html>