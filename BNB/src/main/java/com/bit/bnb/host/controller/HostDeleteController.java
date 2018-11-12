package com.bit.bnb.host.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bit.bnb.host.service.HostDeleteService;

@Controller
public class HostDeleteController {

	@Autowired
	private HostDeleteService service;  // delete하는 서비스 주입
	
	@RequestMapping("/host/delete")
	public String HostDelete(@RequestParam("bId")int bId) {
		
		service.deleteLink(bId);//서비스 참조변수명.서비스명메서드
		
		return "redirect:/host";//삭제하고 보여줄 뷰경로
	
	}	
}
