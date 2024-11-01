package com.market.yeonsung.service;

import com.market.yeonsung.dao.ChatsDAO;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Map;

@Service
public class ChatsService {

    private final ChatsDAO chatsDAO;

    public ChatsService(ChatsDAO chatsDAO) {
        this.chatsDAO = chatsDAO;
    }

    public List<Map<String, Object>> getChatBetweenUsers(int senderId, int receiverId) {
        return chatsDAO.getChatBetweenUsers(senderId, receiverId);
    }
}