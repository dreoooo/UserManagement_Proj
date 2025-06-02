<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Home - Student Profiling Application</title>
    <!-- BOOTSTRAP CSS -->
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          crossorigin="anonymous" />
    <!-- FONT AWESOME -->
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
        .nav-link {
            color: white !important;
            font-weight: 500;
        }
        .nav-link:hover {
            color: #cccccc !important;
        }
        .dropdown-menu {
            background-color: #343a40;
        }
        .dropdown-item {
            color: white;
        }
        .dropdown-item:hover {
            background-color: #495057;
        }
        .content-container {
            animation: fadeIn 0.4s ease-in forwards;
        }
        @keyframes fadeIn {
            from {opacity: 0;}
            to {opacity: 1;}
        }
        .content-box {
            background-color: rgba(255, 255, 255, 0.62);
            border-radius: 12px;
            padding: 30px;
            box-shadow: 0 12px 28px rgba(0, 0, 0, 0.15);
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.3);
        }
        h1 {
            font-weight: 700;
            color: #343a40;
        }
        p {
            font-size: 1.1rem;
            color: #555555;
        }
        .header-space {
            margin-top: 60px;
        }
        .btn-oblong {
            padding: 10px 24px;
            font-size: 1rem;
            font-weight: 500;
            color: #fff;
            background-color: #007bff;
            border: none;
            border-radius: 50px;
            transition: background-color 0.3s ease, transform 0.3s ease;
            text-decoration: none;
            display: inline-block;
            margin-bottom: 12px; /* spacing between buttons */
            
            /* Added to make buttons equal width */
            width: 280px;
            text-align: center;
        }
        .btn-oblong:hover {
            background-color: #0056b3;
            color: white;
            transform: scale(1.1);
            z-index: 10; /* keep hovered button on top */
        }
    </style>
</head>
<body>
<header>
    <nav class="navbar navbar-expand-md navbar-dark">
        <div class="container-fluid px-3">
            <a href="#" class="navbar-brand">
                <img src="https://htcgsc.edu.ph/wp-content/uploads/2022/02/htc-new-seal.png" alt="HTC Logo" height="30" />
                Dreo's Web Project
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                <ul class="navbar-nav">
                    <!-- Removed Home nav item here on Home page -->
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/about.jsp" class="nav-link">
                            <i class="fas fa-info-circle mr-1"></i> About Us
                        </a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="settingsDropdown" role="button" data-toggle="dropdown">
                            <i class="fas fa-cog mr-1"></i> Settings
                        </a>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="settingsDropdown">
                            <a class="dropdown-item" href="#">Account Settings</a>
                            <a class="dropdown-item" href="#">Privacy</a>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</header>

<div class="container header-space content-container">
    <div class="content-box text-center">
        <h1>Welcome To My Simple Web Project!</h1>
        <p>
            <strong>Explore the available systems below.</strong>
        </p>
        
        <a href="${pageContext.request.contextPath}/new" class="btn btn-oblong mt-4">
            <i class="fas fa-user-graduate mr-2"></i> Student Profile Application
        </a>
        <br />
        <a href="${pageContext.request.contextPath}/calculator.jsp" class="btn btn-oblong">
            <i class="fas fa-calculator mr-2"></i> Basic Calculator
        </a>
    </div>
</div>

<!-- BOOTSTRAP JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</body>
</html>
