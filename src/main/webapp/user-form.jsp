<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>Student Profiling Application</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
    <style>
        /* Your original styles here, unchanged */
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
        }

        @keyframes fadeIn {
            from {opacity: 0;}
            to {opacity: 1;}
        }

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

        /* Added minimal style for field warnings */
        .field-error {
            color: #d9534f;
            font-size: 0.85rem;
            margin-top: 0.25rem;
            margin-left: 2.8rem; /* aligns nicely with input padding */
        }
    </style>
</head>
<body>

<header>
    <nav class="navbar navbar-expand-md navbar-dark">
        <div class="container-fluid px-3">
            <a href="#" class="navbar-brand">
                <img src="https://htcgsc.edu.ph/wp-content/uploads/2022/02/htc-new-seal.png" alt="Holy Trinity College Logo" height="30" />
                Student Profiling Application
            </a>
        </div>
    </nav>
</header>

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

                <!-- First Name -->
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

                <!-- Middle Name -->
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-text"><i class="fas fa-id-badge"></i></div>
                        <input type="text" id="middleName" name="middleName" placeholder="Middle Name"
                               class="form-control"
                               value="${fn:escapeXml(param.middleName != null ? param.middleName : user.middleName)}" />
                    </div>
                </div>

                <!-- Last Name -->
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

                <!-- Email -->
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

                <!-- Country -->
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-text"><i class="fas fa-globe"></i></div>
                        <select id="country" name="country" class="form-control" required>
                            <option value="">Select Country</option>
                            <option value="Philippines" <c:if test="${(param.country != null ? param.country : user.country) == 'Philippines'}">selected</c:if>>Philippines</option>
                            <option value="United States" <c:if test="${(param.country != null ? param.country : user.country) == 'United States'}">selected</c:if>>United States</option>
                            <option value="Canada" <c:if test="${(param.country != null ? param.country : user.country) == 'Canada'}">selected</c:if>>Canada</option>
                            <option value="United Kingdom" <c:if test="${(param.country != null ? param.country : user.country) == 'United Kingdom'}">selected</c:if>>United Kingdom</option>
                            <option value="Australia" <c:if test="${(param.country != null ? param.country : user.country) == 'Australia'}">selected</c:if>>Australia</option>
                        </select>
                    </div>
                    <c:if test="${not empty countryError}">
                        <div class="field-error">${countryError}</div>
                    </c:if>
                </div>

                <!-- Region -->
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-text"><i class="fas fa-map-marker-alt"></i></div>
                        <select id="region" name="region" class="form-control" required>
                            <option value="">Select Region</option>
                            <c:forEach var="i" begin="1" end="13">
                                <option value="${i}" <c:if test="${(param.region != null ? param.region : user.region) == i}">selected</c:if>>Region ${i}</option>
                            </c:forEach>
                            <option value="MIMAROPA" <c:if test="${(param.region != null ? param.region : user.region) == 'MIMAROPA'}">selected</c:if>>MIMAROPA</option>
                            <option value="NCR" <c:if test="${(param.region != null ? param.region : user.region) == 'NCR'}">selected</c:if>>NCR</option>
                            <option value="CAR" <c:if test="${(param.region != null ? param.region : user.region) == 'CAR'}">selected</c:if>>CAR</option>
                        </select>
                    </div>
                    <c:if test="${not empty regionError}">
                        <div class="field-error">${regionError}</div>
                    </c:if>
                </div>

                <div class="button-container">
                    <button type="submit" class="btn btn-oblong">
                        <c:choose>
                            <c:when test="${not empty user}">Update Student Profile</c:when>
                            <c:otherwise>Add Student Profile</c:otherwise>
                        </c:choose>
                    </button>
                    <a href="${pageContext.request.contextPath}/list" class="btn btn-user-list">Home</a>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>
