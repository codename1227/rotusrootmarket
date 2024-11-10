package com.market.yeonsung.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MessageDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;
    
    public MessageDAO(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public void saveMessage(String senderId, String receiverId, String content) {
        String sql = "INSERT INTO message (sender_id, receiver_id, content) VALUES (?, ?, ?)";
        jdbcTemplate.update(sql, senderId, receiverId, content);
    }
    
    public List<Map<String, Object>> getMessageHistory(String senderId, String receiverId) {
        String sql = "SELECT msg_id, sender_id, receiver_id, content, timestamp FROM message " +
                     "WHERE (sender_id = ? AND receiver_id = ?) " +
                     "OR (sender_id = ? AND receiver_id = ?) " +
                     "ORDER BY timestamp";

        return jdbcTemplate.queryForList(sql, senderId, receiverId, receiverId, senderId);
    }
}