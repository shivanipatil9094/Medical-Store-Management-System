package controller;

import Configuration.JDBCConnection;
import Model.MedicineM;
import Services.MedService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;

@WebServlet("/insertMedicine")
public class InsertMed extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Getting form parameters
        String medicineName = req.getParameter("medicineName");
        String batchNo = req.getParameter("batchNo");
        String mfgDateStr = req.getParameter("mfgDate");
        String expDateStr = req.getParameter("expDate");
        String quantityStr = req.getParameter("quantity");
        String supplierIdStr = req.getParameter("supplierId");
        String pricePerUnitStr = req.getParameter("pricePerUnit");
        String remark = req.getParameter("remark");

        // Convert values to correct types
        Date mfgDate = null;
        Date expDate = null;
        int quantity = 0;
        int supplierId = 0;
        double pricePerUnit = 0.0;

        try {
            if(mfgDateStr != null && !mfgDateStr.isEmpty())
                mfgDate = Date.valueOf(mfgDateStr);

            if(expDateStr != null && !expDateStr.isEmpty())
                expDate = Date.valueOf(expDateStr);

            if(quantityStr != null && !quantityStr.isEmpty())
                quantity = Integer.parseInt(quantityStr);

            if(supplierIdStr != null && !supplierIdStr.isEmpty())
                supplierId = Integer.parseInt(supplierIdStr);

            if(pricePerUnitStr != null && !pricePerUnitStr.isEmpty())
                pricePerUnit = Double.parseDouble(pricePerUnitStr);

        } catch (IllegalArgumentException e) {
            System.out.println("Invalid input: " + e.getMessage());
        }

        // Debugging output
        System.out.println(medicineName + " " + batchNo + " " + mfgDate + " " + expDate + " " +
                quantity + " " + supplierId + " " + pricePerUnit + " " + remark);

        // Create MedicineInventory object
        MedicineM medicine = new MedicineM();
        medicine.setMedicineName(medicineName);
        medicine.setBatchNo(batchNo);
        medicine.setMfgDate(mfgDate);
        medicine.setExpDate(expDate);
        medicine.setQuantity(quantity);
        medicine.setSupplierId(supplierId);
        medicine.setPricePerUnit(pricePerUnit);
        medicine.setRemark(remark);

        // Call Service
        MedService service = new MedService(JDBCConnection.getConnection());
        try {
            boolean inserted = service.insertMedicine(medicine);
            if (inserted) {
                System.out.println("Medicine Insert Successful");
                resp.sendRedirect("report.jsp");  // Redirect to medicine inventory page
            } else {
                System.out.println("Insert Failed");
                resp.sendRedirect("error.jsp");
            }
        } catch (SQLException ex) {
            throw new RuntimeException(ex);
        }
    }
}
