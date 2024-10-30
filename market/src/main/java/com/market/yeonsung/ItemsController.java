package com.market.yeonsung;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.market.yeonsung.service.ItemsService;

@Controller
@RequestMapping("/items")
public class ItemsController {

    @Autowired
    private ItemsService itemsService;

    // 상품 등록 처리
    @PostMapping("/add")
    public String addItem(@RequestParam("title") String title,
                          @RequestParam("description") String description,
                          @RequestParam("price") int price,
                          @RequestParam("image") String image,
                          Model model) {
        // 입력값 유효성 검증 및 서비스 호출
        if (title == null || title.isEmpty()) {
            model.addAttribute("error", "Title cannot be empty");
            return "registration";
        }
        if (price <= 0) {
            model.addAttribute("error", "Price must be greater than 0");
            return "registration";
        }
        
        itemsService.addItem(title, description, price, image);
        return "redirect:/main";
    }
    

}
