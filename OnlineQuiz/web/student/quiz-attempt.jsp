<%@ page session="true" %>
<%@ page import="classes.Question" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%
    
    int subjectId = request.getParameter("sid") != null ? Integer.parseInt(request.getParameter("sid")) : 1;
    boolean isnew = request.getParameter("isnew") != null ? request.getParameter("isnew").equals("y") : false;

   
    List<Question> questionsList = (List<Question>) session.getAttribute("questionsList");
    if (isnew || questionsList == null) {
        questionsList = Question.getQuestionsBySubject(subjectId);
        session.setAttribute("questionsList", questionsList);
    }

   
    Integer currentQuestionIndex = (Integer) session.getAttribute("currentQuestionIndex");
    if (currentQuestionIndex == null) {
        currentQuestionIndex = 0;
        session.setAttribute("currentQuestionIndex", currentQuestionIndex);
    }

  
    List<String> userAnswers = (List<String>) session.getAttribute("userAnswers");
    if (userAnswers == null) {
        userAnswers = new ArrayList<String>();
        session.setAttribute("userAnswers", userAnswers);
    }

   
    if (request.getParameter("next") != null) {
        String selectedOption = request.getParameter("option");
        userAnswers.add(selectedOption);

        currentQuestionIndex++;
        session.setAttribute("currentQuestionIndex", currentQuestionIndex);
    }

  
    Double quizDuration = (Double) session.getAttribute("quizDuration");
    if (quizDuration == null) {
        String durationParam = request.getParameter("duration");
        if (durationParam != null) {
            try {
                quizDuration = Double.parseDouble(durationParam) * 60.0; 
            } catch (NumberFormatException e) {
                quizDuration = 1800.0; 
            }
        } else {
            quizDuration = 1800.0; 
        }
        session.setAttribute("quizDuration", quizDuration);
    }

   
    int quizDurationInt = quizDuration.intValue();
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Quiz Interface</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            .question-container {
                margin: 20px 0px;
                padding: 20px;
                border: 1px solid #ddd;
                border-radius: 10px;
            }
            .option-btn {
                width: 100%;
                text-align: left;
                margin-bottom: 10px;
            }
            .submit-btn {
                background-color: #2e4e3f;
                color: #fff;
                border-radius: 10px;
                border: none;
                padding: 10px 30px;
                float: right;   
            }
            .primary-btn {
                background-color: #2e4e3f;
                color: #fff;
                border-radius: 10px;
                border: none;
                padding: 6px 30px;
            }
        </style>
        <script>
        let timeLeft = <%= quizDurationInt %>;

        function updateTimer() {
            const minutes = Math.floor(timeLeft / 60);
            const seconds = timeLeft % 60;
            document.getElementById('timer').textContent =
                    (minutes < 10 ? "0" : "") + minutes + ":" +
                    (seconds < 10 ? "0" : "") + seconds;

            if (timeLeft <= 0) {
                clearInterval(timerInterval);
                document.getElementById('endQuizForm').submit();
            }
            timeLeft--;
        }

        const timerInterval = setInterval(updateTimer, 1000);
        </script>
    </head>
    <body>
        
        <div class="container p-5">
            <div class="d-flex justify-content-between">
                <div>
                    Time remaining: <h3 id="timer">00:00</h3>
                </div>
                <div>
                    <form id="endQuizForm" method="post" action="quiz-result.jsp">
                        <button type="submit" name="submit" class="submit-btn">End Quiz</button>
                    </form>
                </div>
            </div>

            <div class="question-container">
                <% if (currentQuestionIndex < questionsList.size()) { %>
                <h5>Question <%= currentQuestionIndex + 1 %> of <%= questionsList.size() %></h5>
                <p><%= questionsList.get(currentQuestionIndex).getQuestionText() %></p>
                <form method="post" action="quiz-attempt.jsp">
                    <% String[] optionsForQuestion = questionsList.get(currentQuestionIndex).getOptions(); %>
                    <div class="row">
                        <% for (int i = 0; i < optionsForQuestion.length; i++) { %>
                        <div class="col-6 col-md-3">
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="option" id="option<%= i %>" value="<%= optionsForQuestion[i] %>" required>
                                <label class="form-check-label" for="option<%= i %>">
                                    <%= (char) ('A' + i) + ". " + optionsForQuestion[i] %>
                                </label>
                            </div>
                        </div>
                        <% } %>
                    </div>
                    <div class="d-flex justify-content-between mt-4">
                        <div>
                            <button type="submit" name="next" class="btn btn-primary primary-btn">Next</button>
                        </div>
                        <div>
                            <nav aria-label="Question Navigation">
                                <ul class="pagination justify-content-center">
                                    <% for (int i = 0; i < questionsList.size(); i++) { %>
                                    <li class="page-item <%= (i == currentQuestionIndex) ? "active" : "" %>">
                                        <a class="page-link" href="quiz-attempt.jsp?index=<%= i %>"><%= (i + 1) %></a>
                                    </li>
                                    <% } %>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </form>
                <% } else { %>
                <div class="d-flex justify-content-between">
                    <h5>Quiz Complete</h5>
                    <a href="quiz-result.jsp" class="btn btn-success">View Results</a>
                </div>
                <% } %>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
