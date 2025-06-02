<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>Student Profiling Application</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
    <style>
        /* General Body Styling */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-image: url('https://images.unsplash.com/photo-1506744038136-46273834b3fb?fm=jpg&q=60&w=3000&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8bGFuZHNjYXBlJTIwd2FsbHBhcGVyfGVufDB8fDB8fHww');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            background-attachment: fixed;
            margin: 0;
            padding: 0;
        }

        /* Navbar Styling */
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

        /* Main Container Animation */
        .content-container {
            animation: fadeIn 0.4s ease-in forwards;
        }

        @keyframes fadeIn {
            from {opacity: 0;}
            to {opacity: 1;}
        }

        /* Card Styling */
        .card {
            border: none;
            border-radius: 16px;
            background-color: rgba(255, 255, 255, 0.58);
            backdrop-filter: blur(8px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15), 0 4px 12px rgba(0, 0, 0, 0.05);
            max-width: 480px;
            margin: 40px auto;
            transition: all 0.3s ease;
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

        /* Form and Input Styling */
        .form-group {
            margin-bottom: 10px;
        }

        .input-group-text {
            background-color: #e9ecef;
            border: 1px solid #ced4da;
            border-right: none;
            border-top-left-radius: 8px;
            border-bottom-left-radius: 8px;
            padding: 0 12px;
            min-width: 45px;
            color: #495057;
            position: relative;
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

        select.form-control {
            padding-left: 0.75rem;
        }

        .form-control:focus {
            box-shadow: none;
            background-color: #f1f3f5;
        }

        input:focus::placeholder {
            color: transparent;
        }

        /* Button Styling */
        .btn-oblong {
            border-radius: 30px;
            padding: 10px 40px;
            font-weight: bold;
            font-size: 16px;
            background-color: #343a40;
            color: white;
            border: none;
            transition: background-color 0.2s ease-in-out;
        }

        .btn-oblong:hover,
        .btn-oblong:focus {
            background-color: #495057;
            color: white;
            outline: none;
        }

        .btn-user-list {
            border-radius: 30px;
            padding: 10px 30px;
            font-weight: bold;
            background-color: #343a40;
            color: white;
            border: none;
            transition: background-color 0.2s ease-in-out;
            text-align: center;
            display: inline-block;
        }

        .btn-user-list:hover,
        .btn-user-list:focus {
            background-color: #495057;
            text-decoration: none;
            color: white;
            outline: none;
        }

        .button-container {
            display: flex;
            flex-direction: column;
            gap: 10px;
            margin-top: 25px;
        }

        .field-error {
            color: #d9534f;
            font-size: 0.85rem;
            margin-top: 0.25rem;
            margin-left: 2.8rem;
        }
    </style>
</head>
<body>

<!-- NAVBAR (.navbar) -->
<header>
    <nav class="navbar navbar-expand-md navbar-dark">
        <div class="container-fluid px-3">
            <a href="#" class="navbar-brand">
                <img src="https://htcgsc.edu.ph/wp-content/uploads/2022/02/htc-new-seal.png" alt="Holy Trinity College Logo" height="30" />
                Dreo's Web Project
            </a>

            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">
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
                </ul>
            </div>
        </div>
    </nav>
</header>

<!-- MAIN CONTAINER -->
<div class="container content-container">
    <c:set var="formAction" value="${empty user ? 'insert' : 'update'}" />
    <div class="card" role="main" aria-labelledby="formTitle">
        <div class="icon-avatar" aria-hidden="true"><i class="fas fa-user"></i></div>
        <div class="card-body">
            <h2 id="formTitle" class="sr-only">Student Profile Form</h2>
            <form action="${pageContext.request.contextPath}/${formAction}" method="post" novalidate>
                <c:if test="${not empty user}">
                    <input type="hidden" name="id" value="${user.id}" />
                </c:if>

                <!-- FIRST NAME (.form-group) -->
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-text"><i class="fas fa-id-badge"></i></div>
                        <input type="text" id="firstName" name="firstName" placeholder="First Name"
                               class="form-control"
                               value="${fn:escapeXml(param.firstName != null ? param.firstName : user.firstName)}" required />
                    </div>
                    <c:if test="${not empty firstNameError}">
                        <div class="field-error">${firstNameError}</div>
                    </c:if>
                </div>

                <!-- MIDDLE NAME (.form-group) -->
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-text"><i class="fas fa-id-badge"></i></div>
                        <input type="text" id="middleName" name="middleName" placeholder="Middle Name"
                               class="form-control"
                               value="${fn:escapeXml(param.middleName != null ? param.middleName : user.middleName)}" />
                    </div>
                </div>

                <!-- LAST NAME (.form-group) -->
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-text"><i class="fas fa-id-badge"></i></div>
                        <input type="text" id="lastName" name="lastName" placeholder="Last Name"
                               class="form-control"
                               value="${fn:escapeXml(param.lastName != null ? param.lastName : user.lastName)}" required />
                    </div>
                    <c:if test="${not empty lastNameError}">
                        <div class="field-error">${lastNameError}</div>
                    </c:if>
                </div>

                <!-- GENDER (.form-group) -->
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-text"><i class="fas fa-venus-mars"></i></div>
                        <select class="form-control" id="gender" name="gender" required>
                            <option value="" disabled selected hidden>Select Gender</option>
                            <option value="Male" <c:if test="${(param.gender != null ? param.gender : user.gender) == 'Male'}">selected</c:if>>Male</option>
                            <option value="Female" <c:if test="${(param.gender != null ? param.gender : user.gender) == 'Female'}">selected</c:if>>Female</option>
                            <option value="Other" <c:if test="${(param.gender != null ? param.gender : user.gender) == 'Other'}">selected</c:if>>Other</option>
                        </select>
                    </div>
                </div>

                <!-- EMAIL (.form-group) -->
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-text"><i class="fas fa-envelope"></i></div>
                        <input type="email" id="email" name="email" placeholder="Email"
                               class="form-control"
                               value="${fn:escapeXml(param.email != null ? param.email : user.email)}" required />
                    </div>
                    <c:if test="${not empty emailError}">
                        <div class="field-error">${emailError}</div>
                    </c:if>
                </div>

                <!-- COUNTRY (.form-group) -->
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-text"><i class="fas fa-globe"></i></div>
                        <select id="country" name="country" class="form-control" required>
                            <option value="" disabled selected hidden>Select Country</option>
                            <option value="Philippines" <c:if test="${(param.country != null ? param.country : user.country) == 'Philippines'}">selected</c:if>>Philippines</option>
                            <option value="United States" <c:if test="${(param.country != null ? param.country : user.country) == 'United States'}">selected</c:if>>United States</option>
                            <option value="Canada" <c:if test="${(param.country != null ? param.country : user.country) == 'Canada'}">selected</c:if>>Canada</option>
                            <option value="United Kingdom" <c:if test="${(param.country != null ? param.country : user.country) == 'United Kingdom'}">selected</c:if>>United Kingdom</option>
                            <option value="Australia" <c:if test="${(param.country != null ? param.country : user.country) == 'Australia'}">selected</c:if>>Australia</option>
                            <option value="Japan" <c:if test="${(param.country != null ? param.country : user.country) == 'Japan'}">selected</c:if>>Japan</option>
                            <option value="Korea" <c:if test="${(param.country != null ? param.country : user.country) == 'Korea'}">selected</c:if>>Korea</option>
                        </select>
                    </div>
                </div>

                <!-- REGION (.form-group) -->
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-text"><i class="fas fa-map-marker-alt"></i></div>
                        <select id="region" name="region" class="form-control" required>
                            <option value="" disabled selected hidden>Select Region</option>
                            <option value="NCR" <c:if test="${(param.region != null ? param.region : user.region) == 'NCR'}">selected</c:if>>NCR</option>
                            <option value="CAR" <c:if test="${(param.region != null ? param.region : user.region) == 'CAR'}">selected</c:if>>CAR</option>
                            <option value="Region I" <c:if test="${(param.region != null ? param.region : user.region) == 'Region I'}">selected</c:if>>Region I</option>
                            <option value="Region II" <c:if test="${(param.region != null ? param.region : user.region) == 'Region II'}">selected</c:if>>Region II</option>
                            <option value="Region III" <c:if test="${(param.region != null ? param.region : user.region) == 'Region III'}">selected</c:if>>Region III</option>
                            <option value="Region IV-A" <c:if test="${(param.region != null ? param.region : user.region) == 'Region IV-A'}">selected</c:if>>Region IV-A</option>
                            <option value="Region IV-B" <c:if test="${(param.region != null ? param.region : user.region) == 'Region IV-B'}">selected</c:if>>Region IV-B</option>
                            <option value="Region V" <c:if test="${(param.region != null ? param.region : user.region) == 'Region V'}">selected</c:if>>Region V</option>
                            <option value="Region VI" <c:if test="${(param.region != null ? param.region : user.region) == 'Region VI'}">selected</c:if>>Region VI</option>
                            <option value="Region VII" <c:if test="${(param.region != null ? param.region : user.region) == 'Region VII'}">selected</c:if>>Region VII</option>
                            <option value="Region VIII" <c:if test="${(param.region != null ? param.region : user.region) == 'Region VIII'}">selected</c:if>>Region VIII</option>
                            <option value="Region IX" <c:if test="${(param.region != null ? param.region : user.region) == 'Region IX'}">selected</c:if>>Region IX</option>
                            <option value="Region X" <c:if test="${(param.region != null ? param.region : user.region) == 'Region X'}">selected</c:if>>Region X</option>
                            <option value="Region XI" <c:if test="${(param.region != null ? param.region : user.region) == 'Region XI'}">selected</c:if>>Region XI</option>
                            <option value="Region XII" <c:if test="${(param.region != null ? param.region : user.region) == 'Region XII'}">selected</c:if>>Region XII</option>
                            <option value="CARAGA" <c:if test="${(param.region != null ? param.region : user.region) == 'CARAGA'}">selected</c:if>>CARAGA</option>
                            <option value="BARMM" <c:if test="${(param.region != null ? param.region : user.region) == 'BARMM'}">selected</c:if>>BARMM</option>
                        </select>
                    </div>
                </div>

                <div class="button-container">
                    <button type="submit" class="btn btn-oblong">
                        <c:choose>
                            <c:when test="${empty user}">Add Student Profile</c:when>
                            <c:otherwise>Update User</c:otherwise>
                        </c:choose>
                    </button>
                    <a href="${pageContext.request.contextPath}/list" class="btn btn-user-list">
                        <i></i> List of Students
                    </a>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" crossorigin="anonymous"></script>

</body>
</html>
