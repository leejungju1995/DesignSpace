package com.project.projectBoard.controller;

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
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.member.model.MemberDto;
import com.project.projectBoard.model.ProjectBoardDto;
import com.project.projectBoard.model.ProjectBoardFileDto;
import com.project.projectBoard.model.ProjectCommentDto;
import com.project.projectBoard.service.ProjectBoardService;
import com.project.util.CommentPaging;
import com.project.util.Paging;
import com.project.util.ProjectBoardPaging;


@Controller
public class ProjectController {

	private static final Logger log = 
		LoggerFactory.getLogger(ProjectController.class);

	@Autowired
	private ProjectBoardService projectBoardService;
	
//	============================== 메인페이지
	@RequestMapping(value = "main/member.do", method = RequestMethod.GET)
	public String mainMember(HttpSession session, Model model) {
		
		return "main/mainMember";
	}
	
	@RequestMapping(value = "main/admin.do", method = RequestMethod.GET)
	public String adminMember(HttpSession session, Model model) {
		
		Map<String, Object> infoListMap = projectBoardService.selectInfoList();
		
		model.addAttribute("infoListMap", infoListMap);
		
		return "main/mainAdmin";
	}
//	============================== 작품게시판
	@RequestMapping(value = "projectBoard/list.do", method = RequestMethod.GET)
	public String projectBoard(@RequestParam(defaultValue="1") int curPage
			, @RequestParam(defaultValue="project_board_no") String sortOption
			, @RequestParam(defaultValue="all") String categoryOption
			, @RequestParam(defaultValue="member_nick") String searchOption
			, @RequestParam(defaultValue="") String keyword
			, @RequestParam(defaultValue="") String pageOption
			, HttpSession session
			, Model model) {
		
		// 전체 작품리스트 조회		
//		작품 페이징 관련
		MemberDto sessionMemberDto = (MemberDto)session.getAttribute("memberDto");
		int memberNo = sessionMemberDto.getMember_no();
		int totalCnt = projectBoardService.projectBoardTotalCount(searchOption, keyword, categoryOption, pageOption, memberNo); 
		
		System.out.println(totalCnt);
		
		ProjectBoardPaging projectBoardPaging = new ProjectBoardPaging(totalCnt, curPage);
		int start = projectBoardPaging.getPageBegin();
		int end = projectBoardPaging.getPageEnd();
		
//		리스트 조회조건 맵에 저장
		Map<String, Object> listOptionMap = new HashMap<>();
		listOptionMap.put("sortOption", sortOption);
		listOptionMap.put("categoryOption", categoryOption);
		listOptionMap.put("searchOption", searchOption);
		listOptionMap.put("keyword", keyword);
		
//		작품 리스트 조회
		List<ProjectBoardDto> projectBoardList = 
			projectBoardService.projectBoardSelectList(searchOption, keyword, sortOption, categoryOption, start, end, pageOption, memberNo);
		
		// 모델로 필요정보 넘김
		model.addAttribute("projectBoardList", projectBoardList);
		model.addAttribute("projectBoardPaging", projectBoardPaging);
		model.addAttribute("listOptionMap", listOptionMap);
		
		return "board/project/projectBoardList";
	}
	
	@RequestMapping(value = "projectBoard/projectView.do", method = RequestMethod.GET)
	public String projectView(int project_board_no
			, @RequestParam(defaultValue="1") int curPage
			, @RequestParam(defaultValue="project_board_no") String sortOption
			, @RequestParam(defaultValue="all") String categoryOption
			, @RequestParam(defaultValue="member_nick") String searchOption
			, @RequestParam(defaultValue="") String keyword
			, @RequestParam(defaultValue="") String pageOption
			, int chkPage
			, HttpSession session, Model model) {
		
		projectBoardService.projectView(project_board_no);
		
		model.addAttribute("project_board_no", project_board_no);
		model.addAttribute("chkPage", chkPage);
		
		model.addAttribute("curPage", curPage);
		model.addAttribute("sortOption", sortOption);
		model.addAttribute("categoryOption", categoryOption);
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("keyword", keyword);
		model.addAttribute("pageOption", pageOption);
		
		return "forward:/projectBoard/detail.do";
	}
	
	@RequestMapping(value = "projectBoard/like.do", method = RequestMethod.GET)
	public String like(int chkPage, int project_board_no, int mno, HttpSession session, Model model) {
				
		projectBoardService.projectLike(project_board_no, mno);
				
		return "forward:/projectBoard/detail.do";
	}
	
	@RequestMapping(value = "projectBoard/likeUpdate.do", method = RequestMethod.GET)
	public String likeUpdate(int chkPage, int project_board_no, int mno, HttpSession session, Model model) {
		
		projectBoardService.projectLikeUpdate(project_board_no, mno);

		return "forward:/projectBoard/detail.do";
	}
	
	@RequestMapping(value = "projectBoard/likeDelete.do", method = RequestMethod.GET)
	public String likeDelete(int chkPage, int project_board_no, int mno, HttpSession session, Model model) {

		projectBoardService.projectLikeDelete(project_board_no, mno);	

		return "forward:/projectBoard/detail.do";
	}
	
	@RequestMapping(value = "projectBoard/detail.do", method = RequestMethod.GET)
	public String projectBoardDetail(int project_board_no
			,@RequestParam(defaultValue="0") int chkPage
			, @RequestParam(defaultValue="1") int curPage
			, @RequestParam(defaultValue="project_board_no") String sortOption
			, @RequestParam(defaultValue="all") String categoryOption
			, @RequestParam(defaultValue="member_nick") String searchOption
			, @RequestParam(defaultValue="") String keyword
			, @RequestParam(defaultValue="") String pageOption  
			, HttpSession session, Model model) {
		
		// 하나의 작품 상세 정보 전달 ( 작품, 파일 )
		ProjectBoardDto projectBoardDto = projectBoardService.projectBoardSelectOne(project_board_no);
		projectBoardDto.setProject_board_no(project_board_no);
		List<ProjectBoardFileDto> projectBoardFileList = projectBoardService.projectBoardFileSelectList(project_board_no);

		// 작품에 대한 댓글정보 전달
		List<ProjectCommentDto> projectCommentList = projectBoardService.projectCommentSelectList(project_board_no); 
		
		// 좋아요 체크
		MemberDto sessionMemberDto = (MemberDto)session.getAttribute("memberDto");
		int member_no = sessionMemberDto.getMember_no();
		Map<String, Object> projectLikeFlag = projectBoardService.projectLikeFlag(project_board_no, member_no); 
		
		// 검색조건
		Map<String, Object> searchOptionMap = new HashMap<String, Object>();
		searchOptionMap.put("curPage", curPage);
		searchOptionMap.put("sortOption", sortOption);
		searchOptionMap.put("categoryOption", categoryOption);
		searchOptionMap.put("searchOption", searchOption);
		searchOptionMap.put("keyword", keyword);
		
		// 모델로 필요정보 넘김
		model.addAttribute("projectBoardDto", projectBoardDto);
		model.addAttribute("projectBoardFileList", projectBoardFileList);
		model.addAttribute("projectCommentList", projectCommentList);
		model.addAttribute("projectLikeFlag", projectLikeFlag);
		model.addAttribute("chkPage", chkPage);
		model.addAttribute("searchOptionMap", searchOptionMap);
		
		return "board/project/projectBoardDetail";
	}
	
	@RequestMapping(value = "projectBoard/add.do", method = RequestMethod.GET)
	public String projectBoardAdd(int chkPage, HttpSession session, Model model) {
		
		model.addAttribute("chkPage", chkPage);
		
		return "board/project/projectBoardAdd";
	}
	
	@RequestMapping(value = "projectBoard/addCtr.do", method = RequestMethod.POST)
	public String projectBoardAddCtr(ProjectBoardDto projectBoardDto, MultipartHttpServletRequest mulRequest, HttpSession session, Model model) {
		
		MemberDto sessionMemberDto = (MemberDto)session.getAttribute("memberDto");
		
		int checkInsert = projectBoardService.projectBoardInsertOne(projectBoardDto, sessionMemberDto, mulRequest);
		
		return "redirect:/projectBoard/list.do";
	}
	
	@RequestMapping(value = "projectBoard/update.do", method = RequestMethod.GET)
	public String projectBoardUpdate(int chkPage, int project_board_no, HttpSession session, Model model) {
		
		ProjectBoardDto projectBoardDto = projectBoardService.projectBoardSelectOne(project_board_no);
		projectBoardDto.setProject_board_no(project_board_no);
		List<ProjectBoardFileDto> projectBoardFileList = projectBoardService.projectBoardFileSelectList(project_board_no);
		
		// 모델로 필요정보 넘김
		model.addAttribute("projectBoardDto", projectBoardDto);
		model.addAttribute("projectBoardFileList", projectBoardFileList);
		model.addAttribute("chkPage", chkPage);
		
		return "board/project/projectBoardUpdate";
	}
	
	@RequestMapping(value = "projectBoard/updateCtr.do", method = RequestMethod.POST)
	public String projectBoardUpdateCtr(int chkPage, String[] chkListFlag, String[] chkListFile, ProjectBoardDto projectBoardDto, MultipartHttpServletRequest mulRequest, HttpSession session, Model model) {
		
		try {
			int checkUpdate = projectBoardService.projectBoardUpdateOne(chkListFlag, chkListFile, projectBoardDto, mulRequest);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		// 모델로 필요정보 넘김
		model.addAttribute("project_board_no", projectBoardDto.getProject_board_no());
		model.addAttribute("chkPage", chkPage);
		
		return "redirect:/projectBoard/detail.do";
	}
	
	@RequestMapping(value = "projectBoard/deleteCtr.do", method = RequestMethod.GET)
	public String projectBoardUpdateCtr(int project_board_no, HttpSession session, Model model) {		
		
		projectBoardService.projectBoardDeleteOne(project_board_no);
		
		return "redirect:/projectBoard/list.do";
	}
	
	@RequestMapping(value = "projectBoard/commentAddCtr.do", method = RequestMethod.GET)
	public String projectBoardCommentAddCtr(ProjectCommentDto projectCommentDto, HttpSession session, Model model) {		
				
		projectBoardService.projectCommentInsertOne(projectCommentDto);
		
		int project_board_no = projectCommentDto.getPROJECT_COMMENT_PBNO();
		
		model.addAttribute("project_board_no", project_board_no);
		
		return "redirect:/projectBoard/detail.do";
	}
	
	@RequestMapping(value = "projectBoard/commentUpdateCtr.do", method = RequestMethod.GET)
	public String projectBoardCommentUpdateCtr(ProjectCommentDto projectCommentDto, HttpSession session, Model model) {		
		
		projectBoardService.projectCommentUpdateOne(projectCommentDto);
		
		int project_board_no = projectCommentDto.getPROJECT_COMMENT_PBNO();
		
		model.addAttribute("project_board_no", project_board_no);
		
		return "redirect:/projectBoard/detail.do";
	}
	
	@RequestMapping(value = "projectBoard/commentDeleteCtr.do", method = RequestMethod.GET)
	public String projectBoardCommentDeleteCtr(ProjectCommentDto projectCommentDto, HttpSession session, Model model) {		
		
		projectBoardService.projectCommentDeleteOne(projectCommentDto.getPROJECT_COMMENT_NO());
		
		int project_board_no = projectCommentDto.getPROJECT_COMMENT_PBNO();
		
		model.addAttribute("project_board_no", project_board_no);
		
		return "redirect:/projectBoard/detail.do";
	}
	
//	============================== 관리자용 작품관리 
	@RequestMapping(value = "projectBoard/management.do", method = RequestMethod.GET)
	public String projectBoardManagement(@RequestParam(defaultValue="1") int curPage
			, @RequestParam(defaultValue="project_board_no") String sortOption
			, @RequestParam(defaultValue="all") String categoryOption
			, @RequestParam(defaultValue="project_board_title") String searchOption
			, @RequestParam(defaultValue="") String keyword
			, @RequestParam(defaultValue="admin") String pageOption
			,HttpSession session, Model model) {		
						
		int memberNo = 1;
		
		// 페이징
		int totalCnt = projectBoardService.projectBoardTotalCount(searchOption, keyword, categoryOption, pageOption, memberNo); 
		
		Paging projectBoardPaging = new Paging(totalCnt, curPage);
		int start = projectBoardPaging.getPageBegin();
		int end = projectBoardPaging.getPageEnd();
		
		// ※※※※※ 작품관리 selectList 변수 수정해야함 ! 페이징화 시키기 !
		List<ProjectBoardDto> projectBoardList = 
			projectBoardService.projectBoardSelectList(searchOption, keyword, sortOption, categoryOption, start, end, pageOption, memberNo);		
		
//		리스트 조회조건 맵에 저장
		Map<String, Object> listOptionMap = new HashMap<>();
//		기타 정렬 이용할 시 사용
//		listOptionMap.put("sortOption", sortOption); 
//		listOptionMap.put("categoryOption", categoryOption);
		listOptionMap.put("searchOption", searchOption);
		listOptionMap.put("keyword", keyword);
		
//		페이징 관련
		Map<String, Object> pagingMap = new HashMap<>();
		pagingMap.put("paging", projectBoardPaging);
		
		// 모델로 필요정보 넘김
		model.addAttribute("projectBoardList", projectBoardList);
		model.addAttribute("pagingMap", pagingMap);
		model.addAttribute("listOptionMap", listOptionMap);
		
		return "board/project/projectBoardManagement";
	}
	
	@RequestMapping(value = "projectBoard/ManagementDeleteCtr.do", method = RequestMethod.GET)
	public String projectBoardManagementDelete(int[] projectCheck, HttpSession session, Model model) {		
		
		System.out.println(projectCheck.length);
		for (int i = 0; i < projectCheck.length; i++) {
			projectBoardService.projectBoardDeleteOne(projectCheck[i]);
		}
		
		return "redirect:/projectBoard/management.do";
	}
	
}