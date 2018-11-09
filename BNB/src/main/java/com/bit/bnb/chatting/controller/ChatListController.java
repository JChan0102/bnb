package com.bit.bnb.chatting.controller;

import com.bit.bnb.chatting.service.MessageListService;
import com.bit.bnb.user.model.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
public class ChatListController {


    @Autowired
    MessageListService service;

    @RequestMapping(value = "/chat/list")
    public ModelAndView list(){
        ModelAndView modelAndView = new ModelAndView();

        return modelAndView;
    }


    @RequestMapping(value = "/chat/c")
    public String hhh(Model model, HttpSession session){
        UserVO userVO = new UserVO();
        userVO.setUserId("test1");
        session.setAttribute("login",userVO);
        model.addAttribute("sender","test1");

        model.addAttribute("TUTOR_USER_user_id","test2");
        model.addAttribute("user_id","test1");
        model.addAttribute("class_id",10);
        try {
         model.addAttribute("lists", service.listviewService("test1","test2","10"));
        } catch (Exception e) {
            e.printStackTrace();
        }


        return "chat/chat";
    }
    @RequestMapping(value = "/chat/d")
    public String hhhd(Model model, HttpSession session){
        UserVO userVO = new UserVO();
        userVO.setUserId("test2");
        session.setAttribute("login",userVO);
        model.addAttribute("sender","test2");

        model.addAttribute("TUTOR_USER_user_id","test2");
        model.addAttribute("user_id","test1");
        model.addAttribute("class_id",10);


        return "chat/chat";
    }
}
