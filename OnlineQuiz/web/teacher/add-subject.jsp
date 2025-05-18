<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="classes.Subject" %>
<%@ page import="java.io.IOException" %>
<%@ page import="javax.servlet.ServletException" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="javax.servlet.http.HttpServletResponse" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
    
    if (request.getMethod().equalsIgnoreCase("POST")) {
        String subjectName = request.getParameter("subjectName");
        String subjectDescription = request.getParameter("subjectDescription");
        int duration;
        
        try {
            duration = Integer.parseInt(request.getParameter("duration"));
            
        
            Subject newSubject = new Subject(
            subjectName, subjectDescription, duration
            );
            newSubject.setName(subjectName);
            newSubject.setDescription(subjectDescription);
            newSubject.setDuration(duration);
            
        
            boolean isAdded = Subject.addSubject(newSubject);
            
            if (isAdded) {
                session.setAttribute("message", "Subject added successfully!");
            } else {
                session.setAttribute("message", "Failed to add subject. Please try again.");
            }
        } catch (NumberFormatException e) {
          
            session.setAttribute("message", "Invalid duration. Please enter a valid number.");
        }

        response.sendRedirect("dashboard.jsp");
    }
%>
