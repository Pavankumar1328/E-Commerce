<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:include page="userheader2.jsp"/>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

</head>
<body>
<div class="container">
<div class="row">

<c:forEach items="${products}" var="product">

<div class="col-sm-4 col-md-3">
 &nbsp&nbsp&nbsp
 <a href="/productid/${product.id}" class="center">
 <img src="/images/${product.originalname}"  width="200" height="200">
 </a>

 <p align="center">${product.cat}</p>
 <p align="center">PRICE : ${product.price}</p>
 <p align="center">QTY : ${product.qty}</p>

</div>

</c:forEach>

</div>
</div>
</body>
</html>
