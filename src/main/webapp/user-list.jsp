<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Student Profiling Application</title>
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .navbar {
            background-color: #343a40;
        }
        .navbar-brand {
            font-weight: bold;
        }
        .content-box {
            background-color: #f0f2f5; /* softer gray background */
            border: 1px solid #d1d5db; /* lighter gray border */
            border-radius: 12px;
            padding: 30px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.08); /* gentle shadow */
        }
        .btn-sm {
            min-width: 75px;
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
            margin-top: 20px;
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
            border: 1px solid #dee2e6;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
            padding: 15px;
            background-color: white;
            max-width: 320px;
            margin: 0 auto;
        }
        /* Updated card header background and color */
        .card-header {
            font-size: 1rem;
            font-weight: bold;
            background-color: #343a40; /* same as add button */
            color: white; /* white text for contrast */
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
        .fa-user-graduate {
            color: #343a40; /* icon color */
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
        h3 .fas.fa-user-graduate {
            vertical-align: middle;
            color: #343a40; /* icon color */
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
        <div class="container">
            <a href="#" class="navbar-brand">
                <img src="https://htcgsc.edu.ph/wp-content/uploads/2022/02/htc-new-seal.png" alt="HTC Logo" height="30" style="margin-right: 10px;">
                Student Profiling Application
            </a>
        </div>
    </nav>
</header>

<div class="container header-space">
    <div class="content-box">
        <div class="header-row">
            <h3>
                <i class="fas fa-user-graduate"></i>
                List of Student Profiles
            </h3>
            <a href="${pageContext.request.contextPath}/new" class="btn btn-oblong">
                <i class="fas fa-plus" style="margin-right: 5px;"></i> Add Student Profile
            </a>
        </div>

        <c:if test="${not empty listUser}">
            <div class="user-cards-container">
                <c:forEach var="user" items="${listUser}">
                    <div class="card">
                        <div class="card-header">
                            ID: <c:out value="${user.id}" />
                        </div>
                        <div class="card-body">
                            <h5 class="card-title mb-2" style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
                                <i class="fas fa-user-graduate text-primary"></i>
                                <c:out value="${user.firstName}"/> <c:out value="${user.middleName}"/> <c:out value="${user.lastName}"/>
                            </h5>
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
                                <a href="edit?id=${user.id}" class="btn btn-outline-secondary btn-sm">
                                    <i class="fas fa-edit" style="margin-right: 5px;"></i> Edit
                                </a>
                                <a href="delete?id=${user.id}" class="btn btn-outline-danger btn-sm"
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

</body>
</html>
