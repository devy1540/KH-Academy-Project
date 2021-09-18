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
	#sortable { 
  		list-style-type: none; 
  		margin: 0; 
  		padding: 0; 
  		width: 50%;
  		margin: 0 auto; 
  		margin-bottom: 30px;
  	}
  	#sortable li { 
  		margin: 0 5px 12px 5px;
  		padding: 10px; 
  		font-size: 0.8em;
  		height: fit-content;
  		border-radius: 7px;
  	}
 	html>body #sortable li { 
	  	height: fit-content;
	  	line-height: 1.2em; 
	}
  	.ui-state-highlight { 
  		height: 3.5em; 
  		line-height: 1.2em; 
  	}
  	.ui-sortable-placeholder {
  		background: white !important;
  		border-color: white !important;
  	}
  	#choice, .choice {
  		margin: 0 auto;
  		margin-top: 20px;
  		width: fit-content;
  	}
  	.choiceInput {
  		width: 100px;
  	}
  	.choiceNameInput {
  		width: 100% !important;
  		background: none !important;
  		border: 0 !important;
  	}
  	.ui.input {
  		margin-right: 5px;
  	}
  	#addQuiz {
  		width: 150px;
  		height: 50px;
  		font-size: 13pt;
  		text-align: center;
  		margin: 0 auto;
  		margin-top: 30px;
  	}
  	#addQuiz:hover, #deleteQuiz:hover {
  		cursor: pointer;
  	}
  	.questionFormNo {
	  	cursor: pointer;
	    word-wrap: break-word;
	    line-height: 1em;
	    white-space: normal;
	    outline: 0;
	    -webkit-transform: rotateZ(0);
	    transform: rotateZ(0);
	    min-width: 5em;
	    min-height: 1em;
	    background: #fff;
	    display: inline-block;
	    padding: 3px;
	    font-size: 10pt;
	    color: rgba(0,0,0,.87);
	    -webkit-box-shadow: none;
	    box-shadow: none;
	    border: 1px solid rgba(34,36,38,.15);
	    border-radius: .28571429rem;
	    -webkit-transition: width .1s ease,-webkit-box-shadow .1s ease;
	    transition: width .1s ease,-webkit-box-shadow .1s ease;
	    transition: box-shadow .1s ease,width .1s ease;
	    transition: box-shadow .1s ease,width .1s ease,-webkit-box-shadow .1s ease;
	    margin-top: 7px;
	    margin-bottom: 7px;
	    height: 40px;
	    width: 100px;
  	}
  	.ui-state-default {
  		min-height: 160px;
  	}
  	.add, .delete {
  		cursor: pointer;
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
						<button id="editTsComplete">상태 저장</button>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div id="adminTitle">
						TS질문관리
					</div>
				</td>
			</tr>
		</table>
		<ul id="sortable">
		<c:forEach var="question" items="${research}">

			<li class="ui-state-default">
				<div>
					<div class="ui input" style="width: 85%;">
						<input type="text" placeholder="문항 작성" class="questionInput" value="${question.rquestionContext }">
						<input type="hidden" class="questionOrder">
						<input type="hidden" class="questionNo" value="${question.questionNo}">
					</div>
					<div style="width: fit-content; float: right;" id="deleteQuiz">
						<i class="large times icon"></i>
					</div>
				</div>
				<div style="width: 100%; height:20px;">
					<input type="hidden" id="qn" class="qn" value="${question.questionFormNo }">
					<select class="questionFormNo" style="float: right;">
						<option value="1">객관식</option>
						<option value="2">주관식</option>
					</select>
				</div>
				<div class="choiceArea">
				<c:forEach var="choice" items="${ question.requestChoiceList }">
					<div class="choice">
						<div class="ui input" style="width: 300px;">
 							<input type="text" placeholder="보기 작성" class="choiceInput" value="${choice.choiceContext }">
 							<input type="hidden" class="choiceOrder">
						</div>
						<span class="add">
							<i class="plus circle icon"></i>
						</span><span class="delete"><i class="minus circle icon"></i></span>
					</div>
					</c:forEach>
				</div>
			</li>
			</c:forEach>
		</ul>
		<div>
			<div id="addQuiz">
				<i class="primary large plus circle icon"></i>질문  추가
			</div>
		</div>
	</div>

	<script>
		$("#addQuiz").on("click", function(){
			var $quiz = $('<li class="ui-state-default"> <div> <div class="ui input" style="width: 85%;"> <input type="text" placeholder="문항 작성" class="questionInput"> <input type="hidden" class="questionOrder"> </div> <div style="width: fit-content; float: right;" id="deleteQuiz"> <i class="large times icon"></i> </div> </div> <div style="width: 100%; height:20px;"> <input type="hidden" id="qn" class="qn"> <select class="questionFormNo" style="float: right;"> <option value="1">객관식</option> <option value="2">주관식</option> </select> </div> <div class="choiceArea"> <div class="choice"> <div class="ui input" style="width: 300px;"> <input type="text" placeholder="보기 작성" class="choiceInput"> <input type="hidden" class="choiceOrder"> </div> <span class="add"> <i class="plus circle icon"></i> </span><span class="delete"><i class="minus circle icon"></i></span> </div> </div> </li>')
			var $accordian = $("#sortable");
			$accordian.append($quiz);
		});
		$(document).on("click", "#deleteQuiz", function(){
			$(this).parent().parent().remove();
		});
		$(".topMenu:nth-child(2)").addClass("active");
		$(".topMenu:nth-child(2)").find(".innerMenu:nth-child(8)").addClass("on");
	</script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  	<script>
  		$("#editTsComplete").on("click", function(){
			//에이작스로 저장
  		});
  		//온로드라서 로딩되자 마자 작동함
  		$(function(){
		 	var research = "${research}";
		 	console.log(research);
		 	sort();
		 	sortChoice();
		 	sortForm();
		 	
		 	$(".qn").each(function(){
		 		var qn = $(this).val();
		 		if(qn == 2){
	  				$(this).parent().parent().find(".choiceArea").text("");
	  			}
		 	})
		});
  		
  		
  		$(document).on("click","#editTsComplete",function(){
  			var questionOrderArr = []; // 문항 번호
  			var choiceOrderArr =[]; //보기 번호 배열
  			var questionTitleArr= []; //질문 타이틀
  			var choiceTitleArr =[]; //보기 번호 내용
  			var questionFormArr =[];//질문 형식 번호(주관식인지 객관식인지)
  			var questionNo =[]; //시퀀스 문제 번호
  			
  			$(".questionNo").each(function(){
  				questionOrderArr.push($(this).val()); //question오더의value값을 순서대로 넣어줌
  			})
  			
  			$(".choiceOrder").each(function(){
  				choiceOrderArr.push($(this).val());
  			})
  			
  			$(".questionInput").each(function(){
  				//questionInput은 질문 타이틀
  				questionTitleArr.push($(this).val());
  			})
  			
  			$(".choiceInput").each(function(){
  				choiceTitleArr.push($(this).val());
  			})
  			
  				//questionFromNumber 주관식인지 객관식인지 판단번호
  			$(".qn").each(function(){
  				questionFormArr.push($(this).val());
  			})
  			$(".questionNo").each(function () {
				questionNo.push($(this).val());
			})
			
  			console.log(questionOrderArr);
  			console.log(choiceOrderArr);
  			console.log(questionTitleArr);
  			console.log(choiceTitleArr);
  			console.log(questionFormArr);
  			console.log(questionNo);
  			
  			Swal.fire({
  			  title: '이대로 저장하시겠습니까?',
  			  text: "ThanksSurvey의 상태가 저장됩니다!",
  			  icon: 'warning',
  			  showCancelButton: true,
  			  confirmButtonColor: '#3085d6',
  			  cancelButtonColor: '#d33',
  			  confirmButtonText: 'Yes'
  			}).then((result) => {
  			  	if (result.value) {
		  			$.ajax({
		  				url:"tsQaManagementUpdate.adminResearch",
		  				type:"post",
		  				traditional:true,
		  				data:{
		  					questionOrderArr:questionOrderArr,
		  					choiceOrderArr:choiceOrderArr,
		  					questionTitleArr:questionTitleArr,
		  					choiceTitleArr:choiceTitleArr,
		  					questionFormArr:questionFormArr, 
		  					questionNo:questionNo
		  				},
		  				success:function(data){
		  					Swal.fire(
								'저장 완료!',
								'현재 상태가 저장되었습니다!',
								'success'
						    )
						    setTimeout(function(){
						        location.reload();
						    },1500)
		  				},
		  				error:function(data){
		  					console.log(data);
		  				}
		  			})
  			  	}
			})
  		})
  		//이게 질문번호
  		function sort() {
  			$("#sortable").find(".questionOrder").each(function(index){
  				$(this).val(index+1);
  				console.log($(this).val());
  				
  				
  			});
			
		}
		
  		//이게 보기문항 번호 
  		function sortChoice(){
  			$("#sortable").find(".questionOrder").each(function() {
					$(this).parent().parent().parent().find(".choiceOrder").each(function(index){
						$(this).val(index+1);
					})
					
  			})
  		}
  		
  		//문항 형식 셀렉트 박스
  		function sortForm(){
  			$(".questionFormNo").each(function(){
  				var qn = $(this).parent().find("#qn").val();
  				$(this).val(qn).prop("selected", "selected");
  			})
  		}
  		
  		$(document).on("change", ".questionFormNo", function(){
  			var qn = $(this).val();
  			$(this).parent().find("#qn").val(qn);
  			if(qn == 2){
  				$(this).parent().parent().find(".choiceArea").text("");
  			}else if(qn == 1){
  				$(this).parent().parent().find(".choiceArea").html('<div class="choice"> <div class="ui input" style="width: 300px;"> <input type="text" placeholder="보기 작성" class="choiceInput"> <input type="hidden" class="choiceOrder"> </div> <span class="add"> <i class="plus circle icon"></i> </span><span class="delete"><i class="minus circle icon"></i></span> </div>');
  			}
  		})
		/* $("#sortable").sortable({
			placeholder:"ui-state-hilight",
			update:function(event,ui){
				sort();
			}
		}) */
  		
  			
  		$(document).on("click", ".add", function(){
			var $choice = $('<div class="ui input" style="width: 300px;"> <input type="text" placeholder="보기 작성" class="choiceInput"> <input type="hidden" class="choiceOrder">');
			var $add = $("<span class='add'><i class='plus circle icon'></i></span>&nbsp;");
			var $delete = $("<span class='delete'><i class='minus circle icon'></i></span>");
			
			var $choiceDiv = $("<div class='choice'>");
			$choiceDiv.append($choice);
			$choiceDiv.append($add);
			$choiceDiv.append($delete);
			
			$(this).parent().parent().append($choiceDiv);
			sort();
		 	sortChoice();
		 	sortForm();
		});
		
		$(document).on("click", ".delete", function(){
			$(this).parent().remove();
			sort();
		 	sortChoice();
		 	sortForm();
		})
  			
  		
  	</script>
</body>
</html>