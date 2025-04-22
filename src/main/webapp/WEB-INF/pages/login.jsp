<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Login Page</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
  <link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/header.css" />

    <link
      href="https://fonts.googleapis.com/css?family=Hanken Grotesk"
      rel="stylesheet"
    />
  <style>
    * {
      box-sizing: border-box;
      font-family: 'Segoe UI', sans-serif;
      margin: 0;
      padding: 0;
    }

    body {
      background-color: #E54E5; /* Primary background */
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
    }

    .container {
      width: 900px;
      height: 550px;
      display: flex;
      background-color: #FFFFFF; /* Secondary (white) */
      border-radius: 40px;
      overflow: hidden;
      box-shadow: 0 0 20px rgba(0, 0, 0, 0.5);
      position: relative;
    }

    /* Left Welcome Panel */
    .left-panel {
      width: 50%;
      background-color: #C1050B; /* Accent background */
      color: #FFFFFF;
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      padding: 40px;
      text-align: center;
      position: relative;
      overflow: hidden;
      border-top-right-radius: 150px;
      border-bottom-right-radius: 150px;
    }

    .left-panel h2 {
      font-size: 36px;
      margin-bottom: 10px;
      position: relative;
      z-index: 2;
    }

    .left-panel p {
      font-size: 16px;
      margin-bottom: 20px;
      position: relative;
      z-index: 2;
    }

    .left-panel a {
      color: #FFFFFF;
      font-size: 18px;
      font-weight: bold;
      text-decoration: none;
      position: relative;
      z-index: 2;
    }

    .left-panel a:hover {
      text-decoration: underline;
    }

    /* Right Login Form Panel */
    .right-panel {
      width: 50%;
      padding: 60px 50px;
      display: flex;
      flex-direction: column;
      justify-content: center;
    }

    .right-panel h2 {
      font-size: 30px;
      margin-bottom: 30px;
      color: #C1050; /* Accent heading */
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
      background-color: #f5f5f5; /* Light gray input background */
      border-radius: 10px;
      outline: none;
      color: #C1050B;
    }

    .input-group input::placeholder {
      color: #696969; /* Primary placeholder */
    }

    .input-group i {
      position: absolute;
      right: 15px;
      top: 50%;
      transform: translateY(-50%);
      color: #696969; /* Match placeholder color */
    }

    .forgot {
      text-align: right;
      font-size: 14px;
      margin-bottom: 25px;
      
    }

    .forgot a {
      color: #696969;
      text-decoration: none;
    }

    .forgot a:hover {
      text-decoration: underline;
    }

    .right-panel button {
      width: 100%;
      padding: 15px;
      font-size: 16px;
      font-weight: bold;
      background-color: #C1050B; /* Primary */
      color: #FFFFFF;
      border: none;
      border-radius: 10px;
      cursor: pointer;
      transition: background-color 0.3s;
    }

    .right-panel button:hover {
      background-color: #a00408; /* Accent on hover */
    }

    @media (max-width: 768px) {
      .container {
        flex-direction: column;
        height: auto;
        width: 95%;
        border-radius: 20px;
      }

      .left-panel,
      .right-panel {
        width: 100%;
        padding: 30px;
      }
      
      .left-panel::before {
        display: none;
      }
    }
    .bgimg{
     position:absolute;
     filter:blur(5px) brightness(0.7);
     width:100vw;
     height:100vh;
     
    }
  </style>
</head>
<body>
	<jsp:include page="header.jsp" />
	<img class="bgimg" src="${pageContext.request.contextPath}/resources/images/system/bgimg.jpg" alt="hero image" />
	
  <div class="container">
    <!-- Left Panel -->
    <div class="left-panel">
      <h2>Hello, Welcome!</h2>
      <p>Don't have an account?</p>
      <a href="${pageContext.request.contextPath}/pages/registration.jsp">Register</a>
    </div>

    <!-- Right Panel Login Form -->
    <div class="right-panel">
      <h2>Login</h2>
      <form action="login" method="POST">
        <div class="input-group">
          <input type="text" name="username" placeholder="Username" required />
          <i class="fas fa-user"></i>
        </div>
        <div class="input-group">
          <input type="password" name="password" placeholder="Password" required />
          <i class="fas fa-lock"></i>
        </div>
        <div class="forgot">
          <a href="#">Forgot Password?</a>
        </div>
        <button type="submit">Login</button>
      </form>
    </div>
  </div>
</body>
</html>