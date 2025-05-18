

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
        response.sendRedirect("adminManageTeachers.jsp?s=0");
        return;
    }

    Connection conn = null;
    try {
        conn = DbConnector.getConnection();
        User teacher = new User();
        teacher.setId(Integer.parseInt(id));
        teacher.setFullname(fullname);
        teacher.setEmail(email);
        teacher.setPhone(phone);

        int result = teacher.updateTeacher(conn);

        if (result > 0) {
            response.sendRedirect("adminManageTeachers.jsp?s=1"); 
        } else {
            response.sendRedirect("adminManageTeachers.jsp?s=0"); 
        }
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("adminManageTeachers.jsp?s=0"); 
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

