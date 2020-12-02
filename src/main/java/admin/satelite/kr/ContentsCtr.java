package main.java.admin.satelite.kr;

import java.util.List;
import java.util.Map;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpServletRequest;
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



        searchVO.pageCalculate( contentsSvc.selectContentsCount(searchVO) ); // startRow, endRow

        List<?> listview  = contentsSvc.selectContentsList(searchVO);
        List<?> cateview  = contentsSvc.selectCateSelList(searchVO);

        modelMap.addAttribute("listview", listview);
        modelMap.addAttribute("searchVO", searchVO);
        modelMap.addAttribute("cateview", cateview);

        return "contents/List";

    }



    @RequestMapping(value = "/contentsForm")
    public String contentsForm(HttpServletRequest request, ContentsVO contentsInfo,
                              ModelMap modelMap, SearchVO searchVO) {

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


    @RequestMapping(value = "/contentsSave")
    public String contentsSave(SearchVO searchVO,
                              HttpServletRequest request, ContentsVO contentsInfo,
                              ModelMap modelMap) {
        ;
        contentsSvc.insertContentsOne(contentsInfo);

        searchVO.pageCalculate( contentsSvc.selectContentsCount(searchVO) ); // startRow, endRow

        List<?> listview  = contentsSvc.selectContentsList(searchVO);

        String title = request.getParameter("title");
        String imageUrl = request.getParameter("imageUrl");
        String videoUrl = request.getParameter("videoUrl");
        String category = request.getParameter("category");
        String ctSource = request.getParameter("ctSource");

        contentsInfo.setTitle(title);
        contentsInfo.setImageUrl(imageUrl);
        contentsInfo.setVideoUrl(videoUrl);
        contentsInfo.setCtSource(ctSource);
        contentsInfo.setCategory(category);


        modelMap.addAttribute("listview", listview);
        modelMap.addAttribute("searchVO", searchVO);

        return "contents/List";
    }

    @RequestMapping(value = "/contentsUp")
    public String contentsUp(SearchVO searchVO,
                            HttpServletRequest request, ContentsVO contentsInfo,
                            ModelMap modelMap) {

        Integer sn = Integer.parseInt(request.getParameter("sn"));
        String title = request.getParameter("title");
        String imageUrl = request.getParameter("imageUrl");
        String videoUrl = request.getParameter("videoUrl");
        String category = request.getParameter("category");
        String ctSource = request.getParameter("ctSource");

        contentsInfo.setTitle(title);
        contentsInfo.setImageUrl(imageUrl);
        contentsInfo.setVideoUrl(videoUrl);
        contentsInfo.setCtSource(ctSource);
        contentsInfo.setCategory(category);
        contentsInfo.setSn(sn);


        searchVO.pageCalculate( contentsSvc.selectContentsCount(searchVO) ); // startRow, endRow
        List<?> listview  = contentsSvc.selectContentsList(searchVO);
        modelMap.addAttribute("listview", listview);
        modelMap.addAttribute("searchVO", searchVO);

        return "contents/List";
    }

    @RequestMapping(value = "/contentsDelete")
    public String contentsDelete(HttpServletRequest request, SearchVO searchVO , ContentsVO contentsInfo,
                                ModelMap modelMap) {


        String sn = request.getParameter("sn");
        contentsSvc.contentsDelete(sn);


        searchVO.pageCalculate( contentsSvc.selectContentsCount(searchVO) ); // startRow, endRow

        List<?> listview  = contentsSvc.selectContentsList(searchVO);

        modelMap.addAttribute("listview", listview);
        modelMap.addAttribute("searchVO", searchVO);

        return "contents/List";
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
    @RequestMapping(value = "/contentsChkPublish")
    public String prtChkNotPublish(HttpServletRequest request, SearchVO searchVO , Map<String,Object> commandMap,ContentsVO contentsInfo,
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
                contentsSvc.notContentsPublish(sn);
            }
        } catch (Exception e) {
            //System.out.println(e.getMessage());
            result = "FALSE";
        }
        return "TRUE";
    }

}
