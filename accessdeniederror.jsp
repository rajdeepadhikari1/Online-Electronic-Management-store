<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Access Denied</title>
    <style>
        body {
            background-color: white;
            color: #333;
            font-family: Helvetica, sans-serif;
        }

        .container {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            text-align: center;
        }

        h1 {
            font-size: 4rem;
            margin-bottom: 2rem;
        }

        p {
            font-size: 1.5rem;
            margin-bottom: 1rem;
        }
    </style>
</head>
<body>
    <div class="container">
        <img src="images/error/accesserror.png" width="500">
        <p style="font-size: 2.5rem;">Access Denied! <br>Sorry, you need to login as Admin.</p>
        <p><a href="login&signup.jsp">Return to Login page</a>.</p>
    </div>
</body>
</html>