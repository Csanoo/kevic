package main.java.common.satelite.kr;

import javax.annotation.PostConstruct;
import javax.sql.DataSource;
import java.sql.DriverManager;

import com.rometools.rome.feed.synd.SyndEntry;
import com.rometools.rome.feed.synd.SyndFeed;
import com.rometools.rome.io.FeedException;
import com.rometools.rome.io.SyndFeedInput;
import com.rometools.rome.io.XmlReader;
import main.java.admin.satelite.kr.RssVO;
import main.java.admin.satelite.kr.ContentsSvc;
import main.java.admin.satelite.kr.ContentsVO;
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

import java.io.IOException;
import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;
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


    public List<RssVO> selectRssFeedSave()  {
        // System.out.println(sqlSession.selectList("selectRssFeedSave"));
        return sqlSession.selectList("selectRss");
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



    @Scheduled(cron = "0 0 */1 * * *")
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
            String USERID = "";
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
                USERID = list.getRegUser();
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
            System.out.println(e.getMessage());
        }
    }

    private Connection con = null;
    private DataSource ds = null;
    private Statement stmt = null;
    private PreparedStatement psmt = null;

    @Scheduled(cron = "0 0 */1 * * *")
    public void SchduleRss(){
        String videoUrl;
        String qry;
        String title;
        String txt;
        Connection con = null;
        PreparedStatement pstmt = null;
        try {
            con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/motiva?serverTimezone=UTC", "root", "1024Csw!@");

            List<RssVO> listview = selectRssFeedSave();
            for (RssVO list : listview) {
                String rssUrl = list.getUrl();
                if (rssUrl.indexOf("http") < 0) {
                    rssUrl = "http://" + rssUrl;
                }
                SyndFeedInput input = new SyndFeedInput();
                SyndFeed feed = null;
                try {
                    URL feedURL = new URL(rssUrl);
                    feed = input.build(new XmlReader(feedURL));
                    for (int i = 0; i < feed.getEntries().size(); i++) {
                        SyndEntry entry = (SyndEntry) feed.getEntries().get(i);
                        System.out.println(entry.getTitle());
                        System.out.println(entry.getAuthor());
                        System.out.println(entry.getDescription().getValue());
                        System.out.println(entry.getLink());
                        videoUrl = entry.getLink();
                        title = entry.getTitle().replaceAll("'","''");;
                        txt = entry.getDescription().getValue().replaceAll("'","''");;
                        qry = "insert into tbl_contents (project, category01, category02, type, imageUrl, videoUrl, ctSource, title, sText ,state, keyword, userid)"
                                + "select  0, 0, 0, 'EV' , '','" + videoUrl + "','RSS', '" + title + "', '" + txt + "', '000', 'RSS','rssfeed'  from dual "
                                + " WHERE NOT EXISTS  (SELECT sn FROM tbl_contents WHERE videoUrl = '" + videoUrl + "' )";

                        //  System.out.println();
                        pstmt = con.prepareStatement(qry);
                        pstmt.executeUpdate();

                    }
                } catch (FeedException e) {
                    e.printStackTrace();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        } catch(Exception e){
            e.printStackTrace();

        }

    }

}
