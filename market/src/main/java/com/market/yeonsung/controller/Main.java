package com.market.yeonsung.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

public class Main {


@Controller
public class MainController {
	
	
	@RequestMapping("/test")
	public String test(Model model) {
		return "test";
	}
}
}
