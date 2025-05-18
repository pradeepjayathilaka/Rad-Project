<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="classes.Question" %>
<%@ page import="javax.servlet.ServletException" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="javax.servlet.http.HttpServletResponse" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.io.IOException" %>

<%
    
  
    String questionIdStr = request.getParameter("id");
    if (questionIdStr != null) {
        int questionId = Integer.parseInt(questionIdStr);
        
      
        boolean isRemoved = Question.removeQuestion(questionId);
        
       
        if (isRemoved) {
            session.setAttribute("message", "Question removed successfully!");
        } else {
            session.setAttribute("message", "Failed to remove question. Please try again.");
        }
    } else {
        session.setAttribute("message", "Invalid question ID.");
    }

   
    response.sendRedirect("add-quiz.jsp");
%>
