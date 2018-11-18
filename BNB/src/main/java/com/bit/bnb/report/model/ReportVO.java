package com.bit.bnb.report.model;

public class ReportVO {
    private int reservationNum;
    private String reportContent;
    private String reportCk;
    private int totalCount;

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    public int getReservationNum() {
        return reservationNum;
    }

    public void setReservationNum(int reservationNum) {
        this.reservationNum = reservationNum;
    }

    public String getReportContent() {
        return reportContent;
    }

    public void setReportContent(String reportContent) {
        this.reportContent = reportContent;
    }

    public String getReportCk() {
        return reportCk;
    }

    public void setReportCk(String reportCk) {
        this.reportCk = reportCk;
    }

    @Override
    public String toString() {
        return "reportVO{" +
                "reservationNum=" + reservationNum +
                ", reportContent='" + reportContent + '\'' +
                ", reportCk='" + reportCk + '\'' +
                '}';
    }
}
