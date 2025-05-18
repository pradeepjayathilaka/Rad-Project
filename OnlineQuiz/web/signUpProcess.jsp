<%@page import="classes.User"%>
<%@page import="classes.DbConnector"%>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String firstName = request.getParameter("firstName");
    String lastName = request.getParameter("lastName");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String mobileNumber = request.getParameter("mobileNumber");
    
    if (firstName == null || lastName == null || email == null || password == null || mobileNumber == null ||
        firstName.trim().isEmpty() || lastName.trim().isEmpty() || email.trim().isEmpty() || 
        password.trim().isEmpty() || mobileNumber.trim().isEmpty()) {
        response.sendRedirect("signUp.jsp?s=3"); 
        return;
    }
    
    Connection conn = null;
    try {
        conn = DbConnector.getConnection();
        User user = new User(firstName + " " + lastName, email, password, mobileNumber);
        
        int result = user.register(conn);
        
        if (result > 0) {
            response.sendRedirect("signUp.jsp?s=1"); 
        } else if (result == -1) {
            response.sendRedirect("signUp.jsp?s=2");
        } else {
            response.sendRedirect("signUp.jsp?s=0"); 
        }
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("signUp.jsp?s=1"); 
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