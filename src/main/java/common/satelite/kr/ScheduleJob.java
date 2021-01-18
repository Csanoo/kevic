package main.java.common.satelite.kr;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;


import java.util.Calendar;
import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;

import main.java.common.satelite.kr.SearchYtb;
import main.java.common.satelite.kr.Crawler;
import org.springframework.stereotype.Controller;


public class ScheduleJob implements Job {


    public void execute(JobExecutionContext context) throws JobExecutionException {

        Date date = new Date();
        SimpleDateFormat dateDD = new SimpleDateFormat("d");
        SimpleDateFormat dateHH = new SimpleDateFormat("H");
        SimpleDateFormat dateE = new SimpleDateFormat("E");
        String currentDay = dateDD.format(date);
        Integer currentTime = Integer.parseInt(dateHH.format(date));

        Calendar oCalendar = Calendar.getInstance( );

        String currentE = String.valueOf(oCalendar.get(Calendar.DAY_OF_WEEK));


        /*
         *         execute() method 에 로직 추가
         */
        System.out.println("========= execute() method Start !!! =========");
        System.out.println("Start Time >>> "+ currentDay + " " + currentE + " "  + currentTime);
        //try {
            ScheduleVO scheduleVO = new ScheduleVO();
            scheduleVO.setDay(currentE);
            scheduleVO.setTime(currentTime);
            List<ScheduleVO> listview = selectReserve(scheduleVO);
            String snsType = "";
            String title = "";
            String stype = "";
            Integer CountCt = 0;
            String USERID = "reserve";
            String sdate = "";
            String edate = "";
            String repeat = "";
            SearchYtb searchYtb = new SearchYtb();
            Crawler crawler = new Crawler();

            for (ScheduleVO list : listview) {
                snsType = list.getCtSource();
                title = list.getKeyword();
                CountCt = list.getSearchNum();
                repeat = list.getRepeat();
                if (snsType.equals("ytb")) {
                    try {
                        //srch.execute(title);
                        searchYtb.execute(title, stype, CountCt, USERID, sdate, edate);
                    } catch (Exception e) {
                        System.out.println(e.getMessage());
                    }
                } else if (snsType.equals("twi")) {
                    try {
                        crawler.searchTwit(title, stype, CountCt, USERID, sdate, edate);
                    } catch (Exception e) {
                        System.out.println(e.getMessage());
                    }
                }

            }
       // } catch (Exception e){
      //      System.out.println(e.getMessage());
      //  }
    }
    @Autowired
    SqlSessionTemplate sqlSession;
    public List<ScheduleVO> selectReserve(ScheduleVO param) {

        return sqlSession.selectList("selectReserve", param);
    }

}
