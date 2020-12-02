package main.java.admin.satelite.kr;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import main.java.common.satelite.kr.SearchVO;
import main.java.admin.satelite.kr.Sh001VO;
import main.java.common.satelite.kr.FileUtil;
import main.java.common.satelite.kr.FileVO;

@Controller
public class Sh001Ctr {

	@Autowired
	private Sh001Svc sh001Svc;
	
	
	
	
	@RequestMapping(value = "/Sh001List")
	public String sh001(HttpServletRequest request, SearchVO searchVO, ModelMap modelMap, HttpSession session) {

				
		
		searchVO.pageCalculate( sh001Svc.selectSh001Count(searchVO) ); // startRow, endRow

		List<?> listview  = sh001Svc.selectSh001List(searchVO);

		modelMap.addAttribute("listview", listview);
		modelMap.addAttribute("searchVO", searchVO);
		
		
		return "posts/Sh001List";

	}
	
	
	
	
	
	@RequestMapping(value = "/Sh001Form")
	public String sh001Form(HttpServletRequest request, Sh001VO sh001Info, 
			ModelMap modelMap) {
		
		
		
		return "posts/Sh001Form";
	}
	
	@RequestMapping(value = "/Sh001Read")
	public String sh001Read(HttpServletRequest request, Sh001VO sh001Info, 
			ModelMap modelMap) {
		
		
		String sn = request.getParameter("sn");
		
		

		sh001Info = sh001Svc.selectSh001One(sn);

		modelMap.addAttribute("sh001Info", sh001Info);
		
		return "posts/Sh001Read";
	}
	
	
	
	@RequestMapping(value = "/Sh001Save")
	public String sh001Save(SearchVO searchVO, 
			HttpServletRequest request, Sh001VO sh001Info, 
			ModelMap modelMap) {
		
		
		String USERTYPE = "";
		if ( request.getSession().getAttribute("USERTYPE") != null ) {
			USERTYPE = (String)request.getSession().getAttribute("USERTYPE");
		}
		String USERID = "";
		if ( request.getSession().getAttribute("USERID") != null ) {
			USERID = (String)request.getSession().getAttribute("USERID");
		}
		
		String[] fileno = request.getParameterValues("fileno");
		FileUtil fs = new FileUtil();
		List<FileVO> filelist = fs.saveAllFilesBB(sh001Info.getUploadfile());
		sh001Info.setUserid(USERID);
		
		sh001Svc.insertSh001(sh001Info, filelist, fileno);

		searchVO.pageCalculate( sh001Svc.selectSh001Count(searchVO) ); // startRow, endRow

		List<?> listview  = sh001Svc.selectSh001List(searchVO);

		modelMap.addAttribute("listview", listview);
		modelMap.addAttribute("searchVO", searchVO);
		
		return "posts/Sh001List";
	}
	
	
	
	
	
	
	
	@RequestMapping(value = "/Sh001Up")
	public String sh001Up(SearchVO searchVO, 
			HttpServletRequest request, Sh001VO sh001Info, 
			ModelMap modelMap) {
		
		
		
		String sn = request.getParameter("sn");
		
		String chname = request.getParameter("chname");
		String chuname = request.getParameter("chuname");
		
		
		
		
		sh001Info.setSn(sn);
		
		
		String[] fileno = request.getParameterValues("fileno");
		FileUtil fs = new FileUtil();
		List<FileVO> filelist = fs.saveAllFilesBB(sh001Info.getUploadfile());
		
		sh001Svc.updateSh001(sh001Info, filelist, fileno);

		searchVO.pageCalculate( sh001Svc.selectSh001Count(searchVO) ); // startRow, endRow

		List<?> listview  = sh001Svc.selectSh001List(searchVO);

		modelMap.addAttribute("listview", listview);
		modelMap.addAttribute("searchVO", searchVO);
		
		return "posts/Sh001List";
	}
	
	
	
	@RequestMapping(value = "/Sh001Delete")
	public String sh001Delete(HttpServletRequest request, SearchVO searchVO , Sh001VO sh001Info, 
			ModelMap modelMap) {
		
		
		String sn = request.getParameter("sn");
		sh001Svc.Sh001Delete(sn);

		
		searchVO.pageCalculate( sh001Svc.selectSh001Count(searchVO) ); // startRow, endRow

		List<?> listview  = sh001Svc.selectSh001List(searchVO);

		modelMap.addAttribute("listview", listview);
		modelMap.addAttribute("searchVO", searchVO);
		
		return "posts/Sh001List";
	}

	

}
