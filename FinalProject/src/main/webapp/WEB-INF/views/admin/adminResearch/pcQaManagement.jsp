<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
  	#box{
  		width: 100%;
  		height: auto;
  		
  	}
  	
  	.ui.dropdown{
  		float: right;
  		text-align: center !important;
  		min-width: 100px !important;
  	}
  	
  	#pcQaTable{
  		width:100%;
  	}
  	
  	#excla, #segmentVideo{
  		text-align: center;
  		border-bottom: 1px solid lightgray;
  		border-top:1px solid lightgray;
  		line-height: 40px;
  	}
  	
  	#explain{
  		text-align: center;
  	
  	}
  	
  	#segmentTwo, #segmentVideo{
  		border: 1px solid #75BCC9 !important;
  		width:70%;
  		margin: 0 auto;
  	}
  	
  	#uploadAudio,#uploadVideo{
  		width:70px;
  		height:30px;
  		 
  		
  	}
  	.add, .delete {
  		display:inline-block; 
  		width: 25px;
  		font-size: 12pt;
  	}
  	.add:hover, .delete:hover {
  		cursor: pointer;
  	}
  	#choice, .choice {
  		margin: 0 auto;
  		margin-top: 5px;
  		width: fit-content;
  	}
  	.choiceInput {
  		width: 170px;
  		margin-right: 10px !important;
  	}
  	.choiceArr {
  		width: fit-content;
  		margin: 0 auto;
  		margin-bottom: 30px;
  	}
  	
  	.ui.input{
  		margin-bottom: 10%;
  	}
  	#confirmBtn{
  		float: right;
  		text-align: center;
  	}
  	
  	
</style>
</head>
<body>
	<jsp:include page="../common/adminMenuBar.jsp"/>
	
	<div id="adminBox">
		<div class="ui segment" id="box">
			<table id="pcQaTable">
				<tr>
					<td><div id="adminTitle">패널 pc환경조사 질문관리</div></td>
				</tr>
				<tr>
					<td>
						<select class="ui dropdown" id="choose">
							<option value="">음성/영상</option>
							<option value="1">음성</option>
							<option value="0">영상</option>
						</select>
					</td>
				</tr>

			</table>
			
			
			<div>
				<table style="width: 100%; ">
					<tr>
						<td >
							<div id="excla">
								<i class="exclamation triangle icon"></i>멀티미디어 환경조사 입니다.
							</div>
						</td>
					</tr>
					<tr>
						<td id="explain">
							본 조사는 멀티미디어 환경 이용이 가능한 패널만 조사 참여가 가능합니다.
						</td>
					</tr>
					
					<tr>
						<td>
							<div class="ui segment" id="segmentAudio">
							<div style="margin: 0 auto; width: fit-content;">
							<div style="margin-top: 20px;">
						 		<audio id="audioTag" controls loop style="vertical-align: middle; ">
 							 		<source id="audio" src="resources/uploadFiles/${ pcQa.mediaExist }" type="audio/mpeg">
 							 	</audio>
						 		<input type="button" value="업로드" id="uploadAudio" style="background: #00679A; color: white; border:0;">
						 		<input type="file" id="audioFile" value="허현주" style="display:none"> 
						 		 <c:set var="fileStore" value="${requestScope.UploadFile.ChangeName}"/>
						 	</div>
								</div>
								<div style="width:100%; text-align: right; height: 40px;">
									 <div class="ui input focus" style="width: 100px; vertical-align: middle; float: right; margin-bottom: 10px;">
									 <input type="text" placeholder="정답" class="answer" value="${pcQa.questionFormNo }">
									</div>	<span style="width: fit-content; line-height: 32px; float: right; vertical-align: middle; margin-right: 15px;">정답 보기 번호 : </span>
								</div>
								
								<div style="text-align: center; margin: 50px auto !important; display: block !important;" class="ui input">
									<input type="text" size="100" class="titleContext" value='<c:out value="${pcQa.rquestionContext}"/>'>
								</div>	
								
															
										
								<div class="choiceArr">
									<c:forEach var ="choice" items="${pcQa.requestChoiceList}" >
										<div class="choice">
											<div class="ui input">
				 	 							<input type="text" placeholder="보기 작성" class="choiceInput" value="${choice.choiceContext}">
											</div>
											<span class="add">
												<i class="plus circle icon"></i>
											</span>
											<span class="delete">
												<i class="minus circle icon"></i>
											</span>
										</div>
									</c:forEach>
								</div>
								<div  style="text-align: center; ">
									<input type="button" id="saveAudio" style="width: 100px; height: 40px; border: 0; background: #00679A; color: white;" value="저장하기" >
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="ui segment" id="segmentVideo" >
								<div style="margin: 0 auto; width: fit-content;">
 							 	<div style="width: fit-content; height: 50%; margin: 0 auto; font-size: 19em; line-height: 260px;   margin-top: 10%;" id="videoArea"><i class="play icon"></i></div>
									<div class="ui labeled input" style="margin:0; margin-top: 10px;">
										<div class="ui label">https://</div>
										<input type="text" placeholder="mysite.com" class="videoAdress" value='<c:out value="${pcQa.questionVideoLink}"></c:out>' >
								<input type="button" style="width:100px; height:40px; border: 0; background: #d35656; color :white;" value="확인" id="confirmBtn">
									</div>
								</div>
								<div style="width:100%; text-align: right; height: 40px;">
									 <div class="ui input focus" style="width: 100px; vertical-align: middle; float: right; margin-bottom: 10px;">
									 <input type="text" placeholder="정답" class="answer2" value="${pcQa.questionFormNo }">
									</div>	<span style="width: fit-content; line-height: 32px; float: right; vertical-align: middle; margin-right: 15px;">정답 보기 번호 : </span>
								</div>
								<div style="text-align: center; margin: 30px auto; margin-bottom: 10px;"class="ui input">
										<input type="text" size="100" class="titleContext2" value='<c:out value="${pcQa.rquestionContext}"/>' >
								</div>							
								
								<div class="choiceArr">
									<c:forEach var ="choice" items="${pcQa.requestChoiceList}" >
										<div class="videoChoice">
											<div class="ui input">
				 	 							<input type="text" placeholder="보기 작성" class="videoChoiceInput" value="${choice.choiceContext}">
											</div>
											<span class="add2">
												<i class="plus circle icon"></i>
											</span>
											<span class="delete2">
												<i class="minus circle icon"></i>
											</span>
										</div>
									</c:forEach>
								</div>
								
								
								
								
								<div  id="saveVideo" style="text-align: center; ">
									<input type="button" style="width: 100px; height: 40px; border: 0; background: #00679A; color: white;" value="저장하기">
								</div>
							</div>
						</td>
					</tr>
				</table>
			</div>
		  <p></p>
		</div>
	</div>
	<c:if test="${ !empty pcQa.questionVideoLink }">
		<script>
			$(function(){
				var videoLink = "${pcQa.questionVideoLink}";
				var videoLinkStr = videoLink.substr(videoLink.lastIndexOf("/", videoLink.length), 12);
				console.log(videoLinkStr);
				$("#videoArea").html("");
				$("#videoArea").html('<iframe style="width: 500px; height: 289px;" src="https://www.youtube.com/embed' + videoLinkStr + '" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>');
			})
		</script>
	</c:if>
	<script>
		$(".ui.dropdown").dropdown();
		
		$(function(){
			$("#segmentVideo").hide();
			
			var checkMedia = "${ pcQa.mediaExplain }";
			if(checkMedia == '음성'){
				$("#choose").val("1");
				$("#segmentAudio").show();
				$("#segmentVideo").hide();
				
				console.log("음성")
			}else if(checkMedia == '영상'){
				$("#choose").val("0");
				$("#segmentAudio").hide();
				$("#segmentVideo").show();
				
				console.log("영상")
			}
			
		})
		var count = 0;
		var count2 = 0;
		function countChoice(){
			count = 0;
			count2 = 0;
			$(".choiceInput").each(function(){
				count += 1;
			});
			$(".videoChoiceInput").each(function(){
				count2 += 1;
			});
		}
		$(document).on("click", ".add", function(){
			var addCount = 0; 
			var $choice = $("<div class='ui input'><input type='text' placeholder='보기 작성' class='choiceInput'></div>");
			var $add = $("<span class='add'><i class='plus circle icon'></i></span>&nbsp;");
			var $delete = $("<span class='delete'><i class='minus circle icon'></i></span>");
			
			var $choiceDiv = $("<div class='choice'>");
			$choiceDiv.append($choice);
			$choiceDiv.append($add);
			$choiceDiv.append($delete);
			
			countChoice();
			if(count == 10){
				Swal.fire(
					'보기 추가 불가!',
					'보기는 10개까지 가능합니다.',
					'warning'
				) 
			}else{
				$(this).parent().parent().append($choiceDiv);
			}

		});
		
		$(document).on("click", ".add2", function(){
			var addCount = 0; 
			var $choice = $("<div class='ui input'><input type='text' placeholder='보기 작성' class='videoChoiceInput'></div>");
			var $add = $("<span class='add2'><i class='plus circle icon'></i></span>&nbsp;");
			var $delete = $("<span class='delete2'><i class='minus circle icon'></i></span>");
			
			var $choiceDiv = $("<div class='choice'>");
			$choiceDiv.append($choice);
			$choiceDiv.append($add);
			$choiceDiv.append($delete);
			
			countChoice();
			if(count2 == 10){
				Swal.fire(
					'보기 추가 불가!',
					'보기는 10개까지 가능합니다.',
					'warning'
				) 
			}else{
				$(this).parent().parent().append($choiceDiv);
			}
	
		});
		
		$(document).on("click", ".delete", function(){
			
			countChoice();
			if(count == 1){
				Swal.fire(
					'보기 삭제 불가!',
					'보기는 최소 1개 이상이어야 합니다.',
					'warning'
				) 
			}else{
				$(this).parent().remove();
			}
		})
		
		$(document).on("click", ".delete2", function(){
			
			countChoice();
			if(count2 == 1){
				Swal.fire(
					'보기 삭제 불가!',
					'보기는 최소 1개 이상이어야 합니다.',
					'warning'
				) 
			}else{
				$(this).parent().remove();
			}
		})
		
		$(document).on("click", "#uploadAudio", function(){
			$("#audioFile").click();
		})
		
		
		//위에서 뭔가 id가audio파일인것에 변화가ㅏ 있으면 이게 ? 동작
		$(document).on("change", "#audioFile", function(){
			
			var formData = new FormData();
            formData.append('file',$("#audioFile")[0].files[0]);
            
            //var fileStore=filePath+changeName;	 
            
           	$.ajax({
				url: 'uploadFile.adminResearch',
				enctype: 'multipart/form-data',
				processData: false,
				contentType: false,
				data: formData,
				type: 'post',
				
				//success는 나중에 생각하고일단 
				success:function(data){
					console.log(data);
					document.getElementById("audio").src = "/survway/resources/uploadFiles/"+data.ufo.changeName; 
					console.log("/survway/resources/uploadfiles/"+data.ufo.changeName);
					document.getElementById("audioTag").load();
				},error:function(data){
					console.log("pc환경조사오류");
				}
			});
            
		});
		
		
		
		$(document).on("click","#saveAudio",function(){
			var titleContext =$('.titleContext').val();
		 	var questionTitle;
		 	var choiceTitleArr = [];
		 	var choiceOrderArr = [];
		 	var questionFormNo=$('.answer').val();
		 	var questionVideoLink;
		 	var choose=$('#choose').val();
		 	console.log(choose);
		 	if($("#choose").val() == 0){
           		questionTitle ="영상";
           		
           	}else{
           		questionTitle ="음성";
           		
           	}
     		$(".choiceInput").each(function(index){
     			choiceTitleArr.push($(this).val());
     			choiceOrderArr.push(index += 1);
     		})
		 	/* console.log(questionTitle); String questionTitle
		 	console.log(choiceTitleArr); String[] choiceTitleArr
		 	console.log(choiceOrderArr); String[] choiceOrderArr */
			
			$.ajax({
				url:"audioEnviron.adminResearch",
				type:"post",
				traditional:true,
				data:{
					titleContext:titleContext,
					questionTitle:questionTitle,
					choiceTitleArr:choiceTitleArr,
					choiceOrderArr:choiceOrderArr,
					questionFormNo:questionFormNo,
					questionVideoLink:questionVideoLink
				},
				success:function(data){
					Swal.fire(
							'pc환경조사 작성완료!',
							'pc환경조사가 등록되었습니다.',
							'success'
							)
							
						setTimeout(function () {
							location.reload();
							
						},1500)	
						
						console.log(questionTitle);
							
				},
				error:function(data){
					console.log(data);
				}
			});
		});
		
		$(document).on("click","#saveVideo",function(){
			var titleContext =$('.titleContext2').val();
		 	var questionTitle;
		 	var videoAdress = $('.videoAdress').val();
		 	var choiceTitleArr = [];
		 	var choiceOrderArr = [];
		 	var questionFormNo=$('.answer2').val();
		 	if($("#choose").val() == 0){
           		questionTitle ="영상";
           		
           	}else{
           		questionTitle ="음성";
           		
           	}
     		$(".videoChoiceInput").each(function(index){
     			choiceTitleArr.push($(this).val());
     			choiceOrderArr.push(index += 1);
     		})
		 	/* console.log(questionTitle); String questionTitle
		 	console.log(choiceTitleArr); String[] choiceTitleArr
		 	console.log(choiceOrderArr); String[] choiceOrderArr */
			
			$.ajax({
				url:"video.adminResearch",
				type:"post",
				traditional:true,
				data:{
					titleContext:titleContext,//질문내용
					questionTitle:questionTitle,//영상or음성
					choiceTitleArr:choiceTitleArr,
					choiceOrderArr:choiceOrderArr,
					questionFormNo:questionFormNo,
					videoAdress:videoAdress
				},
				success:function(data){
					Swal.fire(
							'pc환경조사 작성완료!',
							'pc환경조사가 등록되었습니다.',
							'success'
							)
							
						setTimeout(function () {
							location.reload();
							
						},1500)	
							
				},
				error:function(data){
					console.log(data);
				}
			});
		});
		
		
		$(document).on("change", "#choose", function(){
			if($(this).val() == "1"){
				$("#segmentVideo").hide();
				$("#segmentAudio").show();
			}else if($(this).val() == "0"){ 
				$("#segmentAudio").hide();
				$("#segmentVideo").show();
			}
		})
		
		
		
		$("#confirmBtn").click(function () {
			var youtube =$('.videoAdress').val();
			console.log(youtube);
			
			var videoLink = youtube;
			var videoLinkStr = videoLink.substr(videoLink.lastIndexOf("/", videoLink.length), 12);
			console.log(videoLinkStr);
			$("#videoArea").html("");
			$("#videoArea").html('<iframe style="width: 100%;" src="https://www.youtube.com/embed' + videoLinkStr + '" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>');
		})
		
		$(".topMenu:nth-child(2)").addClass("active");
		$(".topMenu:nth-child(2)").find(".innerMenu:nth-child(9)").addClass("on");
		
		
		
		
	</script>
	
</body>
</html>