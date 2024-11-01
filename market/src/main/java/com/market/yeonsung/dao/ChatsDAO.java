package com.market.yeonsung.dao;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Map;

@Repository
public class ChatsDAO {

    private final JdbcTemplate jdbcTemplate;

    public ChatsDAO(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public List<Map<String, Object>> getChatBetweenUsers(int senderId, int receiverId) {
        String sql = "SELECT * FROM Chats " +
                     "WHERE (sender_id = ? AND receiver_id = ?) " +
                     "OR (sender_id = ? AND receiver_id = ?) " +
                     "ORDER BY sent_at";
        return jdbcTemplate.queryForList(sql, senderId, receiverId, receiverId, senderId);
    }
}