<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="controller.attributes.Product" %>
<%@ page import="model.DAO.DisplayDAO" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="homeheader.jsp"%>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Advanced Programming Course Work</title>

    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <!-- custom css file link  -->
    <link rel="stylesheet" href="style/HomeCSS.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

</head>
<body>
    



<!-- products section starts  -->

<section class="products" id="products">
    <h1 class="heading"> exclusive </h1>
    <div class="box-container">
        <% try {
            Product[] products = DisplayDAO.executeQuery("SELECT * FROM Product ORDER BY Price DESC");
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
</section>

<!-- products section ends -->





<!-- footer section starts  -->

<%@ include file="homefooter.jsp"%>

<!-- footer section ends -->




<!-- custom js file link -->
<script src="scripts/Home.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>