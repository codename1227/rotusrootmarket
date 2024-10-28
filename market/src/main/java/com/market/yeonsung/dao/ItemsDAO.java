package com.market.yeonsung.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

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
}