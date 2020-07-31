package com.project.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.freeBoard.service.FreeBoardService;
import com.project.member.model.MemberBoardDto;
import com.project.member.model.MemberDto;
import com.project.member.service.MemberService;
import com.project.projectBoard.model.ProjectBoardDto;
import com.project.projectBoard.service.ProjectBoardService;
import com.project.qnaBoard.model.QnaBoardDto;
import com.project.qnaBoard.service.QnaBoardService;
import com.project.reportBoard.model.ReportBoardDto;
import com.project.reportBoard.service.ReportBoardService;
import com.project.util.CommentPaging;
import com.project.util.Paging;


@Controller
public class memberController {


	
	private static final Logger log = 
		LoggerFactory.getLogger(memberController.class);


	@Autowired
	private MemberService memberService;	
	
	@Autowired
	private ProjectBoardService projectBoardService;
	
	@Autowired
	private FreeBoardService freeBoardService;
	
	@Autowired
	private ReportBoardService reportBoardService;
	
	@Autowired
	private QnaBoardService qnaBoardService;
	
	@RequestMapping(value = "/login.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String mainLogin(@RequestParam(defaultValue = "")String member_email, Model model) {
		
		log.info("로그인 메인페이지 이동");
		
		
		model.addAttribute("member_email",member_email);
		log.info(member_email);
		
		return "login/loginMain";
	}
	
	@RequestMapping(value = "/member/loginCtr.do", method = RequestMethod.POST)
	public String mainboard(String member_email, String member_pwd, HttpSession session, Model model) {
		log.info("로그인 완료페이지 이동");
		
		MemberDto memberDto = memberService.memberExist(member_email, member_pwd);
		System.out.println("dddddddddddddddddddd"+memberDto);
		
		if (memberDto == null) {
			return "login/alert/missLogin";
		}else{
			session.setAttribute("memberDto",memberDto);
			if(memberDto.getMember_grade()==0) {
				return "redirect:/main/member.do";	
			}else {
				return "redirect:/main/admin.do";	
			}
		}
		
		//return /login/loginDone
		
	}
	
	// 로그아웃
		@RequestMapping(value = "/member/logout.do", method = RequestMethod.GET)
		public String logout(HttpSession session, Model model) {
			log.info("로그아웃 gogo");

			session.invalidate();
			
			return "redirect:/login.do";
		}
	
	
	@RequestMapping(value = "/member/join.do", method = RequestMethod.GET)
	public String memberJoin(Model model) {
		log.info("회원가입페이지 이동");
		return "/login/memberJoin";
	}
	
	@RequestMapping(value = "/member/joinCtr.do", method = RequestMethod.POST)
	public String memberList(MemberDto memberDto, MultipartHttpServletRequest mulRequest, Model model) {
		log.info("회원가입 진행"+memberDto);
		
		
		
		memberService.memberAdd(memberDto, mulRequest);
		
		return "/login/alert/successAlert";
	}
	
	@RequestMapping(value = "/member/findId.do", method = RequestMethod.GET)
	public String findId(Model model) {
		log.info("아이디 찾기페이지로 이동");
		return "/login/findId";
	}
	
	@RequestMapping(value = "/member/findIdCtr.do", method = RequestMethod.POST)
	public String idInput(String member_name, String member_phone, Model model) {
		log.info("회원정보입력(아이디)");
		
		MemberDto memberDto = memberService.memberIdFind(member_name, member_phone);
		System.out.println("ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ"+memberDto);
		
		
		
		if (memberDto==null) {
			return "/login/alert/failIdAlert";
		}else {
			model.addAttribute("member_email",memberDto.getMember_email());
			System.out.println(memberDto.getMember_email());
			return "/login/alert/findIdAlert";
		}
		
		
		
	}
	
	
	@RequestMapping(value = "/member/findPwd.do", method = RequestMethod.GET)
	public String findPwd(Model model) {
		log.info("비밀번호 찾기페이지로 이동");
		return "/login/findPwd";
	}
	//비밀번호 조회
	@RequestMapping(value = "/member/findPwdCtr.do", method = RequestMethod.POST)
	public String pwdInput(String member_email, int member_check_question, String member_check_answer, Model model) {
		log.info("회원정보입력(비밀번호)");
		
		MemberDto memberDto = memberService.memberPwdFind(member_email, member_check_question, member_check_answer);
				
		log.info("회원비밀번호 : " +memberDto);
		
		
		if (memberDto==null) {
			return "/login/alert/failPwdAlert";
		}else {
			model.addAttribute("member_pwd",memberDto.getMember_pwd());
			return "/login/alert/findPwdAlert";

		}
	}
	
	
	//회원정보조회
	@RequestMapping(value = "/member/info.do", method = RequestMethod.GET)
	public String memberInfo(HttpSession session, Model model) {
		log.info("회원정보 조회 페이지 이동");
		
		MemberDto sessionMemeberDto = (MemberDto)session.getAttribute("memberDto");
		System.out.println(sessionMemeberDto);
		
		MemberDto memberDto = memberService.memberInfo(sessionMemeberDto.getMember_no());
		
		
		model.addAttribute("member", memberDto);
		
		return "/member/memberInfo";
	}
		
	//회원정보 수정
	@RequestMapping(value = "/member/modInfo.do", method = RequestMethod.GET)
	public String memberMod(HttpSession session, Model model) {
		log.info("회원정보 수정 페이지 이동");
		
		int member_no = ((MemberDto)session.getAttribute("memberDto")).getMember_no();
		System.out.println(member_no);
		
		String getPwd = memberService.memberMod(member_no);
		
		
		model.addAttribute("member_no", member_no);
		model.addAttribute("member_pwd", getPwd);
		
		
		return "/member/memberModify";
	}
	
	//회원정보 수정 상세
		@RequestMapping(value = "/member/modInfoDetail.do", method = RequestMethod.GET)
		public String memberModDetail(HttpSession session, Model model) {
			log.info("회원정보 상세수정 페이지 이동");
			
			int member_no = ((MemberDto)session.getAttribute("memberDto")).getMember_no();
			
			System.out.println(member_no);
			
			MemberDto memberDto = memberService.memberModDetail(member_no);
			
			model.addAttribute("memberDto", memberDto);
			
			
			return "/member/memberModifyDetail";
		}
		
		@RequestMapping(value = "/member/modInfoDetailCtr.do", method = RequestMethod.POST)
		public String memberUpdate(MemberDto memberDto, String change, MultipartHttpServletRequest mulRequest,
			HttpSession session, Model model){
			
			log.info("회원정보 수정 가즈아"+memberDto);
			
			
			memberService.memberUpdate(memberDto, change, mulRequest);
			
			System.out.println("●▅▇█▇▅▄▄▌●▅▇█▇▅▄▄▌성공●▅▇█▇▅▄▄▌●▅▇█▇▅▄▄▌");
			
			memberDto = memberService.memberExist(memberDto.getMember_email(), memberDto.getMember_pwd());
			session.setAttribute("memberDto",memberDto);
			
			return "/member/alert/updateSuccess";
		}
		//----------------------------------------------------------------------
		
		
		//내글목록
		@RequestMapping(value = "member/myBoard.do", method = RequestMethod.GET)
		   public String projectBoardMyPage(int mno
		         , @RequestParam(defaultValue="1") int curPage
		         , @RequestParam(defaultValue="project_board_no") String sortOption
		         , @RequestParam(defaultValue="all") String categoryOption
		         , @RequestParam(defaultValue="project_board_title") String searchOption
		         , @RequestParam(defaultValue="") String keyword
		         , @RequestParam(defaultValue="my") String pageOption
		         , HttpSession session, Model model) {      

		      //개인 정보 조회
		      MemberDto myMemberDto = projectBoardService.profileSelectOne(mno);
		      
		      // 전체 작품리스트 조회      
//		      작품 페이징 관련
		      
		      int totalCnt = projectBoardService.projectBoardTotalCount(searchOption, keyword, categoryOption, pageOption, mno); 
		      
		      CommentPaging projectBoardPaging = new CommentPaging(totalCnt, curPage);
		      int start = projectBoardPaging.getPageBegin();
		      int end = projectBoardPaging.getPageEnd();
		      
//		      리스트 조회조건 맵에 저장
		      Map<String, Object> listOptionMap = new HashMap<>();
		      listOptionMap.put("sortOption", sortOption);
		      listOptionMap.put("categoryOption", categoryOption);
		      listOptionMap.put("searchOption", searchOption);
		      listOptionMap.put("keyword", keyword);
		      
//		      작품 리스트 조회
		      List<ProjectBoardDto> projectBoardList = 
		         projectBoardService.projectBoardSelectList(searchOption, keyword, sortOption, categoryOption, start, end, pageOption, mno);
		      
		      // 모델로 필요정보 넘김
		      model.addAttribute("projectBoardList", projectBoardList);
		      model.addAttribute("projectBoardPaging", projectBoardPaging);
		      model.addAttribute("listOptionMap", listOptionMap);   
		      model.addAttribute("myMemberDto", myMemberDto);
		      model.addAttribute("mno", mno);
		      
		      return "member/myBoard";
		   }
		
		//내 신고글 이동
		@RequestMapping(value = "/member/myReport.do", method = RequestMethod.GET)
		public String myReportBoardList(@RequestParam(defaultValue = "1") int curPage
								 , @RequestParam(defaultValue = "0") int report_board_no
								 , @RequestParam(defaultValue = "titleAndContent") String searchOption
								 , @RequestParam(defaultValue = "report_board_whole") String sortOption
								 , @RequestParam(defaultValue = "") String keyword
								 , int mno
								 , HttpSession session
								 , Model model) {
			log.info("Welcome reportBoardList! " + curPage + " : ????"
					+ searchOption + " : " + keyword + "회원번호" + mno);
			
			if("writer".equals(searchOption)) {
				searchOption = "member_nick";
			}
			
			if("title".equals(searchOption)) {
				searchOption = "report_board_title";
			}
			
			if("content".equals(searchOption)) {
				searchOption = "report_board_contents";
			}
			
			int totalCount = 
					reportBoardService.reportBoardSelectTotalCount(searchOption, keyword, sortOption, mno);
			
			Paging reportBoardPaging = new Paging(totalCount, curPage);
			int start = reportBoardPaging.getPageBegin();
			int end = reportBoardPaging.getPageEnd();
					
			List<ReportBoardDto> reportBoardList = reportBoardService.reportBoardSelectList(
					searchOption, keyword, sortOption, start, end, mno);
			
//			 화면의 form의 이름을 맞추기 위한 작업
			if("member_nick".equals(searchOption)) {
				searchOption = "writer";
			}
			
			if("report_board_title".equals(searchOption)) {
				searchOption = "title";
			}
			
			if("report_board_contents".equals(searchOption)) {
				searchOption = "content";
			}
			
			// 검색
			HashMap<String, Object> searchMap 
				= new HashMap<String, Object>();
			searchMap.put("searchOption", searchOption);
			searchMap.put("keyword", keyword);
			searchMap.put("sortOption", sortOption);
			
			// 페이징
			Map<String, Object> pagingMap = new HashMap<>();
			pagingMap.put("totalCount", totalCount);
			pagingMap.put("paging", reportBoardPaging);

			model.addAttribute("reportBoardList", reportBoardList);
			model.addAttribute("pagingMap", pagingMap);
			model.addAttribute("searchMap", searchMap);
			
			return "member/myReport";
		}
		
		
		@RequestMapping(value = "/member/myQna.do", method = RequestMethod.GET)
		public String myQnaList(@RequestParam(defaultValue = "1") int curPage
								 , @RequestParam(defaultValue = "0") int qna_board_no
								 , @RequestParam(defaultValue = "titleAndContent") String searchOption
								 , @RequestParam(defaultValue = "qna_board_whole") String sortOption
								 , @RequestParam(defaultValue = "") String keyword
								 , int mno
								 , HttpSession session, Model model) {
			log.info("Welcome qnaBoardList! " + curPage + " : ????"
					+ searchOption + " : " + keyword);
			
			if("writer".equals(searchOption)) {
				searchOption = "member_nick";
			}
			
			if("title".equals(searchOption)) {
				searchOption = "qna_board_title";
			}
			
			if("content".equals(searchOption)) {
				searchOption = "qna_board_contents";
			}
			
			int totalCount = 
					qnaBoardService.qnaBoardSelectTotalCount(searchOption, keyword, sortOption, mno);
			
			Paging qnaBoardPaging = new Paging(totalCount, curPage);
			int start = qnaBoardPaging.getPageBegin();
			int end = qnaBoardPaging.getPageEnd();
			System.out.println("총 카운트 : "+totalCount);		
			List<QnaBoardDto> qnaBoardList = qnaBoardService.qnaBoardSelectList(
					searchOption, keyword, sortOption, start, end, mno);
//			 화면의 form의 이름을 맞추기 위한 작업

			if("member_nick".equals(searchOption)) {
				searchOption = "writer";
			}
			
			if("qna_board_title".equals(searchOption)) {
				searchOption = "title";
			}
			
			if("qna_board_contents".equals(searchOption)) {
				searchOption = "content";
			}
			
			// 검색
			HashMap<String, Object> searchMap 
				= new HashMap<String, Object>();
			searchMap.put("searchOption", searchOption);
			searchMap.put("keyword", keyword);
			searchMap.put("sortOption", sortOption);
			
			// 페이징
			Map<String, Object> pagingMap = new HashMap<>();
			pagingMap.put("totalCount", totalCount);
			pagingMap.put("paging", qnaBoardPaging);

			model.addAttribute("qnaBoardList", qnaBoardList);
			model.addAttribute("pagingMap", pagingMap);
			model.addAttribute("searchMap", searchMap);
			
			return "member/myQna";
		}
		
		@RequestMapping(value = "/admin/listAdmin.do", method = {RequestMethod.GET, RequestMethod.POST})
		public String memberList(HttpSession session, @RequestParam(defaultValue = "1") 
			int curPage
			, @RequestParam(defaultValue = "0") int no
			, @RequestParam(defaultValue = "all") String searchOption
			, @RequestParam(defaultValue = "") String keyword
			, Model model){
			
			log.info("관리자용 회원관리 컬페이지 : " + curPage);
			
//			List<MemberBoardDto> memberList = memberService.getMemberList();
//			
//			model.addAttribute("memberList", memberList);
			
			log.info("관리자용 회원관리! " + "curPage" + curPage+"\\\\"
					+ searchOption + " : " + keyword);
			
			
				
			// 화면의 form의 이름을 마바티스에 편하게 맞추기 위한 로직
//			if("name".equals(searchOption)) {
//				searchOption = "member_name";
//			}
			
			// 페이징을 위한 전체 회원목록 갯수
			int totalCount = 
				memberService.memberSelectTotalCount(
						searchOption, keyword
			);
			
			// 이전 페이지로 회원의 번호가 명확하게 나온 경우
			// 자신의 curPage 찾는 로직 
			if(no != 0) {
				curPage 
					= memberService.memberSelectCurPage(
							searchOption, keyword, no);
			}
			
//						
//						System.out.println("????????: " + curPage);
			
			Paging memberPaging = new Paging(totalCount, curPage);
			int start = memberPaging.getPageBegin();
			int end = memberPaging.getPageEnd();
			
			List<MemberBoardDto> memberList = 
				memberService.memberSelectList(searchOption, keyword
					, start, end);

			// 화면의 form의 이름을 맞추기 위한 작업
//			if("mname".equals(searchOption)) {
//				searchOption = "member_name";
//			}
			
			// 검색
			HashMap<String, Object> searchMap 
				= new HashMap<String, Object>();
			searchMap.put("searchOption", searchOption);
			searchMap.put("keyword", keyword);
			
			// 페이징
			Map<String, Object> pagingMap = new HashMap<>();
			pagingMap.put("totalCount", totalCount);
			pagingMap.put("paging", memberPaging);
			

			model.addAttribute("memberList", memberList);
			model.addAttribute("pagingMap", pagingMap);
			model.addAttribute("searchMap", searchMap);
					
	
	
	
			return "/member/memberListAdmin";
		}
		
		
		
		@RequestMapping(value = "/admin/listOneAdmin.do", method = RequestMethod.GET)
		public String memberOne(int member_no, HttpSession session, int curPage, Model model){
			
			log.info("관리자용 회원정보보기"+member_no);
			
			MemberDto memberDto = memberService.memberModDetail(member_no);
			
			model.addAttribute("memberDto", memberDto);
			model.addAttribute("curPage", curPage);
			
			return "/member/memberInfoAdmin";
		}
		
		//회원탈퇴
		@RequestMapping(value = "/member/remove.do", method = {RequestMethod.GET, RequestMethod.POST})
		public String removeOne(int[] member_chk, 
				@RequestParam(defaultValue = "0") int member_no,HttpSession session){
			
			log.info("회원삭제"+member_no);
			
			MemberDto sessionMemeberDto = (MemberDto)session.getAttribute("memberDto");
			int loginUser = sessionMemeberDto.getMember_no();
			
			
			if(member_no==0) {
				
				System.out.println(member_chk.length);
				
				for (int i = 0; i < member_chk.length; i++) {
					memberService.memberRemove(member_chk[i]);
				}
				
			}else {
				memberService.memberRemove(member_no);
				
				if (member_no==loginUser) {
					session.invalidate();
				}
			}
			
			
			
			
			return "/member/alert/deleteSuccess";
			
		}
		
		
		@ResponseBody
		@RequestMapping(value = "/member/checkNick.do", method = RequestMethod.GET)
		public int checkNick(@RequestParam("nick") String nick) {
	
			log.info("닉네임 중복체크 {}", nick);
	      
			return memberService.checkNick(nick);
		}
		
		@ResponseBody
		@RequestMapping(value = "/member/checkEmail.do", method = RequestMethod.GET)
		public int checkEmail(@RequestParam("email") String email) {
	
			log.info("이메일 중복체크 {}", email);
	      
			return memberService.checkEmail(email);
		}
		
		@ResponseBody
		@RequestMapping(value = "/member/checkPhone.do", method = RequestMethod.GET)
		public int checkPhone(@RequestParam("phone") String phone) {
	
			log.info("번호 중복체크 {}", phone);
	      
			return memberService.checkPhone(phone);
		}
		
}