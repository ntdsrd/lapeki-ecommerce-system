<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:url value="/view/customer/" var="url"></c:url>
<c:url value="/" var="path"></c:url>
<!DOCTYPE html>
<html>
<head>
	<title>Register</title>
	<link rel="icon" type="image/png" href="${url }images/favicon.png">
	<meta charset="UTF-8">
	<link rel="stylesheet" href="${url }custom.css/login_register_style.css">
	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700,800&display=swap" rel="stylesheet">
</head>
<body>
	 <%
	 	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1
	 	response.setHeader("Pragma", "no-cache"); //HTTP 1.0
	 %>
  <div class="cont">
    <form action="login" method="post" class="form sign-in">
     <a href="${path}">
        <img class="back-button" src="${url }images/arrow-left-solid.svg" alt="Back">  
      </a>
      <h2>Sign In</h2>
      <label>
        <span>Username</span>
        <input type="text" name="username">
      </label>
      <label>
        <span>Password</span>
        <input type="password" name="password">
      </label>
      <label class="container">Remember me
        <input type="checkbox" name="remember" >
        <span class="checkmark"></span>
      </label>
      <button class="submit">Sign In</button>
      <p class="forgot-pass">Forgot Password ?</p>

      <div class="social-media">
        <ul>
          <li><img src="${url }images/facebook.png"></li>
          <li><img src="${url }images/twitter.png"></li>
          <li><img src="${url }images/linkedin.png"></li>
          <li><img src="${url }images/instagram.png"></li>
        </ul>
      </div>
    </form>

    <div class="sub-cont">
      <div class="img">
        <div class="img-text m-up">
          <h2>New here?</h2>
          <p>Sign up and discover great amount of new opportunities!</p>
        </div>
        <div class="img-text m-in">
          <h2>One of us?</h2>
          <p>If you already has an account, just sign in. We've missed you!</p>
        </div>
        <div class="img-btn">
          <span class="m-up">Sign Up</span>
          <span class="m-in">Sign In</span>
        </div>
      </div>
    
      <form action="register" method="post" class="form sign-up">
      	<a href="${path}">
        <img class="back-button" src="${url }images/arrow-left-solid.svg" alt="Back">  
      </a>
        <h2>Sign Up</h2>
        <div class="signup-container">
          <div class="left">
            <label>
              <span>Username</span>

              <input type="text" name="username" required>
            </label>
            <label>
              <span>Password</span>
              <input type="password" name="password" required>
            </label>
            <label>
              <span>Email</span>
              <input type="email" name="email" required>
            </label>
            <label>
              <span>Date of Birth</span>
              <input type="date" name="dob" required>
            </label>
          </div>

          <div class="right">
            <label>
              <span>Full name</span>
              <input type="text" name="fullname" required>
            </label>
            <label>
              <span>Address</span>
              <input type="text" name="address" required>
            </label>
            <label>
              <span>Phone number</span>
              <input type="tel" name="mobile" required>
            </label>
            <label>
              <span>Gender: </span>
              <select id="gender-option" name="gender">							
                <option value="Male" >Male</option>
                <option value="Female">Female</option>
                <option value="Others">Others</option>
              </select>
            </label>
          </div>
        </div>
        
        
        <button type="submit" class="submit submit-signup">Sign Up</button>
      </form>
    </div>
  </div>
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script >
  document.querySelector('.img-btn').addEventListener('click', function()
	{
		document.querySelector('.cont').classList.toggle('s-signup')
	}
);
  
 	var pathname = window.location.pathname;
 	if(pathname == "/SE2-Ecommerce_WebProject/register"){
 		document.querySelector('.cont').classList.add('s-signup');
 	}
 	
 	
 	var alert = '${alert}';
 	console.log(alert);
 	if(alert.length > 0){
 		swal("Error!", alert, "error");
 	}
</script>
</body>
</html>