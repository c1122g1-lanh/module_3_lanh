<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 13/03/2023
  Time: 10:50 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        table,th,td {
            border: black 1px solid;
            border-collapse: collapse;
        }
    </style>
</head>
<body>
<form action="/product">
<table>
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Price</th>
        <th>information</th>
        <th>producer</th>
    </tr>
    <c:forEach items="${productList}" var="product">
        <tr>
            <td>${product.id}</td>
            <td>${product.name}</td>
            <td>${product.price}</td>
            <td>${product.information}</td>
            <td>${product.producer}</td>
            <td><a href="/product?action=edit"> Edit </a></td>
            <td><a href="/product?action=delete"> Delete </a></td>
        </tr>
    </c:forEach>
    <tr>
        <td><a href="/product?action=create">Create</a></td>
    </tr>

</table>
</form>
</body>
</html>
