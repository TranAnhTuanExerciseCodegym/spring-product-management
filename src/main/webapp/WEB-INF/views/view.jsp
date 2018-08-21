<%--
  Created by IntelliJ IDEA.
  User: Tran Anh Tuan
  Date: 8/21/2018
  Time: 4:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View</title>
</head>
<body>
<a href="/products">Back</a>
<h1>View Product</h1>
<table>
    <tr>
        <td>#</td>
        <td>${view.id}</td>
    </tr>
    <tr>
        <td>Code</td>
        <td>${view.code}</td>
    </tr>
    <tr>
        <td>Name</td>
        <td>${view.name}</td>
    </tr>
    <tr>
        <td>Price</td>
        <td>${view.name}</td>
    </tr>

</table>
</body>
</html>
