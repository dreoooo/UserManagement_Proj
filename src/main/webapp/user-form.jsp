<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Student Profiling Application</title>
    <link rel="stylesheet"
          href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          crossorigin="anonymous" />
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
            background-color: #343a40; 
            color: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 55px;  
            margin: 20px auto 0 auto; 
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
            transition: border-color 0.3s;
            color: #495057;
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
            color: #495057;
        }
        .form-control:focus {
            box-shadow: none;
            background-color: #f1f3f5;
        }
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
            background-color: #343a40;
            color: white;
            border: none;
            transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
        }
        .btn-oblong:hover {
            background-color: #495057;
            color: white;
        }
        .btn-user-list {
            border-radius: 30px;
            padding: 10px 30px;
            font-weight: bold;
            background-color: #343a40;
            color: white;
            border: none;
            transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
            text-align: center;
            display: inline-block;
        }
        .btn-user-list:hover {
            background-color: #495057;
            color: white;
            text-decoration: none;
        }
        .button-container {
            display: flex;
            flex-direction: column;
            gap: 10px;
            margin-top: 25px;
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

<div class="container">
    <c:set var="formAction" value="${empty user ? 'insert' : 'update'}" />

    <div class="card">
        <div class="icon-avatar">
            <i class="fas fa-user"></i>
        </div>

        <div class="card-body">
            <!-- Title removed -->

            <form action="${pageContext.request.contextPath}/${formAction}" method="post">
                <c:if test="${not empty user}">
                    <input type="hidden" name="id" value="${user.id}" />
                </c:if>

                <div class="form-group">
                    <div class="input-group name">
                        <div class="input-group-text"><i class="fas fa-id-badge"></i></div>
                        <input type="text" name="firstName" placeholder="First Name" class="form-control" 
                               value="${user.firstName}" required autofocus autocomplete="off"/>
                    </div>
                </div>

                <div class="form-group">
                    <div class="input-group name">
                        <div class="input-group-text"><i class="fas fa-id-badge"></i></div>
                        <input type="text" name="middleName" placeholder="Middle Name" class="form-control" 
                               value="${user.middleName}" autocomplete="off"/>
                    </div>
                </div>

                <div class="form-group">
                    <div class="input-group name">
                        <div class="input-group-text"><i class="fas fa-id-badge"></i></div>
                        <input type="text" name="lastName" placeholder="Last Name" class="form-control" 
                               value="${user.lastName}" required autocomplete="off"/>
                    </div>
                </div>

                <div class="form-group">
                    <div class="input-group email">
                        <div class="input-group-text"><i class="fas fa-envelope"></i></div>
                        <input type="email" name="email" placeholder="Email" class="form-control" 
                               value="${user.email}" required autocomplete="off"/>
                    </div>
                </div>

                <div class="form-group">
                    <div class="input-group country">
                        <div class="input-group-text"><i class="fas fa-globe"></i></div>
                        <input type="text" name="country" placeholder="Country" class="form-control" 
                               value="${user.country}" required autocomplete="off"/>
                    </div>
                </div>

                <div class="form-group">
                    <div class="input-group region">
                        <div class="input-group-text"><i class="fas fa-map-marker-alt"></i></div>
                        <input type="text" name="region" placeholder="Region" class="form-control" 
                               value="${user.region}" required autocomplete="off"/>
                    </div>
                </div>

                <div class="button-container">
                    <button type="submit" class="btn btn-oblong">
                        <c:choose>
                            <c:when test="${not empty user}">
                                Update Student Profile
                            </c:when>
                            <c:otherwise>
                                Add Student Profile
                            </c:otherwise>
                        </c:choose>
                    </button>

                    <a href="${pageContext.request.contextPath}/list" class="btn btn-user-list">
                        Student Profiles List
                    </a>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>
