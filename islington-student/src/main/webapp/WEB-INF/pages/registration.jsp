<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" type="text/css" href= "${pageContext.request.contextPath}/css/home.css"/>
</head>
<body>
<div class = "container">
<form action = "#">
<h2>Registration</h2>
<div class = "formcontent">
<label for = "firstname">First Name:</label>
<input type = "text" id = "firstname" name = "firstname" required>
<label for = "lastname">Last Name:</label>
<input type = "text" id = "lastname" name = "lastname" required>
</div>

<div class = "formcontent">
<label for = "username">User Name:</label>
<input type = "text" id = "username" name = "username" required>
<label for = "DOB">Date of Birth:</label>
<input type = "date" id = "DOB" name = "DOB" required>
</div>

<div class = "formcontent">
<label for = "gender">Gender:</label>

                    <input type="radio" id="male" name="gender" value="Male" checked>
                    <label for="male">Male</label>
                    <input type="radio" id="female" name="gender" value="Female">
                    <label for="female">Female</label>
                

<label for = "email">Email:</label>
<input type = "email" id = "email" name = "email" required>
</div>

<div class = "formcontent">
<label for = "number">Phone Number:</label>
<input type = "text" id = "number" name = "number" required>
<label for = "subject">Subject:</label>
<input type = "text" id = "subject" name = "subject" required>
</div>

<div class = "formcontent">
<label for = "password">Password:</label>
<input type = "text" id = "password" name = "password" required>
<label for = "repassword">Retype Password:</label>
<input type = "text" id = "repassword" name = "repassword" required>
</div>
<button type="submit" class="login-button">Login</button>
</form>


</div>

</body>
</html>