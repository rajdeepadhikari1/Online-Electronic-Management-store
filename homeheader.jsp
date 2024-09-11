
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
   <link rel="stylesheet" href="style/HomeCSS.css">
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
</head>
<body>

<header class="header">

    <a href="home.jsp" class="logo"><i class="bi bi-speaker-fill"></i> Sound Scape </a>

    <nav class="navbar">
        <a href="home.jsp">home</a>
        <% if(session.getAttribute("loggedInId")!= null){
%>
        <a href="userorderlist.jsp">Order History</a>
        <%} %>
      
  	<a href="home+highest+price.jsp" class="buttons">Price High To Low</a>
  	
	
         <%
	
	if(session.getAttribute("loggedInId")!= null){
%>
  	<a href="logout"><button id="logout-btn" class="Log-btn" >Logout</button></a>
       
        <%} else{%>
         <a href="login&signup.jsp"><button id="login-btn" class="Log-btn">Login</button></a>
        <%} %>
       
  	
    </nav>

    <div class="icons">
        <div id="menu-btn" class="fas fa-bars"></div>
         <div id="search-btn"></div>
         <nav class="navbar">
        <%
	
	if(session.getAttribute("loggedInId")!= null){
%>
        <a href="addtocart.jsp">Cart</a>
        <a href="profile.jsp" class="fa fa-user"></a>
    </div>
    
 <%} %>
   </nav>

</header>

<script src="scripts/Home.js"></script>

</body>
</html>