<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="classes.User" %>
<%@ page import="classes.Subject" %>
<%@ page import="classes.DbConnector" %>
<%
    Connection conn = null;
    int teacherCount = 0;
    int studentCount = 0;
    int quizCount = 0;

    try {
        conn = DbConnector.getConnection();
        User user = new User();
        teacherCount = user.getTeacherCount(conn);
        studentCount = user.getStudentCount(conn);
        quizCount = Subject.getQuizCount(conn);
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (conn != null) {
                conn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Dashboard - QuizMaster</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
        <style>

            .navbar-custom {
                background-color: #343a40;
            }
            .navbar-brand {
                font-size: 1.5rem;
                font-weight: bold;
                color: #ffffff !important;
            }
            .nav-link {
                color: #ffffff !important;
                margin-right: 15px;
                transition: color 0.3s ease;
            }
            .nav-link:hover {
                color: #ffc107 !important;
            }
            .nav-item.active .nav-link {
                color: #ffc107 !important;
            }
            .btn-logout {
                background-color: #dc3545;
                color: #ffffff;
                transition: background-color 0.3s ease;
            }
            .btn-logout:hover {
                background-color: #c82333;
            }


            .card-custom {
                border-left: 5px solid #007bff;
                transition: transform 0.2s ease-in-out;
            }
            .card-custom:hover {
                transform: scale(1.05);
            }
            .card-icon {
                font-size: 3rem;
                color: #007bff;
            }
        </style>
    </head>
    <body>

        <nav class="navbar navbar-expand-lg navbar-custom">
            <div class="container">
                <a class="navbar-brand" href="#">QuizMaster Admin</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav me-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="adminDashboard.jsp">Dashboard</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="adminManageTeachers.jsp">Manage Teachers</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="adminManageStudents.jsp">Manage Students</a>
                        </li>
                    </ul>
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <a class="btn btn-logout" href="logout.jsp">Logout</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>


        <div class="container mt-5">
            <h2>Admin Dashboard</h2>
            <div class="row mt-4">

                <div class="col-md-4">
                    <div class="card card-custom">
                        <div class="card-body d-flex align-items-center">
                            <div>
                                <i class="bi bi-person-badge card-icon"></i>
                            </div>
                            <div class="ms-3">
                                <h5 class="card-title">Teachers</h5>
                                <p class="card-text">Total number of teachers: <strong><%= teacherCount%></strong></p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card card-custom">
                        <div class="card-body d-flex align-items-center">
                            <div>
                                <i class="bi bi-journal-text card-icon"></i>
                            </div>
                            <div class="ms-3">
                                <h5 class="card-title">Quizzes</h5>
                                <p class="card-text">Total number of quizzes: <strong><%= quizCount%></strong></p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="card card-custom">
                        <div class="card-body d-flex align-items-center">
                            <div>
                                <i class="bi bi-person-lines-fill card-icon"></i>
                            </div>
                            <div class="ms-3">
                                <h5 class="card-title">Students</h5>
                                <p class="card-text">Total number of students: <strong><%= studentCount%></strong></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
