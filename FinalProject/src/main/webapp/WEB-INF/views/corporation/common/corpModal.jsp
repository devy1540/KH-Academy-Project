<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
	<jsp:include page="/WEB-INF/views/panel/common/head.jsp"/>
</head>
<body>
	<c:if test="${ !empty param.message }">
		<c:if test="${ param.message eq 'researchComplete' }">
			<script>
				Swal.fire('리서치 작성완료', '작성한 리서치가 신청되었습니다.', 'success').then(function(){
					location.replace("previousResearchMain.corpResearch");
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