package com.market.yeonsung;

import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.market.yeonsung.dao.EmailRequestDto;
import com.market.yeonsung.service.ItemsService;
import com.market.yeonsung.service.MailSendService;

import lombok.RequiredArgsConstructor;

/**
 * Handles requests for the application home page.
 */
@RequiredArgsConstructor
@Controller
public class HomeController {
	
	@Autowired
	private MailSendService mailService;

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
	
	@ResponseBody
	@PostMapping(value = "/sendMail", consumes = MediaType.APPLICATION_JSON_VALUE)
    public String mailSend(@RequestBody EmailRequestDto emailDto){
        System.out.println("이메일 인증 요청이 들어옴");
        System.out.println("이메일 인증 이메일 :"+emailDto.getEmail());
        return mailService.joinEmail(emailDto.getEmail());
    }
    
    
	@PostMapping("/mailauthCheck")
	@ResponseBody // JSON 형식으로 응답하기 위해 추가
	public ResponseEntity<String> AuthCheck(@RequestBody EmailRequestDto emailCheckDto) {
	    Boolean checked = mailService.checkAuthNum(emailCheckDto.getEmail(), emailCheckDto.getAuthNum());

	    if (checked) {
	        return ResponseEntity.ok("인증 성공"); // 성공 메시지 반환
	    } else {
	        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("인증 번호가 올바르지 않습니다."); // 실패 메시지 반환
	    }
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
    
	@RequestMapping("/insert")
	public String insert(Model model) {
		return "insert";
	}	
	
}

