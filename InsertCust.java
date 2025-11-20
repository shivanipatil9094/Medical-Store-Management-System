package controller;

import Configuration.JDBCConnection;
import Model.CustM;
import Services.CustService;
import Services.SupplierService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;


@WebServlet("/insertCustomer")

public class InsertCust extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        String customerName = req.getParameter("customerName");
        String age = req.getParameter("age");
        String gender = req.getParameter("gender");
        String contactNo = req.getParameter("contactNo");
        String address = req.getParameter("address");
        String email = req.getParameter("email");

        System.out.println(customerName + " " + age + " " + gender + " " + contactNo + " " + address + " " + email);
        CustM customer = new CustM();

        customer.setCustomerName(customerName);
        customer.setAge(Integer.parseInt(age));
        customer.setGender(gender);
        customer.setContact(contactNo);
        customer.setAddress(address);
        customer.setEmail(email);


        CustService service = new CustService(JDBCConnection.getConnection());
        try {
            boolean inserted = service.insertCustomer(customer);
            if (inserted) {
                System.out.println("Customer Insert Successful");
                resp.sendRedirect("CustTable.jsp");  // Redirect to supplier page
            } else {
                System.out.println("Insert Failed");
                resp.sendRedirect("error.jsp");
            }
        } catch (SQLException ex) {
            throw new RuntimeException(ex);
        }
    }

}
