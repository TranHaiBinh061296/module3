<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 10/10/2022
  Time: 11:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Product List</title>
</head>
<body>
<h1>Products</h1>
<p>
  <a href="/products?action=create">Create new product</a>
</p>

<form method="post" action ="/products?action=search" >
  <table>
    <tr>
      <td><input type="text" name="name" id="name" placeholder="Product name search" ></td>
      <td><button type="submit" >Search</button></td>
    </tr>
  </table>
</form>
<table border="1">
  <tr>
    <td>Product Name</td>
    <td>Price</td>
    <td>Amount</td>
    <td>Description</td>
    <td>Producer</td>
    <td>Edit</td>
    <td>Delete</td>
  </tr>
  <c:forEach items='${requestScope["products"]}' var="product">
    <tr>
      <td><a href="/products?action=view&id=${product.getId()}">${product.getName()}</a></td>
      <td>${product.getPrice()}</td>
      <td>${product.getAmount()}</td>
      <td>${product.getDescription()}</td>
      <td>${product.getProducer()}</td>
      <td><a href="/products?action=edit&id=${product.getId()}">edit</a></td>
      <td><a href="/products?action=delete&id=${product.getId()}">delete</a></td>
    </tr>
  </c:forEach>


</table>
</body>
</html>
