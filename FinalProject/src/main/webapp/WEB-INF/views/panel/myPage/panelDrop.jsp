<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
   <%@ include file="/WEB-INF/views/panel/common/head.jsp" %>
</head>
<style>
.panelDropArea {
   width: 100%;
}
.ui.blue.button {
   background-color:#00679A;
}
.ui.blue.button:hover {
   background-color: #217BA7;
}
</style>
<body>
   <c:if test="${ loginUser != null }">
       <div class="wrap">
	      <%@ include file="/WEB-INF/views/panel/common/header.jsp" %>
	      <section class="container">
	      <br />
	      
	   
	         <table id="titleTable" height="10px;" width="99%;">
	            <tr>
	               <td id="menuTitle">패널 탈퇴</td>
	               <td id="pagePath">
	                  <div class="ui breadcrumb">
	                     <a class="section" id="depth1" href="panelMain.panel">Home</a>
	                     <i class="right angle icon divider"></i>
	                     <a class="section" id="depth2" href="myInfo.panel">마이페이지</a>
	                     <i class="right angle icon divider"></i>
	                     <div class="active section" id="depth3">패널 탈퇴</div>
	                  </div>
	               </td>
	            </tr>
	         </table>
	         
	         <div class="sectionLine">
	            <hr>
	         </div>
	         
	         
	         <div class="panelDropImgArea" style="width:100%; margin-bottom:40px;">
	            <img src="resources/images/signOutPic.png" style="width:100%;">
	         </div>  <!-- .panelDropImgArea end -->
	         
	         
	         <div class="panelDropArea">
	            <form id="dropForm" action="dropPanel.me" method="post">
	               <div class="panelDropReasonArea" align="center">
	                  <span style="font-size:1vw; font-weight:bold; line-height:150%; margin-bottom:40px;">
	                     회원님께서 탈퇴하시는 사유 또는 저희 사이트에 건의하고 싶은 점 있으신가요?<br>
	                     글을 남겨주시면 회원님의 의견을 소중히 경청하겠습니다.
	                  </span>
	               </div>
	               <div style="margin-bottom:40px;">
	                  <textarea name="leaveReason" id="leaveReason" style="margin-top: 20px; width: 100%; height: 150px; resize: none; padding:20px;"></textarea>
	               </div>  <!-- panelDropReasonArea end -->
	               
	               <div class="panelDropPasswordArea" style="width: 100%;">
	                  <div style="margin-bottom:20px; text-align:center;">
	                     <span style="font-size:1vw; font-weight:bold;">개인정보보호를 위해 탈퇴를 원하시면 비밀번호를 한번 더 입력 후 [탈퇴하기]를 선택해 주시기 바랍니다.</span>
	                  </div>
	                  <div style="text-align:center; margin-bottom:40px;">
	                     <span style="font-size:0.9vw;">비밀번호 : </span>
	                     <div class="ui input">
	                     	<input type="hidden" name="mno" value="${ loginUser.mno }"/>
	                        <input type="password" name="userPwd" id="userPwd" style="margin-left: 10px;">
	                     </div>
	                  </div>
	                  <hr>
	                  <div style="text-align:right; margin-top:40px; margin-bottom:100px;">
	                     <button class="ui blue button" id="dropPanelBtn" type="button">탈퇴하기</button>
	                     <button class="ui blue button" type="button" onclick="location.href='panelMain.panel'">메인으로</button>
	                  </div>
	               </div>  <!-- panelDropPasswordArea end -->
	            </form>
	         </div>  <!-- panelDropArea end -->
	      <br />
	      </section>  <!-- container end -->
	      <%@ include file="/WEB-INF/views/panel/common/footer.jsp" %>
	   </div>  <!-- wrap end -->
   </c:if>
   <c:if test="${ loginUser == null }">
		<script>
			location.href="panelResult.panel?message=notLoginAccess";
		</script>
	</c:if>
   <script>
		
		$("#dropPanelBtn").click(function() {
			var ajaxPwd = $("#userPwd").val();
			console.log("${ loginUser.userId }");
			console.log(ajaxPwd);
			$.ajax({
				url: "checkPasswordAjax.me",
				type: "post",
				data : {
					userId: "${ loginUser.userId }",
					ajaxPwd: ajaxPwd
				},
				success: function(data) {
					if(data.isEqual == true) {
						$("#dropForm").submit();
					} else {
						Swal.fire('실패', '비밀번호가 일치하지 않습니다', 'warning');
						return false;
					}
				},
				error: function(data) {
					Swal.fire('에러', '다시 시도해주세요', 'error');
				}
			});
		});
	</script>
</body>
</html>