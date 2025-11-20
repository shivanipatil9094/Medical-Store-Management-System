<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Smart Mart</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #1e293b, #334155);
            overflow-x: hidden;
        }

        .card {
            border-radius: 12px;
            background: #f8fafc;
            box-shadow: 0 6px 16px rgba(0, 0, 0, 0.15);
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.25);
        }

        .btn-dark {
            background-color: #b89f5d;
            border-radius: 8px;
            border: none;
            color: #1f1f1f;
            font-weight: 600;
            transition: 0.3s ease;
        }

        .btn-dark:hover {
            background-color: #a38849;
            color: #fff;
            transform: translateY(-2px);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.25);
        }

        .text-muted {
            font-size: 0.9rem;
            color: #94a3b8;
        }
    </style>
</head>
<body class="d-flex align-items-center justify-content-center vh-100">

<div class="card shadow-lg p-4" style="max-width: 400px; width: 100%;">
    <h3 class="text-center mb-4">🔐 Login</h3>

    <!-- Login Form -->
    <form action="Login" method="post">
        <!-- Role Selection -->
        <div class="mb-3">
            <label for="role" class="form-label">Select Role</label>
            <select class="form-select" id="role" name="role" required>
                <option value="admin">Admin</option>
                <option value="staff">Staff</option>
            </select>
        </div>

        <!-- User ID -->
        <div class="mb-3">
            <label for="username" class="form-label">ID</label>
            <input type="text" class="form-control" id="username" name="username" placeholder="Enter ID" required>
        </div>

        <!-- Password -->
        <div class="mb-3">
            <label for="password" class="form-label">Password</label>
            <input type="password" class="form-control" id="password" name="password" placeholder="Enter Password" required>
        </div>

        <!-- Login Button -->
        <button type="submit" class="btn btn-dark w-100">Log in</button>
    </form>

    <!-- Error Message -->
    <%
        String error = (String) request.getAttribute("errorMessage");
        if (error != null) {
    %>
    <p class="text-danger text-center mt-3"><%= error %></p>
    <%
        }
    %>
</div>

</body>
</html>
