<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 10/10/2022
  Time: 11:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Customer details</title>
</head>
<body>
<p>
  <a href="/products">Back to product list</a>
</p>
<table>
  <tr>
    <td>Name: </td>
    <td>${requestScope["product"].getName()}</td>
  </tr>
  <tr>
    <td>Price: </td>
    <td>${requestScope["product"].getPrice()}</td>
  </tr>
  <tr>
    <td>Amounts: </td>
    <td>${requestScope["product"].getAmount()}</td>
  </tr>
  <tr>
    <td>Description: </td>
    <td>${requestScope["product"].getDescription()}</td>
  </tr>
  <tr>
    <td>producer :</td>
    <td>${requestScope["product"].getProducer()}</td>
  </tr>
</table>
</body>
</html>
