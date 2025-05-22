<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>User Form - User Management Application</title>
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          crossorigin="anonymous">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f1f3f5;
        }

        .navbar {
            background-color: #343a40;
            margin-bottom: 20px;
        }

        .navbar-brand {
            font-weight: bold;
        }

        .card {
            border: none;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.05);
            max-width: 450px;
            margin: 40px auto;
            background-color: #ffffff;
        }

        .icon-avatar {
            width: 130px;   
            height: 130px;  
            background-color: #007bff;
            color: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 55px;  
            margin: 20px auto 5px auto;
        }

        .form-group {
            margin-bottom: 10px; 
        }

        .input-group-text {
            background-color: #e9ecef; 
            border: 1px solid #ced4da;
            border-right: none;
            border-top-left-radius: 8px;
            border-bottom-left-radius: 8px;
            padding-left: 12px;
            padding-right: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
            min-width: 45px;
        }

        .input-group-text::after {
            content: "";
            position: absolute;
            right: 0;
            top: 10%;
            height: 80%;
            width: 1px;
            background-color: #ced4da;
        }

        .form-control {
            border: 1px solid #ced4da;
            border-left: none;
            border-top-right-radius: 8px;
            border-bottom-right-radius: 8px;
            background-color: #f8f9fa;
            padding-left: 1rem;
            height: 45px;
        }

        .form-control:focus {
            box-shadow: none;
            background-color: #f1f3f5;
        }

        /* ✅ New: Hide placeholder text on focus */
        input:focus::placeholder {
            color: transparent;
        }

        .btn-oblong {
            border-radius: 30px;
            padding: 10px 40px;
            font-weight: bold;
            font-size: 16px;
            line-height: 1.2;
            height: auto;
            white-space: nowrap;
        }

        .btn-user-list {
            border-radius: 30px;
            padding: 10px 30px;
            font-weight: bold;
            background-color: #007bff;
            color: white;
            transition: background-color 0.2s ease-in-out;
        }

        .btn-user-list:hover {
            background-color: #0056b3;
        }

        .button-container {
            display: flex;
            flex-direction: column;
            gap: 10px;
            margin-top: 25px;
        }

        h3 {
            margin-bottom: 20px;
            text-align: center;
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

<div class="container">
    <c:set var="formAction" value="${empty user ? 'insert' : 'update'}" />

    <div class="card">
        <div class="icon-avatar">
            <i class="fas fa-user"></i>
        </div>

        <div class="card-body">
            <h3>
                <c:choose>
                    <c:when test="${not empty user}">
                        
                    </c:when>
                    <c:otherwise>
                        
                    </c:otherwise>
                </c:choose>
            </h3>

            <form action="${pageContext.request.contextPath}/${formAction}" method="post">
                <c:if test="${not empty user}">
                    <input type="hidden" name="id" value="<c:out value='${user.id}' />">
                </c:if>

                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text">
                                <i class="fas fa-user"></i>
                            </span>
                        </div>
                        <input type="text" class="form-control" id="name" name="name"
                               placeholder="Full Name"
                               value="<c:out value='${user.name}' default='' />" required autocomplete="name">
                    </div>
                </div>

                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text">
                                <i class="fas fa-envelope"></i>
                            </span>
                        </div>
                        <input type="email" class="form-control" id="email" name="email"
                               placeholder="Email Address"
                               value="<c:out value='${user.email}' default='' />" required autocomplete="email">
                    </div>
                </div>

                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text">
                                <i class="fas fa-globe"></i>
                            </span>
                        </div>
                        <input type="text" class="form-control" id="country" name="country"
                               placeholder="Country"
                               value="<c:out value='${user.country}' default='' />" required autocomplete="country-name">
                    </div>
                </div>

                <div class="button-container">
                    <button type="submit" class="btn btn-primary btn-oblong">
                        <c:if test="${not empty user}">Update User</c:if>
                        <c:if test="${empty user}">Create User</c:if>
                    </button>
                    <a href="${pageContext.request.contextPath}/list" class="btn btn-user-list">
                        Go Back
                    </a>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>
