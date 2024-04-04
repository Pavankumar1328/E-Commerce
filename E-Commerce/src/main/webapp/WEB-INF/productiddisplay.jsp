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

<form method="post" action="/productbuy/${product.id}">
<br>
<div class="container" style="text-align:center">
<table class="table-bordered  table-hover center">
 <tr>
    <td rowspan="8">
    <img src="/images/${product.originalname}" height="300" width="300">
    </td>

    <td>Product ID:</td>
    <td>${product.id}</td>
    </tr>

    <td>Product Category :</td>
    <td>${product.cat}</td>
     </tr>

      <td>Product PRICE :</td>
      <td>${product.price}</td>
      </tr>

      <td>Product STOCK :</td>
      <td>${product.qty}</td>
      </tr>

      <td>QUANTITY</td>
      <td>
      <select name="quantity">
      <option value="1">1</option>
      <option value="2">2</option>
      <option value="3">3</option>
      <option value="4">4</option>
      <option value="5">5</option>
      </td>
      </tr>

      <tr>
      <td>
      <input type="submit" value="BUY" class="btn btn-primary">
      </td>
      </tr>

</table>
</form>

</div>
</body>
</html>