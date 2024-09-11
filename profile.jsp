<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="database.helper.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        body {
            background-color: #f4f5f7;
        }

        .profile-card {
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }

        .profile-img {
            background-color: #007bff;
            color: #fff;
            text-align: center;
            padding: 20px 0;
            border-radius: 10px 10px 0 0;
        }

        .profile-img img {
            width: 150px;
            border-radius: 50%;
            border: 5px solid #fff;
        }

        .profile-body {
            padding: 20px;
        }

        .profile-body h5 {
            margin-bottom: 0;
        }

        .profile-body h6 {
            color: #6c757d;
        }

        .profile-body p {
            margin-bottom: 0.5rem;
        }

        .edit-btn {
            background-color: #007bff;
            border-color: #007bff;
        }

        .edit-btn:hover {
            background-color: #0056b3;
            border-color: #0056b3;
        }
    </style>
</head>
<body>
<%
String attributeName = "loggedInId";
String attributeValue = (String) session.getAttribute(attributeName);

Connection con = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
try {
    con = ConnectionProvider.getConnection();
    String query = "SELECT * FROM users WHERE email=?";
    pstmt = con.prepareStatement(query);
    pstmt.setString(1, attributeValue); // Assuming 1 is the desired user ID

    rs = pstmt.executeQuery(); // Executing the prepared statement
    if (rs.next()) {
        String id = rs.getString("id");
        String email = rs.getString("email");
        String username = rs.getString("username");
        String password = rs.getString("password");
%>

<header>
    <nav class="navbar navbar-dark" style="background-color: #031A45; color: white;">
        <div class="container">
            <a class="navbar-brand" href="#">
                <i class="fas fa-user-circle"></i> User Profile
            </a>
            <ul class="navbar-nav ml-auto">
                <%	
                String attributeValue1=(String)session.getAttribute("loggedInId");
                if(attributeValue1.equals("admin@admin.com")) {	
                %>
                <li class="nav-item">
                    <a class="nav-link" href="adminhome.jsp">Home</a>
                </li>
                <%} else{%>
                <li class="nav-item">
                    <a class="nav-link text-light" href="home.jsp">Home</a>
                </li>  
                <%} %>
            </ul>
        </div>
    </nav>
</header>

<section class="py-5">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="profile-card">
                    <div class="profile-img" style="background-color: #031A45;">
                        <img src="https://png.pngtree.com/png-vector/20190411/ourlarge/pngtree-business-male-icon-vector-png-image_916468.jpg" alt="Avatar">
                        <h5><%= username %></h5>
                        <p>User</p>
                    </div>
                    <div class="profile-body">
                        <h6>User Details</h6>
                        <hr>
                        <div class="row">
                            <div class="col-md-6">
                                <h6>User ID</h6>
                                <p><%= id %></p>
                            </div>
                            <div class="col-md-6">
                                <h6>Email</h6>
                                <p><%= email %></p>
                            </div>
                            <div class="col-md-6">
                                <h6 hidden>Password</h6>
                                <p hidden><%= password %></p>
                            </div>
                        </div>
                        <a href="EditUserProfile?id=<%=id%>" class="btn edit-btn" style="background-color: #031A45; color:white"><i class="fas fa-edit mr-2"></i>Edit</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<%
    }
} catch (Exception e) {
    e.printStackTrace();
} finally {
    // Closing resources
    try { if (rs != null) rs.close(); } catch (Exception e) { e.printStackTrace(); }
    try { if (pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
    try { if (con != null) con.close(); } catch (Exception e) { e.printStackTrace(); }
}
%>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
