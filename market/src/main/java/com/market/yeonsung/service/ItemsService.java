package com.market.yeonsung.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.market.yeonsung.dao.ItemsDAO;

@Service
public class ItemsService {

    @Autowired
    private ItemsDAO itemsDAO;

    public Map<String, Object> getItemById(int itemId) {
        return itemsDAO.getItemById(itemId);
    }

    public List<Map<String, Object>> getAllItems() {
        return itemsDAO.getAllItems();
    }
}