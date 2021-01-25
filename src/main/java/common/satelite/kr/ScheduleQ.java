package main.java.common.satelite.kr;

import javax.annotation.PostConstruct;

import org.mybatis.spring.SqlSessionTemplate;
import org.quartz.CronScheduleBuilder;
import org.quartz.JobBuilder;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.SchedulerFactory;
import org.quartz.Trigger;
import org.quartz.TriggerBuilder;
import org.quartz.impl.StdSchedulerFactory;
import org.springframework.stereotype.Component;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;


@Component
public class ScheduleQ {

    private SchedulerFactory schedulerFactory;
    private Scheduler scheduler;
    @Autowired
    SqlSessionTemplate sqlSession;

    public List<ScheduleVO> selectReserve(ScheduleVO param) {

        return sqlSession.selectList("selectReserve", param);
    }

 //   @PostConstruct
 //   public void start() throws SchedulerException {

  //     schedulerFactory = new StdSchedulerFactory();
   //     scheduler = schedulerFactory.getScheduler();
  //     scheduler.start();

      //  JobDetail job = JobBuilder.newJob(ScheduleJob.class).withIdentity("scJob").build();
       // Trigger trigger = TriggerBuilder.newTrigger().withSchedule(CronScheduleBuilder.cronSchedule("30 * * * * ?")).build();

        //Trigger trigger = TriggerBuilder.newTrigger().startAt(startDateTime).endAt(endDateTime)
        //        .withSchedule(CronScheduleBuilder.cronSchedule("*/1 * * * *")).build();

       // scheduler.scheduleJob(job, trigger);
   // }



    @Scheduled(cron = "0 */1 * * * *")
    public void cronTest1(){
        try { //일정시간이 되면 DAO를 통하여 DB에 쿼리문 조회
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
            System.out.println("Start Time >>> "+ currentDay + " " + currentTime + " "  + currentE);
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
                if (repeat.equals("N")){
                    sqlSession.update("updateUse", list.getSn());
                }
            }


            // } catch (Exception e){
            //      System.out.println(e.getMessage());
            //  }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
