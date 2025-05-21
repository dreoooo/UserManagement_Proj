<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>User Management Application</title>
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

        .card {
            border: 1px solid #dee2e6;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
            min-height: auto;
            padding: 10px;
        }

        .card-title {
            font-size: 1.1rem;
            font-weight: 600;
        }

        .card-body {
            padding: 10px;
        }

        .btn-sm {
            min-width: 70px;
        }

        .card-actions {
            margin-top: 10px;
        }

        .header-space {
            margin-top: 20px;
            margin-bottom: 30px;
        }

        .btn-oblong {
            border-radius: 30px;
            padding: 10px 30px;
            font-weight: bold;
        }

        .card-header {
    	font-size: 1rem;
    	font-weight: bold;
    	background-color: #007bff; 
    	color: white;
    	text-align: center;
    	border-bottom: 1px solid #dee2e6;
    	border-top-left-radius: 8px;
    	border-top-right-radius: 8px;
		}


        .no-users-message {
            font-style: italic;
            color: #6c757d;
        }

        .card-text i,
        .card-title i {
            margin-right: 6px;
        }

        .profile-row {
            margin-top: 30px;
        }

        .big-box {
            background-color: #e9ecef;
            border-radius: 12px;
            padding: 30px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
        }

        .user-cards-container {
            display: grid;
            grid-template-columns: repeat(4, 1fr); /* 4 per row */
            gap: 15px;
        }

        @media (max-width: 992px) {
            .user-cards-container {
                grid-template-columns: repeat(3, 1fr);
            }
        }

        @media (max-width: 768px) {
            .user-cards-container {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        @media (max-width: 576px) {
            .user-cards-container {
                grid-template-columns: 1fr;
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
                User Management System
            </a>
        </div>
    </nav>
</header>

<div class="container header-space">
    <!-- BIG BOX (Always visible) -->
    <div class="row profile-row">
        <div class="col-12">
            <div class="big-box">
                <!-- Header Row: Manage Users + Add Button -->
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h3 class="mb-0">
                        <i class="fas fa-user" style="margin-right: 8px;"></i>List of Users
                    </h3>
                    <a href="${pageContext.request.contextPath}/new" class="btn btn-primary btn-oblong">
                        <i class="fas fa-plus" style="margin-right: 5px;"></i> Add User
                    </a>
                </div>

                <c:if test="${not empty listUser}">
                    <div class="user-cards-container">
                        <c:forEach var="user" items="${listUser}">
                            <div class="card">
                                <div class="card-header">
                                    <strong>ID:</strong> <c:out value="${user.id}" />
                                </div>
                                <div class="card-body">
                                    <h5 class="card-title">
                                        <i class="fas fa-user text-primary"></i>
                                        <c:out value="${user.name}" />
                                    </h5>
                                    <p class="card-text mb-1">
                                        <i class="fas fa-envelope text-secondary"></i>
                                        <c:out value="${user.email}" />
                                    </p>
                                    <p class="card-text mb-1">
                                        <i class="fas fa-globe text-success"></i>
                                        <c:out value="${user.country}" />
                                    </p>
                                    <div class="card-actions">
                                        <a href="edit?id=${user.id}" class="btn btn-outline-secondary btn-sm">
                                            <i class="fas fa-edit" style="margin-right: 5px;"></i> Edit
                                        </a>
                                        <a href="delete?id=${user.id}" class="btn btn-outline-danger btn-sm"
                                           onclick="return confirm('Are you sure you want to delete this user?')">
                                            <i class="fas fa-trash-alt"></i> Delete
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:if>

                <!-- If no users, show message -->
                <c:if test="${empty listUser}">
                    <div class="text-center no-users-message">
                        <p>No users found. Click "Add User" to create one.</p>
                    </div>
                </c:if>
            </div>
        </div>
    </div>
</div>

</body>
</html>
