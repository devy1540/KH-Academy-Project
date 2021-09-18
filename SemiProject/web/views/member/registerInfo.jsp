<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/registerInfo.css">
<title>LauXion</title>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	<%@ include file="../common/nav.jsp" %>
    <section>
        <div id="Register">
            회원가입 
            <span id="road">
                <span class="road">
                    약관동의
                </span>
                <span class="arrow">
                    >
                </span>
                <span class="road">
                    정보입력
                </span>
                <span class="arrow">
                    >
                </span>
                <span class="road">
                    가입완료
                </span>
            </span> 
        </div>

        <form action="<%= request.getContextPath() %>/insertMember.me" method="post" onsubmit="return checkAll()">
            <table>
                <tr>
                    <td>
                        <label>이름</label>
                    </td>
                    <td>
                        <input type="text" name="USER_NAME" id="userName" size="26">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>아이디</label>
                    </td>
                    <td>
                        <input type="text" name="USER_ID" id="userId" size="26">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>비밀번호</label>
                    </td>
                    <td>
                        <input type="password" name="USER_PWD" id="userPwd" size="26">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>비밀번호 확인</label>
                    </td>
                    <td>
                        <input type="password" id="pwdCheck" size="26">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>휴대폰번호</label>
                    </td>
                    <td>
                        <input type="tel" name="USER_PHONE" id="userPhone" size="26">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>주소</label>
                    </td>
                    <td>
                        <input type="text" name="USER_ADDRESS" id="userAddr" size="26">
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>이메일</label>
                    </td>
                    <td>
                        <input type="text" name="EMAIL" id="userEmail" size="10"> @
                        <select>
                            <option value="">naver.com</option>
                            <option value="">google.com</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>이메일 인증번호</label>
                    </td>
                    <td>
                        <input type="text" name="" id="emailCerti" size="26">
                    </td>
                </tr>
            </table>
            <div class="end">
                <input type="reset" value="취소">
                <input type="submit" value="가입하기">
            </div>
        </form>
    </section>
    <br><br><br><br>
    <%@ include file="../common/footer.jsp" %>
</body>
</html>