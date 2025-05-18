

<%@ page import="classes.User"%>
<%@ page import="classes.DbConnector"%>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String id = request.getParameter("id");

    if (id == null || id.trim().isEmpty()) {
        response.sendRedirect("adminManageStudents.jsp?s=0");
        return;
    }

    Connection conn = null;
    try {
        conn = DbConnector.getConnection();
        User student = new User();
        student.setId(Integer.parseInt(id));

        int result = student.removeStudent(conn);

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

