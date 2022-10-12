<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <title>User Management Application</title>
</head>
<body>
<center>
  <h1>User Management</h1>
  <c:if test="${requestScope.message!=null}">
    <h4>${requestScope.message}</h4>
  </c:if>
  <h2>
    <a href="/users?action=create">Add New User</a>
  </h2>
</center>
<div align="center">
  <table border="1" cellpadding="5">
    <caption><h2>List of Users</h2></caption>
    <tr>
      <th>ID</th>
      <th>Name</th>
      <th>Email</th>
      <th>Country</th>
      <th>Actions</th>
    </tr>
    <c:forEach items="${requestScope.list}" var="user">
      <tr>
        <td>${user.getId()}</td>
        <td>${user.getName()}</td>
        <td>${user.getEmail()}</td>
        <td>
          <c:forEach items="${applicationScope.listCountry}" var="country">
            <c:if test="${country.getId()==user.getIdCountry()}">
              ${country.getName()}
            </c:if>
          </c:forEach>
        </td>
        <td>
          <a href="/user?action=edit&id=${user.id}">Edit</a>
          <a href="/user?action=delete&id=${user.id}">Delete</a>
        </td>
      </tr>
    </c:forEach>
  </table>
</div>
</body>
</html>