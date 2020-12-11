package main.java.admin.satelite.kr;

import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

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

        return "redirect:contents/List";
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
    public String contentsChkPublish(HttpServletRequest request, SearchVO searchVO , Map<String,Object> commandMap,ContentsVO contentsInfo, ModelMap modelMap) throws Exception{
        String result = "TRUE";
        try {
            int cnt = Integer.parseInt(request.getParameter("CNT"));
            //System.out.println(cnt);
            String rprtOdr = request.getParameter("RPRT_ODR");
            String project = request.getParameter("project");
            String category = request.getParameter("category");
            String [] strArray = rprtOdr.split(",");



            for(int i=0; i<cnt; i++) {
                //System.out.println(i);
                Integer sn = Integer.valueOf((String)strArray[i]);

                contentsInfo.setProject(project);
                contentsInfo.setCategory(category);
                contentsInfo.setSn(sn);

                contentsSvc.ContentsPublish(contentsInfo);
            }
        } catch (Exception e) {
            //System.out.println(e.getMessage());
            result = "FALSE";
        }
        return "TRUE";
    }

    @ResponseBody
    @RequestMapping(value = "/contentsChkUpdate")
    public String contentsChkUpdate(HttpServletRequest request, ContentsVO contentsInfo) throws Exception{
        String result = "TRUE";
        try {
            int cnt = Integer.parseInt(request.getParameter("CNT"));
            //System.out.println(cnt);
            String rprtOdr = request.getParameter("RPRT_ODR");
            String stitle = request.getParameter("STITLE");
            String [] strArray = rprtOdr.split(",");
            String [] strArrayTit = stitle.split(",");


            for(int i=0; i<cnt; i++) {

                Integer sn = Integer.valueOf((String)strArray[i]);
                String title = (String)strArrayTit[i];

                contentsInfo.setTitle(title);
                contentsInfo.setSn(sn);

                contentsSvc.ContentsUpdate(contentsInfo);
            }
        } catch (Exception e) {
           // System.out.println(e.getMessage());
            result = "FALSE";
        }
       // System.out.println(result);
        return result;
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

    @RequestMapping(value="/ExcelDownload")
    public void ExcelDownload(HttpServletResponse response, SearchVO searchVO, Model model) throws Exception {

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
        objCell.setCellValue("이미지URL");
        objCell.setCellStyle(styleHd);

        objCell = objRow.createCell(2);
        objCell.setCellValue("비디URL");
        objCell.setCellStyle(styleHd);

        objCell = objRow.createCell(3);
        objCell.setCellValue("출처");
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

        List<?> listview  = contentsSvc.selectContentsList(searchVO);
        for(int i=0; i<listview.size(); i++) {
            int s = i + 1;
            objRow = objSheet.createRow(s);
            objRow.setHeight ((short) 0x150);

            objCell = objRow.createCell(0);
            objCell.setCellValue(listview.size() - i);
            objCell.setCellStyle(styleHd);

            objCell = objRow.createCell(1);
            objCell.setCellValue(listview.get(i).toString());
            objCell.setCellStyle(styleHd);

            objCell = objRow.createCell(2);
            objCell.setCellValue(listview.get(i).toString());
            objCell.setCellStyle(styleHd);

            objCell = objRow.createCell(3);
            objCell.setCellValue(listview.get(i).toString());
            objCell.setCellStyle(styleHd);

            objCell = objRow.createCell(4);
            objCell.setCellValue(listview.get(i).toString());
            objCell.setCellStyle(styleHd);

            objCell = objRow.createCell(5);
            objCell.setCellValue(listview.get(i).toString());
            objCell.setCellStyle(styleHd);

            objCell = objRow.createCell(6);
            objCell.setCellValue(listview.get(i).toString());
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

}
