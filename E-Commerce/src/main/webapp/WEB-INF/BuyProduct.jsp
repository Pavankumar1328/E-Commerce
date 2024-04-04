<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:include page="userheader2.jsp"/>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
<br>

<h1 style="text-align:center" class="text-success">WISHLIST</h1>

<form method="get" action="/checkout">

<div class="container">
<table class="table table-hover table-bordered">

<thead class="table table-dark">
<tr>
<td>PRODUCT ID</td>
<td>PRODUCT NAME</td>
<td>PRODUCT PRICE</td>
<td>PRODUCT QTY</td>
<td>AMOUNT</td>
<td>UPDATE</td>
<td>DELETE</td>
</tr>
</thead>

<tbody>
<c:forEach items="${whislists}" var="whislist">
<tr>
<td>${whislist.id}</td>
<td>${whislist.cat}</td>
<td>${whislist.price}</td>
<td>${whislist.qty}</td>
<td>${whislist.qty * whislist.price}</td>
<td><a href="/updatewishlist?id=${whislist.id}" class="btn btn-success">UPDATE</a></td>
<td><a href="/deletewishlist?id=${whislist.id}" class="btn btn-danger">DELETE</a></td>
</tr>
</c:forEach>

<tr>
<td colspan="4">TOTAL PURCHASE AMOUNT</td>
<td colspan="1">${totalamount}</td>
</tr>

</tbody>
</table>
<div class="container" style="text-align:center">
<a href="/getproduct" class="btn btn-primary">Continue Your Shopping</a>
<button type="submit" class="btn btn-primary">CHECK OUT</button>
</div>
</form>
</body>
</html>