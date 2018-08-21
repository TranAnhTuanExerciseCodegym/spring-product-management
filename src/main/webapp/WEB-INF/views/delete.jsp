<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Tran Anh Tuan
  Date: 8/21/2018
  Time: 3:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete</title>
</head>
<body>
<a href="/products">Back</a>
<h1>Delete</h1>
<h3>You are sure</h3>
<form:form modelAttribute="product" action="delete?id=${product.id}" method="post">
    <table>
        <tr>
            <td>#</td>
            <td>${product.id}</td>
        </tr>
        <tr>
            <td>Code</td>
            <td>${product.code}</td>
        </tr>
        <tr>
            <td>Name</td>
            <td>${product.name}</td>
        </tr>
        <tr>
            <td>Price</td>
            <td>${product.price}</td>
        </tr>
        <tr>
            <td><input type="submit" value="Delete"></td>
        </tr>
    </table>
</form:form>
</body>
</html>
