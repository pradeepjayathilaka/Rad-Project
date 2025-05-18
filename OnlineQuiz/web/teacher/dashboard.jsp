<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="classes.User" %>
<%@ page import="classes.DbConnector" %>
<%@ page import="java.sql.*" %>
<%@ page import="classes.Subject" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Teacher Dashboard - QuizMaster</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
        <style>
            .dashboard-card {
                transition: transform 0.3s;
            }
            .dashboard-card:hover {
                transform: translateY(-5px);
            }
        </style>
    </head>
    <body class="bg-light">
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
            <div class="container">
                <a class="navbar-brand" href="#">QuizMaster</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <a class="nav-link active" href="#">Dashboard</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="profile.jsp">Profile</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="logout.jsp">Logout</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="container mt-4">
            <div class="row">
                <div class="col-md-4 mb-4">
                    <div class="card dashboard-card">
                        <div class="card-body">
                            <h5 class="card-title"><i class="fas fa-clipboard-list"></i> Quizzes Created</h5>
                            <p class="card-text display-4">5</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-4">
                    <div class="card dashboard-card">
                        <div class="card-body">
                            <h5 class="card-title"><i class="fas fa-chart-line"></i> Average Score</h5>
                            <p class="card-text display-4">85%</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-4">
                    <div class="card dashboard-card">
                        <div class="card-body">
                            <h5 class="card-title"><i class="fas fa-users"></i> Total Students</h5>
                            <p class="card-text display-4">30</p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row mt-4">
                <div class="col-md-6 mb-4">
                    <div class="card dashboard-card">
                        <div class="card-body">
                            <h5 class="card-title">Recent Quizzes</h5>
                            <ul class="list-group">
                                <li class="list-group-item">Math Quiz - Average Score: 85%</li>
                                <li class="list-group-item">Science Quiz - Average Score: 90%</li>
                                <li class="list-group-item">History Quiz - Average Score: 78%</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 mb-4">
                    <div class="card dashboard-card">
                        <div class="card-body">
                            <h5 class="card-title">Manage Quizzes</h5>
                            <ul class="list-group">
                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                    Geography Quiz
                                    <a href="#" class="btn btn-primary btn-sm" onclick="openEditQuizModal(1, 'Geography Quiz', 'Description for Geography Quiz', 45)">Edit</a>
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                    Literature Quiz
                                    <a href="#" class="btn btn-primary btn-sm" onclick="openEditQuizModal(2, 'Literature Quiz', 'Description for Literature Quiz', 60)">Edit</a>
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                    Computer Science Quiz
                                    <a href="#" class="btn btn-primary btn-sm" onclick="openEditQuizModal(3, 'Computer Science Quiz', 'Description for Computer Science Quiz', 75)">Edit</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="row mt-4">
                <div class="col-md-12 mb-4">
                    <div class="card dashboard-card">
                        <div class="card-body">
                            <h5 class="card-title">Manage Subjects</h5>
                            <form method="post" action="add-subject.jsp">
                                <div class="mb-3">
                                    <input type="text" class="form-control" name="subjectName" placeholder="Subject Name" required>
                                </div>
                                <div class="mb-3">
                                    <input type="text" class="form-control" name="subjectDescription" placeholder="Description" required>
                                </div>
                                <div class="mb-3">
                                    <input type="number" class="form-control" name="duration" placeholder="Duration (in minutes)" required>
                                </div>
                                <button type="submit" class="btn btn-success">Add Subject</button>
                            </form>
                            <hr>
                            <h6>Available Subjects:</h6>
                            <ul class="list-group">
                                <%
                                    List<Subject> subjects = Subject.getAllSubjects();
                                    for (Subject subject : subjects) {
                                %>
                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                    <%= subject.getName()%>
                                    <div>
                                        <a href="#" class="btn btn-info btn-sm me-2" onclick="openEditSubjectModal(<%= subject.getId()%>, '<%= subject.getName()%>', '<%= subject.getDescription()%>', <%= subject.getDuration()%>)">Edit</a>
                                        <a href="add-quiz.jsp?id=<%= subject.getId()%>" class="btn btn-primary btn-sm">Add Quiz</a>
                                    </div>
                                </li>
                                <%
                                    }
                                %>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="editQuizModal" tabindex="-1" aria-labelledby="editQuizModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="editQuizModalLabel">Edit Quiz</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="editQuizForm" method="post" action="edit-quiz.jsp">
                            <input type="hidden" name="quizId" id="quizId">
                            <div class="mb-3">
                                <label for="quizName" class="form-label">Quiz Name</label>
                                <input type="text" class="form-control" id="quizName" name="quizName" required>
                            </div>
                            <div class="mb-3">
                                <label for="quizDescription" class="form-label">Description</label>
                                <textarea class="form-control" id="quizDescription" name="quizDescription" rows="3" required></textarea>
                            </div>
                            <div class="mb-3">
                                <label for="quizDuration" class="form-label">Duration (in minutes)</label>
                                <input type="number" class="form-control" id="quizDuration" name="quizDuration" required>
                            </div>
                            <button type="submit" class="btn btn-primary">Save Changes</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
 
        <div class="modal fade" id="editSubjectModal" tabindex="-1" aria-labelledby="editSubjectModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="editSubjectModalLabel">Edit Subject</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="editSubjectForm" method="post" action="edit-subject.jsp">
                            <input type="hidden" name="subjectId" id="subjectId">
                            <div class="mb-3">
                                <label for="subjectName" class="form-label">Subject Name</label>
                                <input type="text" class="form-control" id="subjectName" name="subjectName" required>
                            </div>
                            <div class="mb-3">
                                <label for="subjectDescription" class="form-label">Description</label>
                                <textarea class="form-control" id="subjectDescription" name="subjectDescription" rows="3" required></textarea>
                            </div>
                            <div class="mb-3">
                                <label for="subjectDuration" class="form-label">Duration (in minutes)</label>
                                <input type="number" class="form-control" id="subjectDuration" name="subjectDuration" required>
                            </div>
                            <button type="submit" class="btn btn-primary">Save Changes</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <script>
            function openEditSubjectModal(subjectId, subjectName, subjectDescription, subjectDuration) {
                document.getElementById('subjectId').value = subjectId;
                document.getElementById('subjectName').value = subjectName;
                document.getElementById('subjectDescription').value = subjectDescription;
                document.getElementById('subjectDuration').value = subjectDuration;
                var editSubjectModal = new bootstrap.Modal(document.getElementById('editSubjectModal'));
                editSubjectModal.show();
            }
        </script>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
