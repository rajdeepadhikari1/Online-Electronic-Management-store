<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <!-- custom css file link  -->
    <link rel="stylesheet" href="style/HomeCSS.css">
     <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
      integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
      crossorigin="anonymous"
    />
</head>
<body>


    <!--  
    <section class="footer">
    <div class="share">
        <a href="https://www.facebook.com/" class="fab fa-facebook-f"></a>
        <a href="https://twitter.com/" class="fab fa-twitter"></a>
        <a href="https://www.linkedin.com/" class="fab fa-linkedin"></a>
        <a href="https://www.instagram.com/" class="fab fa-instagram"></a>
    </div>

    <div class="credit"> &copy; copyright @ 2023 by <span>ABC</span> </div>
    </section>
    -->
   <footer class="border-top text-muted">
      <div class="footer_items">
        <div class="footer_links">
          <h2 style="color: white">Navigation</h2>
          <ul class="navbar-nav flex-grow-1">
            <li class="nav-item">
              <a href="home.jsp" class="nav-link text-white">Home</a>
            </li>
             <% if(session.getAttribute("loggedInId")!= null){
%>
            <li class="nav-item">
              <a href="userorderlist.jsp" class="nav-link text-white">Order History</a>
            </li>
             <%} %>
            <li class="nav-item">
              <a  href="home+highest+price.jsp" class="nav-link text-white">Price High To Low</a>
            </li>
            
            
          </ul>
        </div>

        <div class="footer_links2">
          <h2>Contact</h2>
         
          <p class="text-white">011-773756</p>
        </div>
        <div></div>
      </div>
      <div class="container copyright1">
        copyright &copy; 2023 all rights reserved- ABC
      </div>
    </footer>

</body>
</html>