package com.market.yeonsung;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.market.yeonsung.service.ItemsService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
    private ItemsService itemsService;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "loginpage";
	}
	
	
	/*
	 * 로그인 화면
	 */
	@RequestMapping("/login")
	public String login(Model model) {
		return "loginpage";
	}
	  
	
	/*
	 * 메인 화면
	 */
	@RequestMapping("/main")
	public String main(Model model) {
        List<Map<String, Object>> items = itemsService.getAllItems();
        model.addAttribute("items", items);
		return "mainpage";
	}
    // 상품 등록 폼 화면
    @RequestMapping("/add")
    public String showAddItemForm() {
        return "registration";
    }
    // 상품 상세 정보 화면
    @RequestMapping("/data")
    public String data(@RequestParam("item_id") int itemId, Model model) {
        model.addAttribute("item", itemsService.getItemById(itemId));
        return "data";
    }
    // 채팅 화면
    @RequestMapping("/chat")
    public String chat() {
        return "chat";
    }
	
}

