

<%@ page import="classes.User"%>
<%@ page import="classes.DbConnector"%>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String id = request.getParameter("id");
    String fullname = request.getParameter("fullname");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");

    if (id == null || id.trim().isEmpty() || fullname == null || fullname.trim().isEmpty() ||
        email == null || email.trim().isEmpty() || phone == null || phone.trim().isEmpty()) {
        response.sendRedirect("adminManageStudents.jsp?s=0");
        return;
    }

    Connection conn = null;
    try {
        conn = DbConnector.getConnection();
        User student = new User();
        student.setId(Integer.parseInt(id));
        student.setFullname(fullname);
        student.setEmail(email);
        student.setPhone(phone);

        int result = student.updateStudent(conn);

        if (result > 0) {
            response.sendRedirect("adminManageStudents.jsp?s=1"); 
        } else {
            response.sendRedirect("adminManageStudents.jsp?s=0"); 
        }
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("adminManageStudents.jsp?s=0"); 
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

