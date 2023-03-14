<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 13/03/2023
  Time: 10:51 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/product?action=edit&id=${product.id}" method="post">
    <div class="form-group">
        <p>Sản phẩm có id = ${product.id}</p>
        <label>Name</label>
        <input type="text" value="${product.name}"
               class="form-control" name="name"  aria-describedby="helpId" placeholder=""><br><br>
        <label>Price</label>
        <input type="text" value="${product.price}"
               class="form-control" name="price"  aria-describedby="helpId" placeholder=""><br><br>
        <label>Information</label>
        <input type="text" value="${product.information}"
               class="form-control" name="information"  aria-describedby="helpId" placeholder=""><br><br>
        <label>Producer</label>
        <input type="text" value="${product.producer}"
               class="form-control" name="producer"  aria-describedby="helpId" placeholder=""><br><br>
        <button type="submit">lụm</button>
    </div>
</form>

</body>
</html>
