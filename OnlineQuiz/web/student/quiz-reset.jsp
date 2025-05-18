<%@ page session="true" %>
<%
    session.invalidate();
    response.sendRedirect("quiz-attempt.jsp");
%>
