<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:include page="userheader2.jsp"/>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<div class="container">
    <h1 style="text-align:center" class="mt-5">Credit Card Payment</h1>
    <hr>
    <div class="row justify-content-center">
        <div class="col-md-6">
            <form method="post" action="/onlinepayment">
                <div class="form-group">
                    <label for="card-type">Card Type</label>
                    <select class="form-control" id="card-type">
                        <option>Visa</option>
                        <option>Mastercard</option>
                        <option>American Express</option>
                        <option>Discover</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="card-number">Card Number</label>
                    <input type="text" class="form-control" id="card-number" placeholder="Enter card number">
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="expiry-date">Expiry Date</label>
                        <input type="text" class="form-control" id="expiry-date" placeholder="MM/YY">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="cvv">CVV</label>
                        <input type="text" class="form-control" id="cvv" placeholder="CVV">
                    </div>
                </div>
                <div style="text-align:center">
                <button type="submit" class="btn btn-primary">Submit Payment</button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>