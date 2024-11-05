package com.market.yeonsung.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

@Repository
public class ItemsDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public Map<String, Object> getItemById(int itemId) {
        String sql = "SELECT * FROM Items WHERE item_id = ?";
        return jdbcTemplate.queryForMap(sql, itemId);
    }

    public List<Map<String, Object>> getAllItems() {
        String sql = "SELECT * FROM Items";
        return jdbcTemplate.queryForList(sql);
    }
    
    public void addItem(String id, String title, String description, int price, String image) {
        String sql = "INSERT INTO Items (id, title, description, price, image) VALUES (?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql, id, title, description, price, image);
    }
}