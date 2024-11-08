package com.market.yeonsung.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

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
    
    public void addItem(String id, String title, String description, int price, String image) {
        itemsDAO.addItem(id, title, description, price, image);
    }
    
    public void updateItem(int itemId, String title, String description, int price, String image) {
        itemsDAO.updateItem(itemId, title, description, price, image);
    }
    
    public void deleteItem(int itemId) {
        itemsDAO.deleteItem(itemId);
    }
}