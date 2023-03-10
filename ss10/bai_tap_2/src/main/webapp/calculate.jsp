<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 10/03/2023
  Time: 2:38 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>calculate</title>
</head>
<body>
<h1>Simple Calculate</h1>
<form>
    <fieldset>
        <legend>Calculate:</legend>
        <label>First operand:</label>
        <b>${one}</b><br><br>
        <label>Operator:</label>
        <b>${operator}</b><br><br>
        <label>Second operator:</label>
        <b>${two
        }</b><br><br>
    </fieldset>
</form>
<p style="font-size: 30px"> Result = ${result}</p>
</body>
</html>
