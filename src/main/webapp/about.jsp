<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>About Us - Student Profiling Application</title>
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
        /* Removed content-box styling for About Us */
        
        .header-space {
            margin-top: 60px; /* Adjust as needed */
        }
        /* About Me Card Styling */
        .about-me-card {
            background: rgba(255, 255, 255, 0.85);
            border-radius: 12px;
            padding: 25px 30px;
            max-width: 700px;
            margin: 0 auto 60px auto;
            box-shadow: 0 10px 24px rgba(0,0,0,0.12);
            color: #2c3e50;
            font-size: 1.05rem;
            line-height: 1.5;
        }
        .about-me-card h2 {
            font-weight: 700;
            margin-bottom: 0.4rem;
            color: #2c3e50;
            border-bottom: 2px solid #007bff;
            padding-bottom: 6px;
            margin-bottom: 20px;
            text-align: center;
        }
        .about-me-card .details {
            font-weight: 600;
            color: #34495e;
            margin-bottom: 10px;
        }
        .about-me-card .description {
            font-style: italic;
            color: #566573;
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
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/home.jsp" class="nav-link">
                            <i class="fas fa-home mr-1"></i> Home
                        </a>
                    </li>
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
    <!-- Only About Me Section -->
    <div class="about-me-card">
        <h2>About Me</h2>
        <p class="details"><strong>Name:</strong> Andreo Kent B. Tarre</p>
        <p class="details"><strong>Course:</strong> Bachelor of Science in Information Technology</p>
        <p class="details"><strong>Year:</strong> 2nd Year</p>
        <p class="description">
            I am passionate about technology and software development, always eager to learn new skills and contribute to innovative projects.
            Currently, I am focusing on building practical experience in web development and data management to prepare for a successful career in IT.
        </p>
    </div>
</div>

<!-- BOOTSTRAP JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</body>
</html>
