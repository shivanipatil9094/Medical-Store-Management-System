package Services;

import Model.MedicineM;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MedService {

    private Connection conn;

    public MedService(Connection conn) {
        this.conn = conn;
    }

    public boolean insertMedicine(MedicineM medicine) throws SQLException {
        String sql = "INSERT INTO medicine_inventory(medicine_name, batch_no, mfg_date, exp_date, quantity, supplier_id, price_per_unit, remark) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, medicine.getMedicineName());
        ps.setString(2, medicine.getBatchNo());
        ps.setDate(3, medicine.getMfgDate());
        ps.setDate(4, medicine.getExpDate());
        ps.setInt(5, medicine.getQuantity());
        ps.setInt(6, medicine.getSupplierId());
        ps.setDouble(7, medicine.getPricePerUnit());
        ps.setString(8, medicine.getRemark());

        int rows = ps.executeUpdate();
        return rows > 0;
    }
    public List<MedicineM> allMedicines() throws SQLException {
        ArrayList<MedicineM> list = new ArrayList<>();
        MedicineM mi = null;

        String sql = "SELECT * FROM medicine_inventory";
        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();

        while(rs.next()) {
            mi = new MedicineM();
            mi.setMedicineId(rs.getInt("medicine_id"));
            mi.setMedicineName(rs.getString("medicine_name"));
            mi.setBatchNo(rs.getString("batch_no"));
            mi.setMfgDate(rs.getDate("mfg_date"));
            mi.setExpDate(rs.getDate("exp_date"));
            mi.setQuantity(rs.getInt("quantity"));
            mi.setSupplierId(rs.getInt("supplier_id"));
            mi.setPricePerUnit(rs.getDouble("price_per_unit"));
            mi.setRemark(rs.getString("remark"));
            mi.setAddedDate(rs.getString("added_date"));

            list.add(mi);
        }

        return list;
    }


}
