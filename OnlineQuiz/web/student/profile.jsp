

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="classes.User"%>
<%@page import="classes.DbConnector"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" rel="stylesheet">
    <style>
        .profile-header {
           background-color: #2c3e50; 
            color: white;
            padding: 2rem 0;
            margin-bottom: 2rem;
        }
        .profile-img {
            width: 150px;
            height: 150px;
            object-fit: cover;
            border: 5px solid white;
        }
    </style>
</head>
<body class="bg-light">
    <%
        Integer userId = (Integer) session.getAttribute("userId");
        String userRole = (String) session.getAttribute("userRole");
        
        if (userId == null || !"user".equals(userRole)) {
            response.sendRedirect("login.jsp");
            return;
        }

        User student = null;
        Connection conn = null;
        try {
            conn = DbConnector.getConnection();
            student = new User().getStudentById(conn, userId);
            
            if (student == null) {
                out.println("<div class='container'><p class='alert alert-danger'>Failed to retrieve student information.</p></div>");
                return;
            }
    %>
    
    <div class="profile-header text-center">
        <img src="../img/graduated.png" alt="Student Profile Picture" class="rounded-circle profile-img mb-3">
        <h2><%= student.getFullName() %></h2>
        <p class="lead">Student</p>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-md-8 mx-auto">
                <div class="card shadow-sm">
                    <div class="card-body">
                        <h3 class="card-title mb-4">Student Profile</h3>
                        <div class="row mb-3">
                            <div class="col-sm-3">
                                <h6 class="mb-0"><i class="fas fa-user text-primary me-2"></i>Full Name</h6>
                            </div>
                            <div class="col-sm-9 text-secondary">
                                <%= student.getFullName() %>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-sm-3">
                                <h6 class="mb-0"><i class="fas fa-envelope text-primary me-2"></i>Email</h6>
                            </div>
                            <div class="col-sm-9 text-secondary">
                                <%= student.getEmail() %>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-sm-3">
                                <h6 class="mb-0"><i class="fas fa-phone text-primary me-2"></i>Phone</h6>
                            </div>
                            <div class="col-sm-9 text-secondary">
                                <%= student.getPhone() %>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-sm-3">
                                <h6 class="mb-0"><i class="fas fa-id-badge text-primary me-2"></i>Student ID</h6>
                            </div>
                            <div class="col-sm-9 text-secondary">
                                <%= student.getId() %>
                            </div>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%
        } catch (Exception e) {
            out.println("<div class='container'><p class='alert alert-danger'>An error occurred: " + e.getMessage() + "</p></div>");
            e.printStackTrace();
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    out.println("<div class='container'><p class='alert alert-danger'>Error closing database connection: " + e.getMessage() + "</p></div>");
                }
            }
        }
    %>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
