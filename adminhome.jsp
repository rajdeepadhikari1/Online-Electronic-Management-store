<%@page import="java.sql.SQLException"%>
<%@page import="model.DAO.DisplayDAO"%>
<%@page import="controller.attributes.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="model.DAO.InsertDAO"%>
<%@page import="database.helper.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
 
<%
    // Check if user is logged in or admin
	String attributeName = "loggedInId";
	String attributeValue = (String) session.getAttribute(attributeName);
	try {
		if (session.getAttribute("loggedInId") == null) {
			response.sendRedirect(request.getContextPath() + "/login&signup.jsp");
    	}
    	if (attributeValue.equals("admin@admin.com")) {
    		System.out.println(attributeValue);
    	} else {
            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/accessdeniederror.jsp");
            rd.forward(request, response);
    	}
	} catch (Exception e) {
    	response.setStatus(500);
        request.setAttribute("errorMessage", "An error occurred: " + e.getMessage());
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/500error.jsp");
        rd.forward(request, response);
    }
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <!-- Font Awesome -->
    <link async href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/fontawesome.min.css" rel="stylesheet" crossorigin="anonymous" referrerpolicy="no-referrer">
    <link async href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/solid.min.css" rel="stylesheet" crossorigin="anonymous" referrerpolicy="no-referrer">
    <link async href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/brands.min.css" rel="stylesheet" crossorigin="anonymous" referrerpolicy="no-referrer">

    <!-- Latest compiled and minified Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
 <!-- custom css file link  -->
   
    <!-- Material Icons -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined" rel="stylesheet">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="style/styles.css">
  </head>
  <body>
    <div class="grid-container">
    

      <!-- Sidebar -->
      <aside id="sidebar">
      
        <div class="sidebar-title">
          <div class="sidebar-brand">
            <span class="material-icons-outlined"></span> Admin's Inventory
          </div>
          <span class="material-icons-outlined" >close</span>
        </div>
        
        <ul class="sidebar-list">
        <li class="sidebar-list-item">
            <a href="profile.jsp" target="_parent">
              <span class="fa fa-user"></span> View Profile
            </a>
          </li>
          <li class="sidebar-list-item">
            <a href="adminhome.jsp" target="_parent">
              <span class="fa fa-tachometer"></span> Dashboard
            </a>
          </li>
          <li class="sidebar-list-item">
            <a href="customer.jsp" target="_parent">
              <span class="material-icons-outlined">account_circle</span> Customers 
            </a>
          </li>
          <li class="sidebar-list-item">
            <a href="product.jsp" target="_parent">
              <span class="material-icons-outlined">fact_check</span> Products
            </a>
          </li>
          <li class="sidebar-list-item">
            <a href="purchaseorder.jsp" target="_parent">
              <span class="material-icons-outlined">add_shopping_cart</span> Purchase Orders
            </a>
          </li>
          <li class="sidebar-list-item">
            <a href="logout"><button id="logout-btn" class="Log-btn text-dark" >Logout</button></a>
          </li>
        </ul>
      </aside>
      <!-- End Sidebar -->

      <!-- Main -->
      <main class="main-container">
        <div class="main-title">
          <p class="font-weight-bold">Dashboard</p>
        </div>

        <div class="main-cards">
        <%
    Connection con = ConnectionProvider.getConnection();
	String query = "SELECT COUNT(*) AS Sum FROM product";
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery(query);
	ArrayList<String> noofproduct = new ArrayList();
	while(rs.next()){
		noofproduct.add(rs.getString("Sum"));
	}
	%>
	<%
	for(int i=0; i<noofproduct.size(); i++){
		%>	
          <div class="card">
            <div class="card-inner">
              <p class="text-primary">PRODUCTS</p>
              <span class="material-icons-outlined text-blue">inventory_2</span>
            </div>
            <span class="text-primary font-weight-bold"><%= noofproduct.get(i) %></span>
          </div>
 	<%
	}
	%>
	<%
	String query2 = "SELECT COUNT(*) AS Sum FROM Purchase";
	Statement stmt2 = con.createStatement();
	ResultSet rs2 = stmt.executeQuery(query2);
	ArrayList<String> noofpurchase = new ArrayList();
	while(rs2.next()){
		noofpurchase.add(rs2.getString("Sum"));
	}
	%>
	<%
	for(int i=0; i<noofpurchase.size(); i++){
		%>	
          <div class="card">
            <div class="card-inner">
              <p class="text-primary">PURCHASE ORDERS</p>
              <span class="material-icons-outlined text-orange">add_shopping_cart</span>
            </div>
            <span class="text-primary font-weight-bold"><%= noofpurchase.get(i) %></span>
          </div>
	<%
	}
	%>
	
	
	<%
	String query4 = "SELECT COUNT(*) AS Sum FROM users";
	Statement stmt4 = con.createStatement();
	ResultSet rs4 = stmt.executeQuery(query4);
	ArrayList<String> noofcustomer = new ArrayList();
	while(rs4.next()){
		noofcustomer.add(rs4.getString("Sum"));
	}
	%>
	<%
	for(int i=0; i<noofcustomer.size(); i++){
		%>
          <div class="card">
            <div class="card-inner">
              <p class="text-primary">Customers</p>
              <span class="material-icons-outlined text-red">account_circle</span>
            </div>
            <span class="text-primary font-weight-bold"><%= noofcustomer.get(i) %></span>
          </div>
	<%
	}
	%>
	</div> <!-- Closing main-cards div here -->
	
	<section class="products" id="products">

 
<h3 class="heading my-5">Most Purchase Items </h3>
   

    <div class="box-container">

	<% 
    try {
    	Product[] products = DisplayDAO.executeQuery("SELECT p.* FROM product p LEFT JOIN (SELECT ProductID, COUNT(*) AS purchase_count FROM purchase GROUP BY ProductID) pu ON p.ProductID = pu.ProductID ORDER BY COALESCE(pu.purchase_count, 0) DESC");
    
    	for (Product product : products) {
%>

<div class="card" style="width: 18rem;">
  <img src="images/<%= product.getPhoto() %>" class="card-img-top" alt="...">
  <div class="card-body">
    <h5 class="card-title"><%= product.getName() %></h5>
    <p class="card-text"><%= product.getDescription() %></p>
  </div>
  <ul class="list-group list-group-flush">
    <li class="list-group-item">Rs.<%= product.getPrice() %></li>
    
  </ul>
  
</div>
<% 
    }
} catch (SQLException e) {
    e.printStackTrace();
}
%>
</div>
</section>	
</main> <!-- Closing main tag here -->
<!-- End Main -->
</div> <!-- Closing grid-container div here -->

<!-- Scripts -->
<!-- ApexCharts -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/apexcharts/3.35.3/apexcharts.min.js"></script>
<!-- Custom JS -->
<script src="scripts/scripts.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>