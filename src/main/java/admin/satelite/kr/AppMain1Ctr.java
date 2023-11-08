package main.java.admin.satelite.kr;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;


import main.java.admin.satelite.kr.AppMain1VO;
import main.java.common.satelite.kr.FileUtil;
import main.java.common.satelite.kr.FileVO;
import org.springframework.web.bind.annotation.ResponseBody;
import main.java.admin.satelite.kr.ProjectSvc;
import main.java.common.satelite.kr.SearchVO;

@Controller
public class AppMain1Ctr {

	@Autowired
	private AppMain1Svc appmain1Svc;
	private ProjectSvc projectSvc;

	@RequestMapping(value = "/AppMain1")
	public String AppMain1(HttpServletRequest request, SearchVO searchVO, ModelMap modelMap, HttpSession session) {

		String pageNo = request.getParameter("pageNo");
		if ( pageNo == null ){
			pageNo = "50";
		}
		searchVO.setDisplayRowCount(Integer.parseInt(pageNo));
		searchVO.setDisplayRowCount(searchVO.getPageNo());
		searchVO.pageCalculate( appmain1Svc.selectAppMain1Count(searchVO) ); // startRow, endRow

		List<?> listview  = appmain1Svc.selectAppMain1List(searchVO);


		List<?> projectview  = appmain1Svc.selectBoxproject(searchVO);

		modelMap.addAttribute("projectview", projectview);
		modelMap.addAttribute("listview", listview);
		modelMap.addAttribute("searchVO", searchVO);

		return "appmain/AppMain1List";

	}
	
		@RequestMapping(value = "/AppMain2")
	public String AppMain2(HttpServletRequest request, SearchVO searchVO, ModelMap modelMap, HttpSession session) {

				
		
		searchVO.pageCalculate( appmain1Svc.selectAppMain2Count(searchVO) ); // startRow, endRow

		List<?> listview  = appmain1Svc.selectAppMain2List(searchVO);

		modelMap.addAttribute("listview", listview);
		modelMap.addAttribute("searchVO", searchVO);
		
		
		return "appmain/AppMain2List";

	}
	
	
	
	@RequestMapping(value = "/appmain1Form")
	public String appmain1Form(HttpServletRequest request, AppMain1VO appmain1Info, SearchVO searchVO,
			ModelMap modelMap) {

		List<?> projectview  = appmain1Svc.selectBoxproject(searchVO);
		modelMap.addAttribute("projectview", projectview);
		
		return "appmain/AppMain1Form";
	}
	
	@RequestMapping(value = "/appmain1Read")
	public String appmain1Read(HttpServletRequest request, AppMain1VO appmain1Info, SearchVO searchVO,
			ModelMap modelMap) {
		
		
		String sn = request.getParameter("sn");


		List<?> projectview  = appmain1Svc.selectBoxproject(searchVO);
		modelMap.addAttribute("projectview", projectview);
		appmain1Info = appmain1Svc.selectAppMain1One(sn);

		modelMap.addAttribute("appmain1Info", appmain1Info);
		
		return "appmain/AppMain1Read";
	}
	
	@RequestMapping(value = "/appmain2Read")
	public String appmain2Read(HttpServletRequest request, AppMain1VO appmain1Info, 
			ModelMap modelMap) {
		
		
		String sn = request.getParameter("sn");
		
		

		appmain1Info = appmain1Svc.selectAppMain1One(sn);

		modelMap.addAttribute("appmain1Info", appmain1Info);
		
		return "appmain/AppMain2Read";
	}
	
	@RequestMapping(value = "/appmain2Form")
	public String appmain2Form(HttpServletRequest request, AppMain1VO appmain1Info, 
			ModelMap modelMap) {
		
		
		
		return "appmain/AppMain2Form";
	}
	
	@RequestMapping(value = "/appmain1Save")
	public String appmain1Save(SearchVO searchVO, 
			HttpServletRequest request, AppMain1VO appmain1Info, 
			ModelMap modelMap) {

		appmain1Svc.insertAppMain1One(appmain1Info);


		return "redirect:AppMain1";

	}
	

	@RequestMapping(value = "/appmain1Up")
	public String appmain1Up(SearchVO searchVO, HttpServletRequest request, AppMain1VO appmain1Info,	ModelMap modelMap) {
		
		String sn = request.getParameter("sn");
		appmain1Info.setSn(sn);
		String uname = request.getParameter("uname");
		appmain1Info.setUname(uname);
		String umemo = request.getParameter("umemo");
		appmain1Info.setUmemo(umemo);
		String code2 = request.getParameter("code2");
		appmain1Info.setCode2(code2);
		String link = request.getParameter("link");
		appmain1Info.setLink(link);
		String title = request.getParameter("title");
		appmain1Info.setTitle(title);
		String appkind = request.getParameter("appkind");
		appmain1Info.setAppkind(appkind);
		String  sdate = request.getParameter("sdate");
		appmain1Info.setSdate(sdate);
		String  stime = request.getParameter("stime");
		appmain1Info.setStime(stime);
		String  edate = request.getParameter("edate");
		appmain1Info.setEdate(edate);
		String  etime = request.getParameter("etime");
		appmain1Info.setEtime(etime);
		Integer  sWidth = Integer.parseInt(request.getParameter("sWidth"));
		appmain1Info.setsWidth(sWidth);
		Integer  sHeight = Integer.parseInt(request.getParameter("sHeight"));
		appmain1Info.setsHeight(sHeight);
		String  state = request.getParameter("state");
		appmain1Info.setState(state);
		Integer  positionX = Integer.parseInt(request.getParameter("positionX"));
		appmain1Info.setPositionX(positionX);
		Integer  positionY = Integer.parseInt(request.getParameter("positionY"));
		appmain1Info.setPositionY(positionY);
		String  closeType = request.getParameter("closeType");
		appmain1Info.setCloseType(closeType);
		String  displaytype = request.getParameter("displaytype");
		appmain1Info.setDisplaytype(displaytype);
		String  dtimetype = request.getParameter("dtimetype");
		appmain1Info.setDtimetype(dtimetype);
		String  project = request.getParameter("project");
		appmain1Info.setProject(project);
		String  linkState = request.getParameter("linkState");
		appmain1Info.setLinkState(linkState);
		String  linkTarget = request.getParameter("linkTarget");
		appmain1Info.setLinkTarget(linkTarget);


		appmain1Svc.updateAppMain1(appmain1Info);

		return "redirect:AppMain1";
	}
	
	@RequestMapping(value = "/appmain2Up")
	public String appmain2Up(HttpServletRequest request, SearchVO searchVO, AppMain1VO appmain1Info, 
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
		
		appmain1Svc.updateAppMain2(appmain1Info, filelist, fileno);
		
		searchVO.pageCalculate( appmain1Svc.selectAppMain2Count(searchVO) ); // startRow, endRow

		List<?> listview  = appmain1Svc.selectAppMain2List(searchVO);

		modelMap.addAttribute("listview", listview);
		modelMap.addAttribute("searchVO", searchVO);

		
		
		return "appmain/AppMain2List";
	}


	
	@RequestMapping(value = "/appmain2Save")
	public String appmain2Save(HttpServletRequest request, SearchVO searchVO, AppMain1VO appmain1Info, 
			ModelMap modelMap) {
		
		
		String[] fileno = request.getParameterValues("fileno");
		FileUtil fs = new FileUtil();
		List<FileVO> filelist = fs.saveAllFilesBB(appmain1Info.getUploadfile());
		appmain1Svc.insertAppMain2(appmain1Info, filelist, fileno);

		searchVO.pageCalculate( appmain1Svc.selectAppMain2Count(searchVO) ); // startRow, endRow

		List<?> listview  = appmain1Svc.selectAppMain2List(searchVO);

		modelMap.addAttribute("listview", listview);
		modelMap.addAttribute("searchVO", searchVO);
		
		return "appmain/AppMain2List";
	}
	
	@RequestMapping(value = "/appmain1Delete")
	public String appmain1Delete(HttpServletRequest request, SearchVO searchVO , AppMain1VO appmain1Info, ModelMap modelMap) {

		String sn = request.getParameter("sn");
		appmain1Svc.appmain1Delete(sn);
		searchVO.pageCalculate( appmain1Svc.selectAppMain1Count(searchVO) ); // startRow, endRow
		List<?> listview  = appmain1Svc.selectAppMain1List(searchVO);
		modelMap.addAttribute("listview", listview);
		modelMap.addAttribute("searchVO", searchVO);
		return "appmain/AppMain1List";
	}
	
	@RequestMapping(value = "/appmain2Delete")
	public String appmain2Delete(HttpServletRequest request, SearchVO searchVO , AppMain1VO appmain1Info, ModelMap modelMap) {
		
		
		String sn = request.getParameter("sn");
		appmain1Svc.appmain1Delete(sn);

		
		searchVO.pageCalculate( appmain1Svc.selectAppMain2Count(searchVO) ); // startRow, endRow

		List<?> listview  = appmain1Svc.selectAppMain2List(searchVO);

		modelMap.addAttribute("listview", listview);
		modelMap.addAttribute("searchVO", searchVO);
		
		return "appmain/AppMain2List";
	}

	@ResponseBody
	@RequestMapping(value = "/popChkDelete")
	public String popChkDelete(HttpServletRequest request, SearchVO searchVO , Map<String,Object> commandMap, ProjectVO projectInfo,
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
				appmain1Svc.chkPopDelete(sn);
			}
		} catch (Exception e) {
			//System.out.println(e.getMessage());
			result = "FALSE";
		}
		return result;
	}
	

}
