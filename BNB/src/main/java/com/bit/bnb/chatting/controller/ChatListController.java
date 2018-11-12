package com.bit.bnb.chatting.controller;

import com.bit.bnb.chatting.model.ChatRoomVO;
import com.bit.bnb.chatting.service.MessageListService;
import com.bit.bnb.chatting.service.NewMessageCkServie;
import com.bit.bnb.user.model.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
public class ChatListController {


    @Autowired
    MessageListService service;
    @Autowired
    NewMessageCkServie newMessageCkServie;

    @RequestMapping(value = "/chat/list", method = RequestMethod.GET)
    public ModelAndView list(HttpSession session,ChatRoomVO roomVO){
        ModelAndView modelAndView = new ModelAndView();

        UserVO user = (UserVO) session.getAttribute("loginUser");

        if(user.getUserId().equals(roomVO.getUserId())){
            roomVO.setReceive("U");
        }else{
            roomVO.setReceive("H");
        }
        newMessageCkServie.getList(user.getUserId(),session);

        modelAndView.addObject("chatRoomList", service.chatAllList(user.getUserId()));
        modelAndView.setViewName("chat/list");
        modelAndView.addObject("sender",user.getUserId());
        modelAndView.addObject("chatroom",roomVO);
        try {
            modelAndView.addObject("lists", service.listviewService(roomVO));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return modelAndView;
    }
    @RequestMapping(value="/chat/list/ck", method = RequestMethod.GET)
    @ResponseBody
    public void update(HttpSession session,ChatRoomVO roomVO){

        UserVO user = (UserVO) session.getAttribute("loginUser");
        if(user.getUserId().equals(roomVO.getUserId())){
            roomVO.setReceive("U");
        }else{
            roomVO.setReceive("H");
        }
        service.readOk(roomVO);
    }

}
