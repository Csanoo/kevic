package main.java.admin.satelite.kr;

import java.util.List;
import java.util.Map;

import main.java.common.satelite.kr.FileUtil;
import main.java.common.satelite.kr.FileVO;
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

        List<?> projectview  = projectSvc.selectBoxproject(searchVO);
        modelMap.addAttribute("projectview", projectview);

        searchVO.pageCalculate( projectSvc.selectProjectCount(searchVO) ); // startRow, endRow

        List<?> listview  = projectSvc.selectProjectList(searchVO);
        List<?> cateview  = projectSvc.selectCateSelList(searchVO);

        modelMap.addAttribute("listview", listview);
        modelMap.addAttribute("searchVO", searchVO);
        modelMap.addAttribute("cateview", cateview);

        return "project/List";

    }

    @RequestMapping(value = "/projectList")
    public String projectList(HttpServletRequest request, SearchVO searchVO, ModelMap modelMap, HttpSession session) {

        searchVO.pageCalculate( projectSvc.selectProjectCount2(searchVO) ); // startRow, endRow

        List<?> listview  = projectSvc.selectProjectList2(searchVO);
        //List<?> cateview  = projectSvc.selectCateSelList(searchVO);

        modelMap.addAttribute("listview", listview);
        modelMap.addAttribute("searchVO", searchVO);
        //modelMap.addAttribute("cateview", cateview);

        return "project/projectList";

    }

    @RequestMapping(value = "/projectForm")
    public String projectForm(HttpServletRequest request, ProjectVO projectInfo,
                               ModelMap modelMap, SearchVO searchVO) {

        List<?> projectview  = projectSvc.selectBoxproject(searchVO);
        modelMap.addAttribute("projectview", projectview);
        List<?> cateview  = projectSvc.selectCateSelList(searchVO);
        modelMap.addAttribute("cateview", cateview);
        List<?> sourceview  = projectSvc.selectSourceSelList(searchVO);
        modelMap.addAttribute("sourceview", sourceview);

        return "project/Form";
    }

    @RequestMapping(value = "/projectReg")
    public String projectReg(HttpServletRequest request, ProjectVO projectInfo, ModelMap modelMap, SearchVO searchVO) {

        List<?> cateview  = projectSvc.selectCateSelList(searchVO);
        modelMap.addAttribute("cateview", cateview);
        List<?> sourceview  = projectSvc.selectSourceSelList(searchVO);
        modelMap.addAttribute("sourceview", sourceview);

        return "project/projectForm";
    }

    @RequestMapping(value = "/cateReg")
    public String cateReg(HttpServletRequest request, ProjectVO projectInfo, ModelMap modelMap, SearchVO searchVO) {

        List<?> cateview  = projectSvc.selectCateSelList(searchVO);
        modelMap.addAttribute("cateview", cateview);
        List<?> sourceview  = projectSvc.selectSourceSelList(searchVO);
        modelMap.addAttribute("sourceview", sourceview);

        return "project/categoryForm";
    }

    @RequestMapping(value = "/projectRead")
    public String projectRead(HttpServletRequest request, ProjectVO projectInfo,
                               ModelMap modelMap) {


        String sn = request.getParameter("sn");



        projectInfo = projectSvc.selectProjectOne(sn);

        modelMap.addAttribute("projectInfo", projectInfo);

        return "project/Read";
    }

    @RequestMapping(value = "/projectDetail")
    public String projectDetail(HttpServletRequest request, ProjectVO projectInfo, ModelMap modelMap) {

        String sn = request.getParameter("sn");
        projectInfo = projectSvc.selectProjectDetail(sn);

        List<?> memolist  = projectSvc.selectMemoSelList(sn);
        modelMap.addAttribute("memolist", memolist);

        modelMap.addAttribute("projectInfo", projectInfo);

        return "project/projectRead";
    }

    @RequestMapping(value = "/categoryDetail")
    public String categoryDetail(HttpServletRequest request, ProjectVO projectInfo, ModelMap modelMap) {


        String sn = request.getParameter("sn");
        projectInfo = projectSvc.selectCategoryDetail(sn);
        List<?> catelistOne  = projectSvc.selectCategoryOne(sn);
        List<?> catelistTwo  = projectSvc.selectCategoryTwo(sn);
        modelMap.addAttribute("catelistOne", catelistOne);
        modelMap.addAttribute("catelistTwo", catelistTwo);
        modelMap.addAttribute("projectInfo", projectInfo);

        return "project/categoryForm";
    }

    @RequestMapping(value = "/projectSave")
    public String projectSave(SearchVO searchVO,
                               HttpServletRequest request, ProjectVO projectInfo,
                               ModelMap modelMap) {
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

        return "redirect:project";
    }

    @RequestMapping(value = "/projectRegSave")
    public String projectRegSave(SearchVO searchVO, HttpServletRequest request, ProjectVO projectInfo, ModelMap modelMap) {
        String[] fileno = request.getParameterValues("fileno");
        FileUtil fs = new FileUtil();
        List<FileVO> filelist = fs.saveAllFilesBB(projectInfo.getUploadfile());

        projectSvc.insertProject(projectInfo, filelist, fileno);
        return "project/projectForm";
    }

    @ResponseBody
    @RequestMapping(value = "/saveMemo")
    public String saveMemo(SearchVO searchVO, HttpServletRequest request, ProjectVO projectInfo, ModelMap modelMap) {

        String title = request.getParameter("title");
        String memo = request.getParameter("memo");

        projectInfo.setTitle(title);
        projectInfo.setMemo(memo);

        projectSvc.insertProjectMemo(projectInfo);
        return "True";
    }

    @RequestMapping(value = "/projectUp")
    public String projectUp(SearchVO searchVO, HttpServletRequest request, ProjectVO projectInfo, ModelMap modelMap) {

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

        String[] fileno = request.getParameterValues("fileno");
        FileUtil fs = new FileUtil();
        List<FileVO> filelist = fs.saveAllFilesBB(projectInfo.getUploadfile());

        projectSvc.updateprojectDetail(projectInfo, filelist, fileno);


        searchVO.pageCalculate( projectSvc.selectProjectCount(searchVO) ); // startRow, endRow
        List<?> listview  = projectSvc.selectProjectList(searchVO);
        modelMap.addAttribute("listview", listview);
        modelMap.addAttribute("searchVO", searchVO);

        return "redirect:project";
    }

    @RequestMapping(value = "/projectRegUp")
    public String projectRegUp(SearchVO searchVO, HttpServletRequest request, ProjectVO projectInfo, ModelMap modelMap) {

        Integer sn = Integer.parseInt(request.getParameter("sn"));
        String title = request.getParameter("title");
        String projectcd = request.getParameter("projectcd");
        String comment = request.getParameter("comment");
        String state = request.getParameter("state");
        String basictitle = request.getParameter("basictitle");

        projectInfo.setTitle(title);
        projectInfo.setComment(comment);
        projectInfo.setProjectcd(projectcd);
        projectInfo.setBasictitle(basictitle);
        projectInfo.setState(state);
        projectInfo.setSn(sn);


        searchVO.pageCalculate( projectSvc.selectProjectCount(searchVO) ); // startRow, endRow
        List<?> listview  = projectSvc.selectProjectList(searchVO);
        modelMap.addAttribute("listview", listview);
        modelMap.addAttribute("searchVO", searchVO);

        return "redirect:project";
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
    public String prtChkNotPublish(HttpServletRequest request, SearchVO searchVO , Map<String,Object> commandMap,ProjectVO projectInfo, ModelMap modelMap) throws Exception{
        String result = "TRUE";
        try {
            int cnt = Integer.parseInt(request.getParameter("CNT"));
            //System.out.println(cnt);
            String rprtOdr = request.getParameter("RPRT_ODR");
            String [] strArray = rprtOdr.split(",");
            for(int i=0; i<cnt; i++) {

                Integer sn = Integer.valueOf((String)strArray[i]);


                projectInfo.setSn(sn);

                projectSvc.notProjectPublish(projectInfo);
            }
        } catch (Exception e) {
            //System.out.println(e.getMessage());
            result = "FALSE";
        }
        return result;
    }


    @ResponseBody
    @RequestMapping(value = "/prtSortConfirm")
    public String prtSortConfirm(HttpServletRequest request, SearchVO searchVO , Map<String,Object> commandMap,ProjectVO projectInfo, ModelMap modelMap) throws Exception{
        String result = "TRUE";
        try {
            int cnt = Integer.parseInt(request.getParameter("CNT"));
            int sort = 1;
            //System.out.println(cnt);
            String rprtOdr = request.getParameter("RPRT_ODR");
            String [] strArray = rprtOdr.split(",");
            for(int i=0; i<cnt; i++) {

                Integer sn = Integer.valueOf((String)strArray[i]);
                sort  = sort+i;

                projectInfo.setSn(sn);
                projectInfo.setSort(sort);

                projectSvc.prtSortConfirm(projectInfo);
            }
        } catch (Exception e) {
            //System.out.println(e.getMessage());
            result = "FALSE";
        }
        return result;
    }


    @ResponseBody
    @RequestMapping(value = "/selPrjTitCt")
    public Integer selPrjTitCt(HttpServletRequest request, SearchVO searchVO , Map<String,Object> commandMap,ProjectVO projectInfo, ModelMap modelMap) throws Exception{

        try {
            String title = request.getParameter("title");
            return projectSvc.selPrjTitCt(title);

        } catch (Exception e) {
            //System.out.println(e.getMessage());
            return 0;
        }

    }

    @ResponseBody
    @RequestMapping(value = "/selPrjCd")
    public Integer selPrjCd(HttpServletRequest request, SearchVO searchVO , Map<String,Object> commandMap,ProjectVO projectInfo, ModelMap modelMap) throws Exception{

        try {
            String title = request.getParameter("title");
            return projectSvc.selPrjCd(title);
        } catch (Exception e) {
            //System.out.println(e.getMessage());
            return 0;
        }

    }

}
