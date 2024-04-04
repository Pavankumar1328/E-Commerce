<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:include page="Header2.jsp"/>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
</head>

<body>

<c:choose>

<c:when test="${mood=='add'}">

<div class="container" >
<form class="mt-5 w-50 mx-auto" method="post" action="addproduct" enctype="multipart/form-data">
<div class="form-group">
<label>PRODUCT CATEGORY</label>
<select name="cat" class="form-group">
 <option value="0" label="SELECT ITEMS" />
 <c:forEach items="${category}" var="cat">
 <option class="form-control" value="${cat}"  label="${cat}">
 </c:forEach>
</select>
</div>
<div class="form-group">
<label>PRODUCT PRICE</label>
<input type="text" class="form-control" name="price">
</div>
<div class="form-group">
<label>PRODUCT STOCK</label>
<input type="text" class="form-control" name="qty">
</div>
<div class="form-group">
<label>PRODUCT IMAGE</label>
<input type="file" class="form-control" name="image">
</div>
<div style="text-align:center">
<button type="submit" class="btn btn-primary">ADD PRODUCT</button>
</div>
</form>
</div>
<br>

<div class="container">
<table class="table table-striped table-bordered table-hover">
<thead class="table table-dark">
<tr>
<td>NO</td>
<td>PRODUCT NAME</td>
<td>PRODUCT IMAGE</td>
<td>PRODUCT PRICE</td>
<td>PRODUCT QTY</td>
<td>UPDATE</td>
<td>DELETE</td>
</tr>
</thead>

<tbody>
<c:forEach items="${products.getContent()}" var="product">
<tr>
<td>${product.id}</td>
<td>${product.cat}</td>
<td><img src="/images/${product.originalname}" width="80" height="80"></td>
<td>${product.price}</td>
<td>${product.qty}</td>
<td><a href="/updateproduct?id=${product.id}" class="btn btn-success">UPDATE</a></td>
<td><a href="/deleteproduct?id=${product.id}" class="btn btn-danger">DELETE</a></td>
</tr>
</c:forEach>
</tbody>
</table>
</div>
<div class="container" style="text-align:center">
<b>Pages : </b><a href="/productmanage?id=0">1</a>
<a href="/productmanage?id=1">2</a>
<c:if test="${products.getNumber()+1 < products.getTotalPages()}">
<a href="/productmanage?id=${products.getNumber()+1}">NEXT</a>
</c:if>
<c:if test="${products.getNumber() > 0}">
<a href="/productmanage?id=${products.getNumber()-1}">PREVIOUS</a>
</c:if>
</div>
</c:when>

<c:when test="${mood=='update'}">
<div class="container" >
<form class="mt-5 w-50 mx-auto" method="post" action="/updateproducts" enctype="multipart/form-data">
<input type="hidden" name="id" value="${product.id}">
<div class="form-group">
<label>PRODUCT CATEGORY</label>
<select name="cat" class="form-group">
 <c:forEach items="${category}" var="cat">
 <option  value="${cat}" label="${cat}">
 </c:forEach>
</select>
</div>
<div class="form-group">
<label>PRODUCT PRICE</label>
<input type="text" class="form-control" value="${product.price}" name="price">
</div>
<div class="form-group">
<label>PRODUCT STOCK</label>
<input type="text" class="form-control" value="${product.qty}" name="qty">
</div>
<div class="form-group">
<label>PRODUCT IMAGE</label>
<input type="file" class="form-control"  name="image"><br>
<img src="/images/${product.originalname}" width="80" height="80">
</div>
<div style="text-align:center">
<button type="submit" class="btn btn-primary">UPDATE PRODUCT</button>
</div>
</form>
</div>
</c:when>
</c:choose>

</body>
</html>