<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Student Profiling Application</title>
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

        .btn-oblong {
            border-radius: 30px;
            padding: 10px 30px;
            font-weight: bold;
            background-color: #343a40;
            color: white;
            border: none;
            transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
        }

        .btn-oblong:hover {
            background-color: #495057;
            color: white;
        }

        .header-space {
            margin-top: 45px;
            margin-bottom: 30px;
        }

        .user-cards-container {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
            justify-content: center;
        }

        @media (max-width: 992px) {
            .user-cards-container {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        @media (max-width: 768px) {
            .user-cards-container {
                grid-template-columns: 1fr;
            }
        }

        .no-users-message {
            font-style: italic;
            color: #6c757d;
        }

        .card {
            width: 100%;
            height: 100%;
            border: none;
            border-radius: 8px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15), 0 4px 12px rgba(0, 0, 0, 0.05);
            padding: 15px;
            background-color: rgba(255, 255, 255, 0.58);
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            backdrop-filter: blur(8px);
        }

        .card-header {
            font-size: 1rem;
            font-weight: bold;
            background-color: #343a40;
            color: white;
            text-align: center;
            border-radius: 8px 8px 0 0;
            padding: 10px;
            margin: -15px -15px 15px -15px;
        }

        .card-actions {
            margin-top: 15px;
            display: flex;
            justify-content: flex-start;
            gap: 10px;
        }

        .fa-user {
            color: #343a40;
        }

        .header-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
            flex-wrap: wrap;
        }

        h3 {
            margin: 0;
            font-weight: 600;
            font-size: 1.75rem;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        @media (max-width: 576px) {
            .header-row {
                flex-direction: column;
                align-items: flex-start;
                gap: 15px;
            }

            .btn-oblong {
                width: 100%;
                text-align: center;
            }
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
    <div class="content-box">
        <div class="header-row">
            <h3>
                <i class="fas fa-users"></i>
                List of Student Profiles
            </h3>
            <a href="${pageContext.request.contextPath}/new" class="btn btn-oblong">
                <i class="fas fa-user-plus mr-2"></i> Add Student Profile
            </a>
        </div>

        <c:if test="${not empty listUser}">
            <div class="user-cards-container">
                <c:forEach var="user" items="${listUser}" varStatus="status">
                    <div class="card">
                        <div class="card-header">
                            No: <c:out value="${status.index + 1}" />
                        </div>
                        <div class="card-body">
                            <h5 class="card-title mb-2" style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
                                <i class="fas fa-user text-primary"></i>
                                <c:out value="${user.firstName}"/>
                                <c:if test="${not empty user.middleName}"> <c:out value="${user.middleName}"/></c:if>
                                <c:out value=" ${user.lastName}"/>
                            </h5>
                            <p class="card-text mb-1">
                                <c:choose>
                                    <c:when test="${user.gender eq 'Male'}">
                                        <i class="fas fa-mars text-primary"></i>
                                    </c:when>
                                    <c:when test="${user.gender eq 'Female'}">
                                        <i class="fas fa-venus text-danger"></i>
                                    </c:when>
                                    <c:otherwise>
                                        <i class="fas fa-genderless text-muted"></i>
                                    </c:otherwise>
                                </c:choose>
                                <c:out value="${user.gender}" />
                            </p>
                            <p class="card-text mb-1">
                                <i class="fas fa-envelope text-secondary"></i> <c:out value="${user.email}" />
                            </p>
                            <p class="card-text mb-1">
                                <i class="fas fa-globe text-success"></i> <c:out value="${user.country}" />
                            </p>
                            <p class="card-text mb-1">
                                <i class="fas fa-map-marker-alt text-info"></i> <c:out value="${user.region}" />
                            </p>
                            <div class="card-actions">
                                <a href="${pageContext.request.contextPath}/edit?id=${user.id}" class="btn btn-outline-secondary btn-sm">
                                    <i class="fas fa-edit mr-1"></i> Edit
                                </a>
                                <a href="${pageContext.request.contextPath}/delete?id=${user.id}" class="btn btn-outline-danger btn-sm"
                                   onclick="return confirm('Are you sure you want to delete this student profile?')">
                                    <i class="fas fa-trash-alt"></i> Delete
                                </a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:if>

        <c:if test="${empty listUser}">
            <div class="text-center no-users-message">
                <p>No student profiles found. Click "Add Student Profile" to create one.</p>
            </div>
        </c:if>
    </div>
</div>

<!-- BOOTSTRAP JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</body>
</html>
