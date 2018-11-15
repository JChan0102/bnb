package com.bit.bnb.hostpage.controller;

import com.bit.bnb.hostpage.service.EvaluationListService;
import com.bit.bnb.user.model.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class EvaluationListController {

    @Autowired
    private EvaluationListService listService;

    public List<List> getList(HttpSession session) {
        UserVO user = (UserVO) session.getAttribute("userLogin");

        List<List> list = new ArrayList<List>();

        list.add(listService.notEvaluationList(user.getUserId()));
        list.add(listService.EvaluationList(user.getUserId()));

        return list;
    }

}
