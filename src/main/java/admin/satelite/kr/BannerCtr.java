package main.java.admin.satelite.kr;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import main.java.common.satelite.kr.SearchVO;
import main.java.common.satelite.kr.FileUtil;
import main.java.common.satelite.kr.FileVO;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class BannerCtr {

	@Autowired
	private BannerSvc bannerSvc;

	@Autowired
	private Member1Svc member1Svc;


	@RequestMapping(value = "/SessionGo")
	public String SessionGo(HttpServletRequest request, SearchVO searchVO, ModelMap modelMap, HttpSession session) {
		return "member1/SessionGo";
	}
	
	@RequestMapping(value = "/BannerList")
	public String BannerList(HttpServletRequest request, SearchVO searchVO, ModelMap modelMap, HttpSession session) {
		String orderKeyword = request.getParameter("orderKeyword");
		searchVO.setOrderKeyword(orderKeyword);
		searchVO.pageCalculate( bannerSvc.selectBanner1Count(searchVO) ); // startRow, endRow




		List<?> projectview  = bannerSvc.selectBoxproject(searchVO);
		List<?> listview  = bannerSvc.selectBanner1List(searchVO);


		modelMap.addAttribute("projectview", projectview);
		modelMap.addAttribute("listview", listview);
		modelMap.addAttribute("searchVO", searchVO);


		return "banner/BannerList";

	}
	
	@RequestMapping(value = "/Banner2List")
	public String Banner2(HttpServletRequest request, SearchVO searchVO, ModelMap modelMap, HttpSession session) {

		searchVO.pageCalculate( bannerSvc.selectBanner2Count(searchVO) ); // startRow, endRow

		List<?> listview  = bannerSvc.selectBanner2List(searchVO);

		modelMap.addAttribute("listview", listview);
		modelMap.addAttribute("searchVO", searchVO);
		
		return "member1/Banner2List";

	}

	@RequestMapping(value = "/bannerForm")
	public String banner1Form(HttpServletRequest request, BannerVO banner1Info,	SearchVO searchVO, ModelMap modelMap) {
		List<?> projectview  = bannerSvc.selectBoxproject(searchVO);
		modelMap.addAttribute("projectview", projectview);
		return "banner/BannerForm";
	}
	
	@RequestMapping(value = "/bannerRead")
	public String banner1Read(HttpServletRequest request, BannerVO banner1Info,SearchVO searchVO, ModelMap modelMap) {
		String sn = request.getParameter("sn");

		banner1Info = bannerSvc.selectBanner1One(sn);

		List<?> bannerDetaillist = bannerSvc.selectBannerDetail(sn);
		List<?> projectview  = bannerSvc.selectBoxproject(searchVO);
		modelMap.addAttribute("projectview", projectview);
		modelMap.addAttribute("banner1Info", banner1Info);
		modelMap.addAttribute("bannerDetaillist", bannerDetaillist);
		return "banner/BannerRead";
	}

	@RequestMapping(value = "/bannerSave")
	public String bannerSave(SearchVO searchVO, HttpServletRequest request, BannerVO banner1Info, ModelMap modelMap) {

		String[] fileno = request.getParameterValues("fileno");
		FileUtil fs = new FileUtil();
		List<FileVO> filelist = fs.saveAllFilesBB(banner1Info.getUploadfile());
		bannerSvc.insertBanner1(banner1Info);

		String[] arrayLink = request.getParameterValues("link");
		String[] arrayLinkTaget = request.getParameterValues("linkTarget");
		String[] arrayImg = new String[filelist.size()];
		int size = 0;
		for(FileVO temp : filelist){
			arrayImg[size++] = temp.getFilename();
		}

		for (int i = 0; i < arrayLink.length; i++) {
			banner1Info.setLink(arrayLink[i]);
			banner1Info.setLinkTarget(arrayLinkTaget[i]);
			banner1Info.setImgfile(arrayImg[i]);
			banner1Info.setSort(i);
			bannerSvc.insertBannerDetail(banner1Info);
		}

		return "redirect:BannerList";
	}





	@RequestMapping(value = "/bannerUp")
	public String bannerUp(SearchVO searchVO, HttpServletRequest request, BannerVO banner1Info, ModelMap modelMap) {
		Integer sn = Integer.parseInt(request.getParameter("sn"));
		System.out.println(sn);
		bannerSvc.deleteBannerDetail(sn);
		String project = request.getParameter("project");
		String title = request.getParameter("title");
		String sdate = request.getParameter("sdate");
		String edate = request.getParameter("edate");
		String displaytype = request.getParameter("displaytype");
		String state = request.getParameter("state");
		banner1Info.setTitle(title);
		banner1Info.setProject(project);
		banner1Info.setSdate(sdate);
		banner1Info.setEdate(edate);
		banner1Info.setDisplayType(displaytype);
		banner1Info.setState(state);
		banner1Info.setSn(sn);

		bannerSvc.updateBanner1(banner1Info);
		FileUtil fs = new FileUtil();
	//	List<FileVO> filelist = fs.saveAllFilesBB(banner1Info.getUploadfile());


		String[] arrayLink = request.getParameterValues("link");
		String[] arrayLinkTaget = request.getParameterValues("linkTarget");
		String[] arrayImgOld = request.getParameterValues("uploadfileOld");
		String[] arrayImgCk = request.getParameterValues("uploadfileck");

		//String[] arrayImg = new String[arrayImgCk.length];


		String bannerImg = "";
		for (int i = 0; i < arrayLink.length; i++) {
			if (arrayImgCk[i] == "T") {
				bannerImg = arrayImgOld[i];
			} else {
				bannerImg = arrayImgOld[i];
			}
			banner1Info.setLink(arrayLink[i]);
			banner1Info.setLinkTarget(arrayLinkTaget[i]);
			banner1Info.setImgfile(bannerImg);
			banner1Info.setSort(i);
			banner1Info.setBannersn(sn);
			if (bannerImg != "" && arrayLink[i] != ""){
				bannerSvc.insertBannerDetail(banner1Info);
			}
		}

		return "redirect:BannerList";
	}

	@RequestMapping(value = "/bannerDelete")
	public String banner1Delete(HttpServletRequest request, SearchVO searchVO , BannerVO banner1Info,
								ModelMap modelMap) {


		String sn = request.getParameter("sn");
		bannerSvc.banner1Delete(sn);


		searchVO.pageCalculate( bannerSvc.selectBanner1Count(searchVO) ); // startRow, endRow

		List<?> listview  = bannerSvc.selectBanner1List(searchVO);

		modelMap.addAttribute("listview", listview);
		modelMap.addAttribute("searchVO", searchVO);

		return "member1/BannerList";
	}

	@RequestMapping(value = "/banner2Read")
	public String banner2Read(HttpServletRequest request, BannerVO banner1Info, ModelMap modelMap) {
		String sn = request.getParameter("sn");
		banner1Info = bannerSvc.selectBanner2One(sn);
		modelMap.addAttribute("banner1Info", banner1Info);
		return "member1/Banner2Read";
	}

	@RequestMapping(value = "/banner2Form")
	public String banner2Form(HttpServletRequest request, BannerVO banner1Info,
							  ModelMap modelMap) {



		return "member1/Banner2Form";
	}
	@RequestMapping(value = "/ContentsRead")
	public String ContentsRead(HttpServletRequest request, BannerVO banner1Info, ModelMap modelMap) {
		String sn = request.getParameter("sn");
		banner1Info = bannerSvc.selectContentsOne(sn);
		modelMap.addAttribute("banner1Info", banner1Info);
		return "member1/ContentsRead";
	}


	
	@RequestMapping(value = "/banner2Up")
	public String banner2Up(HttpServletRequest request, SearchVO searchVO, BannerVO banner1Info,
			ModelMap modelMap) {
		
		Integer sn = Integer.parseInt(request.getParameter("sn"));
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
		bannerSvc.updateBanner1(banner1Info);
		searchVO.pageCalculate( bannerSvc.selectBanner2Count(searchVO) ); // startRow, endRow
		List<?> listview  = bannerSvc.selectBanner2List(searchVO);
		modelMap.addAttribute("listview", listview);
		modelMap.addAttribute("searchVO", searchVO);
		return "member1/Banner2List";
	}
	
	@RequestMapping(value = "/banner2Save")
	public String banner2Save(HttpServletRequest request, SearchVO searchVO, BannerVO banner1Info,
			ModelMap modelMap) {
		
		
		String[] fileno = request.getParameterValues("fileno");
		FileUtil fs = new FileUtil();
		List<FileVO> filelist = fs.saveAllFilesBB(banner1Info.getUploadfile());
		bannerSvc.insertBanner2(banner1Info, filelist, fileno);

		searchVO.pageCalculate( bannerSvc.selectBanner2Count(searchVO) ); // startRow, endRow

		List<?> listview  = bannerSvc.selectBanner2List(searchVO);

		modelMap.addAttribute("listview", listview);
		modelMap.addAttribute("searchVO", searchVO);
		
		return "member1/Banner2List";
	}


	@ResponseBody
	@RequestMapping(value = "/bannerChkDelete")
	public String prtChkNotPublish(HttpServletRequest request, SearchVO searchVO , Map<String,Object> commandMap, BannerVO bannerinfo, ModelMap modelMap) throws Exception{
		String result = "TRUE";
		try {
			int cnt = Integer.parseInt(request.getParameter("CNT"));
			//System.out.println(cnt);
			String rprtOdr = request.getParameter("RPRT_ODR");
			String [] strArray = rprtOdr.split(",");
			for(int i=0; i<cnt; i++) {

				//Integer sn = Integer.valueOf((String)strArray[i]);
				String sn = (String)strArray[i];

				//bannerinfo.setSn(sn);

				bannerSvc.bannerChkDelete(sn);
			}
		} catch (Exception e) {
			//System.out.println(e.getMessage());
			result = "FALSE";
		}
		return result;
	}


}
