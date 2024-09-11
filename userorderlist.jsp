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
    // Check if user is logged in
    HttpSession session1 = request.getSession(false);
    if (session1 == null || session1.getAttribute("loggedInId") == null) {
        response.sendRedirect(request.getContextPath() + "/login&signup.jsp");
        
    } 
%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Add to Cart</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <style>
    body {
  font-family: Arial, sans-serif;
  margin: 0;
  background-image:url('https://www.creativefabrica.com/wp-content/uploads/2020/06/24/green-white-background-gradient-Graphics-4446161-1.jpg');
    background-repeat: no-repeat; /* This stops the background image from repeating */
    background-size: cover;
}

header {
  background-color: #031A45;
  color: #fff;
  padding: 20px;
}

nav ul {
  list-style: none;
  margin: 0;
  padding: 0;
}

nav li {
  display: inline-block;
  margin-right: 20px;
}

nav a {
  color: #fff;
  text-decoration: none;
}

main {
  max-width: 1000px;
  margin: 0 auto;
  padding: 20px;
}

h1 {
  font-size: 36px;
  margin-top: 0;
}


.product-box{
	padding: 10px;
}

.product-list {
  list-style: none;
  margin: 0;
  padding: 0;
  margin-bottom: 10px;
  background-color: #031A45;
}

.product-list li {
  display: flex;
  border: 1px solid #ccc;
  margin-bottom: 20px;
}

.product-list li img {
  max-width: 200px;
  margin-right: 20px;
}

.product-list li .product-info {
  flex: 1;
}

.product-list li h2 {
  font-size: 24px;
  margin-top: 0;
  color:white;
}

.product-list li p {
  margin-top: 0;
  color:white;
}

.product-list li .price {
  font-size: 18px;
  font-weight: bold;
  color: #000000;
  color:white;
}

.product-list li form {
  display: flex;
  margin-top: 10px;
  color:white;
}

.product-list li form label {
  margin-right: 10px;
}

.product-list li form select {
  margin-right: 10px;
  padding: 5px;
  border-radius: 5px;
  border: 1px solid #ccc;
}

.product-list li form button {
  padding: 5px 10px;
  border-radius: 5px;
  border: none;
  background-color: green;
  color: #fff;
  cursor: pointer;
  margin: 7px;
}

.product-list li form button:hover {
  background-color: #8c8c8c;
}
    
  </style>
  </head>

  <body>
    <header>
      <nav>
        <ul>
          <li><a href="home.jsp"><i class="bi bi-house-fill"></i></a></li>
          
        </ul>
      </nav>
    </header>
    <main>
    	<%
    String attributeName = "loggedInId";
    String attributeValue = (String) session.getAttribute(attributeName);
    System.out.println(attributeValue);
    Connection con = ConnectionProvider.getConnection();
	String query = "SELECT p.*, pr.* " +
            "FROM Purchase p " +
            "JOIN Product pr ON p.productID = pr.ProductID " +" WHERE p.useremail = '"+attributeValue+"'";
	
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery(query);
	ArrayList<String> id = new ArrayList();
	ArrayList<String> Name = new ArrayList();
	ArrayList<String> Photo = new ArrayList();
	ArrayList<String> Brand = new ArrayList();
	ArrayList<String> Price = new ArrayList();
	ArrayList<String> Stock = new ArrayList();
	ArrayList<String> PurchaseDate = new ArrayList();
	System.out.println("Number of rows: " + id.size());
	while(rs.next()){
		id.add(rs.getString("p.PurchaseID"));
		Name.add(rs.getString("Pr.Name"));
		Photo.add(rs.getString("Pr.ProductPhoto"));
		Brand.add(rs.getString("Pr.Brand"));
		Price.add(rs.getString("Pr.Price"));
		Stock.add(rs.getString("Pr.Stock"));
		PurchaseDate.add(rs.getString("P.Purchase_Date"));
	}
	%>
      <h1>Order History</h1>
      <%
	for(int i=0; i<id.size(); i++){
	System.out.println(Name.get(i));
		%>	
      <ul class="product-list">
        <li>
          <img src="images/<%= Photo.get(i) %>" alt="Product 1">
          <div class= "product-box">
          <div class="product-info">
            <h2><%= Name.get(i) %></h2>
            
            <p><%= Brand.get(i) %></p>
            <p class="price"><%= Price.get(i) %></p>
            
          </div>
          </div>
        </li>
      </ul>
      <%
	}
	%>
    </main>
  </body>
</html>
