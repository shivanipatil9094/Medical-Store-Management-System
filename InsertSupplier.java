package controller;

import Configuration.JDBCConnection;
import Model.SupplierM;
import Services.SupplierService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/insertSupplier")
public class InsertSupplier extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Getting form parameters
        String supplierName = req.getParameter("supplierName");
        String category = req.getParameter("category");
        String priceStr = req.getParameter("price");
        String availability = req.getParameter("availability");
        String image = req.getParameter("image");
        String contactNo = req.getParameter("contactNo");
        String address = req.getParameter("address");
        String medicineDescription = req.getParameter("medicineDescription");

        double price = 0.0;
        try {
            if (priceStr != null && !priceStr.isEmpty()) {
                price = Double.parseDouble(priceStr);
            }
        } catch (NumberFormatException e) {
            System.out.println("Invalid price format: " + priceStr);
        }

        // Debugging output
        System.out.println(supplierName + " " + category + " " + price + " " + availability + " " +
                image + " " + contactNo + " " + address + " " + medicineDescription);

        // Create Supplier object
        SupplierM supplier = new SupplierM();
        supplier.setSupplierName(supplierName);
        supplier.setCategory(category);
        supplier.setPrice(price);
        supplier.setAvailability(availability);
        supplier.setImage(image);
        supplier.setContactNo(contactNo);
        supplier.setAddress(address);
        supplier.setMedicineDescription(medicineDescription);

        // Call Service
        SupplierService service = new SupplierService(JDBCConnection.getConnection());
        try {
            boolean inserted = service.insertSupplier(supplier);
            if (inserted) {
                System.out.println("Supplier Insert Successful");
                resp.sendRedirect("report.jsp");  // Redirect to supplier page
            } else {
                System.out.println("Insert Failed");
                resp.sendRedirect("error.jsp");
            }
        } catch (SQLException ex) {
            throw new RuntimeException(ex);
        }
    }
}
