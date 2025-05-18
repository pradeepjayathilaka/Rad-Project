<%@ page import="classes.Subject" %>
<%@ page import="java.sql.*" %>

<%
    int subjectId = Integer.parseInt(request.getParameter("subjectId"));
    String subjectName = request.getParameter("subjectName");
    String subjectDescription = request.getParameter("subjectDescription");
    int subjectDuration = Integer.parseInt(request.getParameter("subjectDuration"));

    Subject subject = new Subject(
            subjectName, subjectDescription, subjectDuration
    
    );
    subject.setId(subjectId);
    
   
    boolean updated = subject.update();
    
    if (updated) {
        response.sendRedirect("dashboard.jsp");
    } else {
        out.println("Failed to update subject");
    }
%>
