<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Tran Anh Tuan
  Date: 8/21/2018
  Time: 9:09 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style type="text/css">
        .information {
            color: red;
        }
    </style>
    <title>List</title>
</head>
<body>
<h1>List Product</h1>
<h3 class="information">There are ${product.size()} product</h3>
<a href="create">Create</a>
<fieldset>
    <legend><h2>List</h2></legend>
    <table border="1">
        <tr>
            <th>#</th>
            <th>Code</th>
            <th>Name</th>
            <th>Price</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
        <c:forEach items="${product}" var="view">
            <tr>
                <td>${view.id}</td>
                <td><a href="/view?id=${view.id}">${view.code}</a></td>
                <td>${view.name}</td>
                <td>${view.price}</td>
                <td><a href="/edit?id=${view.id}">Edit</a></td>
                <td><a href="/delete?id=${view.id}">Delete</a></td>
            </tr>
        </c:forEach>
    </table>
</fieldset>
</body>
</html>
