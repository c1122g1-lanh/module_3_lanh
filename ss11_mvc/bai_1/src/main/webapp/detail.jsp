<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 13/03/2023
  Time: 8:24 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Detail Product</title>
</head>
<body>
<a href="/products">Back to view</a>
<%--<a href="/products">Back to view</a>--%>
<p> Id :${product.id}</p>
<p> Name :${product.name}</p>
<p> Price :${product.price}</p>
<p> Information :${product.information}</p>
<p> Producer :${product.producer}</p>
</body>
</html>
