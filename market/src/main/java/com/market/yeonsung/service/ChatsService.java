package com.market.yeonsung.service;

import com.market.yeonsung.dao.ChatsDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ChatsService {

    @Autowired
    private ChatsDAO chatsDAO;

    public void saveChatMessage(int itemId, String senderId, String receiverId, String message) {
        chatsDAO.insertChat(itemId, senderId, receiverId, message);
    }

    public List<Map<String, Object>> getChatMessages(int itemId) {
        return chatsDAO.fetchChatMessages(itemId);
    }
}