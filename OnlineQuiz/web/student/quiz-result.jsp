<%@ page session="true" %>
<%@ page import="java.util.List" %>
<%@ page import="classes.Question" %>
<%
    
    List<String> userAnswers = (List<String>) session.getAttribute("userAnswers");
    List<Question> questionsList = (List<Question>) session.getAttribute("questionsList");
    int score = 0;

   
    if (userAnswers != null && questionsList != null) {
        int numberOfQuestions = Math.min(userAnswers.size(), questionsList.size());

        for (int i = 0; i < numberOfQuestions; i++) {
            if (userAnswers.get(i).equals(questionsList.get(i).getCorrectAnswer())) {
                score++;
            }
        }
    }
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Quiz Results</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            .result-container {
                margin: 20px 0px;
                padding: 20px;
                border: 1px solid #ddd;
                border-radius: 10px;
            }
            .score-circle {
                width: 80px;
                height: 80px;
                border-radius: 50%;
                border: 8px solid #2e4e3f;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 20px;
            }
        </style>
    </head>
    <body>
        
        <div class="container p-5">
            <div class="result-container">
                <div class="d-flex justify-content-between">
                    <div>
                        <h5>Quiz Complete</h5>
                        <p>View Your Results</p>
                    </div>
                    <div>
                        <div class="score-circle">
                            <span><%= score%></span>
                        </div>
                    </div>
                </div>
                <hr class="hr">
                <ul>
                    <% if (questionsList != null) { %>
                    <% for (int i = 0; i < questionsList.size(); i++) {%>
                    <li class="card p-3 my-3">
                        Question <%= i + 1%>:
                        <h5><%= questionsList.get(i).getQuestionText()%> </h5>
                        Your Answer: <%= (userAnswers.size() > i) ? userAnswers.get(i) : "Not Answered"%> <br>
                        Correct Answer: <%= questionsList.get(i).getCorrectAnswer()%>
                    </li>
                    <% } %>
                    <% }%>
                </ul>
            </div>

            <form method="post" action="quiz-reset.jsp">
                <button type="submit" class="btn btn-primary">Try Again</button>
            </form>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
