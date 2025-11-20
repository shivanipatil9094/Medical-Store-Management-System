package controller;

import Configuration.JDBCConnection;
import Model.SupplierM;
import Services.SupplierService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/update")
@MultipartConfig
public class update extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int supplierId = Integer.parseInt(request.getParameter("supplier_id"));
            String supplierName = request.getParameter("supplier_name");
            String category = request.getParameter("category");
            String price = request.getParameter("price");
            String availability = request.getParameter("availability");
            String image = request.getParameter("image");
            String contactNo = request.getParameter("contact_no");
            String address = request.getParameter("address");
            String medicineDescription = request.getParameter("medicine_description");
            String addedDate = request.getParameter("added_date");

            System.out.println(supplierName + " " + category + " " + price + " " + availability + " " +
                    image + " " + contactNo + " " + address + " " +
                    medicineDescription + " " + addedDate);

            SupplierM e= new SupplierM();
            e.setSupplierId(supplierId);
            e.setSupplierName(supplierName);
            e.setCategory(category);
            e.setPrice(Double.parseDouble(price));
            e.setAvailability(availability);
            e.setImage(image);
            e.setContactNo(contactNo);
            e.setAddress(address);
            e.setMedicineDescription(medicineDescription);
            e.setAddedDate(addedDate);


            SupplierService p2 = new SupplierService(JDBCConnection.getConnection());
            boolean b = p2.update(e);

            if (b) {
                System.out.println("Update successful!");
                response.sendRedirect("report.jsp");
            } else {
                System.out.println("Update failed!");
                response.sendRedirect("error.jsp");
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}
