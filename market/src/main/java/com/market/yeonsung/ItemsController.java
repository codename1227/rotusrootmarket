package com.market.yeonsung;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;

import com.market.yeonsung.service.ItemsService;

@Controller
@RequestMapping("/items")
public class ItemsController {

    @Autowired
    private ItemsService itemsService;

    // 상품 등록 처리
    @PostMapping("/add")
    public String addItem(HttpSession session,
                          @RequestParam("title") String title,
                          @RequestParam("description") String description,
                          @RequestParam("price") int price,
                          @RequestParam("image") MultipartFile image, // MultipartFile로 수정
                          Model model) {
        
        // 세션에서 사용자 ID 가져오기
        String id = (String) session.getAttribute("loggedInUser");
        
        // 입력값 유효성 검증
        if (id == null || id.isEmpty()) {
            model.addAttribute("error", "You must be logged in to add items.");
            return "registration";
        }
        if (title == null || title.isEmpty()) {
            model.addAttribute("error", "Title cannot be empty");
            return "registration";
        }
        if (price <= 0) {
            model.addAttribute("error", "Price must be greater than 0");
            return "registration";
        }
        
        // 이미지 파일이 업로드되었는지 확인 및 처리
        String imageName = null;
        if (image != null && !image.isEmpty()) {
            try {
                // 실제 실행 경로에 저장
                imageName = image.getOriginalFilename();
                String uploadDir = session.getServletContext().getRealPath("/resources/images/");
                Path uploadPath = Paths.get(uploadDir + imageName);
                
                // 디렉토리가 존재하지 않으면 생성
                Files.createDirectories(uploadPath.getParent());
                
                // 파일 저장
                Files.write(uploadPath, image.getBytes());
                
            } catch (Exception e) {
                model.addAttribute("error", "Failed to upload image.");
                return "registration";
            }
        }
        
        // 상품 등록 처리
        itemsService.addItem(id, title, description, price, imageName);
        return "redirect:/main";
    }
    
    @PostMapping("/edit")
    public String editItem(@RequestParam("itemId") int itemId,
                           @RequestParam("title") String title,
                           @RequestParam("description") String description,
                           @RequestParam("price") int price,
                           @RequestParam("image") MultipartFile image,
                           HttpSession session,
                           Model model) {
        // 로그인 여부 확인
        String id = (String) session.getAttribute("loggedInUser");
        if (id == null) {
            model.addAttribute("error", "You must be logged in to edit items.");
            return "login"; // 로그인 페이지로 리다이렉트
        }
        
        // 이미지 파일 처리
        String imageName = null;
        if (image != null && !image.isEmpty()) {
            try {
                imageName = image.getOriginalFilename();
                String uploadDir = session.getServletContext().getRealPath("/resources/images/");
                Path uploadPath = Paths.get(uploadDir + imageName);
                Files.createDirectories(uploadPath.getParent());
                Files.write(uploadPath, image.getBytes());
            } catch (Exception e) {
                model.addAttribute("error", "Failed to upload image.");
                return "edit"; // 오류 시 수정 페이지로
            }
        }
        
        // 아이템 업데이트 처리
        itemsService.updateItem(itemId, title, description, price, imageName);
        return "redirect:/data?item_id=" + itemId; // 업데이트 후 상세 페이지로 리다이렉트
    }
}