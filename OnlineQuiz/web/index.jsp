<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>QuizMaster - Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body, html {
            height: 100%;
        }
        .bg-image {
            background-image: url('https://source.unsplash.com/random/1200x900?quiz,learning');
            background-size: cover;
            background-position: center;
        }
        .bg-overlay {
            background-color: rgba(0, 0, 0, 0.6);
        }
        .login-container {
            max-width: 400px;
        }
        .btn-primary {
            background-color: #6c63ff;
            border-color: #6c63ff;
        }
        .btn-primary:hover {
            background-color: #5a52d5;
            border-color: #5a52d5;
        }
    </style>
</head>
<body>
    <div class="container-fluid h-100">
        <div class="row h-100">
            <div class="col-md-6 d-none d-md-flex bg-image">
                <div class="w-100 bg-overlay d-flex align-items-center justify-content-center text-white p-5">
                    <div>
                        <h1 class="display-4 fw-bold mb-4">QuizMaster</h1>
                        <p class="lead">Test your knowledge, challenge your mind, and learn something new every day!</p>
                    </div>
                </div>
            </div>
            <div class="col-md-6 d-flex align-items-center justify-content-center">
                <div class="login-container w-100 p-4">
                    <h2 class="text-center mb-4">Welcome Back</h2>
                    <%
                        String status = request.getParameter("s");
                        if (status != null) {
                            if (status.equals("1")) {
                                out.println("<div class='alert alert-danger'>Login failed. Please try again.</div>");
                            } else if (status.equals("3")) {
                                out.println("<div class='alert alert-warning'>All fields are required.</div>");
                            }
                        }
                    %>
                    <form action="loginProcess.jsp" method="post">
                        <div class="form-floating mb-3">
                            <input type="email" class="form-control" id="email" name="email" placeholder="name@example.com" required>
                            <label for="email">Email address</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="password" class="form-control" id="password" name="password" placeholder="Password" required>
                            <label for="password">Password</label>
                        </div>
                        <div class="d-grid">
                            <button class="btn btn-primary btn-lg" type="submit">Sign in</button>
                        </div>
                        <p class="mt-3 text-center">New to QuizMaster? <a href="signUp.jsp">Create an account</a></p>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>