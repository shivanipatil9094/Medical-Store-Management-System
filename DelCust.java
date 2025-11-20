package controller;

import Configuration.JDBCConnection;
import Services.CustService;
import Services.SupplierService;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class DelCust extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("CustomerID"));
        System.out.println(id);

        try {
            CustService p = new CustService(JDBCConnection.getConnection());
            boolean b = p.deleteCustomer(id);
            if (b) {
                resp.sendRedirect("CustTable.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
