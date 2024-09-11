<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="controller.attributes.Product" %>
<%@ page import="model.DAO.DisplayDAO" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}
.herf{
	font-family: arial, sans-serif;
	margin-top: 10px;
}
body {
			margin: 0;
			padding: 0;
			font-family: Arial, sans-serif;
			background-color: #f1f1f1;
		}
		header {
			background-color: #333;
			color: white;
			padding: 20px;
			text-align: center;
			font-size: 36px;
			font-weight: bold;
			box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.5);
			position: fixed;
			top: 0;
			left: 0;
			width: 100%;
			z-index: 1000;
		}
		form {
			background-color: white;
			padding: 20px;
			border-radius: 10px;
			box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.5);
			margin-top: 100px;
			margin-bottom: 50px;
			max-width: 800px;
			margin-left: auto;
			margin-right: auto;
		}
		h1 {
			font-size: 30px;
			margin-bottom: 20px;
		}
		label {
			font-weight: bold;
			font-size: 18px;
			display: block;
			margin-top: 20px;
		}
		input[type="text"], input[type="number"], select {
			width: 100%;
			height: 40px;
			border-radius: 5px;
			border: 1px solid #ccc;
			padding: 5px;
			margin-top: 10px;
			font-size: 16px;
			box-sizing: border-box;
		}
		select {
			appearance: none;
			-webkit-appearance: none;
			background-image: url("data:image/svg+xml,%3Csvg viewBox='0 0 10 5' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M5 5L0 0h10L5 5z' fill='%23000'/%3E%3C/svg%3E");
			background-size: 10px 5px;
			background-repeat: no-repeat;
			background-position-x: calc(100% - 10px);
			background-position-y: center;
			padding-right: 20px;
		}
		input[type="file"] {
			width: 100%;
			margin-top: 10px;
			font-size: 16px;
		}
		button {
			margin-top: 20px;
			width: 150px;
			height: 40px;
			border-radius: 5px;
			background-color: #333;
			color: #fff;
			font-size: 18px;
			border: none;
			cursor: pointer;
		}
		button:hover {
			background-color: #555;
		}
		button.btn-delete {
			margin-left: 15px;
			margin-top: 20px;
			width: 150px;
			height: 40px;
			border-radius: 5px;
			background-color: #dc3545;
			color: #fff;
			font-size: 18px;
			border: none;
			cursor: pointer;
		}
		button.btn-delete:hover {
			background-color: #e34b59;
		}
		

</style>
</head>
<body>
<h1>helllo</h1>
		
			<header>Edit Product</header>
			<form method="post" enctype="multipart/form-data">
			<h1>Edit Product</h1>
			<%
			String queryString = request.getQueryString();
			Product[] products = DisplayDAO.executeQuery("Select * from Product WHERE ProductID = " + queryString);
			 
			for (Product product : products) { 
        	%>
         
			<label for="name">Name:</label>
			<input type="text" id="name" name="name" value="<%= product.getName() %>">

			

			<label for="brand">Brand:</label>
			<input type="text" id="brand" name="brand" value="<%= product.getBrand() %>">

			<label for="photo">Photo:</label>
			<input type="file" id="photo" name="photo" accept="image/*" value="<%= product.getPhoto() %>">
			<input type="hidden" name="oldPhoto" value="<%= product.getPhoto() %>">
			<label for="price">Price:</label>
			<input type="number" id="price" name="price" min="0" step="1" value="<%= product.getPrice() %>">

			<label for="stock">Stock:</label>
			<input type="number" id="stock" name="stock" value="<%=  product.getStock() %>" min="0">

			<label for="description">Description:</label>
			<input type="text" id="description" name="description" value="<%= product.getDescription() %>">
		
			
			<button type="submit" onclick="javascript: form.action='UpdateProduct';" >Edit Product</button>
			<button type="submit" onclick="javascript: form.action='DeleteProduct';" >Delete Product</button>
			<input type="hidden" name="id" value="<%= queryString %>">
			
			<% 
			} 
			
			%>
		</form>
		
		
			

</body>
</html>