<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<c:url var="signUpURL" value='/register'/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Đăng kí</title>
</head>
<body>
<h2>Đăng kí</h2>

<%-- Hiển thị thông báo lỗi nếu có --%>
<% if (request.getParameter("error") != null) { %>
<p style="color: red;">Tên đăng nhập đã tồn tại. Vui lòng chọn tên đăng nhập khác.</p>
<% } %>

<%-- Hiển thị thông báo thành công nếu có --%>
<% if (request.getParameter("success") != null) { %>
<p style="color: green;">Đăng kí thành công.</p>
<% } %>  <%-- Form đăng kí --%>

<%--<form:form  action="${signUpURL}" method="POST">--%>
<form method="post" action="<c:url value="/register"/>" >
    <div>
        <label>Tên đăng kí:</label>
        <input type="text" name="fullName" required>
    </div>
    <div>
        <label>Email:</label>
        <input type="text" name="userName" required>
    </div>
    <div>
        <label for="password">Mật khẩu:</label>
        <input type="password" id="password" name="password" required>
    </div>

    <div>
        <input type="submit" value="Đăng kí">
    </div>
</form>
</body>
</html>