package com.bit.bnb.host.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bit.bnb.host.model.HostModel;
import com.bit.bnb.host.service.HostWriteService;

@Controller
@RequestMapping("/host/write")
public class HostWriteController {
	
	@Autowired
	private HostWriteService service; // write하는 서비스 주입
	
	@RequestMapping(method=RequestMethod.GET)//get방식으로 들어올때
	public String HostWrite() {
		
		return "host/write_view";
		
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView HostWrite(HostModel hostModel) {
		
		ModelAndView modelAndView = new ModelAndView(); //모델앤뷰생성=데이터를 전송할수있는 리턴타입
		service.hostWrite(hostModel);
		modelAndView.setViewName("redirect:/host/");//어떤페이지를 보여줄것인지.
		
		return modelAndView;
	}
	
}
