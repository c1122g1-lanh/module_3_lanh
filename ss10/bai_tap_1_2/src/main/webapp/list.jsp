<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 10/03/2023
  Time: 10:12 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<style>
    table{
        border: cornflowerblue inset;
        border-bottom: black solid 1px;
    }
</style>
<body>

<table action="CustomerServlet" method="get" >
    <tr>
        <h1>Danh sach khach hang</h1>
    </tr>
    <tr>
        <td>No</td>
        <td>Id</td>
        <td>Name</td>
        <td>Dayofbirth</td>
        <td>Address</td>
        <td>Img</td>
    </tr>
    <c:forEach items="${listCustomer}" var="customer" varStatus="loop">
        <tr>
            <td style="width: 30px">${loop.count}</td>
            <td style="width: 30px">${customer.id}</td>
            <td style="width: 160px">${customer.name}</td>
            <td style="width: 160px">${customer.dayOfBirth}</td>
            <td style="width: 160px">${customer.address}</td>
            <td><img src="${customer.img}" style="width: 50px"> </td>
        </tr>
    </c:forEach>


</table>
</body>
</html>
