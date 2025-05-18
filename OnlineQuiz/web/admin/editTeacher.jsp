

<%@ page import="classes.User"%>
<%@ page import="classes.DbConnector"%>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String teacherId = request.getParameter("id");
    if (teacherId == null || teacherId.trim().isEmpty()) {
        response.sendRedirect("adminManageTeachers.jsp");
        return;
    }

    User teacher = null;
    Connection conn = null;
    try {
        conn = DbConnector.getConnection();
        teacher = new User().getTeacherById(conn, Integer.parseInt(teacherId));
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

    if (teacher == null) {
        response.sendRedirect("adminManageTeachers.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Teacher</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-5">

    <h2 class="mb-4">Edit Teacher</h2>

    <form action="editTeacherProcess.jsp" method="post">
        <input type="hidden" name="id" value="<%= teacher.getId() %>">
        <div class="mb-3">
            <label for="fullname" class="form-label">Full Name:</label>
            <input type="text" class="form-control" id="fullname" name="fullname" value="<%= teacher.getFullName() %>" required>
        </div>
        <div class="mb-3">
            <label for="email" class="form-label">Email:</label>
            <input type="email" class="form-control" id="email" name="email" value="<%= teacher.getEmail() %>" required>
        </div>
        <div class="mb-3">
            <label for="phone" class="form-label">Phone:</label>
            <input type="text" class="form-control" id="phone" name="phone" value="<%= teacher.getPhone() %>" required>
        </div>
        <button type="submit" class="btn btn-primary"><i class="fas fa-save"></i> Save Changes</button>
    </form>

</body>
</html>
