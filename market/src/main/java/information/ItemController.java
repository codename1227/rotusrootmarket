package information;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ItemController {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/university";
    private static final String DB_USER = "aban";
    private static final String DB_PASSWORD = "1234";

    public List<Item> getAllItems() {
        List<Item> items = new ArrayList();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            pstmt = conn.prepareStatement("SELECT * FROM Items");
            rs = pstmt.executeQuery();

            while (rs.next()) {
                Item item = new Item(
                        rs.getInt("item_id"),
                        rs.getInt("user_id"),
                        rs.getString("title"),
                        rs.getString("description"),
                        rs.getInt("price")
                );
                items.add(item);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return items;
    }
}