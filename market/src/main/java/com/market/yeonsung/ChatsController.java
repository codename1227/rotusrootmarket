package com.market.yeonsung;

import com.market.yeonsung.service.ChatsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
public class ChatsController {

    @Autowired
    private ChatsService chatsService;

    @GetMapping("/chat")
    public String chatPage(HttpSession session, Model model) {
        String loggedInUser = (String) session.getAttribute("loggedInUser");

        if (loggedInUser == null) {
            return "redirect:/login";
        }

        model.addAttribute("loggedInUser", loggedInUser);
        return "chat";
    }

    @PostMapping("/sendMessage")
    @ResponseBody
    public String sendMessage(HttpSession session, @RequestParam("itemId") int itemId, 
                              @RequestParam("receiverId") String receiverId, @RequestParam("message") String message) {
        String senderId = (String) session.getAttribute("loggedInUser");
        chatsService.saveChatMessage(itemId, senderId, receiverId, message);
        return "success";
    }

    @GetMapping("/getMessages")
    @ResponseBody
    public List<Map<String, Object>> getMessages(@RequestParam("itemId") int itemId) {
        return chatsService.getChatMessages(itemId);
    }
}