package main.java.admin.satelite.kr;

import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import main.java.common.satelite.kr.FileUtil;
import main.java.common.satelite.kr.FileVO;
import main.java.common.satelite.kr.LeftMenuUtil;
import main.java.common.satelite.kr.Search;
import main.java.common.satelite.kr.SearchYtb;
import main.java.common.satelite.kr.SearchVO;
import main.java.common.satelite.kr.Crawler;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class Member1Ctr {

	@Autowired
	private Member1Svc member1Svc;


	@RequestMapping(value = "/ContentsList")
	public String Contents1(HttpServletRequest request, SearchVO searchVO, ModelMap modelMap, HttpSession session) {


		String USERTYPE = "";
		if ( request.getSession().getAttribute("USERTYPE") != null ) {
			USERTYPE = (String)request.getSession().getAttribute("USERTYPE");
		}
		String USERID = "";
		if ( request.getSession().getAttribute("USERID") != null ) {
			USERID = (String)request.getSession().getAttribute("USERID");
		}

		if ( USERTYPE.equals("CP")) {



			searchVO.setUserid(USERID);

			searchVO.pageCalculate( member1Svc.selectContents12Count(searchVO) ); // startRow, endRow

			List<?> listview  = member1Svc.selectContents12List(searchVO);

			modelMap.addAttribute("listview", listview);
			modelMap.addAttribute("searchVO", searchVO);
			
			
		
		}else {
			searchVO.pageCalculate( member1Svc.selectContents1Count(searchVO) ); // startRow, endRow

			List<?> listview  = member1Svc.selectContents1List(searchVO);

			modelMap.addAttribute("listview", listview);
			modelMap.addAttribute("searchVO", searchVO);
			
			
		}
		
		return "member1/ContentsList";

	}

	@RequestMapping(value = "/Contents2List")
	public String Contents12(HttpServletRequest request, SearchVO searchVO, ModelMap modelMap, 
			HttpSession session) {

		String USERID = "";
		if ( request.getSession().getAttribute("USERID") != null ) {
			USERID = (String)request.getSession().getAttribute("USERID");
		}

		searchVO.setUserid(USERID);

		searchVO.pageCalculate( member1Svc.selectContents12Count(searchVO) ); // startRow, endRow

		List<?> listview  = member1Svc.selectContents12List(searchVO);

		modelMap.addAttribute("listview", listview);
		modelMap.addAttribute("searchVO", searchVO);


		return "member1/ContentsList";

	}

	@RequestMapping(value = "/codeList")
	public String Code1(HttpServletRequest request, SearchVO searchVO, ModelMap modelMap, HttpSession session) {
		System.out.println(request.getParameter("orderKeyword"));
		searchVO.setDisplayRowCount(10);

		//searchVO.setOrderKeyword(request.getParameter("orderKeyword"));
		searchVO.pageCalculate( member1Svc.selectCode1Count(searchVO) ); // startRow, endRow
		List<?> listview  = member1Svc.selectCode1List(searchVO);

		modelMap.addAttribute("listview", listview);
		modelMap.addAttribute("searchVO", searchVO);

		return "member1/CodeList";

	}

	@RequestMapping(value = "/codeForm")
	public String Code1Form(HttpServletRequest request, SearchVO searchVO, ModelMap modelMap, HttpSession session) {
		
		String code1 = "";
		if ( request.getParameter("code1") != null) {
			code1 = request.getParameter("code1");
		}

		List<?> listsel  = member1Svc.selectCode1SelList();

		modelMap.addAttribute("listsel", listsel);
		
		modelMap.addAttribute("code1", code1);


		return "member1/CodeForm";

	}
	
	@RequestMapping(value = "/ytbForm")
	public String ytb1Form(HttpServletRequest request, SearchVO searchVO, ModelMap modelMap, HttpSession session) {
		searchVO.setDisplayRowCount(searchVO.getPageNo());
		String USERTYPE = "";
		if ( request.getSession().getAttribute("USERTYPE") != null ) {
			USERTYPE = (String)request.getSession().getAttribute("USERTYPE");
		}
		String USERID = "";
		if ( request.getSession().getAttribute("USERID") != null ) {
			USERID = (String)request.getSession().getAttribute("USERID");
		}


			searchVO.pageCalculate( member1Svc.selectContents1Count(searchVO) ); // startRow, endRow
			List<?> listview  = member1Svc.selectContents1List(searchVO);

			Integer QuataSum = member1Svc.sumYtbQuata();
			modelMap.addAttribute("listview", listview);
			modelMap.addAttribute("searchVO", searchVO);



		List<?> cateview  = member1Svc.selectCodetype();

		modelMap.addAttribute("cateview", cateview);
		modelMap.addAttribute("QuataSum",QuataSum);

		return "posts/Ytbform";

	}



	@ResponseBody
	@RequestMapping(value = "/ytbPost")
	public String ytb1Post(HttpServletRequest request, SearchVO searchVO, ModelMap modelMap, HttpSession session) throws Exception {


		String USERID = "";
		if ( request.getSession().getAttribute("USERID") != null ) {
			USERID = (String)request.getSession().getAttribute("USERID");
		}

		searchVO.setUserid(USERID);
		String title = "";
		String stype = "";
		String snsType = "";
		Integer CountCt = 0;
		title = request.getParameter("title");
		stype = request.getParameter("type");
		snsType = request.getParameter("snsType");
		CountCt = Integer.parseInt(request.getParameter("CountCt"));
		String sdate = request.getParameter("sdate");
		String edate = request.getParameter("edate");

		//System.out.println(snsType);
		Search srch = new Search();
		SearchYtb searchYtb = new SearchYtb();
		Crawler crawler = new Crawler();

		if(snsType.equals("ytb")) {
			try {
				//srch.execute(title);
				searchYtb.execute(title, stype,CountCt,USERID, sdate, edate);
			} catch(Exception e) {
				System.out.println(e.getMessage());
			}
		}else if(snsType.equals("twi")){
			crawler.searchTwit(title, stype, CountCt, USERID, sdate, edate);
		}else if(snsType.equals("fb")){
			crawler.searchFb(title, stype);
		}else if(snsType.equals("insta")){
			crawler.searchInsta(title, stype);
		}


		//return "redirect:ytbForm";
		return "TRUE";
	}

	@RequestMapping(value = "/postDelete")
	public String postDelete(SearchVO searchVO, HttpServletRequest request, BannerVO banner1Info, ModelMap modelMap) {


		String sn = "";
		if ( request.getParameter("sn") != null) {
			sn = request.getParameter("sn");
		}

		member1Svc.ContentsDelete(request.getParameter("sn"));


        return "redirect:ytbForm";

	}


	
	@RequestMapping(value = "/codeRead")
	public String Code1Read(HttpServletRequest request, SearchVO searchVO, ModelMap modelMap, HttpSession session) {

		String sn = "";
		if ( request.getParameter("sn")!= null) {
			sn = request.getParameter("sn");
		}
		Member1VO mvo = new Member1VO();
		mvo = member1Svc.selectCode1One(sn);
		modelMap.addAttribute("mvo", mvo);

		List<?> listsel  = member1Svc.selectCode1SelList();

		modelMap.addAttribute("listsel", listsel);



		return "member1/CodeRead";

	}

	@RequestMapping(value = "/codeSave")
	public String Code1Save(Member1VO mvo,HttpServletRequest request, SearchVO searchVO, ModelMap modelMap, HttpSession session) {


		//상위 코드 하드 코딩
		if ( mvo.getCode1().equals("USER")) {mvo.setCode1memo("관리자 회원");}
		if ( mvo.getCode1().equals("CONT")) {mvo.setCode1memo("출처");}
		if ( mvo.getCode1().equals("CMS")) {mvo.setCode1memo("홈페이지");}
		if ( mvo.getCode1().equals("CATE")) {mvo.setCode1memo("카테고리");}
		if ( mvo.getCode1().equals("TYPE")) {mvo.setCode1memo("컨텐츠 타입");}
		member1Svc.insertCode1One(mvo);


		searchVO.pageCalculate( member1Svc.selectCode1Count(searchVO) ); // startRow, endRow

		List<?> listview  = member1Svc.selectCode1List(searchVO);

		modelMap.addAttribute("listview", listview);
		modelMap.addAttribute("searchVO", searchVO);
		return "redirect:codeList";


	}
	@ResponseBody
	@RequestMapping(value = "/codeUp")
	public String Code1UP(Member1VO mvo,HttpServletRequest request, SearchVO searchVO, ModelMap modelMap, HttpSession session) {


		//상위 코드 하드 코딩
		if ( mvo.getCode1().equals("USER")) {mvo.setCode1memo("관리자 회원");}
		if ( mvo.getCode1().equals("CONT")) {mvo.setCode1memo("출처");}
		if ( mvo.getCode1().equals("CMS")) {mvo.setCode1memo("홈페이지");}
		if ( mvo.getCode1().equals("CATE")) {mvo.setCode1memo("카테고리");}
		if ( mvo.getCode1().equals("TYPE")) {mvo.setCode1memo("컨텐츠 타입");}
		member1Svc.insertCode1One(mvo);

		return "TRUE";


	}

	@ResponseBody
	@RequestMapping(value = "/codeDelete")
	public String Code1Del(Member1VO mvo,HttpServletRequest request, SearchVO searchVO, ModelMap modelMap, HttpSession session) {


		String sn = "";
		if ( request.getParameter("sn") != null) {
			sn = request.getParameter("sn");
		}
		
		if ( mvo.getCode1().equals("USER")) {mvo.setCode1memo("관리자 회원");}
		if ( mvo.getCode1().equals("CONT")) {mvo.setCode1memo("출처");}
		if ( mvo.getCode1().equals("CMS")) {mvo.setCode1memo("홈페이지");}
		if ( mvo.getCode1().equals("CATE")) {mvo.setCode1memo("카테고리");}
		if ( mvo.getCode1().equals("TYPE")) {mvo.setCode1memo("컨텐츠 타입");}

		member1Svc.deleteCode1One(sn);


		return "TRUE";

	}

	@RequestMapping(value = "/")
	public String MainLogin(HttpServletRequest request, SearchVO searchVO, ModelMap modelMap, HttpSession session) {

		return "member1/LoginForm";

	}

	@RequestMapping(value = "/regist")
	public String MainRegist1(HttpServletRequest request, SearchVO searchVO, ModelMap modelMap, HttpSession session) {
		List<?> listsel  = member1Svc.selectCode2SelList();
		modelMap.addAttribute("listsel", listsel);
		return "member1/Register";

	}

	@RequestMapping(value = "/stat")
	public String MainStat1(Member1VO mvo, HttpServletRequest request, SearchVO searchVO, ModelMap modelMap, HttpSession session) {

		
		String USERID = "";
		if ( request.getSession().getAttribute("USERID") != null ) {
			USERID = (String)request.getSession().getAttribute("USERID");
		}
		String USERTYPE = "";
		if ( request.getSession().getAttribute("USERTYPE") != null ) {
			USERTYPE = (String)request.getSession().getAttribute("USERTYPE");
		}
		
		if ( USERTYPE.equals("SA") ) {USERID="";
		mvo = member1Svc.selectMainStat(USERID);
		}else {
			mvo = member1Svc.selectMainStat2(USERID);
		}
		
		modelMap.addAttribute("mvo", mvo);
		
		return "member1/LoginList";

	}

	@RequestMapping(value = "/logout")
	public String MainLogout(HttpSession session) {
		session.invalidate();
		return "member1/LoginForm";

	}

	@RequestMapping(value = "/regist2")
	public String MainRegist2(Member1VO mvo,HttpServletRequest request, SearchVO searchVO, ModelMap modelMap, HttpSession session) {

		String userid = "";
		String userpw = "";
		String username = "";
		String email = "";
		String mobile = "";
		String usertype = "";
		String state = "";
		if (request.getParameter("userid") != null) {
			userid = request.getParameter("userid");
		}

		if (request.getParameter("userpw") != null) {
			userpw = request.getParameter("userpw");
		}

		if (request.getParameter("username") != null) {
			username = request.getParameter("username");
		}

		if (request.getParameter("email") != null) {
			email = request.getParameter("email");
		}

		if (request.getParameter("usertype") != null) {
			usertype = request.getParameter("usertype");
		}

		if (request.getParameter("state") != null) {
			state = request.getParameter("state");
		}

		Member1VO param = new Member1VO();
		param.setUserid(userid);
		param.setUserpw(userpw);
		param.setEmail(email);
		param.setMobile(mobile);
		param.setUsername(username);
		param.setUsertype(usertype);
		param.setState(state);

		member1Svc.insertMember1One(param);


		return "redirect:memberList";

	}
	
	@RequestMapping(value = "/memberSave")
	public String memberSave(Member1VO mvo,HttpServletRequest request, SearchVO searchVO, 
			ModelMap modelMap, HttpSession session) {

		String userid = "";
		String userpw = "";
		String username = "";
		String email = "";
		String mobile = "";
		String usertype = "";
		String uptuser = (String)request.getSession().getAttribute("USERID");

		if (request.getParameter("userid") != null) {
			userid = request.getParameter("userid");
		}
		
		if (request.getParameter("usertype") != null) {
			usertype = request.getParameter("usertype");
		}

		if (request.getParameter("userpw") != null) {
			userpw = request.getParameter("userpw");
		}

		if (request.getParameter("username") != null) {
			username = request.getParameter("username");
		}

		if (request.getParameter("email") != null) {
			email = request.getParameter("email");
		}

		if (request.getParameter("mobile") != null) {
			mobile = request.getParameter("mobile");
		}

		String menu01 = request.getParameter("menu01");
		String menu02 = request.getParameter("menu02");
		String menu03 = request.getParameter("menu03");
		String menu04 = request.getParameter("menu04");

		String state = request.getParameter("state");
		Member1VO param = new Member1VO();
		param.setUserid(userid);
		param.setUserpw(userpw);
		param.setEmail(email);
		param.setMobile(mobile);
		param.setUsername(username);
		param.setUsertype(usertype);
		param.setState(state);
		param.setUptuser(uptuser);
		param.setMenu01(menu01);
		param.setMenu02(menu02);
		param.setMenu03(menu03);
		param.setMenu04(menu04);

		member1Svc.updateMember1One(param);
		String userIng = "";
		userIng = (String)request.getSession().getAttribute("USERID");

		if(userid.equals(userIng)){
			return "redirect:logout";
		}
			searchVO.pageCalculate( member1Svc.selectMember1Count(searchVO) ); // startRow, endRow

		List<?> listview  = member1Svc.selectMember1List(searchVO);

		
		searchVO.setAction("memberList");
		modelMap.addAttribute("listview", listview);
		modelMap.addAttribute("searchVO", searchVO);




		return "redirect:memberList";

	}
	@ResponseBody
	@RequestMapping(value = "/login")
	public String MainLogin2(Member1VO mvo, HttpServletRequest request, SearchVO searchVO, ModelMap modelMap,
			HttpSession session) {

		String userid = "";
		String userpw = "";
		if (request.getParameter("userid") != null) {
			userid = request.getParameter("userid");
		}

		if (request.getParameter("userpw") != null) {
			userpw = request.getParameter("userpw");
		}

		Member1VO param = new Member1VO();
		param.setUserid(userid);
		param.setUserpw(userpw);

		mvo = member1Svc.selectMember1One(param);

		if (mvo != null) {

				String menuval ="00";
				String menu01 = mvo.getMenu01();
				String menu02 = mvo.getMenu02();
				String menu03 = mvo.getMenu03();
				String menu04 = mvo.getMenu04();
				session.setAttribute("USERNAME", mvo.getUsername());
				session.setAttribute("USERTYPE", mvo.getUsertype());
				session.setAttribute("USERID", mvo.getUserid());

				modelMap.addAttribute("mvo", mvo);

				LeftMenuUtil lmu = new LeftMenuUtil();
				//lmu.setUserProgram("ADMINLOGIN", mvo.getUserid());


				String USERID = "";
				if ( request.getSession().getAttribute("USERID") != null ) {
					USERID = (String)request.getSession().getAttribute("USERID");
				}
				String USERTYPE = "";
				if ( request.getSession().getAttribute("USERTYPE") != null ) {
					USERTYPE = (String)request.getSession().getAttribute("USERTYPE");
				}

				if ( USERTYPE.equals("SA") ) {

					//mvo = member1Svc.selectMainStat(USERID);
					//modelMap.addAttribute("mvo", mvo);

					session.setAttribute("menu01", "Y");
					session.setAttribute("menu02", "Y");
					session.setAttribute("menu03", "Y");
					session.setAttribute("menu04", "Y");
					return "01";
				}else {
					session.setAttribute("menu01", menu01);
					session.setAttribute("menu02", menu02);
					session.setAttribute("menu03", menu03);
					session.setAttribute("menu04", menu04);
					mvo = member1Svc.selectMainStat2(USERID);
					modelMap.addAttribute("mvo", mvo);

					System.out.println(menu04);
					System.out.println(menu03);
					System.out.println(menu02);
					System.out.println(menu01);
					if(menu04.equals("Y")){
						menuval = "04";
					}
					if(menu03.equals("Y")){
						menuval = "03";
					}
					if(menu02.equals("Y")){
						menuval = "02";
					}
					if(menu01.equals("Y")){
						menuval = "01";
					}
					return menuval;
				}

		} else {
			return "FALSE";
		}
	}

	@RequestMapping(value = "/memberList")
	public String member1List(HttpServletRequest request, SearchVO searchVO, ModelMap modelMap){



		List<?> listsel  = member1Svc.selectCode2SelList();

		searchVO.setDisplayRowCount(10);
		searchVO.pageCalculate( member1Svc.selectMember1Count(searchVO) ); // startRow, endRow
		List<?> listview  = member1Svc.selectMember1List(searchVO);


		modelMap.addAttribute("listsel", listsel);
		modelMap.addAttribute("listview", listview);
		modelMap.addAttribute("searchVO", searchVO);
		return "member1/MemberList";
	}

	@RequestMapping(value = "/memberExcel")
	public String member1Ex(HttpServletRequest request,SearchVO searchVO, ModelMap modelMap) {

		List<?> listview  = member1Svc.selectMember1Excel(searchVO);
		modelMap.addAttribute("listview", listview);



		return "member1/MemberExcel";
	}

	@RequestMapping(value = "/member1Read")
	public String member1Read(HttpServletRequest request,SearchVO searchVO, ModelMap modelMap, ProjectVO projectVO) {

		String uid = request.getParameter("userid");

		Member1VO param = new Member1VO();

		param = member1Svc.selectMember1Read(uid);

		modelMap.addAttribute("mvo", param);
		searchVO.setUserid(uid);
		List<?> plist  = member1Svc.projectmember(searchVO);
		modelMap.addAttribute("plist", plist);
		List<?> listsel  = member1Svc.selectCode2SelList();
		modelMap.addAttribute("listsel", listsel);

		return "member1/MemberForm";
	}

	@RequestMapping(value = "/tableBasic")
	public String tableBasic(
			HttpServletRequest request,SearchVO searchVO, ModelMap modelMap) {

		return "member1/TableBasic";
	}

	@RequestMapping(value = "/ContentsUpdate")
	public String ContentsUpdate(SearchVO searchVO, 
			HttpServletRequest request, BannerVO banner1Info,
			ModelMap modelMap) {

		
		FileUtil fs = new FileUtil();
		List<FileVO> filelist = fs.saveAllFilesBB(banner1Info.getUploadfile());

		member1Svc.updateContents(banner1Info,filelist);

		searchVO.pageCalculate( member1Svc.selectContents1Count(searchVO) ); // startRow, endRow

		List<?> listview  = member1Svc.selectContents1List(searchVO);

		modelMap.addAttribute("listview", listview);
		modelMap.addAttribute("searchVO", searchVO);

		return "member1/ContentsList";
	}
	
	@RequestMapping(value = "/ContentsDelete")
	public String ContentsDelete(SearchVO searchVO, 
			HttpServletRequest request, BannerVO banner1Info,
			ModelMap modelMap) {

		
		
		member1Svc.ContentsDelete(request.getParameter("sn"));

		

		return "redirect:ContentsList";

	}

	@RequestMapping(value = "/ContentsSave")
	public String ContentsSave(SearchVO searchVO, 
			HttpServletRequest request, BannerVO banner1Info,
			ModelMap modelMap) {

		String USERID = "";
		if ( request.getSession().getAttribute("USERID") != null ) {
			USERID = (String)request.getSession().getAttribute("USERID");
		}
		String USERTYPE = "";
		if ( request.getSession().getAttribute("USERTYPE") != null ) {
			USERTYPE = (String)request.getSession().getAttribute("USERTYPE");
		}

		FileUtil fs = new FileUtil();
		List<FileVO> filelist = fs.saveAllFilesBB(banner1Info.getUploadfile());
		member1Svc.insertContents(banner1Info,filelist);

		if ( USERTYPE.equals("CP")) {



			searchVO.setUserid(USERID);

			searchVO.pageCalculate( member1Svc.selectContents12Count(searchVO) ); // startRow, endRow

			List<?> listview  = member1Svc.selectContents12List(searchVO);

			modelMap.addAttribute("listview", listview);
			modelMap.addAttribute("searchVO", searchVO);
			
			
		
		}else {
			searchVO.pageCalculate( member1Svc.selectContents1Count(searchVO) ); // startRow, endRow

			List<?> listview  = member1Svc.selectContents1List(searchVO);

			modelMap.addAttribute("listview", listview);
			modelMap.addAttribute("searchVO", searchVO);
			
			
		}
		
		return "member1/ContentsList";
	}


	@RequestMapping(value = "/ContentsForm")
	public String ContentsForm(SearchVO searchVO, 
			HttpServletRequest request, BannerVO banner1Info,
			ModelMap modelMap) {

		String USERID = "";
		if ( request.getSession().getAttribute("USERID") != null ) {
			USERID = (String)request.getSession().getAttribute("USERID");
		}
		String USERTYPE = "";
		if ( request.getSession().getAttribute("USERTYPE") != null ) {
			USERTYPE = (String)request.getSession().getAttribute("USERTYPE");
		}
		if( USERTYPE.equals("CP")) {
		banner1Info.setUserid(USERID);}
		
		modelMap.addAttribute("banner1Info", banner1Info);
		
		return "member1/ContentsForm";
	}

	@RequestMapping(value = "/usertypeList")
	public String usertypeList(HttpServletRequest request, SearchVO searchVO, ModelMap modelMap, HttpSession session) {

		searchVO.pageCalculate( member1Svc.selectMemberCodeCount(searchVO) );
		List<?> listGrade  = member1Svc.selectMemberCode(searchVO);
		List<?> listsel  = member1Svc.selectCode2SelList();
		modelMap.addAttribute("listGrade", listGrade);
		modelMap.addAttribute("searchVO", searchVO);
		modelMap.addAttribute("listsel", listsel);
		return "member1/usertypelist";
	}

	@RequestMapping(value = "/usertypeRead")
	public String usertypeRead(HttpServletRequest request, SearchVO searchVO, ModelMap modelMap, HttpSession session) {

		String sn = "";
		if ( request.getParameter("sn")!= null) {
			sn = request.getParameter("sn");
		}
		Member1VO mvo = new Member1VO();
		mvo = member1Svc.selectCode1One(sn);
		modelMap.addAttribute("mvo", mvo);


		return "member1/usertypeRead";

	}

	@RequestMapping(value = "/loginList")
	public String loginList(HttpServletRequest request, SearchVO searchVO, ModelMap modelMap, Member1VO member1VO) {

		String userid = "";
		userid = request.getParameter("userid");
		searchVO.setUserid(userid);

		searchVO.setDisplayRowCount(10);
		searchVO.pageCalculate( member1Svc.selectLoginCount(searchVO) );
		List<Member1VO> loginlist = member1Svc.loginHistory(searchVO);
		modelMap.addAttribute("loginlist", loginlist);
		modelMap.addAttribute("searchVO", searchVO);
		return "member1/loginhistory";

	}

	@RequestMapping(value = "/usertypeSave")
	public String usertypeSave(Member1VO mvo,HttpServletRequest request, SearchVO searchVO, ModelMap modelMap, HttpSession session) {
		mvo.setCode1("USER");
		mvo.setCode1memo("회원");
		String USERID = "";
		if ( request.getSession().getAttribute("USERID") != null ) {
			USERID = (String)request.getSession().getAttribute("USERID");
		}
		System.out.println(USERID);
		mvo.setUserid(USERID);
		member1Svc.insertUserType(mvo);

		return "redirect:usertypeList";

	}

	@RequestMapping(value = "/userTypeForm")
	public String userTypeForm(HttpServletRequest request, SearchVO searchVO, ModelMap modelMap, HttpSession session) {

		String code1 = "";
		if ( request.getParameter("code1") != null) {
			code1 = request.getParameter("code1");
		}

		List<?> listsel  = member1Svc.selectCode1SelList();

		modelMap.addAttribute("listsel", listsel);

		modelMap.addAttribute("code1", code1);


		return "member1/usertypeForm";

	}

	@RequestMapping(value = "/userTypeDelete")
	public String userTypeDelete(HttpServletRequest request) {

		String sn = "";
		if ( request.getParameter("sn") != null) {
			sn = request.getParameter("sn");
		}
		member1Svc.deleteCode1One(sn);
		return "redirect:usertypeList";


	}


	@ResponseBody
	@RequestMapping(value = "/dupUserid")
	public Integer dupUserid(HttpServletRequest request, SearchVO searchVO , Map<String,Object> commandMap, ProjectVO projectInfo, ModelMap modelMap) throws Exception{

		try {
			String userid = request.getParameter("userid");
			return member1Svc.selDupUserid(userid);

		} catch (Exception e) {
			//System.out.println(e.getMessage());
			return 0;
		}

	}

	@RequestMapping(value="/ExcelDownloadC")
	public void ExcelDownload(HttpServletResponse response, SearchVO searchVO, Model model, Member1VO member1VO) throws Exception {

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
		objCell.setCellValue("원본URL");
		objCell.setCellStyle(styleHd);

		objCell = objRow.createCell(4);
		objCell.setCellValue("출처");
		objCell.setCellStyle(styleHd);

		objCell = objRow.createCell(5);
		objCell.setCellValue("타이틀");
		objCell.setCellStyle(styleHd);

		objCell = objRow.createCell(6);
		objCell.setCellValue("키워드");
		objCell.setCellStyle(styleHd);

		objCell = objRow.createCell(7);
		objCell.setCellValue("등록일");
		objCell.setCellStyle(styleHd);

		objCell = objRow.createCell(8);
		objCell.setCellValue("등록자");
		objCell.setCellStyle(styleHd);


		List<Member1VO> listview  = member1Svc.selectexcelList(searchVO);
		// listview.forEach(s -> );
		int rowNo = 1;
		String str = "";
		ArrayList val;
		for(Member1VO list : listview){
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
			objCell.setCellValue(""+list.getCtSource());
			objCell.setCellStyle(styleHd);

			objCell = objRow.createCell(5);
			objCell.setCellValue(""+str);
			objCell.setCellStyle(styleHd);

			objCell = objRow.createCell(6);
			objCell.setCellValue(""+list.getKeyword());
			objCell.setCellStyle(styleHd);

			objCell = objRow.createCell(7);
			objCell.setCellValue(""+list.getCrtdate());
			objCell.setCellStyle(styleHd);

			objCell = objRow.createCell(8);
			objCell.setCellValue(""+list.getUserid());
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

	@ResponseBody
	@RequestMapping(value = "/selCodeTitCt")
	public Integer selCodeTitCt(HttpServletRequest request, SearchVO searchVO , Map<String,Object> commandMap,ProjectVO projectInfo, ModelMap modelMap) throws Exception{

		try {
			String code2 = request.getParameter("code2");
			return member1Svc.selCodeTitCt(code2);

		} catch (Exception e) {
			//System.out.println(e.getMessage());
			return 0;
		}

	}
}


