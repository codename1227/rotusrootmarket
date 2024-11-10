package com.market.yeonsung;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.market.yeonsung.dao.MessageDAO;

@Controller
public class MessageController {

    @Autowired
    private MessageDAO messageDAO;

    @PostMapping("/sendMessage")
    public String sendMessage(
            @RequestParam("sender_id") String senderId,
            @RequestParam("receiver_id") String receiverId,
            @RequestParam("content") String content) {
        
        // 메시지 저장
        messageDAO.saveMessage(senderId, receiverId, content);

        // 메시지 전송 후 메시지 목록 페이지로 리다이렉트
        return "redirect:/sendMessage?receiverId=" + receiverId;
    }
}