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
	#poorResponseTable {
  		width: 70%;
  		margin: 0 auto;
  		border-spacing: 0;
		border-collapse: collapse;
  	}
  	#poorResponseTable th {
  		width: 20%;
  		height: 70px;
  		border-bottom: 1px solid #C5C5C5;
  	}
  	#poorResponseTable td {
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
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div id="adminTitle">
						불량 응답 목록
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
				<th id="allCheck" style="width: 5%">전체 체크<br><input type="checkbox" id="allCheckMailing" style="display: none;"></th>
				<th style="width: 10%;">폐기응답번호</th>
				<th style="width: 10%;">패널번호</th> <!-- 아이디아님 -->
				<th style="width: 10%;">리서치 번호</th>
				<th style="width: 20%;">폐기 사유</th>
				<th style="width: 10%;">처리 상태</th>
				<th style="width: 20%;">처리 일</th>
				<th style="width: 15%;">상세보기</th>
			</tr>
			<c:forEach var="i" begin="0" end="9">
				<tr class="tableContext">
					<td><input type="checkbox" class="checkPoorMailing"></td>
					<td>폐기응답번호</td>
					<td>패널번호</td>
					<td>리서치</td>
					<td>폐기 사유</td>
					<td>처리 상태</td>
					<td>처리 일</td>
					<td><button class="detail">상세보기</button></td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="8"><input type="button" value="메일 전송" id="sendBtn"></td>
			</tr>
		</table>
		<div id="pagingArea" align="center">
			<span>[처음]</span>
			<span>[이전]</span>
			<c:forEach var="i" begin="1" end="10">
				<span><c:out value="${ i }"/></span>
			</c:forEach>
			<span>[다음]</span>
			<span>[마지막]</span>
		</div>
	</div>
		
	<div class="ui tiny modal" id="sendMailModal">
		<div class="header">메일 전송중</div>
		<div class="content" style="margin: 0 auto; width: fit-content;">
			<img alt="sendMail.gif" src="${ contextPath }/resources/images/sendMail.gif" style="width: 400px;">
		</div>
	</div>
	<div class="ui modal" id="disposalResponse">
		<div class="header">불량응답 내용</div>
		<div class="scrolling content">
			<div>
				<table id="poorResponseTable">
					<tr>
						<th style="width: 10%">번호</th>
						<td style="width: 40%">2378</td>
						<th style="width: 10%">날짜</th>
						<td style="width: 40%">2020-01-10</td>
					</tr>
					<tr>
						<th>패널 번호</th>
						<td colspan="3">98772</td>
					</tr>
					<tr>
						<th>리서치 번호</th>
						<td colspan="3">279</td>
					</tr>
					<tr>
						<th>분류</th>
						<td colspan="3">응답시간 하위 5%</td>
					</tr>
					<tr>
						<th>상세보기</th>
						<td colspan="3"></td>
					</tr>
				</table>
			</div>
		</div>
		<div class="actions">
		    <div class="ui cancel button">Close</div>
  		</div>
	</div>
	<script>
		$(document).on("click", ".detail", function(){
			$("#disposalResponse").modal("show");
		});
		$("#sendBtn").on("click", function(){
			Swal.fire({
			  	title: '정말 메일을 보내시겠습니까?',
			  	text: "이 결정은 되돌릴 수 없습니다!",
			  	icon: 'warning',
			  	showCancelButton: true,
			  	confirmButtonColor: '#3085d6',
			  	cancelButtonColor: '#d33',
			  	confirmButtonText: 'Yes'
			}).then((result) => {
			  	if (result.value) {
				  	$("#sendMailModal").modal("show");
				  	setTimeout(function() {
				  		$("#sendMailModal").modal("hide");
				  		Swal.fire(
							'메일 전송 완료!',
							'해당 회원에서 불량응답기록 메일을 전송하였습니다.',
							'success'
						)
					}, 3000);
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
		$(".topMenu:nth-child(2)").addClass("active");
		$(".topMenu:nth-child(2)").find(".innerMenu:nth-child(5)").addClass("on");
	</script>
</body>
</html>