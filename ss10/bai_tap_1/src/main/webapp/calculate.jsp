<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 09/03/2023
  Time: 1:32 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/cal" method="post">
    Product Description : <input type="text" name="productDescription">
    <br>
    List Price : <input type="number" name="listPrice">
    <br>
    Discount Percent : <input type="number" name="discountPercent">
    <br>
    <button type="submit">Calculate</button>
</form>
<p>${amount}</p>
</body>
</html>
