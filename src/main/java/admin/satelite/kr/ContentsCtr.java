package main.java.admin.satelite.kr;

import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.ArrayList;


import org.apache.poi.hssf.usermodel.*;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import main.java.common.satelite.kr.SearchVO;


@Controller
public class ContentsCtr {


    @Autowired
    private ContentsSvc contentsSvc;




    @RequestMapping(value = "/contents")
    public String Contents(HttpServletRequest request, SearchVO searchVO, ModelMap modelMap, HttpSession session) {
        String pageNo = request.getParameter("pageNo");
        if ( pageNo == null ){
            pageNo = "50";
        }
        searchVO.setDisplayRowCount(Integer.parseInt(pageNo));
        searchVO.setDisplayRowCount(searchVO.getPageNo());
        List<?> projectview  = contentsSvc.selectBoxproject(searchVO);
        modelMap.addAttribute("projectview", projectview);
        searchVO.pageCalculate( contentsSvc.selectContentsCount(searchVO) ); // startRow, endRow

        List<?> listview  = contentsSvc.selectContentsList(searchVO);
        List<?> cateview  = contentsSvc.selectCateSelList(searchVO);
        List<?> sourceview  = contentsSvc.selectSourceSelList(searchVO);

        modelMap.addAttribute("sourceview", sourceview);
        modelMap.addAttribute("listview", listview);
        modelMap.addAttribute("searchVO", searchVO);
        modelMap.addAttribute("cateview", cateview);

        return "contents/List";

    }

    @RequestMapping(value = "/listLoad")
    public String listLoad(HttpServletRequest request, SearchVO searchVO, ModelMap modelMap, HttpSession session) {
        String pageNo = request.getParameter("pageNo");
        if ( pageNo == null ){
            pageNo = "50";
        }
        searchVO.setDisplayRowCount(Integer.parseInt(pageNo));
        searchVO.setDisplayRowCount(searchVO.getPageNo());
        searchVO.pageCalculate( contentsSvc.selectContentsCount(searchVO) ); // startRow, endRow

        List<?> listview  = contentsSvc.selectContentsList(searchVO);
        modelMap.addAttribute("listview", listview);
        modelMap.addAttribute("searchVO", searchVO);

        return "contents/ListLoad";
    }


    @RequestMapping(value = "/contentsForm")
    public String contentsForm(HttpServletRequest request, ContentsVO contentsInfo,   ModelMap modelMap, SearchVO searchVO) {

        List<?> projectview  = contentsSvc.selectBoxproject(searchVO);
        modelMap.addAttribute("projectview", projectview);
        List<?> cateview  = contentsSvc.selectCateSelList(searchVO);
        modelMap.addAttribute("cateview", cateview);
        List<?> sourceview  = contentsSvc.selectSourceSelList(searchVO);
        modelMap.addAttribute("sourceview", sourceview);

        return "contents/Form";
    }

    @RequestMapping(value = "/contentsRead")
    public String contentsRead(HttpServletRequest request, ContentsVO contentsInfo,
                              ModelMap modelMap) {


        String sn = request.getParameter("sn");



        contentsInfo = contentsSvc.selectContentsOne(sn);

        modelMap.addAttribute("contentsInfo", contentsInfo);

        return "contents/Read";
    }

    @ResponseBody
    @RequestMapping(value = "/contentsSave")
    public String contentsSave(SearchVO searchVO,
                              HttpServletRequest request, ContentsVO contentsInfo,
                              ModelMap modelMap) {

        contentsSvc.insertContentsOne(contentsInfo);

        searchVO.pageCalculate( contentsSvc.selectContentsCount(searchVO) ); // startRow, endRow

        List<?> listview  = contentsSvc.selectContentsList(searchVO);

        String title = request.getParameter("title");

        contentsInfo.setTitle(title);

        modelMap.addAttribute("listview", listview);
        modelMap.addAttribute("searchVO", searchVO);

        return "redirect:contents/List";
    }

    @RequestMapping(value = "/contentsUp")
    public String contentsUp(SearchVO searchVO, HttpServletRequest request, ContentsVO contentsInfo, ModelMap modelMap) {

        Integer sn = Integer.parseInt(request.getParameter("sn"));
        String title = request.getParameter("title");

        contentsInfo.setTitle(title);
        contentsInfo.setSn(sn);


        searchVO.pageCalculate( contentsSvc.selectContentsCount(searchVO) ); // startRow, endRow
        List<?> listview  = contentsSvc.selectContentsList(searchVO);
        modelMap.addAttribute("listview", listview);
        modelMap.addAttribute("searchVO", searchVO);

        return "redirect:contents";
    }

    @RequestMapping(value = "/contentsDelete")
    public String contentsDelete(HttpServletRequest request, SearchVO searchVO , ContentsVO contentsInfo, ModelMap modelMap) {


        String sn = request.getParameter("sn");
        contentsSvc.contentsDelete(sn);


        searchVO.pageCalculate( contentsSvc.selectContentsCount(searchVO) ); // startRow, endRow

        List<?> listview  = contentsSvc.selectContentsList(searchVO);

        modelMap.addAttribute("listview", listview);
        modelMap.addAttribute("searchVO", searchVO);

        return "redirect:contents";
    }



    @RequestMapping(value = "/contentsDelete2")
    public String contentsDelete2(HttpServletRequest request, SearchVO searchVO , ContentsVO contentsInfo, ModelMap modelMap) {


        String sn = request.getParameter("sn");
        contentsSvc.contentsDelete(sn);


        searchVO.pageCalculate( contentsSvc.selectContentsCount(searchVO) ); // startRow, endRow

        List<?> listview  = contentsSvc.selectContentsList(searchVO);

        modelMap.addAttribute("listview", listview);
        modelMap.addAttribute("searchVO", searchVO);

        return
                "redirect:ytbForm";
    }

    @ResponseBody
    @RequestMapping(value = "/contentsChkDelete")
    public String prtChkDelete(HttpServletRequest request, SearchVO searchVO , Map<String,Object> commandMap,ContentsVO contentsInfo,
                               ModelMap modelMap) throws Exception{
        String result = "TRUE";
        try {
            int cnt = Integer.parseInt(request.getParameter("CNT"));
            //System.out.println(cnt);
            String rprtOdr = request.getParameter("RPRT_ODR");
            String [] strArray = rprtOdr.split(",");
            for(int i=0; i<cnt; i++) {
                //System.out.println(i);
                String sn = (String)strArray[i];
                contentsSvc.chkContentsDelete(sn);
            }
        } catch (Exception e) {
            //System.out.println(e.getMessage());
            result = "FALSE";
        }
        return "TRUE";
    }

    @ResponseBody
    @RequestMapping(value = "/contentsUpdate")
    public String contentsUpdate(HttpServletRequest request,  ContentsVO contentsInfo) throws Exception{
        String result = "TRUE";
        try {
            Integer sn = Integer.valueOf(request.getParameter("sn"));
            String title = request.getParameter("title");
            contentsInfo.setSn(sn);
            contentsInfo.setTitle(title);
            contentsSvc.ContentsUpdate(contentsInfo);
        } catch (Exception e) {
            //System.out.println(e.getMessage());
            result = "FALSE";
        }
        return result;
    }


}
