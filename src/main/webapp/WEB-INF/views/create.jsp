<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Tran Anh Tuan
  Date: 8/21/2018
  Time: 9:43 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style type="text/css">
        .message {
            color: red;
        }
    </style>
    <title>Create</title>
</head>
<body>
<a href="/products">Back</a>
<h1>Create</h1>
<c:if test="${message !=null}">
    <span class="message">${message}</span>
</c:if>
<form:form action="create" method="post" modelAttribute="product">
    <table>
        <tr>
            <td><form:label path="code">Code</form:label></td>
            <td><form:input path="code"/></td>
        </tr>
        <tr>
            <td><form:label path="name">Name</form:label></td>
            <td><form:input path="name"/></td>
        </tr>
        <tr>
            <td><form:label path="price">Price</form:label></td>
            <td><form:input path="price"/></td>
        </tr>
        <tr>
            <td><input type="submit" value="Create"></td>
        </tr>
    </table>
</form:form>
</body>
</html>
