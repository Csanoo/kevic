package main.java.common.satelite.kr;

import main.java.admin.satelite.kr.Member1Svc;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class ScheduleCtr {

    @Autowired
    private Member1Svc member1Svc;
    @Autowired
    private ScheduleSvc scheduleSvc;

    @RequestMapping(value = "/reserveForm")
    public String reserveForm(HttpServletRequest request, SearchVO searchVO, ModelMap modelMap, HttpSession session) {
        searchVO.setDisplayRowCount(searchVO.getPageNo());
        String USERTYPE = "";
        if ( request.getSession().getAttribute("USERTYPE") != null ) {
            USERTYPE = (String)request.getSession().getAttribute("USERTYPE");
        }
        String USERID = "";
        if ( request.getSession().getAttribute("USERID") != null ) {
            USERID = (String)request.getSession().getAttribute("USERID");
        }


        searchVO.pageCalculate( scheduleSvc.selectReserveListCount(searchVO) ); // startRow, endRow
        List<?> listview  = scheduleSvc.selectReserveList(searchVO);

        List<?> cateview  = member1Svc.selectCodetype();

        modelMap.addAttribute("cateview", cateview);
        modelMap.addAttribute("listview", listview);

        return "posts/Reserveform";

    }


    @ResponseBody
    @RequestMapping(value = "/reserveSave")
    public String ytb1Post(HttpServletRequest request, ScheduleVO scheduleVO, ModelMap modelMap, HttpSession session) throws Exception {


        String USERID = "";
        if ( request.getSession().getAttribute("USERID") != null ) {
            USERID = (String)request.getSession().getAttribute("USERID");
        }

        scheduleVO.setRegUser(USERID);

        String keyword = "";
        String stype = "";
        String ctSource = "";
        Integer CountCt = 0;
        //keyword = request.getParameter("title");
        //    ctSource = request.getParameter("ctSource");
        //  CountCt = Integer.parseInt(request.getParameter("CountCt"));


        scheduleSvc.insertSchedule(scheduleVO);


        return "TRUE";
    }

    @ResponseBody
    @RequestMapping(value = "/reserveUse")
    public String reserveUse(HttpServletRequest request, ScheduleVO scheduleVO, ModelMap modelMap, HttpSession session) throws Exception {
        scheduleSvc.updateUse(scheduleVO);
        return "TRUE";
    }
}
