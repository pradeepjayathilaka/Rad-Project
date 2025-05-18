

<%@ page import="classes.User"%>
<%@ page import="classes.DbConnector"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Students</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
</head>
<body class="container mt-5">

    <h2 class="mb-4">Manage Students</h2>

    <table class="table table-bordered table-striped">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Full Name</th>
                <th>Email</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <%
                Connection conn = null;
                try {
                    conn = DbConnector.getConnection();
                    User user = new User();
                    List<User> students = user.getAllStudents(conn);
                    for (User student : students) {
            %>
            <tr>
                <td><%= student.getId() %></td>
                <td><%= student.getFullname() %></td>
                <td><%= student.getEmail() %></td>
                <td>
                    <a href="editStudent.jsp?id=<%= student.getId() %>" class="btn btn-warning btn-sm"><i class="fas fa-edit"></i> Edit</a>
                    <a href="deleteStudentProcess.jsp?id=<%= student.getId() %>" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this student?');"><i class="fas fa-trash"></i> Delete</a>
                </td>
            </tr>
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    if (conn != null) {
                        try {
                            conn.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }
                }
            %>
        </tbody>
    </table>

</body>
</html>
