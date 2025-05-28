<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Error</title>
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          crossorigin="anonymous" />
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
    <style>
        body {
            background-image: url('https://images.unsplash.com/photo-1506744038136-46273834b3fb?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8bGFuZHNjYXBlJTIwd2FsbHBhcGVyfGVufDB8fDB8fHww');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            background-attachment: fixed;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .navbar {
            background-color: #343a40;
            padding-top: 10px;
            padding-bottom: 8px;
            min-height: 60px;
        }

        .navbar .container-fluid {
            padding-left: 12px;
            padding-right: 12px;
            max-width: 100%;
        }

        .navbar-brand {
            font-weight: bold;
            font-size: 1.29rem;
            color: white;
            display: flex;
            align-items: center;
            gap: 8px;
            margin: 0;
        }

        .content-container {
            animation: fadeIn 0.4s ease-in forwards;
            margin-top: 80px;
            max-width: 600px;
            margin-left: auto;
            margin-right: auto;
            background-color: rgba(255, 255, 255, 0.25);
            border-radius: 12px;
            padding: 30px;
            box-shadow: 0 12px 28px rgba(0, 0, 0, 0.12);
            border: 1px solid rgba(255, 255, 255, 0.15);
            text-align: center;
        }

        @keyframes fadeIn {
            from {opacity: 0;}
            to {opacity: 1;}
        }

        h1 {
            color: #dc3545;
            font-weight: 700;
            margin-bottom: 15px;
        }

        h2 {
            color: #343a40;
            font-weight: 600;
            font-size: 1.25rem;
            word-wrap: break-word;
        }

        .error-icon {
            font-size: 4rem;
            color: #dc3545;
            margin-bottom: 20px;
        }

        .btn-home {
            margin-top: 30px;
            background-color: #343a40;
            color: white;
            border-radius: 30px;
            padding: 10px 30px;
            font-weight: bold;
            text-decoration: none;
            display: inline-block;
            transition: background-color 0.2s ease-in-out;
        }

        .btn-home:hover {
            background-color: #495057;
            color: white;
            text-decoration: none;
        }
    </style>
</head>
<body>

<header>
    <nav class="navbar navbar-expand-md navbar-dark">
        <div class="container-fluid px-3">
            <a href="#" class="navbar-brand">
                <img src="https://htcgsc.edu.ph/wp-content/uploads/2022/02/htc-new-seal.png" alt="HTC Logo" height="30" />
                Student Profiling Application
            </a>
        </div>
    </nav>
</header>

<div class="content-container">
    <div class="error-icon">
        <i class="fas fa-exclamation-triangle"></i>
    </div>
    <h1>Error</h1>
    <h2><%= exception.getMessage() %></h2>

    <a href="${pageContext.request.contextPath}/userlist" class="btn-home">
        <i class="fas fa-home" style="margin-right: 8px;"></i> Home
    </a>
</div>

</body>
</html>
