

<%@ page import="classes.User"%>
<%@ page import="classes.DbConnector"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Teachers</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
</head>
<body class="container mt-5">

    <h2 class="mb-4">Manage Teachers</h2>

    <table class="table table-bordered table-striped">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Full Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <%
                Connection conn = null;
                try {
                    conn = DbConnector.getConnection();
                    User user = new User();
                    List<User> teachers = user.getAllTeachers(conn);
                    for (User teacher : teachers) {
            %>
            <tr>
                <td><%= teacher.getId() %></td>
                <td><%= teacher.getFullName() %></td>
                <td><%= teacher.getEmail() %></td>
                <td><%= teacher.getPhone() %></td>
                <td>
                    <a href="editTeacher.jsp?id=<%= teacher.getId() %>" class="btn btn-warning btn-sm"><i class="fas fa-edit"></i> Edit</a>
                    <a href="deleteTeacherProcess.jsp?id=<%= teacher.getId() %>" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this teacher?');"><i class="fas fa-trash"></i> Delete</a>
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

    <a href="addTeacher.jsp" class="btn btn-success"><i class="fas fa-plus"></i> Add New Teacher</a>

</body>
</html>
