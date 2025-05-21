<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>User Form - User Management Application</title>
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f1f3f5; /* Light gray background for the entire page */
        }

        .navbar {
            background-color: #343a40;
        }

        .navbar-brand {
            font-weight: bold;
        }

        .card {
        border: 1px solid #dee2e6 !important;
        border-radius: 8px !important;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05) !important;
        max-width: 450px;
        margin-left: auto;
        margin-right: auto;
        padding: 30px;
        margin-bottom: 30px;
        background-color: #ffffff !important;
    	}

        .card-header {
    	font-size: 1.2rem;
    	font-weight: bold;
    	text-align: center;
    	margin-bottom: 20px;
    	color: #343a40;
    	background-color: transparent; 
    	padding-bottom: 10px;
    	border-bottom: 2px solid #000000; 
		}

        .form-group {
            margin-bottom: 15px;
        }

        .btn-oblong {
            border-radius: 30px;
            padding: 10px 30px;
            font-weight: bold;
        }

        .btn-user-list {
            border-radius: 30px;
            padding: 8px 20px;
            font-weight: bold;
            background-color: #007bff;
            color: white;
            text-align: center;
            white-space: nowrap;
            font-size: 0.95rem;
            transition: background-color 0.2s ease-in-out;
        }

        .btn-user-list:hover {
            background-color: #0056b3;
        }

        .button-container {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }

        .button-container .btn {
            width: 48%;
        }

        .form-footer {
            text-align: center;
            margin-top: 15px;
        }

        .header-space {
            margin-top: 0;
            margin-bottom: 30px;
        }

        .navbar {
            margin-bottom: 20px;
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

    <!-- Heading for User Form -->
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h3 class="mb-0">
            <c:if test="${not empty user}">
                Edit User
            </c:if>
            <c:if test="${empty user}">
            
            </c:if>
        </h3>
    </div>

    <!-- User Form Card -->
    <div class="card">
        <div class="card-header">
            <strong>User Form</strong>
        </div>

        <div class="card-body">
            <form action="<c:if test='${not empty user}'>update</c:if><c:if test='${empty user}'>insert</c:if>" method="post">
                <c:if test="${not empty user}">
                    <input type="hidden" name="id" value="<c:out value='${user.id}' />">
                </c:if>
                <div class="form-group">
                    <label for="name">Name</label>
                    <input type="text" class="form-control" id="name" name="name" value="<c:out value='${user.name}' />" required>
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" class="form-control" id="email" name="email" value="<c:out value='${user.email}' />" required>
                </div>
                <div class="form-group">
                    <label for="country">Country</label>
                    <input type="text" class="form-control" id="country" name="country" value="<c:out value='${user.country}' />" required>
                </div>

                <!-- Button Container for 'Create User' and 'Manage Users' buttons -->
                <div class="button-container">
                    <button type="submit" class="btn btn-primary btn-oblong">
                        <c:if test="${not empty user}">Update User</c:if>
                        <c:if test="${empty user}">Create User</c:if>
                    </button>
                    <a href="<%=request.getContextPath()%>/list" class="btn btn-user-list">Manage Users</a>
                </div>
            </form>
        </div>
    </div>

</div>

</body>
</html>


