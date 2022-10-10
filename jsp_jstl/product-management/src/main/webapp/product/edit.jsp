<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 10/10/2022
  Time: 11:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<html>
<head>
  <title>Edit product</title>
</head>
<body>
<h1>Edit product</h1>
<p>
  <c:if test='${requestScope["message"] != null}'>
    <span class="message">${requestScope["message"]}</span>
  </c:if>
</p>
<p>
  <a href="/products">Back to products list</a>
</p>
<form method="post">
  <fieldset>
    <legend>Product information</legend>
    <table>
      <tr>
        <td>Name: </td>
        <td><input type="text" name="name" id="name" value="${requestScope["product"].getName()}"></td>
      </tr>
      <tr>
        <td>Price: </td>
        <td><input type="number" name="price" id="price" value="${requestScope["product"].getPrice()}"></td>
      </tr>
      <tr>
        <td>Amount: </td>
        <td><input type="number" name="amount" id="amount" value="${requestScope["product"].getAmount()}"></td>
      </tr>
      <tr>
        <td>Description: </td>
        <td>
          <textarea name="description" id="description" style="resize: none" cols="30" rows="10" >${requestScope["product"].getDescription()}</textarea>
        </td>
      </tr>
      <tr>
        <td>Producer : </td>
        <td>
          <input type="text" name="producer" id="producer" class="producer">
        </td>
      </tr>
      <tr>
        <td></td>
        <td><input type="submit" value="Update product"></td>
      </tr>
    </table>
  </fieldset>
</form>
</body>
</html>