package main.java.admin.satelite.kr;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import main.java.common.satelite.kr.SearchVO;
import main.java.admin.satelite.kr.Posts1VO;
import main.java.common.satelite.kr.FileUtil;
import main.java.common.satelite.kr.FileVO;

@Controller
public class Posts1Ctr {

	@Autowired
	private Posts1Svc posts1Svc;
	
	
	@RequestMapping(value = "/charts")
	public String charts1(HttpServletRequest request, SearchVO searchVO, ModelMap modelMap, HttpSession session) {

		List<?> listbarchart  = posts1Svc.selectBarChart();

		modelMap.addAttribute("listbarchart", listbarchart);
		
		
		List<?> listlinechart  = posts1Svc.selectLineChart();

		modelMap.addAttribute("listlinechart", listlinechart);

		
		return "posts/ChartsList";

	}
	
	@RequestMapping(value = "/PostList")
	public String posts1(HttpServletRequest request, SearchVO searchVO, ModelMap modelMap, HttpSession session) {

				
		
		searchVO.pageCalculate( posts1Svc.selectPosts1Count(searchVO) ); // startRow, endRow

		List<?> listview  = posts1Svc.selectPosts1List(searchVO);

		modelMap.addAttribute("listview", listview);
		modelMap.addAttribute("searchVO", searchVO);
		
		
		return "posts/PostsList";

	}
	
	
	
	
	
	@RequestMapping(value = "/PostForm")
	public String posts1Form(HttpServletRequest request, Posts1VO posts1Info, 
			ModelMap modelMap) {
		
		
		
		return "posts/PostsForm";
	}
	
	@RequestMapping(value = "/PostRead")
	public String posts1Read(HttpServletRequest request, Posts1VO posts1Info, 
			ModelMap modelMap) {
		
		
		String sn = request.getParameter("sn");
		
		

		posts1Info = posts1Svc.selectPosts1One(sn);

		modelMap.addAttribute("posts1Info", posts1Info);
		
		return "posts/PostsRead";
	}
	
	
	
	@RequestMapping(value = "/PostSave")
	public String posts1Save(SearchVO searchVO, 
			HttpServletRequest request, Posts1VO posts1Info, 
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
		List<FileVO> filelist = fs.saveAllFilesBB(posts1Info.getUploadfile());
		posts1Info.setUserid(USERID);
		
		posts1Svc.insertPosts1(posts1Info, filelist, fileno);

		searchVO.pageCalculate( posts1Svc.selectPosts1Count(searchVO) ); // startRow, endRow

		List<?> listview  = posts1Svc.selectPosts1List(searchVO);

		modelMap.addAttribute("listview", listview);
		modelMap.addAttribute("searchVO", searchVO);
		
		return "posts/PostsList";
	}
	
	
	
	
	
	
	
	@RequestMapping(value = "/PostUp")
	public String posts1Up(SearchVO searchVO, 
			HttpServletRequest request, Posts1VO posts1Info, 
			ModelMap modelMap) {
		
		String USERID = "";
		if ( request.getSession().getAttribute("USERID") != null ) {
			USERID = (String)request.getSession().getAttribute("USERID");
		}
		
		String sn = request.getParameter("sn");
		
		String title = request.getParameter("title");
		String post = request.getParameter("post");
		
		
		posts1Info.setUserid(USERID);
		posts1Info.setTitle(title);
		posts1Info.setPost(post);
		
		posts1Info.setSn(sn);
		
		
		String[] fileno = request.getParameterValues("fileno");
		FileUtil fs = new FileUtil();
		List<FileVO> filelist = fs.saveAllFilesBB(posts1Info.getUploadfile());
		
		posts1Svc.updatePosts1(posts1Info, filelist, fileno);

		searchVO.pageCalculate( posts1Svc.selectPosts1Count(searchVO) ); // startRow, endRow

		List<?> listview  = posts1Svc.selectPosts1List(searchVO);

		modelMap.addAttribute("listview", listview);
		modelMap.addAttribute("searchVO", searchVO);
		
		return "posts/PostsList";
	}
	
	
	
	@RequestMapping(value = "/PostDelete")
	public String posts1Delete(HttpServletRequest request, SearchVO searchVO , Posts1VO posts1Info, 
			ModelMap modelMap) {
		
		
		String sn = request.getParameter("sn");
		posts1Svc.Posts1Delete(sn);

		
		searchVO.pageCalculate( posts1Svc.selectPosts1Count(searchVO) ); // startRow, endRow

		List<?> listview  = posts1Svc.selectPosts1List(searchVO);

		modelMap.addAttribute("listview", listview);
		modelMap.addAttribute("searchVO", searchVO);
		
		return "posts/PostsList";
	}

	

}
