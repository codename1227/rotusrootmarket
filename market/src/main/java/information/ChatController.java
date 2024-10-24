package information;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ChatController {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/university";
    private static final String DB_USER = "aban";
    private static final String DB_PASSWORD = "1234";

    public void sendMessage(Chat chat) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            String sql = "INSERT INTO Chats (item_id, sender_id, receiver_id, message) VALUES (?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, chat.getItemId());
            pstmt.setInt(2, chat.getSenderId());
            pstmt.setInt(3, chat.getReceiverId());
            pstmt.setString(4, chat.getMessage());
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    public List<Chat> getChatsForItem(int itemId) {
        List<Chat> chatMessages = new ArrayList();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            String sql = "SELECT * FROM Chats WHERE item_id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, itemId);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Chat chatMessage = new Chat(
                        rs.getInt("item_id"),
                        rs.getInt("sender_id"),
                        rs.getInt("receiver_id"),
                        rs.getString("message")
                );
                chatMessage.setChatId(rs.getInt("chat_id"));
                chatMessage.setSentAt(rs.getTimestamp("sent_at"));
                chatMessages.add(chatMessage);
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
        return chatMessages;
    }
}