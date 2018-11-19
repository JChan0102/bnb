package com.bit.bnb.report.contoller;

import com.bit.bnb.mypage.model.ReviewVO;
import com.bit.bnb.mypage.service.ReviewWriteService;
import com.bit.bnb.report.model.ReportVO;
import com.bit.bnb.report.service.ReportWriteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class reportWriteContoller {

    @Autowired
    private ReportWriteService service;

    @RequestMapping(value = "/reportWrite",method = RequestMethod.GET)
    public String reviewForm(@RequestParam("reservationNum") int reservationNum, Model model) {

        model.addAttribute("reservationNum", reservationNum);
        return "mypage/reportWriteForm";
    }

    @RequestMapping(value = "/reportWrite",method = RequestMethod.POST)
    @ResponseBody
    public void reviewInsert(ReportVO vo) {
        service.insertt(vo);
    }
    @RequestMapping(value = "/adminpage/report/nope", method = RequestMethod.GET)
    @ResponseBody
    public void nopeReport(ReportVO vo){
        vo.setReportCk("B");
    }
    @RequestMapping(value = "/adminpage/report/comfirm", method = RequestMethod.GET)
    @ResponseBody
    public void comfirmReport(ReportVO vo){
        vo.setReportCk("T");
    }
}
