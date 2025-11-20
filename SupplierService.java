package Services;

import Model.SupplierM;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SupplierService {
    private Connection conn;

    public SupplierService(Connection conn) {
        this.conn = conn;
    }

    public boolean insertSupplier(SupplierM supplier) throws SQLException {
        String sql = "INSERT INTO suppliers (supplier_name, category, price, availability, image, contact_no, address, medicine_description) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, supplier.getSupplierName());
        ps.setString(2, supplier.getCategory());
        ps.setDouble(3, supplier.getPrice());
        ps.setString(4, supplier.getAvailability());
        ps.setString(5, supplier.getImage());
        ps.setString(6, supplier.getContactNo());
        ps.setString(7, supplier.getAddress());
        ps.setString(8, supplier.getMedicineDescription());

        int rows = ps.executeUpdate();
        return rows > 0;
    }

    public List<SupplierM> allSupplier() throws SQLException {
        ArrayList<SupplierM> al=new ArrayList<>();
        SupplierM sm= null;
        PreparedStatement ps = conn.prepareStatement("select * from suppliers");
        ResultSet rs = ps.executeQuery();
        while(rs.next()){
            sm=new SupplierM();
            sm.setSupplierId(rs.getInt(1));
            sm.setSupplierName(rs.getString(2));
            sm.setCategory(rs.getString(3));
            sm.setPrice(rs.getDouble(4));
            sm.setAvailability(rs.getString(5));
            sm.setImage(rs.getString(6));
            sm.setContactNo(rs.getString(7));
            sm.setAddress(rs.getString(8));
            sm.setMedicineDescription(rs.getString(9));
            sm.setAddedDate(rs.getString(10));
            
            al.add(sm);


        }
        return al;


    }

    public List<SupplierM> checkid(int supplier_id) {
        List<SupplierM> list = new ArrayList<>();
        try {
            String query = "SELECT * FROM suppliers WHERE supplier_id=?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, supplier_id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                SupplierM s = new SupplierM();
                s.setSupplierId(rs.getInt("supplier_id"));
                s.setSupplierName(rs.getString("supplier_name"));
                s.setCategory(rs.getString("category"));
                s.setPrice(rs.getDouble("price"));
                s.setAvailability(rs.getString("availability"));
                s.setContactNo(rs.getString("contact_no"));
                s.setImage(rs.getString("image"));
                s.setAddress(rs.getString("address"));
                s.setMedicineDescription(rs.getString("medicine_description"));
                s.setAddedDate(rs.getString("added_date"));

                list.add(s);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }


    public boolean deleteSupllier(int supplier_id) throws SQLException {
        boolean b = false;
        PreparedStatement ps = conn.prepareStatement("delete from suppliers where supplier_id=?");
        ps.setInt(1, supplier_id);
        int i = ps.executeUpdate();
        if (i == 1) {
            b = true;
        }
        return b;
    }

    public boolean update(SupplierM e) throws SQLException{

            boolean b=false;
            PreparedStatement ps = conn.prepareStatement("update suppliers set supplier_name=?, category=?,price=?,availability=?,image=?,contact_no =?,address=?, medicine_description=?,added_date=? where supplier_id=?");

           ps.setInt(1,e.getSupplierId());
            ps.setString(2,e.getSupplierName());
            ps.setString(3,e.getCategory());
            ps.setDouble(4,e.getPrice());
            ps.setString(5,e.getAvailability());
            ps.setString(6,e.getImage());
            ps.setString(7,e.getContactNo());
            ps.setString(8,e.getAddress());
            ps.setString(9,e.getMedicineDescription());
            ps.setString(10,e.getAddedDate());
            ps.executeUpdate();
            int i =ps.executeUpdate();
            if(i==1){
                b=true;
                System.out.println("Update Table successfully");
            }
            return b;
        }
    }

