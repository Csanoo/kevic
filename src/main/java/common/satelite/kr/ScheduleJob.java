package main.java.common.satelite.kr;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import main.java.admin.satelite.kr.Member1Svc;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;





public class ScheduleJob implements Job {




    @Override
    public void execute(JobExecutionContext context) throws JobExecutionException {

        Date date = new Date();
        SimpleDateFormat dateDD = new SimpleDateFormat("d");
        SimpleDateFormat dateHH = new SimpleDateFormat("H");
        SimpleDateFormat dateE = new SimpleDateFormat("E");
        String currentDay = dateDD.format(date);
        String currentTime = dateHH.format(date);
        String currentE = dateE.format(date);
        /*
         *         execute() method 에 로직 추가
         */
        System.out.println("========= execute() method Start !!! =========");
        System.out.println("Start Time >>> "+ currentDay + " " + currentE + " "  + currentTime);
    }


}
