package com.bit.bnb.mypage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bit.bnb.mypage.service.WishService;
import com.bit.bnb.user.model.UserVO;

@Controller
public class WishController {

	@Autowired
	private WishService service;

	@RequestMapping(value="/wishIn", method=RequestMethod.GET)
	@ResponseBody
	public Model wishInsert(HttpSession session, @RequestParam("roomsId") int roomsId, Model model) { // 좋아요클릭시 ajax처리를 위한 컨트롤러매핑

		System.out.println("즐겨찾기 컨트롤러진입");
		UserVO user = (UserVO) session.getAttribute("loginUser");
		if (service.wishSelect(user.getUserId(), roomsId).isEmpty()) { // 아이디랑 룸넘버가 즐겨찾기에 들어가있는게 없으면
			service.wishInput(user.getUserId(), roomsId); // 넣ㅇㅓ주고
			return model.addAttribute("in", 1);			
		} else {
			service.wishDelete(user.getUserId(), roomsId); // 있으면 삭제해주고 ! (즐겨찾기 해제)
			return model.addAttribute("out", 2);
		}
	}

	@RequestMapping("/wish")
	public ModelAndView wishMainList(HttpSession session, HttpServletRequest request) { // div나타내줄 쿼리문 뽑아옴ㅎ~~

		UserVO user = (UserVO) session.getAttribute("loginUser");
		String address = request.getParameter("address");

		System.out.println(address);

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("mypage/wishMain");
		modelAndView.addObject("wishDiv", service.wishDivList(user.getUserId()));
		modelAndView.addObject("wishCnt", service.wishDivCnt(user.getUserId(), address));

		return modelAndView;
	}

	@RequestMapping("/wishList")
	public ModelAndView wishList(@RequestParam("userId") String userId, @RequestParam("address") String address) {

		ModelAndView modelAndView = new ModelAndView();

		modelAndView.setViewName("mypage/wishList");
		modelAndView.addObject("wishList", service.wishList(userId, address));

		return modelAndView;
	}

}
