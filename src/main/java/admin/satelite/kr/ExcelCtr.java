package main.java.admin.satelite.kr;



import org.springframework.ui.ModelMap;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import java.util.Date;
import java.text.SimpleDateFormat;


import java.io.IOException;

import org.springframework.web.bind.annotation.ResponseBody;
import java.io.OutputStream;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import main.java.common.satelite.kr.SearchVO;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

@Controller
public class ExcelCtr {

    @Autowired
    private ExcelSvc excelSvc;


    @RequestMapping(value = "/excelForm")
    public String excelForm(HttpServletRequest request, SearchVO searchVO, ModelMap modelMap, HttpSession session) {
        return "excel/Form";
    }

   // @ResponseBody
    @RequestMapping(value = "/excelUploadAjax", method = RequestMethod.POST)
    public String excelUploadAjax(MultipartHttpServletRequest request)  throws Exception{
        MultipartFile excelFile =request.getFile("excelFile");
        System.out.println("엑셀 파일 업로드 컨트롤러");
        if(excelFile==null || excelFile.isEmpty()){
            throw new RuntimeException("엑셀파일을 선택 해 주세요.");
        }

        String realPath = request.getSession().getServletContext().getRealPath("upload");
        File destFile = new File(realPath+"/excel/"+"upload_"+excelFile.getOriginalFilename());
        try{
            excelFile.transferTo(destFile);
        }catch(IllegalStateException | IOException e){
            throw new RuntimeException(e.getMessage(),e);
        }

        excelSvc.excelUpload(destFile);

        //FileUtils.delete(destFile.getAbsolutePath());

    //  ModelAndView view = new ModelAndView();
      //  view.setViewName("");
        return "redirect:contents";
    }
    @RequestMapping(value="/ExcelSample")
    public void ExcelPoi(HttpServletResponse response, Model model) throws Exception {

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

        objSheet = objWorkBook.createSheet("첫번째 시트");     //워크시트 생성

        // 1행
        objRow = objSheet.createRow(0);
        objRow.setHeight ((short) 0x150);

        objCell = objRow.createCell(0);
        objCell.setCellValue("컨텐츠타입");
        objCell.setCellStyle(styleHd);

        objCell = objRow.createCell(1);
        objCell.setCellValue("출처이미지URL");
        objCell.setCellStyle(styleHd);

        objCell = objRow.createCell(2);
        objCell.setCellValue("원본URL");
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

