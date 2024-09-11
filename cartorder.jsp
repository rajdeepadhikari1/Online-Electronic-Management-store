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
	try{
		if (session.getAttribute("loggedInId") == null) {
			response.sendRedirect(request.getContextPath() + "/login&signup.jsp");
    	}
    	if (attributeValue.equals("admin@admin.com")) {
    		System.out.println(attributeValue);
    	} else {
            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/accessdeniederror.jsp");
            rd.forward(request, response);
    	}
	}
    catch (Exception e){
    	response.setStatus(500);
        request.setAttribute("errorMessage", "An error occurred: " + e.getMessage());
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/500error.jsp");
        rd.forward(request, response);
    }
%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <title>Admin Dashboard</title>

    <!-- Font Awesome -->
    <link async href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/fontawesome.min.css" rel="stylesheet" crossorigin="anonymous" referrerpolicy="no-referrer">
    <link async href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/solid.min.css" rel="stylesheet" crossorigin="anonymous" referrerpolicy="no-referrer">
    <link async href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/brands.min.css" rel="stylesheet" crossorigin="anonymous" referrerpolicy="no-referrer">

    <!-- Latest compiled and minified Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">

    <!-- Responsive Tables -->
    <link rel="stylesheet" href="style/rwd-table.min.css?v=6.1.2">
    <link rel="stylesheet" href="style/docs.min.css?v=6.1.2">

    <!-- Material Icons -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined" rel="stylesheet">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="style/styles.css">

  </head>

  <body id="home" data-bs-spy="scroll" data-bs-target="#navbar">
    
    <div class="grid-container">

      <!-- Header -->
      <header class="header">
        <div class="menu-icon" onclick="openSidebar()">
          <span class="material-icons-outlined">menu</span>
        </div>
        <div class="header-left">
          <span class="material-icons-outlined">search</span>
        </div>
        <div class="header-right">
          <span class="material-icons-outlined">notifications</span>
          <span class="material-icons-outlined">email</span>
          <span class="material-icons-outlined">account_circle</span>
        </div>
      </header>
      <!-- End Header -->


   
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
            <a href="adminhome.jsp" target="_parent">
              <span class="material-icons-outlined">dashboard</span> Dashboard
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
            <a href="cartorder.jsp" target="_parent">
              <span class="material-icons-outlined">shopping_cart</span> Add to Carts
            </a>
          </li>
          <li class="sidebar-list-item">
            <a href="#" target="_parent">
              <span class="material-icons-outlined">poll</span> Reports
            </a>
          </li>
          <li class="sidebar-list-item">
            <a href="#" target="_parent">
              <span class="material-icons-outlined">settings</span> Settings
            </a>
          </li>
        </ul>
      </aside>
      <!-- End Sidebar -->

      <!-- Main -->
      <main class="main-container">
        <section id="demo">
          <div class="container-fluid">
              <div class="page-header">
                  <h2>Added Carts</h2>
              </div>
	<div data-responsive-table-toolbar="tech-companies"></div>
              <div class="table-responsive" id="tech-companies-wrapper" data-pattern="priority-columns" data-sortable="true">
                  <table cellspacing="0" id="tech-companies" class="table table-small-font table-tighten table-bordered table-striped">
                      <thead>
                      	<%
				Connection con = ConnectionProvider.getConnection();
                      	String query = "Select C.CartID, P.Name,P.Brand, P.Price, P.Stock, P.Rating FROM Cart C JOIN Product P ON C.ProductID = P.ProductID JOIN users U ON C.email = U.email";
				Statement stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery(query);
				ArrayList<String> id = new ArrayList();
				ArrayList<String> Name = new ArrayList();
				
				ArrayList<String> Brand = new ArrayList();
				ArrayList<String> Price = new ArrayList();
				ArrayList<String> Stock = new ArrayList();
				ArrayList<String> Rating = new ArrayList();
				while(rs.next()){
					id.add(rs.getString("C.CartID"));
					Name.add(rs.getString("P.Name"));
					
					Brand.add(rs.getString("P.Brand"));
					Price.add(rs.getString("P.Price"));
					Stock.add(rs.getString("P.Stock"));
					Rating.add(rs.getString("P.Rating"));
				}
			%>
                           <tr>
                              <th>Cart ID</th>
                              <th data-priority="3">Product Name</th>
                             
                              <th data-priority="3">Brand</th>
                              <th data-priority="1">Price</th>
                              <th data-priority="3">Stock</th>
                              <th data-priority="3">Rating</th>
                          </tr>
                      </thead>
                      <%
					for(int i=0; i<id.size(); i++){
						%>
                      <tbody>
                      
                         <tr>
                          	  <th>ID No.<span class="co-name"><%= id.get(i) %></span></th>
               				  <td><%= Name.get(i) %></td>
            				  
            				  <td><%= Brand.get(i) %></td>
            				  <td><%= Price.get(i) %></td>
            				  <td><%= Stock.get(i) %></td>
            				  <td><%= Rating.get(i) %></td>
            				  
            				  
        				</tr>
   					<% } %>
						</tbody>
                  		</table>
              </div>
          </div>
      </section>
          

      </main>
      <!-- End Main -->

    </div>

    <!-- Scripts -->
    <!-- ApexCharts -->

    <script src="https://cdnjs.cloudflare.com/ajax/libs/apexcharts/3.35.3/apexcharts.min.js"></script>
    <!-- Custom JS -->
    <script src="scripts/scripts.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>

        <!-- Latest compiled and minified Bootstrap JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>

        <script src="scripts/rwd-table.js?v=6.1.2"></script>
        <script src="scripts/docs.min.js"></script>
  </body>
</html>