package controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/Login")
public class Login extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Hardcoded Admin credentials
    private static final String ADMIN_USER = "pharma";
    private static final String ADMIN_PASS = "pharma@123";

    // Hardcoded Staff credentials
    private static final String STAFF_USER = "staff";
    private static final String STAFF_PASS = "staff@123";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String role = request.getParameter("role");       // role comes from dropdown
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        boolean isValid = false;

        if ("admin".equals(role)) {
            if (ADMIN_USER.equals(username) && ADMIN_PASS.equals(password)) {
                isValid = true;
                response.sendRedirect("index.jsp"); // redirect to admin dashboard
            }
        } else if ("staff".equals(role)) {
            if (STAFF_USER.equals(username) && STAFF_PASS.equals(password)) {
                isValid = true;
                response.sendRedirect("index2.jsp"); // redirect to staff dashboard
            }
        }

        // if invalid credentials → back to login page with error
        if (!isValid) {
            request.setAttribute("errorMessage", "❌ Invalid " + role + " ID or Password!");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        }
    }
}