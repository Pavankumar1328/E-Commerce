<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:include page="Header2.jsp"/>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
<c:choose>

<c:when test="${mood=='add'}">
<div class="container">
<form class="mt-5 w-50 mx-auto" method="post" action="/addcategory">
<div class="form-group">
<label>CATEGORY NAME</label>
<input class="form-control" type="text" name="cname">
</div>
<div class="form-group" >
<label>CATEGORY DESCRIPTION</label>
<input  class="form-control" type="text" name="cdesc">
</div>
<div style="text-align:center">
<button  type="submit" class="btn btn-primary">ADD CATEGORY</button>
</div>
</form>
</div>
<br>


<div class="container" style="text-align:center">
<form  method="get" action="/getBysearch">
<label>FILTER</label>
<input type="text" name="search" placeholder="search">&nbsp
<button type="submit" class="btn btn-primary">SEARCH</button>
<a href="/category">CLEAR</a>
</div>
</form>
</div>

<br>
<div class="container">
<table class="table table-striped table-bordered table-hover">
<thead class="table table-dark">
<tr>
<td>NO</td>
<td>CATEGORY</td>
<td>CATEGORY DESCRIPTION</td>
<td>UPDATE</td>
<td>DELETE</td>
</tr>
</thead>
<tbody>

<c:if test="${not empty cats}">
<c:forEach items="${cats}" var="cat">
<tr>
<td>${cat.cid}</td>
<td>${cat.cname}</td>
<td>${cat.cdesc}</td>
<td><a href="/updatecategory/${cat.cid}" class="btn btn-success">UPDATE</a></td>
<td><a href="/deletecategory?id=${cat.cid}" class="btn btn-danger">DELETE</a></td>
</tr>
</c:forEach>
</tbody>
</table>
</div>
</c:if>

<c:if test="${not empty search}">
<c:forEach items="${search}" var="search">
<tr>
<td>${search.cid}</td>
<td>${search.cname}</td>
<td>${search.cdesc}</td>
<td><a href="/updatecategory/${search.cid}" class="btn btn-success">UPDATE</a></td>
<td><a href="/deletecategory?id=${search.cid}" class="btn btn-danger">DELETE</a></td>
</tr>
</c:forEach>
</tbody>
</table>
</div>
</c:if>

<div class="container" style="text-align:center">

Pages : <a href="/categoryByPage/1">1</a>
 <a href="/categoryByPage/2">2</a>
 <a href="/categoryByPage/3">3</a>
<c:if test="${currentpage < totalpages-1}">
<a href="/categoryByPage/${currentpage+2}">Next</a>
</c:if>

<c:if test="${currentpage > 0}">
<a href="/categoryByPage/${currentpage}">Previous</a>
</c:if>
</div>

</c:when>

<c:when test="${mood=='update'}">
<div class="container" style="text-align:center">
<form class="mt-5 w-50 mx-auto" method="post" action="/updatecat">
<input type="hidden" name="cid" value="${category.cid}">
<div class="form-group">
<label>CATEGORY NAME</label>
<input type="text" class="form-control" name="cname" value="${category.cname}">
</div>
<div class="form-group" >
<label>CATEGORY DESCRIPTION</label>
<input type="text" class="form-control" name="cdesc" value="${category.cdesc}">
</div>
<div>
<button type="submit" class="btn btn-primary">UPDATE CATEGORY</button>
</div>
</form>
</div>
</c:when>

</c:choose>
</body>
</html>