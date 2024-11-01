package com.market.yeonsung;

import com.market.yeonsung.service.ChatsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.stereotype.Controller;

@Controller
public class ChatsController {

    @Autowired
    private ChatsService chatsService;

    @GetMapping("/chat")
    public String getChatBetweenUsers(@RequestParam("senderId") int senderId, 
                                      @RequestParam("receiverId") int receiverId, 
                                      Model model) {
        model.addAttribute("chats", chatsService.getChatBetweenUsers(senderId, receiverId));
        return "chat";
    }
}