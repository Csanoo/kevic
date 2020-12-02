package main.java.admin.satelite.kr;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import main.java.common.satelite.kr.SearchVO;
import main.java.admin.satelite.kr.Banner1VO;
import main.java.common.satelite.kr.FileUtil;
import main.java.common.satelite.kr.FileVO;

@Controller
public class Banner1Ctr {

	@Autowired
	private Banner1Svc banner1Svc;
	private Member1Svc member1Svc;
	
	@RequestMapping(value = "/SessionGo")
	public String SessionGo(HttpServletRequest request, SearchVO searchVO, ModelMap modelMap, HttpSession session) {

		
		return "member1/SessionGo";

	}
	
	@RequestMapping(value = "/BannerList")
	public String Banner1(HttpServletRequest request, SearchVO searchVO, ModelMap modelMap, HttpSession session) {

				
		
		searchVO.pageCalculate( banner1Svc.selectBanner1Count(searchVO) ); // startRow, endRow

		List<?> listview  = banner1Svc.selectBanner1List(searchVO);

		modelMap.addAttribute("listview", listview);
		modelMap.addAttribute("searchVO", searchVO);
		
		
		return "member1/BannerList";

	}
	
	@RequestMapping(value = "/Banner2List")
	public String Banner2(HttpServletRequest request, SearchVO searchVO, ModelMap modelMap, HttpSession session) {

				
		
		searchVO.pageCalculate( banner1Svc.selectBanner2Count(searchVO) ); // startRow, endRow

		List<?> listview  = banner1Svc.selectBanner2List(searchVO);

		modelMap.addAttribute("listview", listview);
		modelMap.addAttribute("searchVO", searchVO);
		
		
		return "member1/Banner2List";

	}
	
	
	
	@RequestMapping(value = "/banner1Form")
	public String banner1Form(HttpServletRequest request, Banner1VO banner1Info, 
			ModelMap modelMap) {
		
		
		
		return "member1/Banner1Form";
	}
	
	@RequestMapping(value = "/banner1Read")
	public String banner1Read(HttpServletRequest request, Banner1VO banner1Info, 
			ModelMap modelMap) {
		
		
		String sn = request.getParameter("sn");
		
		

		banner1Info = banner1Svc.selectBanner1One(sn);

		modelMap.addAttribute("banner1Info", banner1Info);
		
		return "member1/Banner1Read";
	}
	
	@RequestMapping(value = "/banner2Read")
	public String banner2Read(HttpServletRequest request, Banner1VO banner1Info, 
			ModelMap modelMap) {
		
		
		String sn = request.getParameter("sn");
		
		

		banner1Info = banner1Svc.selectBanner2One(sn);

		modelMap.addAttribute("banner1Info", banner1Info);
		
		return "member1/Banner2Read";
	}
	
	@RequestMapping(value = "/banner2Form")
	public String banner2Form(HttpServletRequest request, Banner1VO banner1Info, 
			ModelMap modelMap) {
		
		
		
		return "member1/Banner2Form";
	}
	
	@RequestMapping(value = "/banner1Save")
	public String banner1Save(SearchVO searchVO, 
			HttpServletRequest request, Banner1VO banner1Info, 
			ModelMap modelMap) {
		
		
		String[] fileno = request.getParameterValues("fileno");
		FileUtil fs = new FileUtil();
		List<FileVO> filelist = fs.saveAllFilesBB(banner1Info.getUploadfile());
		banner1Svc.insertBanner1(banner1Info, filelist, fileno);

		searchVO.pageCalculate( banner1Svc.selectBanner1Count(searchVO) ); // startRow, endRow

		List<?> listview  = banner1Svc.selectBanner1List(searchVO);

		modelMap.addAttribute("listview", listview);
		modelMap.addAttribute("searchVO", searchVO);
		
		return "member1/BannerList";
	}
	
	@RequestMapping(value = "/ContentsRead")
	public String ContentsRead(HttpServletRequest request, Banner1VO banner1Info, 
			ModelMap modelMap) {
		
		
		String sn = request.getParameter("sn");
		
		

		banner1Info = banner1Svc.selectContentsOne(sn);

		modelMap.addAttribute("banner1Info", banner1Info);
		
		return "member1/ContentsRead";
	}
	
	
	
	
	
	@RequestMapping(value = "/banner1Up")
	public String banner1Up(SearchVO searchVO, 
			HttpServletRequest request, Banner1VO banner1Info, 
			ModelMap modelMap) {
		
		String sn = request.getParameter("sn");
		String code2 = request.getParameter("code2");
		String link = request.getParameter("link");
		String uname = request.getParameter("uname");
		String umemo = request.getParameter("umemo");
		
		banner1Info.setCode2(code2);
		banner1Info.setLink(link);
		banner1Info.setUname(uname);
		banner1Info.setUmemo(umemo);
		banner1Info.setSn(sn);
		
		
		String[] fileno = request.getParameterValues("fileno");
		FileUtil fs = new FileUtil();
		List<FileVO> filelist = fs.saveAllFilesBB(banner1Info.getUploadfile());
		
		banner1Svc.updateBanner1(banner1Info, filelist, fileno);

		searchVO.pageCalculate( banner1Svc.selectBanner1Count(searchVO) ); // startRow, endRow

		List<?> listview  = banner1Svc.selectBanner1List(searchVO);

		modelMap.addAttribute("listview", listview);
		modelMap.addAttribute("searchVO", searchVO);
		
		return "member1/BannerList";
	}
	
	@RequestMapping(value = "/banner2Up")
	public String banner2Up(HttpServletRequest request, SearchVO searchVO, Banner1VO banner1Info, 
			ModelMap modelMap) {
		
		String sn = request.getParameter("sn");
		String code2 = request.getParameter("code2");
		String link = request.getParameter("link");
		String uname = request.getParameter("uname");
		String umemo = request.getParameter("umemo");
		
		String text1 = request.getParameter("text1");
		String text2 = request.getParameter("text2");
		
		
		banner1Info.setCode2(code2);
		banner1Info.setLink(link);
		banner1Info.setUname(uname);
		banner1Info.setUmemo(umemo);
		
		banner1Info.setText1(text1);
		banner1Info.setText2(text2);
		
		banner1Info.setSn(sn);
		
		
		String[] fileno = request.getParameterValues("fileno");
		FileUtil fs = new FileUtil();
		List<FileVO> filelist = fs.saveAllFilesBB(banner1Info.getUploadfile());
		
		banner1Svc.updateBanner1(banner1Info, filelist, fileno);
		
		searchVO.pageCalculate( banner1Svc.selectBanner2Count(searchVO) ); // startRow, endRow

		List<?> listview  = banner1Svc.selectBanner2List(searchVO);

		modelMap.addAttribute("listview", listview);
		modelMap.addAttribute("searchVO", searchVO);

		
		
		return "member1/Banner2List";
	}
	
	@RequestMapping(value = "/banner2Save")
	public String banner2Save(HttpServletRequest request, SearchVO searchVO, Banner1VO banner1Info, 
			ModelMap modelMap) {
		
		
		String[] fileno = request.getParameterValues("fileno");
		FileUtil fs = new FileUtil();
		List<FileVO> filelist = fs.saveAllFilesBB(banner1Info.getUploadfile());
		banner1Svc.insertBanner2(banner1Info, filelist, fileno);

		searchVO.pageCalculate( banner1Svc.selectBanner2Count(searchVO) ); // startRow, endRow

		List<?> listview  = banner1Svc.selectBanner2List(searchVO);

		modelMap.addAttribute("listview", listview);
		modelMap.addAttribute("searchVO", searchVO);
		
		return "member1/Banner2List";
	}
	
	@RequestMapping(value = "/banner1Delete")
	public String banner1Delete(HttpServletRequest request, SearchVO searchVO , Banner1VO banner1Info, 
			ModelMap modelMap) {
		
		
		String sn = request.getParameter("sn");
		banner1Svc.banner1Delete(sn);

		
		searchVO.pageCalculate( banner1Svc.selectBanner1Count(searchVO) ); // startRow, endRow

		List<?> listview  = banner1Svc.selectBanner1List(searchVO);

		modelMap.addAttribute("listview", listview);
		modelMap.addAttribute("searchVO", searchVO);
		
		return "member1/BannerList";
	}

	

}
