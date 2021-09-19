<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
	<jsp:include page="/WEB-INF/views/panel/common/head.jsp"/>
</head>
<body>
	<c:if test="${ !empty param.message }">
		<c:if test="${ param.message eq 'notLoginAccess' }">
			<script>
				Swal.fire('안내', '로그인 후 이용해주시기 바랍니다', 'warning').then(function(){
					location.href="panelLogin.panel";
				});
			</script>
		</c:if>
		<c:if test="${ param.message eq 'pwdSuccess' }">
			<script>
				Swal.fire('수정완료', '비밀번호 수정이 완료되었습니다<br>다시 로그인 해주세요', 'success').then(function(){
					location.href="panelLogin.panel";
				});
			</script>
		</c:if>
		<c:if test="${ param.message eq 'dropSuccess' }">
			<script>
				Swal.fire('탈퇴완료', '정상적으로 탈퇴 완료 되었습니다<br>이용해 주셔서 감사합니다', 'success').then(function(){
					location.href="panelMain.panel";
				});
			</script>
		</c:if>
		<c:if test="${ param.message eq 'dropFail' }">
			<script>
				Swal.fire('탈퇴실패', '탈퇴에 실패했습니다.<br>관리자에게 문의 바랍니다.', 'warning').then(function(){
					location.href="panelDrop.panel";
				});
			</script>
		</c:if>
		<c:if test="${ param.message eq 'updateAccount' }">
			<script>
				Swal.fire('계좌 저장완료', '계좌저장이 완료되었습니다.<br>올바른 정보 저장을 위해<br>다시 로그인 해주세요.', 'success').then(function(){
					location.href="panelLogin.panel";
				});
			</script>
		</c:if>
		<c:if test="${ param.message eq 'uploadSurvey' }">
			<script>
				Swal.fire('서베이 등록완료', '서베이 등록이 완료되었습니다.', 'success').then(function(){
					location.href="panelSurveyLists.survey";
				});
			</script>
		</c:if>
	</c:if>
	<c:if test="${ empty param.message }">
		<script>
			Swal.fire('에러', '잘못된 접근입니다!', 'error');
		</script>
	</c:if>
</body>