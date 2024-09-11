<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="database.helper.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Profile</title>
    <!-- Include your CSS stylesheets or style here -->
    <style>
        /* Define your styles for the profile page */
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            color: #333;
        }
        form {
            margin-top: 20px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        label {
            display: block;
            font-weight: bold;
            color: #666;
        }
        input[type="text"], input[type="email"], input[type="password"] {
            width: calc(100% - 20px);
            padding: 10px;
            margin: 5px 0 10px 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 16px;
        }
        input[type="submit"] {
            background-color: #031A45;
            color: white;
            padding: 12px 24px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s;
            margin-left: 10px;
        }
        input[type="submit"]:hover {
            background-color: #031A45;
        }
        .profile-image {
            text-align: center;
        }
        .profile-image img {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            border: 5px solid #031A45;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<%
String message = (String) request.getAttribute("id");
System.out.println("hhhhhhhhhh00"+message);

int id1=Integer.parseInt(message);
    Connection con = ConnectionProvider.getConnection();
    String query = "SELECT * FROM users WHERE id=?";
    PreparedStatement pstmt = con.prepareStatement(query);
    pstmt.setInt(1, id1); // Assuming 1 is the desired user ID

    ResultSet rs = pstmt.executeQuery(); // Executing the prepared statement
    String id = "";
    String email = "";
    String username = "";
    String password = "";
    while(rs.next()){
        id = rs.getString("id");
        email = rs.getString("email");
        username = rs.getString("username");
        password = rs.getString("password");
    }
    rs.close(); // Close the result set
    pstmt.close(); // Close the prepared statement
    con.close(); // Close the connection
%>
<div class="container">
    <div class="profile-image">
        <img src="https://www.w3schools.com/howto/img_avatar.png" alt="Profile Picture">
    </div>
    <h2>User Profile</h2>
    <form action="update-info" method="post">
        <div class="form-group">
            <label for="userId">User ID:</label>
            <input type="text" id="userId" name="userId" value="<%= id %>" readonly>
        </div>
        <div class="form-group">
            <label for="username">Username:</label>
            <input type="text" id="username" name="newName" value="<%= username %>">
        </div>
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" id="email" name="newEmail" value="<%= email %>">
        </div>
        <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" id="password" name="newPassword" value="<%= password %>">
        </div>
        <div class="form-group">
            <input type="submit" value="Update Profile">
        </div>
    </form>
</div>

</body>
</html>
