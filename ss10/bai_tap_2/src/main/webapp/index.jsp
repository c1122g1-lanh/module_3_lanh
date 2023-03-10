<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<form action="/CalculateServlet" method="post">
    <fieldset>
        <legend>Calculate:</legend>
        <label>First operand:</label>
        <input type="number" name="one"><br><br>
        <label>Operator:</label>
        <select name="operator">
            <option value="+">+</option>
            <option value="-">-</option>
            <option value="*">*</option>
            <option value="/">/</option>
        </select><br><br>
        <label>Second operator:</label>
        <input type="number" name="two"><br><br>
        <button type="submit">calculate</button>
    </fieldset>
</form>
</body>
</html>