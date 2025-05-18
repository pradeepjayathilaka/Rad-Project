<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="classes.Question" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.util.List" %>
<%@ page import="javax.servlet.ServletException" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="javax.servlet.http.HttpServletResponse" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="classes.DbConnector" %>
<%@ page import="java.sql.*" %>

<%
  
    String subjectIdParam = request.getParameter("id");
    int subjectId = Integer.parseInt(subjectIdParam); 


    List<Question> quizzes = Question.getQuestionsBySubject(subjectId);

   
    if (request.getMethod().equalsIgnoreCase("POST")) {
        String questionText = request.getParameter("questionText");
        String option1 = request.getParameter("option1");
        String option2 = request.getParameter("option2");
        String option3 = request.getParameter("option3");
        String option4 = request.getParameter("option4");
        String correctAnswer = request.getParameter("correctAnswer");

       
        String[] options = {option1, option2, option3, option4};
        Question newQuestion = new Question(0, questionText, options, correctAnswer, subjectId);

    
        boolean isAdded = Question.addQuestion(newQuestion);

        if (isAdded) {
            session.setAttribute("message", "Question added successfully!");
        } else {
            session.setAttribute("message", "Failed to add question. Please try again.");
        }

   
        response.sendRedirect("dashboard.jsp?subjectId=" + subjectId);
    }
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Teacher Dashboard</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    </head>
    <body>
        <div class="container mt-5">
            <h2>Teacher Dashboard - Subject ID: <%= subjectId%></h2>

       
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addQuestionModal">
                Add Question
            </button>

    
            <div class="modal fade" id="addQuestionModal" tabindex="-1" aria-labelledby="addQuestionModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="addQuestionModalLabel">Add Question</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form method="post" action="">
                                <input type="hidden" name="subjectId" value="<%= subjectId%>">
                                <div class="mb-3">
                                    <label for="questionText" class="form-label">Question Text</label>
                                    <textarea class="form-control" id="questionText" name="questionText" rows="3" required></textarea>
                                </div>
                                <div class="mb-3">
                                    <label for="option1" class="form-label">Option 1</label>
                                    <input type="text" class="form-control" id="option1" name="option1" required>
                                </div>
                                <div class="mb-3">
                                    <label for="option2" class="form-label">Option 2</label>
                                    <input type="text" class="form-control" id="option2" name="option2" required>
                                </div>
                                <div class="mb-3">
                                    <label for="option3" class="form-label">Option 3</label>
                                    <input type="text" class="form-control" id="option3" name="option3" required>
                                </div>
                                <div class="mb-3">
                                    <label for="option4" class="form-label">Option 4</label>
                                    <input type="text" class="form-control" id="option4" name="option4" required>
                                </div>
                                <div class="mb-3">
                                    <label for="correctAnswer" class="form-label">Correct Answer</label>
                                    <input type="text" class="form-control" id="correctAnswer" name="correctAnswer" required>
                                </div>
                                <button type="submit" class="btn btn-primary">Add Question</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

      
            <h3 class="mt-5">Available Quizzes</h3>
            <ul class="list-group">
                <% for (Question quiz : quizzes) {%>
                <li class="list-group-item d-flex justify-content-between align-items-center mb-3   ">
                    <div>
                        <strong>Question:</strong> <%= quiz.getQuestionText()%> <br>
                        <strong>Options:</strong>
                        <ul>
                            <li>1. <%= quiz.getOptions()[0]%></li>
                            <li>2. <%= quiz.getOptions()[1]%></li>
                            <li>3. <%= quiz.getOptions()[2]%></li>
                            <li>4. <%= quiz.getOptions()[3]%></li>
                        </ul>
                        <strong>Correct Answer:</strong> <%= quiz.getCorrectAnswer()%>
                    </div>
                    <div>
                        <a href="removeQuestion.jsp?id=<%= quiz.getId()%>" class="btn btn-danger btn-sm" title="Remove">
                            <i class="fas fa-trash-alt"></i> Remove
                        </a>
                    </div>
                </li>
                <% }%>
            </ul>

            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        </div>
    </body>
</html>
