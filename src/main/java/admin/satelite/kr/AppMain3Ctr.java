package main.java.admin.satelite.kr;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import main.java.common.satelite.kr.SearchVO;
import main.java.admin.satelite.kr.AppMain1VO;
import main.java.common.satelite.kr.FileUtil;
import main.java.common.satelite.kr.FileVO;

@Controller
public class AppMain3Ctr {

	@Autowired
	private AppMain3Svc appmain3Svc;
	
	
	
	
	@RequestMapping(value = "/AppMain3")
	public String AppMain3(HttpServletRequest request, SearchVO searchVO, ModelMap modelMap, HttpSession session) {

				
		
		searchVO.pageCalculate( appmain3Svc.selectAppMain3Count(searchVO) ); // startRow, endRow

		List<?> listview  = appmain3Svc.selectAppMain3List(searchVO);

		modelMap.addAttribute("listview", listview);
		modelMap.addAttribute("searchVO", searchVO);
		
		
		return "appmain/AppMain3List";

	}
	
	@RequestMapping(value = "/AppMain4")
	public String AppMain2(HttpServletRequest request, SearchVO searchVO, ModelMap modelMap, HttpSession session) {

				
		
		searchVO.pageCalculate( appmain3Svc.selectAppMain4Count(searchVO) ); // startRow, endRow

		List<?> listview  = appmain3Svc.selectAppMain4List(searchVO);

		modelMap.addAttribute("listview", listview);
		modelMap.addAttribute("searchVO", searchVO);
		
		
		return "appmain/AppMain4List";

	}
	
	
	
	@RequestMapping(value = "/appmain3Form")
	public String appmain1Form(HttpServletRequest request, AppMain1VO appmain1Info, 
			ModelMap modelMap) {
		
		
		
		return "appmain/AppMain3Form";
	}
	
	@RequestMapping(value = "/appmain3Read")
	public String appmain1Read(HttpServletRequest request, AppMain3VO appmain3Info, 
			ModelMap modelMap) {
		
		
		String sn = request.getParameter("sn");
		
		

		appmain3Info = appmain3Svc.selectAppMain3One(sn);

		modelMap.addAttribute("appmain3Info", appmain3Info);
		
		return "appmain/AppMain3Read";
	}
	
	@RequestMapping(value = "/appmain4Read")
	public String appmain4Read(HttpServletRequest request, AppMain3VO appmain3Info, 
			ModelMap modelMap) {
		
		
		String sn = request.getParameter("sn");
		
		

		appmain3Info = appmain3Svc.selectAppMain4One(sn);

		modelMap.addAttribute("appmain3Info", appmain3Info);
		
		return "appmain/AppMain4Read";
	}
	
	@RequestMapping(value = "/appmain4Form")
	public String appmain4Form(HttpServletRequest request, AppMain1VO appmain1Info, 
			ModelMap modelMap) {
		
		
		
		return "appmain/AppMain4Form";
	}
	
	@RequestMapping(value = "/appmain3Save")
	public String appmain1Save(SearchVO searchVO, 
			HttpServletRequest request, AppMain3VO appmain3Info, 
			ModelMap modelMap) {
		
		
		String[] fileno = request.getParameterValues("fileno");
		FileUtil fs = new FileUtil();
		List<FileVO> filelist = fs.saveAllFilesBB(appmain3Info.getUploadfile());
		
		appmain3Svc.insertAppMain3(appmain3Info, filelist, fileno);

		searchVO.pageCalculate( appmain3Svc.selectAppMain3Count(searchVO) ); // startRow, endRow

		List<?> listview  = appmain3Svc.selectAppMain3List(searchVO);

		modelMap.addAttribute("listview", listview);
		modelMap.addAttribute("searchVO", searchVO);
		
		return "appmain/AppMain3List";
	}
	
	
	
	
	
	
	
	@RequestMapping(value = "/appmain3Up")
	public String appmain1Up(SearchVO searchVO, 
			HttpServletRequest request, AppMain3VO appmain1Info, 
			ModelMap modelMap) {
		
		String sn = request.getParameter("sn");
		String code2 = request.getParameter("code2");
		String link = request.getParameter("link");
		String uname = request.getParameter("uname");
		String umemo = request.getParameter("umemo");
		
		appmain1Info.setCode2(code2);
		appmain1Info.setLink(link);
		appmain1Info.setUname(uname);
		appmain1Info.setUmemo(umemo);
		appmain1Info.setSn(sn);
		
		
		String[] fileno = request.getParameterValues("fileno");
		FileUtil fs = new FileUtil();
		List<FileVO> filelist = fs.saveAllFilesBB(appmain1Info.getUploadfile());
		
		appmain3Svc.updateAppMain3(appmain1Info, filelist, fileno);

		searchVO.pageCalculate( appmain3Svc.selectAppMain3Count(searchVO) ); // startRow, endRow

		List<?> listview  = appmain3Svc.selectAppMain3List(searchVO);

		modelMap.addAttribute("listview", listview);
		modelMap.addAttribute("searchVO", searchVO);
		
		return "appmain/AppMain3List";
	}
	
	@RequestMapping(value = "/appmain4Up")
	public String appmain4Up(HttpServletRequest request, SearchVO searchVO, AppMain3VO appmain1Info, 
			ModelMap modelMap) {
		
		String sn = request.getParameter("sn");
		String code2 = request.getParameter("code2");
		String link = request.getParameter("link");
		String uname = request.getParameter("uname");
		String umemo = request.getParameter("umemo");
		
		String text1 = request.getParameter("text1");
		String text2 = request.getParameter("text2");
		
		
		appmain1Info.setCode2(code2);
		appmain1Info.setLink(link);
		appmain1Info.setUname(uname);
		appmain1Info.setUmemo(umemo);
		
		appmain1Info.setText1(text1);
		appmain1Info.setText2(text2);
		
		appmain1Info.setSn(sn);
		
		
		String[] fileno = request.getParameterValues("fileno");
		FileUtil fs = new FileUtil();
		List<FileVO> filelist = fs.saveAllFilesBB(appmain1Info.getUploadfile());
		
		appmain3Svc.updateAppMain4(appmain1Info, filelist, fileno);
		
		searchVO.pageCalculate( appmain3Svc.selectAppMain4Count(searchVO) ); // startRow, endRow

		List<?> listview  = appmain3Svc.selectAppMain4List(searchVO);

		modelMap.addAttribute("listview", listview);
		modelMap.addAttribute("searchVO", searchVO);

		
		
		return "appmain/AppMain4List";
	}
	
	@RequestMapping(value = "/appmain4Save")
	public String appmain4Save(HttpServletRequest request, SearchVO searchVO, AppMain3VO appmain3Info, 
			ModelMap modelMap) {
		
		
		String[] fileno = request.getParameterValues("fileno");
		FileUtil fs = new FileUtil();
		List<FileVO> filelist = fs.saveAllFilesBB(appmain3Info.getUploadfile());
		appmain3Svc.insertAppMain4(appmain3Info, filelist, fileno);

		searchVO.pageCalculate( appmain3Svc.selectAppMain4Count(searchVO) ); // startRow, endRow

		List<?> listview  = appmain3Svc.selectAppMain4List(searchVO);

		modelMap.addAttribute("listview", listview);
		modelMap.addAttribute("searchVO", searchVO);
		
		return "appmain/AppMain4List";
	}
	
	@RequestMapping(value = "/appmain3Delete")
	public String appmain3Delete(HttpServletRequest request, SearchVO searchVO , AppMain1VO appmain1Info, 
			ModelMap modelMap) {
		
		
		String sn = request.getParameter("sn");
		appmain3Svc.appmain3Delete(sn);

		
		searchVO.pageCalculate( appmain3Svc.selectAppMain3Count(searchVO) ); // startRow, endRow

		List<?> listview  = appmain3Svc.selectAppMain3List(searchVO);

		modelMap.addAttribute("listview", listview);
		modelMap.addAttribute("searchVO", searchVO);
		
		return "appmain/AppMain3List";
	}
	
	@RequestMapping(value = "/appmain4Delete")
	public String appmain4Delete(HttpServletRequest request, SearchVO searchVO , AppMain1VO appmain1Info, 
			ModelMap modelMap) {
		
		
		String sn = request.getParameter("sn");
		appmain3Svc.appmain3Delete(sn);

		
		searchVO.pageCalculate( appmain3Svc.selectAppMain4Count(searchVO) ); // startRow, endRow

		List<?> listview  = appmain3Svc.selectAppMain4List(searchVO);

		modelMap.addAttribute("listview", listview);
		modelMap.addAttribute("searchVO", searchVO);
		
		return "appmain/AppMain4List";
	}

	

}
