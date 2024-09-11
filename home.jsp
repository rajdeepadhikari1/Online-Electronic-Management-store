<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="controller.attributes.Product" %>
<%@ page import="model.DAO.DisplayDAO" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%
    
    HttpSession session1 = request.getSession(false);
 
%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="homeheader.jsp"%>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Advanced Programming Course Work</title>

    <!-- font awesome cdn link  -->
    <link rel=" " href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <!-- custom css file link  -->
    <link rel="stylesheet" href="style/HomeCSS.css">
   

</head>
<body>
    
<!-- header section starts  -->


<!-- header section ends -->



<!-- products section starts  -->

<section class="products" id="products">
    <h1 class="heading"> exclusive </h1>
    <form method="post">
        <div class="box-container">
            <% try {
                Product[] products = DisplayDAO.executeQuery("SELECT * FROM Product");
                for (Product product : products) { %>
                    <div class="card" style="width: 18rem;">
                        <img src="images/<%= product.getPhoto() %>" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title"><%= product.getName() %></h5>
                            <p class="card-text"><%= product.getDescription() %></p>
                        </div>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item">Rs.<%= product.getPrice() %></li>
                        </ul>
                        <div class="icons">
                            <input type="hidden" name="productid" value="<%= product.getId() %>">
                            <% if(session.getAttribute("loggedInId")!= null) { %>
                                <a class="fas fa-shopping-cart">
                                    <input onclick="javascript: form.action='AddtoCart?id=<%=product.getId()%>';" type="submit"  value="Add to Cart">
                                </a>
                            <% } else { %>
                                <a class="fas fa-shopping-cart">
                                    <input onclick="alert('Login is required to add items to the cart.');" type="submit"  value="Add to Cart">
                                </a>
                            <% } %>
                        </div>
                    </div>
                <% } 
                } catch (SQLException e) {
                    e.printStackTrace();
                } %>
        </div>
    </form>
</section>


<!-- products section ends -->





<!-- footer section starts  -->

<%@ include file="homefooter.jsp"%>

<!-- footer section ends -->




<!-- custom js file link -->
<script src="scripts/Home.js"></script>
<script>
    function updateButton() {
        // Get the login and logout buttons
        var loginBtn = document.getElementById("login-btn");
        var logoutBtn = document.getElementById("logout-btn");

        // Check if the user is logged in
        if ('<%= session1 == null || session1.getAttribute("loggedInId") == null %>') {
            // User is logged in, hide the login button and show the logout button
           		loginBtn.style.display = "block";
            	logoutBtn.style.display = "none";
            	
            	
            }
        } else {
            // User is not logged in, show the login button and hide the logout button
        	loginBtn.style.display = "none";    
        	logoutBtn.style.display = "block";
            	
            }
        }
    }

// Call the updateButton() function when the page loads
window.onload = updateButton;
</script>


</body>
</html>