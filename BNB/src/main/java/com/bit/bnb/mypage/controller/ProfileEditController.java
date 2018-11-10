package com.bit.bnb.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProfileEditController {
	
	@RequestMapping("/profileEdit")
	public String profileEditForm() {
		
		return "mypage/MemberEditForm";
	}

}
