<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/views/panel/common/head.jsp"/>
</head>
<style>
	div.ui.right.attached.rail {
		width: 200px !important;
		height:auto;
		display: inline-block;
		border-radius: 0px;
		padding-top: 0px;
		
	}
	
	div.ui.segment {
		position: relative;
		background: #fff;
		-webkit-box-shadow: 0 1px 2px 0 rgba(34, 36, 38, .15);
		box-shadow: 0 1px 2px 0 rgba(34, 36, 38, .15);
		margin: 1rem 0;
		padding: 1em 1em;
		border-radius: 0px;
		border: 1px solid rgba(34, 36, 38, .15);
		height: inherit;
	}
	
	div.ui.segment.leftArea {
		position: relative;
		background: white;
		-webkit-box-shadow: 0;
		box-shadow: 0 1px 2px 0 white;
		margin: 1rem 0;
		padding: 1em 1em;
		padding-left:0px;
		padding-right:0px;
		border-radius: 0px;
		border: 1px solid white;
		height: inherit;
		margin-right:-30px;
		height:58%;
	}
	
	#firstWing {
		height: 50px;
		-webkit-box-shadow: 0;
		box-shadow: 0 1px 2px 0 white;
		border: 1px solid white;
		padding: 0px;
		/*position:fixed;*/
		/* top:204px; */
	}
	
	#secondWing {
		height: auto;
		-webkit-box-shadow: 0;
		box-shadow: 0 1px 2px 0 white;
		border: 1px solid white;
		padding: 0px;
		/* position:fixed;
		top:250px; */
	}
	#thirdWing {
		height: 75px;
		width:inherit;
		/* position:fixed;
		top:298px; */
	}
	#fourthWing {
		height: 235px;
		width: inherit;
		padding: 13px;
		/* position:fixed;
		top:384px; */
		background-color:white;
	}
	#fifthWing {
		height: 30px;
		-webkit-box-shadow: 0;
		box-shadow: 0 1px 2px 0 white;
		border: 1px solid white;
		padding: 0px;
		/* position:fixed;
		top:627px; */
	}
	#panelSurvayUpload, #completeWrite {
		background-color: #00679A;
		width: 200px;
		height: inherit;
		color: white;
		border: none;
		cursor: pointer;
		font-size:11pt;
	}
	#completeWrite {
		height: 50px;
	}
	#mySurveyBtn {
		background-color: #A0A0A0;
		width: 200px;
		height: inherit;
		color: white;
		border: none;
		cursor: pointer;
		font-size:10pt;
	}
	#voteBtn {
		background-color: #CC3399;
		width: 150px;
		height: 40px;
		color: white;
		border: none;
		cursor: pointer;
		font-size:0.9vw;
	}
	#searchInput, .ui.action.input {
		width: 160px;
		height: 37px;
		font-size: 11pt;
	}
	div.ui.segment.eachSurveyBox {
		background-color:#F2F2F4;
		padding:8px;
		cursor:pointer;
	}
	.ui.basic.button,.ui.toggle.button {
		height: 20px;
		width: 80px;
		font-size:0.5vw;
		background-color:white;
		box-shadow:0 0 0 1px rgba(34,36,38,.15) inset;
	}
	.ui.basic.button:hover,.ui.toggle.button:hover {
		box-shadow:0 0 0 1px #CC3399 inset;
	}
	.ui.button.toggle.active {
		background-color:#CC3399 !important;
	}
	#quizArea {
		width: 70%;
		margin: 0 auto;
	}
	#quizTable {
		width: 100%;
		margin: 0 auto;
		border-spacing: 0;
		border-collapse: collapse;
	}
	#quizTable td {
		font-size: 12px;
		width: 80%;
		font-weight: normal;
		border-bottom: 1px solid #F0F0F0;
		height: 70px;
	}
	#quizTable th {
		height: 70px;
		width: 20%;
    	text-align: left;
    	border-bottom: 1px solid #F0F0F0;
    	padding-left: 30px;
	}
	input[type=text] {
		height: 40px;
		border: 0;
		border-bottom: 1px solid lightgray;
	}
	input[type=text]:focus {
		outline: 0 !important;
		border-bottom: 1px solid #808080 !important;
	}
	.choice {
		margin-top: 10px;
		margin-bottom: 10px;
	}
	.choiceInputDiv {
		width: 80% !important;
	}
	.choiceInputDiv input {
		border-top: 0!important;
		border-left: 0!important;
		border-right: 0!important;
		border-radius: 0 !important;
	}
	.choiceOrder {
		border: 0 !important;
		width: 15px;
		margin-right: 10px;
	}
	.deleteChoice {
		float: right; 
		vertical-align: middle; 
		margin: 2px !important;
		line-height: 2 !important;
		cursor: pointer;
	}
	.addChoice, .addImageChoice{
		width: fit-content; 
		margin: 20px auto;
		cursor: pointer;
	}
</style>
<body>
	<div class="wrap">
		<jsp:include page="/WEB-INF/views/panel/common/header.jsp"/>
		<section class="container">
			<br />

			<table id="titleTable" height="10px;" width="99%;">
				<tr>
					<td id="menuTitle">패널서베이</td>
					<td id="pagePath">
						<div class="ui breadcrumb">
							<a class="section" id="depth1" href="panelMain.panel">Home</a>
							<i class="right angle icon divider"></i>
							<a class="section" id="depth2" href="surveyList.survey">서베이</a>
							<i class="right angle icon divider"></i>
							<div class="active section" id="depth3">패널서베이</div>
						</div>
					</td>
				</tr>
			</table>
			
			<div class="sectionLine">
				<hr>
			</div>


			<div class="ui segment leftArea">
				
				<div id="quizArea">
					<form action="uploadSurvey.survey" method="post" id="uploadSurveyForm" enctype="multipart/form-data">
						<table id="quizTable" style="width: 100%;">
							<tr>
								<th>카테고리</th>
								<td>
									<select class="ui dropdown" id="category" name="category">
										<option value="">Category</option>
										<option value="1">연애/사랑</option>
										<option value="2">경제/사회</option>
										<option value="3">여행/레저/스포츠</option>
										<option value="4">육아/교육</option>
										<option value="5">음식/주류</option>
										<option value="6">패션/쇼핑/뷰티</option>
										<option value="7">기타</option>
									</select>
								</td>
							</tr>
							<tr>
								<th>서베이 제목</th>
								<td>
									<input type="text" id="surveyTitle" style="width: 100%;" name="surveyTitle" placeholder="서베이 제목을 입력해주세요">
								</td>
							</tr>
							<tr>
								<th colspan="2">서베이 내용</th>
							</tr>
							<tr>
								<td colspan="2" style="padding: 3%;">
									<div class="ui form" style="margin: 0 auto;">
										 <div class="ui corner labeled input" style="width: 100%;">
									     	<div class="ui corner label">
									        	<i class="asterisk icon"></i>
									        </div>
									        <textarea name="surveyContext" placeholder="서베이 내용을 입력해주세요" style="resize: none; line-height: 30px;"></textarea>
									    </div>
									</div>
								</td>
							</tr>
							<tr>
								<th colspan="2" style="width: 100%;">
									보기
								</th>
							</tr>
							<tr>
								<td colspan="2" id="choiceTd">
									<div id="choiceArea" style="width: 100%; text-align: center;">
										<img src="${ contextPath }/resources/images/click.png" style="width: 40px; vertical-align: middle; margin-right: 10px;">문항 형식을 선택해주세요>
									</div>
								</td>
							</tr>
						</table>
					</form>
					<div style="margin: 20px auto; width: fit-content;">
						<button class="panelSurvay" id="completeWrite">작성 완료</button>
					</div>
				</div>
				
				<div id="scroll" style="position:absolute;right:0;top:0;">
					<div class="ui right attached rail">
						<div class="ui segment" id="firstWing">
							<button class="panelSurvay" id="panelSurvayUpload">내 투표 올리기</button>
						</div>
						<div class="ui segment" id="secondWing">
							<div class="ui vertical buttons" style="width: 100%;">
								<button type="button" class="ui button" id="multipleChoice">객관식</button>
								<button type="button" class="ui button" id="multipleImageChoice">객관식 & 이미지</button>
							</div>
						</div>
						<div class="ui segment" id="fifthWing">
							<button id="mySurveyBtn" class="panelSurvay">내 패널서베이 보러가기</button>
						</div>
					</div>
				</div>
				<script>
					$(window).scroll(function( ){  //스크롤이 움직일때마다 이벤트 발생 
						var position = $(window).scrollTop(); // 현재 스크롤바의 위치값을 반환합니다.
					    $("#scroll").stop().animate({top:position+"px"}, 700); //해당 오브젝트 위치값 재설정
					});
				</script>
				<p></p>
				<p></p>
			</div>


			<br />
		</section>
		<!-- container end -->
		<jsp:include page="/WEB-INF/views/panel/common/footer.jsp"/>
	</div>
	<!-- wrap end -->
	
	<script>
		$(document).on("click", "#multipleChoice", function(){
			Swal.fire({
				  title: '객관식 변경',
				  text: "서베이 형식을 객관식으로 변경하시겠습니까?",
				  icon: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: 'Yes'
				}).then((result) => {
				  if (result.value) {
					  $("#choiceTd").html("");
						var $choiceArea = $('<div id="choiceArea" style="width: 100%; text-align: center;"> <div class="choice"> Q<input type="text" readonly class="choiceOrder" name="choiceOrder" value="1"> <div class="ui input choiceInputDiv"> <input type="text" class="choiceInput" name="choiceInput" placeholder="보기를 작성해주세요"> </div> <i class="large times icon deleteChoice"></i> </div> <div class="choice"> Q<input type="text" readonly class="choiceOrder" name="choiceOrder" value="2"> <div class="ui input choiceInputDiv"> <input type="text" class="choiceInput" name="choiceInput" placeholder="보기를 작성해주세요"> </div> <i class="large times icon deleteChoice"></i> </div> </div> <div class="addChoice"> <img src="/survway/resources/images/add.png" style="width: 30px; vertical-align: middle; margin-right: 10px;">보기 추가 </div>');
						$("#choiceTd").append($choiceArea);
				  }
				}); 
			
		})
		$(document).on("click", "#multipleImageChoice", function(){
			Swal.fire({
				  title: '객관식 & 이미지 변경',
				  text: "서베이 형식을 객관식 & 이미지로 변경하시겠습니까?",
				  icon: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: 'Yes'
				}).then((result) => {
				  if (result.value) {
					  $("#choiceTd").html("");
						var $choiceArea = $('<div id="choiceArea" style="width: 100%; text-align: center;"> <div class="choice"> Q<input type="text" readonly class="choiceOrder" name="choiceOrder" value="1"> <div class="ui input choiceInputDiv"> <input type="text" class="choiceInput" name="choiceInput" placeholder="보기를 작성해주세요"> </div> <i class="large times icon deleteChoice"></i> <br> <div style="width: 65%; display: inline-block;"> <input type="file" id="imageChoiceUpload" name="imageChoiceUpload" style="float: left; margin-left: 5%;" value="파일 선택"> <br> <div style="font-size: 10pt; text-align: left; margin-left: 20%;"> 이미지 사이즈 : <span style="color: #7A0075;">700px X 100 ~ 600px, 1MB</span>이하<br> 미풍양속을 해치는 이미지를 쓸 경우 큰 불이익을 당할 수 있습니다. </div> </div> <div style="width: 25%; height: 110px; margin-top: 10px; margin-bottom: 20px; display: inline-block; vertical-align: middle;" id="imageArea"> <img src="resources/images/imageBackground.png" class="image" style="width: 100%; height:110px;"> </div> </div> <div class="choice"> Q<input type="text" readonly class="choiceOrder" name="choiceOrder" value="2"> <div class="ui input choiceInputDiv"> <input type="text" class="choiceInput" name="choiceInput" placeholder="보기를 작성해주세요"> </div> <i class="large times icon deleteChoice"></i> <br> <div style="width: 65%; display: inline-block;"> <input type="file" id="imageChoiceUpload" name="imageChoiceUpload" style="float: left; margin-left: 5%;" value="파일 선택"> <br> <div style="font-size: 10pt; text-align: left; margin-left: 20%;"> 이미지 사이즈 : <span style="color: #7A0075;">700px X 100 ~ 600px, 1MB</span>이하<br> 미풍양속을 해치는 이미지를 쓸 경우 큰 불이익을 당할 수 있습니다. </div> </div> <div style="width: 25%; height: 110px; margin-top: 10px; margin-bottom: 20px; display: inline-block; vertical-align: middle;" id="imageArea"> <img src="resources/images/imageBackground.png" class="image" style="width: 100%; height:110px;"> </div> </div> </div> <div class="addImageChoice"> <img src="/survway/resources/images/add.png" style="width: 30px; vertical-align: middle; margin-right: 10px;">보기 추가 </div>');
						$("#choiceTd").append($choiceArea);
				  }
				});
			
		})
		$(document).on("click", ".deleteChoice", function(){
			if($(".choiceInput").length == 2){
				Swal.fire({
					icon: 'error',
					title: 'Oops...',
					text: '보기는 최소 2개 이상이어야 합니다.',
				})
			}else {
				$(this).parent().remove();
				choiceIndex();
			}
		});
		
		$(document).on("click", ".addChoice", function(){
			if($(".choiceInput").length == 10){
				Swal.fire({
					icon: 'error',
					title: 'Oops...',
					text: '보기는 최대 10개까지 가능합니다.',
				})
			}else {
				var $choice = $('<div class="choice"> Q<input type="text" readonly class="choiceOrder" name="choiceOrder" value="2"> <div class="ui input choiceInputDiv"> <input type="text" class="choiceInput" name="choiceInput" placeholder="보기를 작성해주세요"> </div> <i class="large times icon deleteChoice"></i> </div>');
				$("#choiceArea").append($choice);
				choiceIndex();
			}
		});
		$(document).on("click", ".addImageChoice", function(){
			if($(".choiceInput").length == 10){
				Swal.fire({
					icon: 'error',
					title: 'Oops...',
					text: '보기는 최대 10개까지 가능합니다.',
				})
			}else {
				var $choice = $('<div class="choice"> Q<input type="text" readonly class="choiceOrder" name="choiceOrder" value="2"> <div class="ui input choiceInputDiv"> <input type="text" class="choiceInput" name="choiceInput" placeholder="보기를 작성해주세요"> </div> <i class="large times icon deleteChoice"></i> <br> <div style="width: 65%; display: inline-block;"> <input type="file" id="imageChoiceUpload" name="imageChoiceUpload" style="float: left; margin-left: 5%;" value="파일 선택"> <br> <div style="font-size: 10pt; text-align: left; margin-left: 20%;"> 이미지 사이즈 : <span style="color: #7A0075;">700px X 100 ~ 600px, 1MB</span>이하<br> 미풍양속을 해치는 이미지를 쓸 경우 큰 불이익을 당할 수 있습니다. </div> </div> <div style="width: 25%; height: 110px; margin-top: 10px; margin-bottom: 20px; display: inline-block; vertical-align: middle;" id="imageArea"> <img src="resources/images/imageBackground.png" class="image" style="width: 100%; height:110px;"> </div> </div>');
				$("#choiceArea").append($choice);
				choiceIndex();
			}
		});
		
		$("#category").dropdown();
		
		function choiceIndex(){
			var index = 1;
			$(".choice").each(function(){
				$(this).find(".choiceOrder").val(index++);
			})
		}
		
		$(document).on("change", "#imageChoiceUpload", function(e){
			var files = e.target.files;
            var filesArr = Array.prototype.slice.call(files);
			var image = $(this).parent().parent().find(".image");
            filesArr.forEach(function (f) {
                if (!f.type.match("image.*")) {
                    alert("이미지 확장자 파일만 등록 가능합니다.");
                    return;
                }
                selFile = f;

                var reader = new FileReader();
                reader.onload = function (e) {
                	image.attr("src", e.target.result);
                }
                reader.readAsDataURL(f);
            });
		});
		$(document).on("click", "#completeWrite", function(){
			var isEmpty = false;
			$("input[type=text]").each(function(){
				if($(this).val() == ""){
					isEmpty = true;
				}
			})
			if($("#category").val() == ""){
				Swal.fire({
					icon: 'error',
					title: 'Oops...',
					text: '카테고리를 선택해 주세요.',
				})
			}else if($(".choiceInput").length == 0){
				Swal.fire({
					icon: 'error',
					title: 'Oops...',
					text: '질문 문항을 선택해 주세요.',
				})
			}else if(isEmpty == true){
				Swal.fire({
					icon: 'error',
					title: 'Oops...',
					text: '질문 내용을 작성해 주세요.',
				})
			}else {
				$("#uploadSurveyForm").submit();
			}
		});
	</script>
	<c:if test="${ empty sessionScope.loginUser }"> 
		<script>
			$(".panelSurvay").click(function() {
				Swal.fire('안내', '로그인 후 이용해주세요', 'warning').then(function(){
					location.href="panelLogin.panel";
				});
			});
		</script>
	</c:if>
	<c:if test="${ !empty sessionScope.loginUser }"> 
		<script>
			$("#panelSurvayUpload").click(function() {
				location.href = "panelSurvayUpload.survey";
			});
		</script>
	</c:if>
</body>
</html>