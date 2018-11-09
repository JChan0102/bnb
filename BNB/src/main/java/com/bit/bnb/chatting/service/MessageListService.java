package com.bit.bnb.chatting.service;


import com.bit.bnb.chatting.dao.ChatDAO;
import com.bit.bnb.chatting.model.MessageVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MessageListService {

    @Autowired
    ChatDAO dao;

    public List<MessageVO> listviewService(String userId, String hostId, String roomId) throws Exception {


        List<MessageVO> list = dao.getMessageList("4");
       return list;

    }

}
