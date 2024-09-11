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
<html>
<head>
<meta charset="ISO-8859-1">
<title>Users</title>
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
        background-color: #f1f1f1;
        font-family: Arial, sans-serif;
      }
      h1 {
        text-align: center;
        margin-top: 50px;
      }
      form {
        max-width: 500px;
        margin: auto;
        background-color: #fff;
        padding: 30px;
        border-radius: 5px;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
      }
      label {
        display: block;
        margin-bottom: 10px;
        font-weight: bold;
      }
      
      input[type="text"],
      input[type="email"],
      input[type="submit"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 20px;
        border: none;
        border-radius: 5px;
        box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.1);
        font-size: 16px;
      }
      input[type="submit"] {
        background-color: #007bff;
        color: #fff;
        cursor: pointer;
        transition: all 0.3s ease;
      }
      input[type="submit"]:hover {
        background-color: #0062cc;
      }
</style>
</head>
<body>

	<%
	Connection con = ConnectionProvider.getConnection();
	String queryString = request.getQueryString();
	String query = "Select * from users WHERE id = " + queryString;
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery(query);
	ArrayList<String> id = new ArrayList();
	ArrayList<String> email = new ArrayList();
	ArrayList<String> username = new ArrayList();
	ArrayList<String> password = new ArrayList();
	while(rs.next()){
		id.add(rs.getString("id"));
		email.add(rs.getString("email"));
		username.add(rs.getString("username"));
		password.add(rs.getString("password"));
	}
	%>
	<table>
		<tr>
  			<th>User ID</th>
		    <th>Email</th>
		    <th>User Name</th>
		    <th>Password</th>
  		</tr>
		<%
	for(int i=0; i<id.size(); i++){
		%>	
  		<tr>
		    <td><%= id.get(i) %></td>
		    <td><%= email.get(i) %></td>
		    <td><%= username.get(i) %></td>
		    <td><%= password.get(i) %></td>
  		</tr>		
		<%
	}
	%>
	</table>
	
	 <h1>Admin Edit Page</h1>

    <form method="post" >
   
      <label for="username">Username:</label>
      <input type="text" name="username" value="">
      <input type="submit" onclick="javascript: form.action='EditProfile';" value="UPDATE">
      <input type="submit" style="background-color: #dc3545;" onclick="javascript: form.action='DeleteProduct';" value="DELETE">
      <input type="hidden" name="id" value="<%= queryString %>">
    </form>
 
   
    
    
	
</body>
</html>