<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LauXion</title>
<!-- favicon불러오는 링크 -->
<link rel="shortcut icon" href="<%= request.getContextPath() %>/img/favicon.ico" type="image/x-icon"/>
</head>
<body>
	<%@ include file="views/common/header.jsp" %>
	<%@ include file="views/common/nav.jsp" %>
	<%@ include file="views/ysh/watchList.jsp" %>
	<%@ include file="views/common/footer.jsp" %>
</body>
</html>