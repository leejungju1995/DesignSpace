package com.project.qnaBoard.controller;

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

import com.project.member.model.MemberDto;
import com.project.qnaBoard.model.QnaBoardDto;
import com.project.qnaBoard.service.QnaBoardService;
import com.project.util.CommentPaging;

@Controller
public class QnaBoardController {

	private static final Logger log = 
			LoggerFactory.getLogger(QnaBoardController.class);
	
	@Autowired
	private QnaBoardService qnaBoardService;
	
	
	// qna게시판 목록
	@RequestMapping(value = "qnaBoard/list.do", method = RequestMethod.GET)
	public String qnaBoardList(@RequestParam(defaultValue = "1") int curPage
							 , @RequestParam(defaultValue = "0") int qna_board_no
							 , @RequestParam(defaultValue = "titleAndContent") String searchOption
							 , @RequestParam(defaultValue = "qna_board_whole") String sortOption
							 , @RequestParam(defaultValue = "") String keyword
							 , Model model) {
		log.info("Welcome qnaBoardList! " + curPage + " : ????"
				+ searchOption + " : " + keyword + sortOption);
		
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
				qnaBoardService.qnaBoardSelectTotalCount(searchOption, keyword, sortOption, 0);
		
		if(qna_board_no != 0) {
			curPage 
				= qnaBoardService.qnaSelectCurPage(searchOption, keyword, qna_board_no);
		}
		
		com.project.util.Paging qnaBoardPaging = new com.project.util.Paging(totalCount, curPage);
		int start = qnaBoardPaging.getPageBegin();
		int end = qnaBoardPaging.getPageEnd();
				
		List<QnaBoardDto> qnaBoardList = qnaBoardService.qnaBoardSelectList(
				searchOption, keyword, sortOption, start, end, 0);
		
//		 화면의 form의 이름을 맞추기 위한 작업
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
		
		model.addAttribute("qnaBoardList", qnaBoardList);
		
		return "board/qna/qnaBoardList";
	}
	
	// qna 게시판 상세조회
	@RequestMapping(value = "qnaBoard/listDetail.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String qnaBoardListDetail(@RequestParam(defaultValue = "1") int curPage
			 , @RequestParam(defaultValue = "0") int qna_board_no
			 , @RequestParam(defaultValue = "titleAndContent") String searchOption
			 , @RequestParam(defaultValue = "qna_board_whole") String sortOption
			 , @RequestParam(defaultValue = "") String keyword
			 , Model model) {
		
		log.info("Welcome qnaBoardListDetail! " + curPage + " : ????"
				+ searchOption + " : " + keyword);
		
		QnaBoardDto qnaBoardDto = qnaBoardService.qnaBoardSelectDetail(qna_board_no);
		
		model.addAttribute("qnaBoardDto", qnaBoardDto);
		
		int totalCount = 
				qnaBoardService.qnaBoardCommentSelectTotalCount(qna_board_no);
		
		CommentPaging qnaCommentPaging = new CommentPaging(totalCount, curPage);
		int end = qnaCommentPaging.getPageEnd();
				
		List<QnaBoardDto> qnaBoardCommentList = 
				qnaBoardService.qnaBoardCommentSelectList(qna_board_no, end);
		
		model.addAttribute("qnaBoardCommentList", qnaBoardCommentList);
		model.addAttribute("freeBoardCommentPaging", qnaCommentPaging);
		
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("keyword", keyword);
		model.addAttribute("sortOption", sortOption);
		
		return "board/qna/qnaBoardDetail";
	}
	
	// qna 게시판 추가화면
	@RequestMapping(value = "qnaBoard/add.do", method = RequestMethod.GET)
	public String qnaBoardAdd(Model model) {
		
		log.info("call qnaBoardAdd!");
		
		return "board/qna/qnaBoardAdd";
	}
	
	// qna 게시판 추가로직
	@RequestMapping(value = "qnaBoard/addCtr.do", method = RequestMethod.POST)
	public String qnaBoardAddCtr(QnaBoardDto qnaBoardDto, Model model) {
		
		log.info("call qnaBoardAdd_ctr! {}", qnaBoardDto);
		
		qnaBoardService.qnaBoardInsertOne(qnaBoardDto);
		
		return "redirect:./list.do";
	}
	
	// qna 게시물 수정
	@RequestMapping(value = "qnaBoard/update.do", method = RequestMethod.GET)
	public String qnaBoardUpdate(int qna_board_no, Model model) {
		
		log.info("call qnaBoardUpdate! {}", qna_board_no);
		
		QnaBoardDto qnaBoardDto = qnaBoardService.qnaBoardSelectDetail(qna_board_no);
		
		model.addAttribute("qnaBoardDto", qnaBoardDto);
		
		return "board/qna/qnaBoardUpdate";
	}
	
	// qna 게시물 수정 로직
	@RequestMapping(value = "qnaBoard/updateCtr.do", method = RequestMethod.POST)
	public String qnaBoardUpdateCtr(QnaBoardDto qnaBoardDto, Model model) {
		
		log.info("call qnaBoardUpdateCtr! " + qnaBoardDto);
		
		qnaBoardService.qnaBoardUpdateOne(qnaBoardDto);
		
		int qna_board_no = qnaBoardDto.getQna_board_no();
		
		model.addAttribute("qnaBoardDto", qnaBoardDto);
		model.addAttribute("qna_board_no", qna_board_no);
		
		return "redirect:listDetail.do";
	}
	
	@RequestMapping(value = "qnaBoard/deleteCtr.do", method = RequestMethod.GET)
	public String qnaBoardDeleteCtr(int qna_board_no, Model model) {
		
		log.info("call qnaBoardDelete_ctr! " + qna_board_no);
		
		qnaBoardService.qnaCommentDelete(qna_board_no);
		
		qnaBoardService.qnaBoardDeleteOne(qna_board_no);
		
		return "redirect:list.do";
	}
	
	
	@RequestMapping(value="qnaBoard/commentAddCtr.do", method = RequestMethod.GET)
	public String qnaBoardCommentAddCtr(int qna_board_no, int qna_comment_mno, int qna_comment_qbno
			, String searchOption , String keyword , String qna_comment_comments
			, String sortOption, Model model, HttpSession session) {
		
		log.info("call qnaBoardCommentAdd_ctr! {} {} ", qna_comment_mno, qna_comment_qbno);
		
		MemberDto sessionMemberDto = (MemberDto) session.getAttribute("memberDto");
		
		if(sessionMemberDto.getMember_grade() == 1) {
			qnaBoardService.changeUpdateStatus(qna_comment_qbno);
		}
		
		qnaBoardService.qnaBoardCommentInsertOne(qna_comment_qbno, qna_comment_mno, qna_comment_comments);
		
		model.addAttribute("qna_board_no", qna_board_no);
		model.addAttribute("qna_comment_mno", qna_comment_mno);
		model.addAttribute("qna_comment_qbno", qna_comment_qbno);
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("keyword", keyword);
		model.addAttribute("qna_comment_comments", qna_comment_comments);
		model.addAttribute("sortOption", sortOption);
		
		return "redirect:/qnaBoard/listDetail.do";
	}
	
	@RequestMapping(value = "qnaBoard/commentDeleteCtr.do", method = RequestMethod.GET)
	public String qnaBoardCommentDeleteCtr(int qna_comment_no
			, int qna_board_no
			, int qna_comment_qbno
			, int qna_comment_mno
			, String searchOption
			, String keyword
			, String sortOption
			, String qna_comment_comments
			, Model model) {
		
		log.info("call qnaBoardCommentDelete_ctr! " + qna_comment_no);
		
		qnaBoardService.qnaCommentDeleteOne(qna_comment_no);
		
		model.addAttribute("qna_comment_no", qna_comment_no);
		model.addAttribute("qna_board_no", qna_board_no);
		model.addAttribute("qna_comment_qbno", qna_comment_qbno);
		model.addAttribute("qna_comment_mno", qna_comment_mno);
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("keyword", keyword);
		model.addAttribute("sortOption", sortOption);
		model.addAttribute("qna_comment_comments", qna_comment_comments);
		
		return "redirect:/qnaBoard/listDetail.do";
	}
	
	@RequestMapping(value = "qnaBoard/commentUpdateCtr.do", method = RequestMethod.GET)
	public String qnaBoardCommentUpdateCtr(int qna_comment_no, String searchOption
											, String keyword, String qna_comment_comments, Model model) {
		
		log.info("call qnaBoardCommentUpdate_ctr! " + qna_comment_no);
		
		qnaBoardService.qnaCommentUpdateOne(qna_comment_no, qna_comment_comments);
		
		return "forward:/qnaBoard/listDetail.do";
	}
	
	@RequestMapping(value = "qnaBoard/answerCompleteCtr.do", method = RequestMethod.GET)
	public String answerCompleteCtr(int qna_board_no, String searchOption,
			String keyword, Model model, HttpSession session) {
		
		log.info("call answerComplete_ctr! " + qna_board_no);
		
		qnaBoardService.answerCompleteChange(qna_board_no);
		
		return "forward:/qnaBoard/listDetail.do";
	}
	
	@RequestMapping(value = "qnaBoard/managementDeleteCtr.do", method = RequestMethod.GET)
	public String qnaBoardManagementDelete(int[] qnaCheck, HttpSession session, Model model) {		
		
		System.out.println(qnaCheck.length);
		for (int i = 0; i < qnaCheck.length; i++) {
			qnaBoardService.qnaCommentDelete(qnaCheck[i]);
			qnaBoardService.qnaBoardDeleteOne(qnaCheck[i]);
		}
		
		return "redirect:/qnaBoard/list.do";
	}
	
}
