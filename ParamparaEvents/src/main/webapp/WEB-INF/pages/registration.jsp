<%@ page isELIgnored="false" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Registration</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">


    <link
      href="https://fonts.googleapis.com/css?family=Hanken Grotesk"
      rel="stylesheet"
    />
  <style>
    * {
      box-sizing: border-box;
      font-family: 'Segoe UI', sans-serif;
    }

    body {
      margin: 0;
      padding: 0;
      background-color: #E54E5; /* Primary background */
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
    }

    .container {
      width: 900px;
      height: 550px;
      background-color: #ffffff; /* Secondary */
      display: flex;
      border-radius: 40px;
      overflow: hidden;
      box-shadow: 0 0 30px rgba(0,0,0,0.2);
    }

    .form-section {
      flex: 1;
      padding: 50px;
      background-color: #ffffff; /* Secondary */
    }

    .form-section h2 {
      font-size: 32px;
      margin-bottom: 30px;
      color: #E54E5; /* Primary */
    }

    .input-group {
      position: relative;
      margin-bottom: 20px;
    }

    .input-group input {
      width: 100%;
      padding: 15px 45px 15px 15px;
      font-size: 16px;
      border: none;
      background-color: #f5f5f5;
      border-radius: 10px;
      outline: none;
      
    }

    .input-group i {
      position: absolute;
      right: 15px;
      top: 50%;
      transform: translateY(-50%);
      color: #696969; 
    }

    .checkbox-group {
      display: flex;
      align-items: center;
      font-size: 14px;
      margin-bottom: 25px;
      color: #333;
    }

    .checkbox-group input {
      margin-right: 10px;
    }

    .form-section button {
      width: 100%;
      padding: 15px;
      font-size: 16px;
      font-weight: bold;
      background-color: #C1050B; /* Accent */
      color: white;
      border: none;
      border-radius: 10px;
      cursor: pointer;
    }

    .form-section button:hover {
      background-color: #a00408;
    }

    .side-panel {
      flex: 1;
      background-color: #C1050B; /* Primary */
      color: white;
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      padding: 40px;
      border-top-left-radius: 150px;
      border-bottom-left-radius: 150px;
    }

    .side-panel h2 {
      font-size: 32px;
      margin-bottom: 10px;
    }

    .side-panel p {
      font-size: 16px;
      margin-bottom: 20px;
    }

    .side-panel a {
      color: white;
      text-decoration: none;
      font-weight: bold;
      font-size: 18px;
    }

    .side-panel a:hover {
      text-decoration: underline;
    }

    @media (max-width: 768px) {
      .container {
        flex-direction: column;
        height: auto;
        border-radius: 0;
      }

      .side-panel {
        border-radius: 0;
      }
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
    <!-- Left: Registration Form -->
    <div class="form-section">
      <h2>Registration</h2>
      <!-- Display error message if available -->
		<c:if test="${not empty error}">
			<p class="error-message">${error}</p>
		</c:if>

		<!-- Display success message if available -->
		<c:if test="${not empty success}">
			<p class="success-message">${success}</p>
		</c:if>
      <form action="${pageContext.request.contextPath}/registration" method="POST">
        <div class="input-group">    
          <input type="text" name="username" placeholder="Username" required />
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
          <input type="password" name="password" placeholder="Password" required />
          <i class="fas fa-lock"></i>
        </div>
        <div class="checkbox-group">
          <input type="checkbox" id="agree" name="agree" required>
          <label for="agree">I agree to the Terms & Conditions and Privacy Policy.</label>
        </div>
        <button type="submit">Register</button>
      </form>
    </div>

    <!-- Right: Side Panel -->
    <div class="side-panel">
      <h2>Welcome!</h2>
      <p>Already have an account?</p>
      <a href="${pageContext.request.contextPath}/pages/login.jsp">Login</a>
    </div>
  </div>
  
</body>
</html>