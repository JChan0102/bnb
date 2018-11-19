package com.bit.bnb.report.service;

import com.bit.bnb.report.dao.ReportDao;
import com.bit.bnb.report.model.ReportVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReportWriteService {

    @Autowired
    private ReportDao dao;

    public void insertt(ReportVO vo) {

        dao.insert(vo);
    }

    public void ckupdate(ReportVO vo) {
        dao.ckupdate(vo);
    }
}
