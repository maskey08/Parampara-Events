<%@ page isELIgnored="false" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login & Register</title>
    <style>
      * {
      box-sizing: border-box;
      font-family: 'Segoe UI', sans-serif;
    }

    body {
      margin: 0;
      padding: 0;
      background-color: #eee; /* Primary background */
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
    } 

      .container {
        width: 900px;
        height: 550px;
        background: #fff;
        border-radius: 50px;
        overflow: hidden;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
        position: relative;
      }

      .form-slider {
        display: flex;
        width: 100%;
        height: 100%;
        position: relative;
      }

      .form-panel {
        width: 50%;
        padding: 50px;
        z-index: 1;
      }

      .form-panel h2 {
        margin-bottom: 20px;
        color: #c1050b;
      }

      .input-group {
        margin-bottom: 15px;
      }
      .checkbox-group  {
      font-size: 13px;
      margin-bottom: 20px;
      color: #555;
    }
    .checkbox-group input{
      transform: translateY(20%);
    }

      .input-group input,
      .input-group select {
        width: 100%;
        padding: 10px;
        border-radius: 5px;
        border: 1px solid #ccc;
      }

      .form-panel button {
        width: 100%;
        padding: 12px;
        background: #c1050b;
        color: #fff;
        font-weight: bold;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: 0.3s;
      }

      .form-panel button:hover {
        background: #a00408;
      }

      .switch-buttons {
        position: absolute;
        width: 200%;
        height: 100%;
        top: 0;
        left: 0;
        background: #c1050b;
        color: #fff;
        border-radius: 10vw;
        display: flex;
        justify-content: flex;
        align-items: center;
        text-align: center;
        transition: all 1.5s ease;
        z-index: 2;
        transform: translateX(-75%);
      }

      .switch-buttons.move-right {
        left: 200%;
        transition: all 1.5s ease;
      }

      .switch-buttons h2 {
        margin-bottom: 10px;
         font-size: 36px;
      }

      .switch-buttons button {
        background: none;
        color: #fff;
        border: none;
        margin: 5px;
 		font-size: 18px;
        cursor: pointer;
        transition: 1s;
      	font-weight: bold;
      }

      .switch-buttons button:hover {
        text-decoration: underline;
         transition: 3s;
        
      }

      .sb-login,
      .sb-register {
        width: 25%;
        color: #ffffff;
        display: block;
        align-items: center;
        justify-content: center;
      }
      .sb-m {
        width: 50%;
      }
      .bgimg{
        position:absolute;
        filter:blur(5px) brightness(0.7);
        width:100vw;
        height:100vh;
        z-index:-1;
      }
    
     .error-message {
        color: red;
      }

      .success-message {
        color: seagreen;
      }
    </style>
  </head>
  <body>
<jsp:include page="header.jsp" />
	<img class="bgimg" src="${pageContext.request.contextPath}/resources/images/system/bgimg.jpg" alt="hero image" />
    <div class="container">
      <div class="form-slider">
        <!-- Register Form -->
        <div class="form-panel">
          <h2>Registration</h2>
          <!-- Display error message if available -->
          <c:if test="${not empty Rerror}">
            <p class="error-message">${Rerror}</p>
          </c:if>

          <!-- Display success message if available -->
          <c:if test="${not empty success}">
            <p class="success-message">${success}</p>
          </c:if>
          <form
            action="${pageContext.request.contextPath}/registration"
            method="POST"
          >
            <div class="input-group">
              <input
                type="text"
                name="username"
                placeholder="Username"
                required
              />
              <i class="fas fa-user"></i>
            </div>
            <div class="input-group">
              <input type="tel" name="phone" placeholder="Phone" required />
              <i class="fas fa-phone"></i>
            </div>
            <div class="input-group">
              <input type="email" name="email" placeholder="Email" required />
              <i class="fas fa-envelope"></i>
            </div>
            <div class="input-group">
              <input
                type="password"
                name="password"
                placeholder="Password"
                required
              />
              <i class="fas fa-lock"></i>
            </div>
            <div class="checkbox-group">
              <input type="checkbox" id="agree" name="agree" required />
              <label for="agree"
                >I agree to the Terms & Conditions and Privacy Policy.</label
              >
            </div>
            <button type="submit">Register</button>
          </form>
        </div>

        <!-- Login Form -->
        <div class="form-panel">
          <h2>Login</h2>
          <!-- Display error message if available -->
          <c:if test="${not empty Lerror}">
            <p class="error-message">${Lerror}</p>
          </c:if>

          <!-- Display success message if available -->
          <c:if test="${not empty success}">
            <p class="success-message">${success}</p>
          </c:if>
          <form action="login" method="POST">
            <div class="input-group">
              <input
                type="text"
                name="username"
                placeholder="Username"
                required
              />
              <i class="fas fa-user"></i>
            </div>
            <div class="input-group">
              <input
                type="password"
                name="password"
                placeholder="Password"
                required
              />
              <i class="fas fa-lock"></i>
            </div>
            <div class="checkbox-group">
              <input type="checkbox" name="rememberMe" value="true" /> 
              <label>Remember Me</label>
            </div>
            <button type="submit">Login</button>
          </form>
        </div>
      </div>

      <!-- Switch Panel -->
      <div class="switch-buttons" id="switch-buttons">
        <div class="sb-login">
          <h2>Hello, Welcome!</h2>
          <p>Already have an account?</p>
          <button onclick="showLogin()">Login</button>
        </div>
        <div class="sb-m"></div>
        <div class="sb-register">
          <h2>Welcome Back!</h2>
          <p>Don't have an account?</p>
          <button onclick="showRegister()">Register</button>
        </div>
      </div>
    </div>
    <c:if test="${param.show == 'register'}">

    <script>
      function showLogin() {
        const panel = document.getElementById("switch-buttons");
        panel.classList.remove("move-right");
      }

      function showRegister() {
        const panel = document.getElementById("switch-buttons");
        panel.classList.add("move-right");
      }

    window.addEventListener('DOMContentLoaded', () => {
      showRegister();
    });
  </script>
</c:if>
    
  </body>
</html>
