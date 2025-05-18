<%@page import="java.util.List"%>
<%@page import="classes.Subject"%>
<%@page import="classes.Question"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="classes.User" %>
<%@ page import="classes.DbConnector" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Dashboard - QuizMaster</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
        .dashboard-card {
            transition: transform 0.3s;
        }
        .dashboard-card:hover {
            transform: translateY(-5px);
        }
    </style>
</head>
<body class="bg-light">
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="container">
            <a class="navbar-brand" href="#">QuizMaster</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link active" href="#">Dashboard</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="profile.jsp">Profile</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="logout.jsp">Logout</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container mt-4">
      
        
        <div class="row">
            <div class="col-md-4 mb-4">
                <div class="card dashboard-card">
                    <div class="card-body">
                        <h5 class="card-title"><i class="fas fa-book-reader"></i> Quizzes Taken</h5>
     
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="card dashboard-card">
                    <div class="card-body">
                        <h5 class="card-title"><i class="fas fa-chart-line"></i> Average Score</h5>
      
                    </div>
                </div>
            </div>
            <div class="col-md-4 mb-4">
                <div class="card dashboard-card">
                    <div class="card-body">
                        <h5 class="card-title"><i class="fas fa-trophy"></i> Achievements</h5>
                        <p class="card-text display-4">3</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="row mt-4">
            <div class="col-md-6 mb-4">
                <div class="card dashboard-card">
                    <div class="card-body">
                        <h5 class="card-title">Recent Quizzes</h5>
                        <ul class="list-group">
                            <li class="list-group-item">Math Quiz - 85%</li>
                            <li class="list-group-item">Science Quiz - 92%</li>
                            <li class="list-group-item">History Quiz - 78%</li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-md-6 mb-4">
    <div class="card dashboard-card">
        <div class="card-body">
            <h5 class="card-title">Available Quizzes</h5>
            <%
                List<Subject> quizzes = Subject.getAllSubjects();
            %>
            <ul class="list-group">
                <% for (Subject quiz : quizzes) { %>
                    <li class="list-group-item d-flex justify-content-between align-items-center">
                        <%= quiz.getName() %>
                        <a href="quiz-attempt.jsp?sid=<%= quiz.getId() %>&isnew=y" class="btn btn-primary btn-sm">Start</a>
                    </li>
                <% } %>
            </ul>
        </div>
    </div>
</div>

        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>