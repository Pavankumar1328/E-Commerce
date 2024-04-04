<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:include page="Header.jsp"/>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
</head>
<body>

<c:if test="${mood=='error'}">
<script type="text/javascript">
    setTimeout(function() {
        window.location.href = "/Register";
    }, 5000);
</script>
</c:if>

<c:if test="${not empty usernames}">
<script type="text/javascript">
setTimeout(()=>{
	const sometext=document.getElementById('msg');
	sometext.style.display='none';
},3000);
</script>

<script type="text/javascript">
    setTimeout(function() {
        window.location.href = "/Register";
    },3000);
</script>
</c:if>

<div class="container">
        <h1 class="text-center mt-5">Create Account</h1>
        <div id="msg" class="text-center mt-5 text-danger">
                <c:if test="${not empty usernames}">
                <b>${usernames}</b>
                </c:if>
         </div>
        <form class="mt-5 w-50 mx-auto" method="post" action="/sign up">
            <div class="form-group">
                <label>Username</label>
                <input type="text" class="form-control" name="username" placeholder="Enter username">
                <div class="text-danger">
                 <c:if test="${not empty result.getFieldError('username')}">
                  ${result.getFieldError('username').getDefaultMessage()}
                 </c:if>
                 </div>
                 <br>
                <label>Password</label>
                <input type="password" class="form-control" name="password" placeholder="Enter password">
                <div class="text-danger">
                                 <c:if test="${not empty result.getFieldError('password')}">
                                  ${result.getFieldError('password').getDefaultMessage()}
                                 </c:if>
                                 </div>
                <br>
                <label>Email</label><input type="email" class="form-control" name="email" value="@gmail.com">
                 <div class="text-danger">
                 <c:if test="${not empty result.getFieldError('email')}">
                                                  ${result.getFieldError('email').getDefaultMessage()}
                                                 </c:if>
                                                 </div>
                <br>
                <label>DOB</label><input type="date" class="form-control" name="DOB" placholder="Enter the DOB">
                 <div class="text-danger">
                 <c:if test="${not empty result.getFieldError('DOB')}">
                       ${result.getFieldError('DOB').getDefaultMessage()}
                      </c:if>
                      </div>
                <br>
                <label>Phone No</label><input type="tel" class="form-control" name="phone" placeholder="Enter the Phone NO">
                <div class="text-danger">
                 <c:if test="${not empty result.getFieldError('phone')}">
                ${result.getFieldError('phone').getDefaultMessage()}
                    </c:if>
                   </div>
                <br>
                <label>Gender</label>&nbsp;&nbsp;<input type="radio" name="Gender" value="Male">Male&nbsp;&nbsp;
                <input type="radio" name="Gender" value="Female">Female&nbsp;&nbsp;
                <input type="radio" name="Gender" value="Others">Others
                 <div class="text-danger">
                <c:if test="${not empty result.getFieldError('Gender')}">
                                ${result.getFieldError('Gender').getDefaultMessage()}
                                    </c:if>
                                   </div>

                </div>
              <div style="text-align:center">
             <button type="submit" class="btn btn-primary">Sign Up</button>
             </div>
        </form>
</body>
</html>
