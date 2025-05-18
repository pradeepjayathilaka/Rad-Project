<%@ page import="classes.User"%>
<%@ page import="classes.DbConnector"%>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String teacherId = request.getParameter("teacherId");
    
    if (teacherId == null || teacherId.trim().isEmpty()) {
        response.sendRedirect("removeTeacher.jsp?s=3");
        return;
    }
    
    Connection conn = null;
    try {
        conn = DbConnector.getConnection();
        User teacher = new User();
        teacher.setId(Integer.parseInt(teacherId));
        
        int result = teacher.remove(conn);
        
        if (result > 0) {
            response.sendRedirect("removeTeacher.jsp?s=1"); 
        } else {
            response.sendRedirect("removeTeacher.jsp?s=0"); 
        }
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("removeTeacher.jsp?s=0"); 
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