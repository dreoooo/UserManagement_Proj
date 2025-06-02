<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Calculator</title>
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
        .content-box {
            background-color: rgba(255, 255, 255, 0.62);
            border-radius: 12px;
            padding: 30px;
            margin-top: 60px;
            box-shadow: 0 12px 28px rgba(0, 0, 0, 0.15);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.3);
            max-width: 400px;
        }
        h3 {
            font-weight: 600;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            gap: 10px;
            justify-content: center;
        }
        .calculator {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 10px;
        }
        .calculator button {
            font-size: 1.3rem;
            padding: 20px;
            border-radius: 12px;
            border: none;
            background-color: #343a40;
            color: white;
            font-weight: bold;
            transition: background-color 0.2s;
        }
        .calculator button:hover {
            background-color: #495057;
        }
        #display {
            width: 100%;
            font-size: 1.5rem;
            text-align: right;
            padding: 15px;
            border-radius: 10px;
            margin-bottom: 15px;
            border: none;
            background-color: white;
            color: #333;
        }
    </style>
    <script>
        function append(value) {
            document.getElementById("display").value += value;
        }

        function clearDisplay() {
            document.getElementById("display").value = "";
        }

        function calculate() {
            try {
                let result = eval(document.getElementById("display").value);
                document.getElementById("display").value = result;
            } catch (e) {
                document.getElementById("display").value = "Error";
            }
        }
    </script>
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
                        <a href="${pageContext.request.contextPath}/" class="nav-link">
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

<div class="container d-flex justify-content-center">
    <div class="content-box">
        <h3><i class="fas fa-calculator"></i> Calculator</h3>
        <input type="text" id="display" readonly />
        <div class="calculator">
            <button onclick="append('7')">7</button>
            <button onclick="append('8')">8</button>
            <button onclick="append('9')">9</button>
            <button onclick="append('/')">÷</button>

            <button onclick="append('4')">4</button>
            <button onclick="append('5')">5</button>
            <button onclick="append('6')">6</button>
            <button onclick="append('*')">×</button>

            <button onclick="append('1')">1</button>
            <button onclick="append('2')">2</button>
            <button onclick="append('3')">3</button>
            <button onclick="append('-')">−</button>

            <button onclick="append('0')">0</button>
            <button onclick="append('.')">.</button>
            <button onclick="calculate()">=</button>
            <button onclick="append('+')">+</button>

            <button onclick="clearDisplay()" style="grid-column: span 4; background-color: #dc3545;">
                CLEAR
            </button>
        </div>
    </div>
</div>

<!-- BOOTSTRAP JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</body>
</html>
