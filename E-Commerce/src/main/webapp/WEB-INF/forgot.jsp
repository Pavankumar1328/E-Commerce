<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <jsp:include page="Header.jsp"/>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>FORGOT PAGE</title>
</head>
<body>

<script type="text/javascript">
setTimeout(()=>{
	const sometext=document.getElementById('invalid');
	sometext.style.display='none';
	const sometext1=document.getElementById('retrivepassword');
    sometext1.style.display='none';
},4000);
</script>

   <h1 class="text-center mt-5">FORGOT PAGE</h1>

   <div id="invalid" class="text-center mt-5 text-danger">
           <c:if test="${not empty invalid}">
           <b>${invalid}<b>
           </c:if>
   </div>

  <div id="retrivepassword" class="text-center mt-5 text-success">
                      <c:if test="${not empty retrivepassword}">
                       <b>${retrivepassword}<b>
                      </c:if>
    </div>

    <div class="container">
   <form class="mt-5 w-50 mx-auto" method="post" action="/forgot">
            <div class="form-group">
                <label>Phone NO</label>
                <input type="text" class="form-control" name="phone" placeholder="Enter Phone No">
            </div>
            <div class="form-group">
                <label>DOB</label>
                <input type="date" class="form-control" name="DOB" placeholder="Enter DOB">
            </div>
            <div style="text-align:center">
            <button type="submit" class="btn btn-primary">Retrive Password</button>
            </div>

            <div class="text-center mt-3">
             <a href="/login">Login Page</a>
            </div>
        </form>
        </div>
</body>
</html>