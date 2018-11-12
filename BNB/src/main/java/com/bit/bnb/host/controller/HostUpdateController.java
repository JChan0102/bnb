package com.bit.bnb.host.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bit.bnb.host.model.HostModel;
import com.bit.bnb.host.service.HostUpdateService;

@Controller
@RequestMapping("host/update")
public class HostUpdateController {

	@Autowired
	private HostUpdateService service;//수정서비스 주입
	
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView update(@RequestParam("bId")int bId) {
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("host/updateForm");
		
		modelAndView.addObject("updateBoard", service.updateLink(bId));
		return modelAndView;
		
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public String update2(HostModel updateModel) {
		
		service.updateLink2(updateModel);
		
		return "redirect:/host";
		
	}
	
}