package com.market.yeonsung.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class ChatsDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public void insertChat(int itemId, String senderId, String receiverId, String message) {
        String sql = "INSERT INTO Chats (item_id, sender_id, receiver_id, message) VALUES (?, ?, ?, ?)";
        jdbcTemplate.update(sql, itemId, senderId, receiverId, message);
    }

    public List<Map<String, Object>> fetchChatMessages(int itemId) {
        String sql = "SELECT sender_id, message, sent_at FROM Chats WHERE item_id = ? ORDER BY sent_at ASC";
        return jdbcTemplate.queryForList(sql, itemId);
    }
}