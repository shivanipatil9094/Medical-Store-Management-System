package Services;

import Model.CustM;
import Model.SupplierM;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustService {
    private Connection conn;
    public CustService(Connection conn) {
        this.conn = conn;
    }

    public boolean insertCustomer(CustM customer) throws SQLException {
        String sql = "INSERT INTO customer (Name,  Age,  Gender, ContactNo,Address, Email) " +
                "VALUES (?, ?, ?, ?, ?, ?)";
        PreparedStatement ps = conn.prepareStatement(sql);

        ps.setString(1, customer.getCustomerName());
        ps.setInt(2, customer.getAge());
        ps.setString(3, customer.getGender());
        ps.setString(4, customer.getContact());
        ps.setString(5, customer.getAddress());
        ps.setString(6, customer.getEmail());



        int rows = ps.executeUpdate();
        return rows > 0;
    }


    public List<CustM> allCustomer() throws SQLException {
        ArrayList<CustM> al = new ArrayList<>();
        CustM cm = null;
        PreparedStatement ps = conn.prepareStatement("SELECT * FROM Customer");
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            cm = new CustM();
            cm.setCustomerId(rs.getInt(1));
            cm.setCustomerName(rs.getString(2));
            cm.setAge(rs.getInt(3));
            cm.setGender(rs.getString(4));
            cm.setContact(rs.getString(5));
            cm.setAddress(rs.getString(6));
            cm.setEmail(rs.getString(7));


            al.add(cm);
        }
        return al;
    }


    public List<CustM> checkid(int  CustomerID) {
        List<CustM> list = new ArrayList<>();
        try {
            String query = "SELECT * FROM Customer WHERE CustomerID=?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, CustomerID);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                CustM s = new CustM();
                s.setCustomerId(rs.getInt("Customer_id"));
                s.setCustomerName(rs.getString("customer_name"));


                s.setAge(rs.getInt("age"));
                s.setContact(rs.getString("contact_no"));
                s.setGender(rs.getString("Gender"));
                s.setAddress(rs.getString("address"));
                s.setEmail(rs.getString("email"));
                list.add(s);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean deleteCustomer(int CustomerID) throws SQLException {
        boolean b = false;
        PreparedStatement ps = conn.prepareStatement("delete from Customer where CustomerID=?");
        ps.setInt(1, CustomerID);
        int i = ps.executeUpdate();
        if (i == 1) {
            b = true;
        }
        return b;
    }

    public boolean update(CustM e) throws SQLException{

        boolean b=false;
        PreparedStatement ps = conn.prepareStatement("update Customer set  Name=?, Age=?,Gender=?,ContactNo=?,Address=?,Email =?,added_date=? where CustomerID=?");

        ps.setInt(1,e.getCustomerId());
        ps.setString(2,e.getCustomerName());
        ps.setInt(3,e.getAge());

        ps.setString(4,e.getGender());
        ps.setString(5,e.getContact());

        ps.setString(6,e.getAddress());

        ps.executeUpdate();
        int i =ps.executeUpdate();
        if(i==1){
            b=true;
            System.out.println("Update Table successfully");
        }
        return b;
    }


}
