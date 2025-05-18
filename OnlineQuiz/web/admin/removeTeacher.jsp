<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="classes.User" %>
<%@ page import="classes.DbConnector" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Remove Teacher</title>
  
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2 class="mb-4">Remove Teacher</h2>
        
        <form action="removeTeacherProcess.jsp" method="post">
            <div class="mb-3">
                <label for="teacherId" class="form-label">Select Teacher to Remove:</label>
                <select name="teacherId" id="teacherId" class="form-select" required>
                    <option value="">Select a teacher</option>
                    <%
                        Connection conn = null;
                        try {
                            conn = DbConnector.getConnection();
                            User user = new User();
                            List<User> teachers = user.getAllTeachers(conn);
                            for (User teacher : teachers) {
                    %>
                        <option value="<%= teacher.getId() %>"><%= teacher.getFullName() %> (<%= teacher.getEmail() %>)</option>
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
                </select>
            </div>
            <button type="submit" class="btn btn-danger">Remove Teacher</button>
        </form>
        
        <%
            String status = request.getParameter("s");
            if (status != null) {
                if (status.equals("1")) {
        %>
                    <div class="alert alert-success mt-3" role="alert">
                        Teacher removed successfully!
                    </div>
        <%
                } else if (status.equals("0")) {
        %>
                    <div class="alert alert-danger mt-3" role="alert">
                        Failed to remove teacher. Please try again.
                    </div>
        <%
                } else if (status.equals("3")) {
        %>
                    <div class="alert alert-warning mt-3" role="alert">
                        Invalid teacher selection. Please select a teacher.
                    </div>
        <%
                }
            }
        %>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>