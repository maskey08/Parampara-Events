<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="jakarta.servlet.http.HttpSession"%>
<%@ page import="jakarta.servlet.http.HttpServletRequest"%>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
%>

<%
	// Initialize necessary objects and variables
	HttpSession userSession = request.getSession(false);
	String currentUser = (String) (userSession != null ? userSession.getAttribute("username") : null);
	// need to add data in attribute to select it in JSP code using JSTL core tag
	pageContext.setAttribute("currentUser", currentUser);
	String contextPath = request.getContextPath();
	// Determine action URL and button label based on user session
	String actionUrl;
	String formMethod; 
	String buttonLabel;
	
	if (currentUser != null) {
		actionUrl=contextPath + "/logout";
		formMethod="POST"; // Call dopost in Logout Controller
		buttonLabel="Logout";
	} else {
		actionUrl = contextPath + "/login";
		formMethod="GET"; // Call dopost in Logout Controller
		buttonLabel="Login";
	}
%>
<style>
 * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
      }

      body {
        font-family: "Hanken Grotesk", sans-serif;
        line-height: 1.6;
        color: #333;
      }

      .header {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        z-index: 1000;
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 10px 30px;
        transition: background-color 0.4s ease, box-shadow 0.4s ease;
        background: linear-gradient(
          to bottom,
          rgba(255, 255, 255, 0.95),
          rgba(255, 255, 255, 0)
        );
      }

      .header.scrolled {
        background-color: #ffffffa3;
        backdrop-filter: blur(2px);
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.5);
      }

      .nav {
        display: flex;
        gap: 50px;
        align-items: center;
      }

      a {
        font-size: 17px;
        text-decoration: none;
        color: #000;
        transition: color 0.3s ease;
      }

      a:hover {
        color: #e74c3c;
      }

      #logo img {
        height: 60px;
      }

      .icon {
        position: absolute;
        right: 30px;
        top: 50%;
        transform: translateY(-45%);
        display: flex;
        align-items: center;
        align-items: center;
        gap: 15px;
      }

      .search {
        display: flex;
        align-items: center;
        gap: 5px;
      }

      .search-bar {
        border: none;
        background-color: inherit;
        width: 125px;
        height: 24px;
        padding: 0 4px;
        font-size: 14px;
        outline: none;
        vertical-align: middle;
      }

      .search:has(.search-bar:focus) {
        border-bottom: 1px solid #000;
      }

      .search-icon svg {
        width: 23px;
        height: 23px;
        transition: width 0.3s ease, height 0.3s ease;
      }

      .search-bar:focus + .search-icon svg {
        width: 20px;
        height: 20px;
      }

      .search-icon {
        border: none;
        background-color: inherit;
        cursor: pointer;
        padding: 0;
      }

      .search-icon:hover {
        color: #e74c3c;
      }

</style>
<header class="header" id="navbar">
      <div class="nav">
        <a href="${pageContext.request.contextPath}/services">Services</a>
        <a href="${pageContext.request.contextPath}/aboutus">About Us</a>
        <a id="logo" href="${pageContext.request.contextPath}/home"><img src="${pageContext.request.contextPath}/resources/images/system/logo.png" alt="Logo" /></a>
        <a href="${pageContext.request.contextPath}/gallery">Gallery</a>
        <a href="${pageContext.request.contextPath}/contactus">Contact Us</a>
        <div class="icon">
          <div class="search">
            <input type="text" id="search-bar" class="search-bar" />
            <button class="search-icon">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                width="24"
                height="24"
                viewBox="0 0 24 24"
                fill="none"
                stroke="currentColor"
                stroke-width="1.5"
                stroke-linecap="round"
                stroke-linejoin="round"
                class="feather feather-search"
              >
                <circle cx="11" cy="11" r="8" />
                <line x1="21" y1="21" x2="16.65" y2="16.65" />
              </svg>
            </button>
          </div>
          <a href="${pageContext.request.contextPath}/registration">
            <svg
              xmlns="http://www.w3.org/2000/svg"
              width="24"
              height="24"
              viewBox="0 0 24 24"
              fill="none"
              stroke="currentColor"
              stroke-width="1.5"
              stroke-linecap="round"
              stroke-linejoin="round"
              class="feather feather-user"
            >
              <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2" />
              <circle cx="12" cy="7" r="4" />
            </svg>
          </a>
          <c:choose>
					<c:when test="${not empty currentUser}">
						<form action="${pageContext.request.contextPath}/logout" method="POST">
						
							<input type="submit" class="nav-button" value="Logout" />
						</form>
					</c:when>
					<c:otherwise>
						<a href="${pageContext.request.contextPath}/login">Login</a>
					</c:otherwise>
				</c:choose>
          <a href="${pageContext.request.contextPath}/booking">
            <svg
              xmlns="http://www.w3.org/2000/svg"
              width="24"
              height="24"
              viewBox="0 0 24 24"
              fill="none"
              stroke="currentColor"
              stroke-width="1.5"
              stroke-linecap="round"
              stroke-linejoin="round"
              class="feather feather-log-in"
            >
              <path d="M15 3h4a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2h-4" />
              <polyline points="10 17 15 12 10 7" />
              <line x1="15" y1="12" x2="3" y2="12" />
            </svg>
          </a>
        </div>
      </div>
    </header>
   
	
	