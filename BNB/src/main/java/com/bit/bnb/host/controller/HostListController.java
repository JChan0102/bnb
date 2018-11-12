package com.bit.bnb.host.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bit.bnb.host.model.HostModel;
import com.bit.bnb.host.service.HostListService;

@Controller
public class HostListController {

	@Autowired
	private HostListService service;// List하는 서비스 주입
	
	@RequestMapping("/host")
	public String list(Model model) {//모델객체에 파라미터로 받음.
		
		List<HostModel> list = service.hostList();
		model.addAttribute("list",list);
		return "host/list";
	}
	
	

}


