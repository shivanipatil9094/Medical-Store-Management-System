package controller;
import Configuration.JDBCConnection;
import Services.SupplierService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
@WebServlet("/delete")
public class delete extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id=Integer.parseInt(req.getParameter("supplier_id"));
        System.out.println(id);

        try {
            SupplierService p=new SupplierService(JDBCConnection.getConnection());
            boolean b=p.deleteSupllier(id);
            if (b){
                resp.sendRedirect("report.jsp");
            }
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
