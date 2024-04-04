<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:include page="userheader2.jsp"/>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<br>

<h1 style="text-align:center" class="text-success">ORDER ITEMS</h1>

<form method="post" action="/orderconfirm">

<div class="container">
<table class="table table-hover table-bordered">

<thead class="table table-dark">
<tr>
<td>PRODUCT ID</td>
<td>PRODUCT NAME</td>
<td>PRODUCT PRICE</td>
<td>PRODUCT QTY</td>
<td>AMOUNT</td>
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
</tr>
</c:forEach>

<tr>
<td colspan="4">TOTAL PURCHASE AMOUNT</td>
<td colspan="1">${totalamount}</td>
</tr>
<tr>
<td><b><p class="text-danger">ADDRESS</p></b></td>
<td><textarea name="address" cols="32" rows="1"></textarea></td>
</tr>
</tbody>
</table>
<div style="background-color:Tomato;">
PAYMENT DETAILS : <input type="radio" name="paymentdetails" value="Credit card">Credit Card
<input type="radio" name="paymentdetails" value="Cash on Delivery">Cash on Delivery
</div>
<br><br>
<div class="container" style="text-align:center">
<a href="/productbuy" class="btn btn-primary">MODIFY WISHLIST</a>
<button type="submit" class="btn btn-primary">ORDER CONFIRM</button>
</div>
</form>
</body>
</html>