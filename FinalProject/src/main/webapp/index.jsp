<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

</head>
<body>
   <c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
<!--    <div style="margin: 400px auto; width: fit-content;">
      <button onclick="location.href='adminMain.admin'">관리자 메인</button> <button onclick="location.href='corpMain.corp'">기업 메인</button> <button onclick="location.href='panelMain.panel'">패널 메인</button>
   </div> -->
   <%-- <jsp:forward page="WEB-INF/views/admin/common/adminMain.jsp"/> --%>
<%--    <jsp:forward page="WEB-INF/views/panel/main/panelMain.jsp"/> --%>
   <jsp:forward page="panelMain.panel" />
</body>
</html>