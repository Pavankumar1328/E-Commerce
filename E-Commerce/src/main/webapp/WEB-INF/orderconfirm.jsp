<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:include page="userheader2.jsp"/>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        .bg-primary-custom {
          background-color: #007bff !important;
        }
        .bg-secondary-custom {
          background-color: #6c757d !important;
        }
        .text-primary-custom {
          color: #007bff !important;
        }
        .text-secondary-custom {
          color: #6c757d !important;
        }
    </style>
</head>
<body>
<div class="container">
    <h1 class="mt-5">Order Receipt</h1>
    <hr>
    <div class="row">
        <div class="col-md-6">
            <h5>Order Number: <span class="text-muted">${reciept.id}</span></h5>
            <p>Order Date: <span class="text-muted">${date}</span></p>
        </div>
        <div class="col-md-6 text-right">
            <h5>Shipping Address</h5>
            <p class="text-muted">${username    }</p>
            <p class="text-muted">${reciept.address}</p>
        </div>
    </div>
    <hr>
    <table class="table mt-4">
        <thead>
        <tr class="bg-secondary-custom text-white">
            <th scope="col">ID</th>
            <th scope="col">Item</th>
            <th scope="col">Price</th>
            <th scope="col">Quantity</th>
            <th scope="col">Total</th>
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
        </tbody>
        </c:forEach>
        <tfoot>
        <tr class="bg-light">
            <th colspan="4" class="text-right">TOTAL PURCHASE AMOUNT</th>
            <td>${totalamount}</td>
        </tr>
        </tfoot>
    </table>
    <b><p>PAYMENT : ${reciept.paymentdetails}</p></b>
    <hr>
    <p class="text-muted text-center">Thank you for shopping with us!</p>
</div>
</body>
</html>