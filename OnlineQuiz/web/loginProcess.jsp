<%@page import="classes.User"%>
<%@page import="classes.DbConnector"%>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    if (email == null || password == null || email.trim().isEmpty() || password.trim().isEmpty()) {
        response.sendRedirect("login.jsp?s=3"); 
        return;
    }

    Connection conn = null;
    try {
        conn = DbConnector.getConnection();
        User user = User.authenticate(email, password, conn);

        if (user != null) {
            session.setAttribute("userId", user.getId());
            session.setAttribute("userEmail", user.getEmail());
            session.setAttribute("userRole", user.getRole());
            session.setMaxInactiveInterval(30 * 60); 

            if ("admin".equals(user.getRole())) {
                response.sendRedirect("admin/dashboard.jsp");
            } else if ("user".equals(user.getRole())) {
                response.sendRedirect("student/dashboard.jsp");
            }else if ("teacher".equals(user.getRole())) {
               response.sendRedirect("teacher/dashboard.jsp");
            }
        } else {
            response.sendRedirect("index.jsp?s=0");
        }
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("index.jsp?s=1");
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