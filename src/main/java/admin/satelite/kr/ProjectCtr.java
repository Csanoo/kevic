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
public class ProjectCtr {


    @Autowired
    private ProjectSvc projectSvc;




    @RequestMapping(value = "/project")
    public String Project(HttpServletRequest request, SearchVO searchVO, ModelMap modelMap, HttpSession session) {



        searchVO.pageCalculate( projectSvc.selectProjectCount(searchVO) ); // startRow, endRow

        List<?> listview  = projectSvc.selectProjectList(searchVO);
        List<?> cateview  = projectSvc.selectCateSelList(searchVO);

        modelMap.addAttribute("listview", listview);
        modelMap.addAttribute("searchVO", searchVO);
        modelMap.addAttribute("cateview", cateview);

        return "project/List";

    }



    @RequestMapping(value = "/projectForm")
    public String projectForm(HttpServletRequest request, ProjectVO projectInfo,
                               ModelMap modelMap, SearchVO searchVO) {

        List<?> cateview  = projectSvc.selectCateSelList(searchVO);
        modelMap.addAttribute("cateview", cateview);
        List<?> sourceview  = projectSvc.selectSourceSelList(searchVO);
        modelMap.addAttribute("sourceview", sourceview);

        return "project/Form";
    }

    @RequestMapping(value = "/projectRead")
    public String projectRead(HttpServletRequest request, ProjectVO projectInfo,
                               ModelMap modelMap) {


        String sn = request.getParameter("sn");



        projectInfo = projectSvc.selectProjectOne(sn);

        modelMap.addAttribute("projectInfo", projectInfo);

        return "project/Read";
    }


    @RequestMapping(value = "/projectSave")
    public String projectSave(SearchVO searchVO,
                               HttpServletRequest request, ProjectVO projectInfo,
                               ModelMap modelMap) {
        ;
        projectSvc.insertProjectOne(projectInfo);

        searchVO.pageCalculate( projectSvc.selectProjectCount(searchVO) ); // startRow, endRow

        List<?> listview  = projectSvc.selectProjectList(searchVO);

        String title = request.getParameter("title");
        String imageUrl = request.getParameter("imageUrl");
        String videoUrl = request.getParameter("videoUrl");
        String category = request.getParameter("category");
        String ctSource = request.getParameter("ctSource");

        projectInfo.setTitle(title);
        projectInfo.setImageUrl(imageUrl);
        projectInfo.setVideoUrl(videoUrl);
        projectInfo.setCtSource(ctSource);
        projectInfo.setCategory(category);


        modelMap.addAttribute("listview", listview);
        modelMap.addAttribute("searchVO", searchVO);

        return "project/List";
    }

    @RequestMapping(value = "/projectUp")
    public String projectUp(SearchVO searchVO,
                             HttpServletRequest request, ProjectVO projectInfo,
                             ModelMap modelMap) {

        Integer sn = Integer.parseInt(request.getParameter("sn"));
        String title = request.getParameter("title");
        String imageUrl = request.getParameter("imageUrl");
        String videoUrl = request.getParameter("videoUrl");
        String category = request.getParameter("category");
        String ctSource = request.getParameter("ctSource");

        projectInfo.setTitle(title);
        projectInfo.setImageUrl(imageUrl);
        projectInfo.setVideoUrl(videoUrl);
        projectInfo.setCtSource(ctSource);
        projectInfo.setCategory(category);
        projectInfo.setSn(sn);


        searchVO.pageCalculate( projectSvc.selectProjectCount(searchVO) ); // startRow, endRow
        List<?> listview  = projectSvc.selectProjectList(searchVO);
        modelMap.addAttribute("listview", listview);
        modelMap.addAttribute("searchVO", searchVO);

        return "project/List";
    }

    @RequestMapping(value = "/projectDelete")
    public String projectDelete(HttpServletRequest request, SearchVO searchVO , ProjectVO projectInfo,
                                 ModelMap modelMap) {


        String sn = request.getParameter("sn");
        projectSvc.projectDelete(sn);


        searchVO.pageCalculate( projectSvc.selectProjectCount(searchVO) ); // startRow, endRow

        List<?> listview  = projectSvc.selectProjectList(searchVO);

        modelMap.addAttribute("listview", listview);
        modelMap.addAttribute("searchVO", searchVO);

        return "project/List";
    }

    @ResponseBody
    @RequestMapping(value = "/prtChkDelete")
    public String prtChkDelete(HttpServletRequest request, SearchVO searchVO , Map<String,Object> commandMap,ProjectVO projectInfo,
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
                projectSvc.chkProjectDelete(sn);
            }
        } catch (Exception e) {
            //System.out.println(e.getMessage());
            result = "FALSE";
        }
        return "TRUE";
    }

    @ResponseBody
    @RequestMapping(value = "/prtChkNotPublish")
    public String prtChkNotPublish(HttpServletRequest request, SearchVO searchVO , Map<String,Object> commandMap,ProjectVO projectInfo,
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
                projectSvc.notProjectPublish(sn);
            }
        } catch (Exception e) {
            //System.out.println(e.getMessage());
            result = "FALSE";
        }
        return "TRUE";
    }

}
