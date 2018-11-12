package com.bit.bnb.host.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bit.bnb.host.model.HostModel;
import com.bit.bnb.host.service.HostViewLinkService;

@Controller
public class HostViewLinkController {
	
	@Autowired
	private HostViewLinkService service;//hostViewLink 서비스 주압
	
	@RequestMapping("/host/viewLink")
	public ModelAndView ViewLink(@RequestParam("bId")int bId) {
		
		ModelAndView modelAndView = new ModelAndView();//새로운 modelandview생성.
		
		HostModel hostModel = service.hostList(bId);
		modelAndView.addObject("viewLink", hostModel);//MODEL객체에 데이터를 담음.
		modelAndView.setViewName("host/content_view");//SET을 이용해서 VIEW이름 입력.
		return modelAndView;//객체리턴
	}
	
}
