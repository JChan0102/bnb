package com.bit.bnb.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class mypageMainController {
	
	@RequestMapping("/mypage")
	public String Listview() {
		
		return "mypage/mypage";
	}

}
