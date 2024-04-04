<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:include page="Header.jsp"/>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
</head>
<body>

<c:if test="${not empty success}">
<script type="text/javascript">
setTimeout(()=>{
	const sometext=document.getElementById('msg');
	sometext.style.display='none';
},3000);
</script>
<script type="text/javascript">
    setTimeout(function() {
        window.location.href = "/login";
    },3000);
</script>
</c:if>

 <div class="container">
        <h1 class="text-center mt-5">Login Form</h1>
                <div id="msg" class="text-center mt-5 text-success">
                        <c:if test="${not empty success}">
                        <b>${success}</b>
                        </c:if>
                 </div>
        <form class="mt-5 w-50 mx-auto" method="post" action="/sign in">
            <div class="form-group">
                <label>Username</label>
                <input type="text" class="form-control" name="username" placeholder="Enter username">
            </div>
            <div class="form-group">
                <label>Password</label>
                <input type="password" class="form-control" name="password" placeholder="Enter password">
            </div>
            <div style="text-align:center">
            <button type="submit" class="btn btn-primary">Login</button>
            </div>
        </form>

        <div class="text-center mt-3">
            <a href="/forgotpassword">Forgotten password?</a>
        </div>

        <div class="text-center mt-3">
            <a href="/Register">Create new account</a>
        </div>
    </div>
</body>
</html>