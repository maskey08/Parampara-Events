<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>PARAMPARA EVENTS</title>
	<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/header.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/home.css" />
    <link
      href="https://fonts.googleapis.com/css?family=Hanken Grotesk"
      rel="stylesheet"
    />
    

  
  </head>
  <body>
	<jsp:include page="header.jsp" />
    <div class="hero">
      <img class="bgimg" src="${pageContext.request.contextPath}/resources/images/system/bgimg.jpg" alt="hero image" />
    </div>

    <div class="hero-blend">
      <div class="wrapper">
        <div class="lid one"></div>
        <div class="lid two"></div>
        <div class="envelope"></div>
        <div class="letter">
          <p>Get 20% off on your first booking.</p>
        </div>
        <button class="book-now-btn">Book Now</button>
      </div>
    </div>

    <script src="${pageContext.request.contextPath}/scripts/scripts.js"></script>
	<jsp:include page="footer.jsp" />

  </body>
</html>
