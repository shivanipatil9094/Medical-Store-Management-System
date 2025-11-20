package controller;

import Configuration.JDBCConnection;
import Model.CustM;
import Services.CustService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/updateCustomer")
@MultipartConfig
public class UpdateCust extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int customerId = Integer.parseInt(req.getParameter("CustomerID"));
            String customerName = req.getParameter("Name");
            String age = req.getParameter("Age");
            String gender = req.getParameter("Gender");
            String contactNo = req.getParameter("ContactNo");
            String address = req.getParameter("Address");
            String email = req.getParameter("Email");

            System.out.println(customerName + " " + age + " " + gender + " " + contactNo + " " + address + " " + email);

            CustM c = new CustM();
            c.setCustomerId(customerId);
            c.setCustomerName(customerName);
            c.setAge(Integer.parseInt(age));
            c.setGender(gender);
            c.setContact(contactNo);
            c.setAddress(address);
            c.setEmail(email);

            CustService custService = new CustService(JDBCConnection.getConnection());
            boolean b = custService.update(c);

            if (b) {
                System.out.println("Update successful!");
                resp.sendRedirect("CustTable.jsp");
            } else {
                System.out.println("Update failed!");
                resp.sendRedirect("error.jsp");
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}
