package main.java.admin.satelite.kr;

import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.io.File;
import main.java.common.satelite.kr.FileUtil;
import main.java.common.satelite.kr.FileVO;
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
import org.springframework.web.multipart.MultipartFile;
import main.java.common.satelite.kr.SearchVO;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class ProjectCtr {


    @Autowired
    private ProjectSvc projectSvc;


    @RequestMapping(value = "/project")
    public String Project(HttpServletRequest request, SearchVO searchVO, ModelMap modelMap, HttpSession session) {

        searchVO.setDisplayRowCount(searchVO.getPageNo());
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

        searchVO.setDisplayRowCount(searchVO.getPageNo());
        searchVO.pageCalculate( projectSvc.selectProjectCount2(searchVO) ); // startRow, endRow

        List<?> listview  = projectSvc.selectProjectList2(searchVO);
        List<?> projectview  = projectSvc.selectBoxproject(searchVO);
        modelMap.addAttribute("projectview", projectview);
        modelMap.addAttribute("listview", listview);
        modelMap.addAttribute("searchVO", searchVO);
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
    public String projectRead(HttpServletRequest request, ProjectVO projectInfo, ModelMap modelMap) {
        String sn = request.getParameter("sn");
        projectInfo = projectSvc.selectProjectOne(sn);
        modelMap.addAttribute("projectInfo", projectInfo);
        return "project/Read";
    }

    @RequestMapping(value = "/projectDetail")
    public String projectDetail(HttpServletRequest request, ProjectVO projectInfo, ModelMap modelMap) {
        ProjectVO pinfo = new ProjectVO();
        String sn = request.getParameter("sn");
        pinfo = projectSvc.selectProjectDetail(sn);

        List<?> memolist  = projectSvc.selectMemoSelList(sn);
        modelMap.addAttribute("memolist", memolist);
        Integer psn = Integer.parseInt(request.getParameter("sn"));
        List<?> mlist  = projectSvc.categoryMember(psn);
        modelMap.addAttribute("mlist", mlist);
        modelMap.addAttribute("projectInfo", pinfo);

        return "project/projectRead";
    }

    @RequestMapping(value = "/categoryDetail")
    public String categoryDetail(HttpServletRequest request, ProjectVO projectInfo, ModelMap modelMap) {


        String sn = request.getParameter("sn");
        projectInfo.setSn(Integer.parseInt(sn));


       // projectInfo = projectSvc.selectCategoryDetail(sn);
        projectInfo.setProjectSn(sn);
        List<?> catelistOne  = projectSvc.selectCategoryOne(Integer.parseInt(sn));
       // List<?> catelistTwo  = projectSvc.selectCategoryTwo(Integer.parseInt(sn));

        modelMap.addAttribute("catelistOne", catelistOne);
        //modelMap.addAttribute("catelistTwo", catelistTwo);
        modelMap.addAttribute("projectInfo", projectInfo);

        return "project/categoryForm";
    }

    @RequestMapping(value = "/projectSave")
    public String projectSave(ProjectVO projectInfo) {
        projectSvc.insertProjectOne(projectInfo);
        projectSvc.insertPublish(projectInfo);
        return "redirect:project";
    }

    @RequestMapping(value = "/projectRegSave")
    public String projectRegSave(SearchVO searchVO, HttpServletRequest request, ProjectVO projectInfo, ModelMap modelMap) {
        String USERID = "";
        if ( request.getSession().getAttribute("USERID") != null ) {
            USERID = (String)request.getSession().getAttribute("USERID");
        }
        projectInfo.setUserid(USERID);
        String[] fileno = request.getParameterValues("fileno");
        FileUtil fs = new FileUtil();
        List<FileVO> filelist = fs.saveAllFilesBB(projectInfo.getUploadfile());

        projectSvc.insertProject(projectInfo, filelist, fileno);

        return "redirect:projectList";
    }

    @ResponseBody
    @RequestMapping(value = "/saveMemo")
    public String saveMemo(SearchVO searchVO, HttpServletRequest request, ProjectVO projectInfo, ModelMap modelMap) {
        String USERID = "";
        if ( request.getSession().getAttribute("USERID") != null ) {
            USERID = (String)request.getSession().getAttribute("USERID");
        }
        String title = request.getParameter("title");
        String memo = request.getParameter("memo");

        projectInfo.setTitle(title);
        projectInfo.setMemo(memo);
        projectInfo.setUserid(USERID);
        projectSvc.insertProjectMemo(projectInfo);
        return "True";
    }

    @ResponseBody
    @RequestMapping(value = "/updateMemo")
    public String updateMemo(SearchVO searchVO, HttpServletRequest request, ProjectVO projectInfo, ModelMap modelMap) {
        Integer sn = Integer.parseInt(request.getParameter("sn"));
        String title = request.getParameter("title");
        String memo = request.getParameter("memo");
        projectInfo.setSn(sn);
        projectInfo.setTitle(title);
        projectInfo.setMemo(memo);

        projectSvc.updateProjectMemo(projectInfo);
        return "True";
    }

    @ResponseBody
    @RequestMapping(value = "/delMemo")
    public String delMemo(SearchVO searchVO, HttpServletRequest request, ProjectVO projectInfo, ModelMap modelMap) {
        Integer sn = Integer.parseInt(request.getParameter("sn"));
        projectSvc.projectMemoDelete(sn);
        return "True";
    }

    @ResponseBody
    @RequestMapping(value = "/msgDelete")
    public String msgDelete(SearchVO searchVO, HttpServletRequest request, ProjectVO projectInfo, ModelMap modelMap) {
        Integer sn = Integer.parseInt(request.getParameter("sn"));
        projectSvc.msgDelete(sn);
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
        String basicTitle = request.getParameter("basicTitle");

        projectInfo.setTitle(title);
        projectInfo.setComment(comment);
        projectInfo.setProjectcd(projectcd);
        projectInfo.setBasicTitle(basicTitle);
        projectInfo.setState(state);
        projectInfo.setSn(sn);

        String[] fileno = request.getParameterValues("fileno");
        FileUtil fs = new FileUtil();
        List<FileVO> filelist = fs.saveAllFilesBB(projectInfo.getUploadfile());

        projectSvc.updateprojectDetail(projectInfo, filelist, fileno);

        searchVO.pageCalculate( projectSvc.selectProjectCount(searchVO) ); // startRow, endRow
        List<?> listview  = projectSvc.selectProjectList(searchVO);
        modelMap.addAttribute("listview", listview);
        modelMap.addAttribute("searchVO", searchVO);

        return "redirect:projectList";
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
    public String prtChkNotPublish(HttpServletRequest request, SearchVO searchVO , Map<String,Object> commandMap,ProjectVO projectInfo, ModelMap modelMap )
throws Exception{
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
    public String prtSortConfirm(HttpServletRequest request, ProjectVO projectInfo) throws Exception{
        String result = "TRUE";
        try {
            Integer cnt = Integer.parseInt(request.getParameter("CNT"));

            String rprtOdr = request.getParameter("RPRT_ODR");
            String [] strArray = rprtOdr.split(",");
            projectInfo.setCt(cnt);
            projectInfo.setStrArray(strArray);
            projectSvc.prtSortConfirm(projectInfo);

        } catch (Exception e) {
            System.out.println(e.getMessage());
            result = "FALSE";
        }
        return result;
    }

    @ResponseBody
    @RequestMapping(value = "/cmInsert")
    public String cmInsert(HttpServletRequest request, SearchVO searchVO , Map<String,Object> commandMap,ProjectVO projectInfo, ModelMap modelMap) throws Exception{
        String result = "TRUE";
        try {
            Integer cnt = Integer.parseInt(request.getParameter("CNT"));
            Integer sn = Integer.parseInt(request.getParameter("sn"));
            String rprtOdr = request.getParameter("RPRT_ODR");
            String [] strArray = rprtOdr.split(",");
            projectInfo.setSn(sn);
            projectInfo.setCt(cnt);
            projectInfo.setStrArray(strArray);
            for(int i=0; i<cnt; i++) {
                String userid = (String)strArray[i];
                projectInfo.setUserid(userid);
                projectSvc.cmInsert(projectInfo);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            result = "FALSE";
        }
        return result;
    }



    @ResponseBody
    @RequestMapping(value = "/CategorySave")
    public Integer CategorySave(HttpServletRequest request, ProjectVO projectInfo, MultipartHttpServletRequest fileRequest) throws Exception{
        try {

            String filePath = "/server/apache-tomcat-8.5.59/webapps/upload/images/";
            FileUtil fs = new FileUtil();
            List<MultipartFile> files = fileRequest.getFiles("attachfiles");
            Integer num = 0;
            if (null != files && files.size() > 0) {
                for (MultipartFile multipartFile : files) {
                    String fileName = multipartFile.getOriginalFilename();
                    if(!"".equalsIgnoreCase(fileName)){
                        if(num == 0) {
                            projectInfo.setBannerImg(fileName);
                            fs.saveFile(multipartFile, filePath, fileName);
                        }
                        if(num == 1) {
                            projectInfo.setIconImg(fileName);
                            fs.saveFile(multipartFile, filePath, fileName);
                        }
                    }
                    num = num + 1;
                }
            }

            return projectSvc.insertCategory(projectInfo);
        } catch (Exception e) {
            //System.out.println(e.getMessage());
            return 0;
        }

    }


    @RequestMapping(value = "/categoryFList")
    public String categoryFList(HttpServletRequest request,ModelMap modelMap) throws Exception{

        try {
            Integer projectSn = Integer.parseInt(request.getParameter("sn"));

            List<?> catelistOne  = projectSvc.selectCategoryOne(projectSn);
            modelMap.addAttribute("listview", catelistOne);
            return "project/cateOne";
        } catch (Exception e) {
            //System.out.println(e.getMessage());
            return "error";
        }

    }

    @ResponseBody
    @RequestMapping(value = "/categoryFdel")
    public String categoryFdel(HttpServletRequest request, SearchVO searchVO , Map<String,Object> commandMap,ProjectVO projectInfo,
                               ModelMap modelMap) throws Exception{
        String result = "TRUE";
        try {
            int sn = Integer.parseInt(request.getParameter("sn"));

             projectSvc.categoryDelete(sn);

        } catch (Exception e) {
            //System.out.println(e.getMessage());
            result = "FALSE";
        }
        return "TRUE";
    }

    @RequestMapping(value = "/categoryTList")
    public String categoryTList(HttpServletRequest request,ModelMap modelMap,ProjectVO projectInfo) throws Exception{

        try {
            String projectSn = request.getParameter("sn");
            Integer pCate = Integer.parseInt(request.getParameter("pCate"));

            projectInfo.setProjectSn(projectSn);
            projectInfo.setpCate(pCate);
            List<?> catelistTwo  = projectSvc.selectCategoryTwo(projectInfo);


            modelMap.addAttribute("listview", catelistTwo);
            return "project/cateTwo";
        } catch (Exception e) {
            //System.out.println(e.getMessage());
            return "error";
        }

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


    @ResponseBody
    @RequestMapping(value = "/cateSort")
    public String cateSort(HttpServletRequest request, ProjectVO projectInfo) throws Exception{
        String result = "TRUE";
        try {
            Integer cnt = Integer.parseInt(request.getParameter("CNT"));
            String rprtOdr = request.getParameter("RPRT_ODR");
            String [] strArray = rprtOdr.split(",");
            projectInfo.setCt(cnt);
            projectInfo.setStrArray(strArray);
            projectSvc.cateSort(projectInfo);
        } catch (Exception e) {
            System.out.println(e.getMessage());
            result = "FALSE";
        }
        return result;
    }


    @ResponseBody
    @RequestMapping(value = "/categoryUp")
    public Integer categoryUp(HttpServletRequest request, ProjectVO projectInfo, MultipartHttpServletRequest fileRequest) throws Exception{
        try {
            Integer sn = Integer.parseInt(request.getParameter("sn"));

            //Integer pCate = Integer.parseInt(request.getParameter("pCate"));
            String projectSn = request.getParameter("projectSn");
            String title = request.getParameter("title");
            String bannerImgOld = request.getParameter("bannerImgOld");
            String iconImgOld = request.getParameter("iconImgOld");
            String adInfo = request.getParameter("adInfo");
            if(request.getParameter("adtime") != "") {
            //    Integer adtime = Integer.parseInt(request.getParameter("adtime"));
              //  projectInfo.setAdtime(adtime);
            }
            String adTag = request.getParameter("adTag");
            String filePath = "/server/apache-tomcat-8.5.59/webapps/upload/images/";
            FileUtil fs = new FileUtil();
            List<MultipartFile> files = fileRequest.getFiles("attachfiles");
            Integer num = 0;

            if (null != files && files.size() > 0) {
                for (MultipartFile multipartFile : files) {
                    String fileName = multipartFile.getOriginalFilename();
                    if (!"".equalsIgnoreCase(fileName)) {
                        if (num == 0) {
                            projectInfo.setBannerImg(fileName);
                            fs.saveFile(multipartFile, filePath, fileName);
                        }
                        if (num == 1) {
                            projectInfo.setIconImg(fileName);
                            fs.saveFile(multipartFile, filePath, fileName);
                        }
                    } else {
                        if (num == 0) {
                            projectInfo.setBannerImg(bannerImgOld);
                        }
                        if (num == 1) {
                            projectInfo.setIconImg(iconImgOld);
                        }
                    }
                    num = num + 1;
                }
            }

            projectInfo.setSn(sn);
            projectInfo.setTitle(title);
           // projectInfo.setpCate(pCate);
            projectInfo.setProjectSn(projectSn);
            projectInfo.setAdinfo(adInfo);
            projectInfo.setAdTag(adTag);
            projectSvc.updateCategory(projectInfo);
            return 1;
        } catch (Exception e) {
           // System.out.println(e.getMessage());
            return 0;
        }
    }

    @RequestMapping(value = "/category01")
    public String category01(HttpServletRequest request, SearchVO searchVO , Map<String,Object> commandMap,ProjectVO projectInfo, ModelMap modelMap) throws Exception{

        try {
            Integer sn = Integer.parseInt(request.getParameter("sn"));
            String sel = request.getParameter("sel");
            projectInfo.setCategory(sel);
            List<?> catelistone  = projectSvc.category01(sn);
            modelMap.addAttribute("projectVO", projectInfo);
            modelMap.addAttribute("listview", catelistone);
            return "project/category01";
        } catch (Exception e) {
            //System.out.println(e.getMessage());
            return "false";
        }

    }

    @RequestMapping(value = "/category02")
    public String category02(HttpServletRequest request, SearchVO searchVO , Map<String,Object> commandMap,ProjectVO projectInfo, ModelMap modelMap) throws Exception{

        try {
            Integer sn = Integer.parseInt(request.getParameter("sn"));
            String sel = request.getParameter("sel");
            projectInfo.setCategory(sel);
            List<?> catelistTwo  = projectSvc.category02(sn);
            modelMap.addAttribute("projectVO", projectInfo);
            modelMap.addAttribute("listview", catelistTwo);
            return "project/category02";

        } catch (Exception e) {
            //System.out.println(e.getMessage());
            return "";
        }

    }

    @RequestMapping(value = "/categoryMember")
    public String categoryMember(HttpServletRequest request, SearchVO searchVO , Map<String,Object> commandMap,ProjectVO projectInfo, ModelMap modelMap) throws Exception{

      //  try {
            Integer sn = Integer.parseInt(request.getParameter("sn"));
           // System.out.println(sn);
            projectInfo.setSn(sn);

            return "project/puser.jsp";

     //   } catch (Exception e) {
     //       System.out.println(e.getMessage());
     //       return "";
     //   }

    }

    @ResponseBody
    @RequestMapping(value = "/delMember")
    public String delMember(HttpServletRequest request, ProjectVO projectInfo) {
        Integer sn = Integer.parseInt(request.getParameter("sn"));
        String userid = request.getParameter("userid");
        projectInfo.setSn(sn);
        projectInfo.setUserid(userid);
        projectSvc.delMember(projectInfo);
        return "True";
    }

    @RequestMapping(value="/ExcelDownloadP")
    public void ExcelDownload(HttpServletResponse response, SearchVO searchVO, Model model, ProjectVO projectVO) throws Exception {

        HSSFWorkbook objWorkBook = new HSSFWorkbook();
        HSSFSheet objSheet = null;
        HSSFRow objRow = null;
        HSSFCell objCell = null;       //셀 생성

        //제목 폰트
        HSSFFont font = objWorkBook.createFont();
        font.setFontHeightInPoints((short)9);
        font.setBoldweight((short)font.BOLDWEIGHT_BOLD);
        font.setFontName("맑은고딕");

        //제목 스타일에 폰트 적용, 정렬
        HSSFCellStyle styleHd = objWorkBook.createCellStyle();    //제목 스타일
        styleHd.setFont(font);
        styleHd.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        styleHd.setVerticalAlignment (HSSFCellStyle.VERTICAL_CENTER);

        objSheet = objWorkBook.createSheet("콘텐츠목록");     //워크시트 생성

        // 1행
        objRow = objSheet.createRow(0);
        objRow.setHeight ((short) 0x150);

        objCell = objRow.createCell(0);
        objCell.setCellValue("No");
        objCell.setCellStyle(styleHd);

        objCell = objRow.createCell(1);
        objCell.setCellValue("컨텐츠타입");
        objCell.setCellStyle(styleHd);

        objCell = objRow.createCell(2);
        objCell.setCellValue("출처이미지URL");
        objCell.setCellStyle(styleHd);

        objCell = objRow.createCell(3);
        objCell.setCellValue("영상URL");
        objCell.setCellStyle(styleHd);

        objCell = objRow.createCell(4);
        objCell.setCellValue("타이틀");
        objCell.setCellStyle(styleHd);

        objCell = objRow.createCell(5);
        objCell.setCellValue("키워드");
        objCell.setCellStyle(styleHd);

        objCell = objRow.createCell(6);
        objCell.setCellValue("등록일");
        objCell.setCellStyle(styleHd);

        objCell = objRow.createCell(7);
        objCell.setCellValue("메시지");
        objCell.setCellStyle(styleHd);

        objCell = objRow.createCell(8);
        objCell.setCellValue("좋아요");
        objCell.setCellStyle(styleHd);


        List<ProjectVO> listview  = projectSvc.selectexcelList(searchVO);
        // listview.forEach(s -> );
        int rowNo = 1;
        String str = "";
        ArrayList val;
        for(ProjectVO list : listview){
            str = list.getTitle();
            str = str.replaceAll("&amp;", "&");
            str = str.replaceAll("&apos;", "'");
            str = str.replaceAll("&#39;", "'");
            str = str.replaceAll("&quot;", "\"");
            str = str.replaceAll("&lt;", "<");
            str = str.replaceAll("&gt;", ">");

            objRow = objSheet.createRow(rowNo++);
            objRow.setHeight ((short) 0x150);

            objCell = objRow.createCell(0);
            objCell.setCellValue(rowNo-1);
            objCell.setCellStyle(styleHd);

            objCell = objRow.createCell(1);
            objCell.setCellValue(""+list.getType());
            objCell.setCellStyle(styleHd);


            objCell = objRow.createCell(2);
            objCell.setCellValue(""+list.getImageUrl());
            objCell.setCellStyle(styleHd);

            objCell = objRow.createCell(3);
            objCell.setCellValue(""+list.getVideoUrl());
            objCell.setCellStyle(styleHd);

            objCell = objRow.createCell(4);
            objCell.setCellValue(""+list.getTitle());
            objCell.setCellStyle(styleHd);

            objCell = objRow.createCell(5);
            objCell.setCellValue(""+list.getKeyword());
            objCell.setCellStyle(styleHd);

            objCell = objRow.createCell(6);
            objCell.setCellValue(""+list.getRegDate());
            objCell.setCellStyle(styleHd);

            objCell = objRow.createCell(7);
            objCell.setCellValue(""+list.getMsgCt());
            objCell.setCellStyle(styleHd);

            objCell = objRow.createCell(8);
            objCell.setCellValue(""+list.getLike());
            objCell.setCellStyle(styleHd);

        }

        SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ( "yyyyMMdd");
        Date currentTime = new Date ();
        String mTime = mSimpleDateFormat.format ( currentTime );

        response.setContentType("Application/Msexcel");
        response.setHeader("Content-Disposition", "ATTachment; Filename=Contents_Bulk_upload_"+mTime+".xls");

        OutputStream fileOut  = response.getOutputStream();

        objWorkBook.write(fileOut);
        fileOut.close();

        response.getOutputStream().flush();
        response.getOutputStream().close();
    }

    @RequestMapping(value = "/msgList")
    public String msgList(HttpServletRequest request, SearchVO searchVO, ModelMap modelMap, ProjectVO projectVO) {

        Integer Sn = Integer.parseInt(request.getParameter("sn"));
        projectVO = projectSvc.selectContentsOne(Sn);
        searchVO.setPsn(Sn);
        searchVO.setDisplayRowCount(10);

        searchVO.pageCalculate( projectSvc.selectMsgCount(searchVO) );
        List<ProjectVO> msglist = projectSvc.selectMsgList(searchVO);

        modelMap.addAttribute("projectInfo", projectVO);
        modelMap.addAttribute("msglist", msglist);
        modelMap.addAttribute("searchVO", searchVO);
        return "project/msgList";

    }

}
