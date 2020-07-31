package com.project.freeBoard.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.freeBoard.model.FreeBoardDto;
import com.project.freeBoard.service.FreeBoardService;
import com.project.util.CommentPaging;
import com.project.util.Paging;

@Controller
public class FreeBoardController {

	private static final Logger log = 
		LoggerFactory.getLogger(FreeBoardController.class);
	
	@Autowired
	private FreeBoardService freeBoardService;
	
	@RequestMapping(value = "/freeBoard/free.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String free(@RequestParam(defaultValue="1") int curPage
			,@RequestParam(defaultValue = "0") int no
			, @RequestParam(defaultValue = "all") String searchOption
			, @RequestParam(defaultValue = "") String keyword
			, @RequestParam(defaultValue = "free_board_no") String lineTitle
			,@RequestParam(defaultValue = "0") int mno
			,Model model) {
		log.info("Welcome free!" + lineTitle);
		
		
		int totalCount = 
				freeBoardService.freeBoardSelectTotalCount(
						searchOption, keyword, lineTitle
		);
		
		if(no != 0) {
			curPage 
				= freeBoardService.freeBoardSelectCurPage(
						searchOption, keyword, no, lineTitle);
		}
		
		Paging freeBoardPaging = new Paging(totalCount, curPage);
		int start = freeBoardPaging.getPageBegin();
		int end = freeBoardPaging.getPageEnd();

		List<FreeBoardDto> freeBoardList = 
				freeBoardService.freeBoardSelectList(searchOption, keyword
				, start, end, lineTitle);
		
		
		HashMap<String, Object> searchMap 
			= new HashMap<String, Object>();
		searchMap.put("searchOption", searchOption);
		searchMap.put("keyword", keyword);
		
		// 페이징
		
		Map<String, Object> pagingMap = new HashMap<>();
		pagingMap.put("totalCount", totalCount);
		pagingMap.put("paging", freeBoardPaging);
		
		model.addAttribute("lineTitle", lineTitle);
		model.addAttribute("freeBoardList", freeBoardList);
		model.addAttribute("pagingMap", pagingMap);
		model.addAttribute("searchMap", searchMap);
		
		
		return "/board/free/freeBoardListView";
	}

	@RequestMapping(value = "/freeBoard/freeBoardListOne.do"
		, method = {RequestMethod.GET,RequestMethod.POST})
	public String freeBoardList(@RequestParam(defaultValue="0")int no
			,@RequestParam(defaultValue = "all")String searchOption
			,@RequestParam(defaultValue = "")String keyword
			,@RequestParam(defaultValue="1") int curPage
			,int rnum
			,Model model
			,@RequestParam(defaultValue = "free_board_no") String lineTitle
			,@RequestParam(defaultValue="0") int mno
			) {
		log.info("call freeBoardListOne! - " + no + "\n" + searchOption
				+ "\n" + keyword + "\n" + mno + "rnum : " + rnum + "lineTitle : " + lineTitle);
		
		
		Map<String, Object> map = freeBoardService.freeBoardSelectOne(no);
		
		FreeBoardDto freeBoardDto = (FreeBoardDto)map.get("freeBoardDto");
		
		//////

		int totalMoveCount = freeBoardService.selectTotalMoveCount(searchOption, keyword
				,lineTitle);
		
		//////
		int totalCount = 
				freeBoardService.freeBoardCommentSelectTotalCount(no);
		
		CommentPaging freeBoardCommentPaging = new CommentPaging(totalCount, curPage);
		int end = freeBoardCommentPaging.getPageEnd();
		
		List<FreeBoardDto> freeBoardCommentList = 
				freeBoardService.freeBoardCommentSelectList(no, end);
		
		int commentCount = freeBoardService.freeBoardCommentTotalCount(no);
		
		model.addAttribute("freeBoardCommentList", freeBoardCommentList);
		model.addAttribute("freeBoardCommentPaging", freeBoardCommentPaging);
		//////

		String freeBoardLikeList = freeBoardService.freeBoardLikeSelectList(no, mno);
		
		model.addAttribute("no", no);
		model.addAttribute("mno", mno);
		model.addAttribute("totalMoveCount", totalMoveCount);
		model.addAttribute("lineTitle", lineTitle);
		model.addAttribute("rnum", rnum);
		model.addAttribute("commentCount", commentCount);
		model.addAttribute("freeBoardLikeList", freeBoardLikeList);
		model.addAttribute("freeBoardDto", freeBoardDto);
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("keyword", keyword);
		
		return "/board/free/freeBoardListOneView";
	}
	
	@RequestMapping(value="/freeBoard/like.do", method = RequestMethod.GET)
	public String like(int mno, int no
			,String searchOption
			,int rnum
			,String keyword
			,String lineTitle
			,Model model) {
		log.info("좋아요 추가"+mno + ": 회원번호 " + no + "게시물 번호"+ searchOption + keyword);
		freeBoardService.freeBoardLikeInsert(no, mno);
		
		model.addAttribute("rnum", rnum);
		model.addAttribute("mno", mno);
		model.addAttribute("no", no);
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("keyword", keyword);
		model.addAttribute("lineTitle", lineTitle);
		return "redirect:/freeBoard/freeBoardListOne.do#date";
	}
	
	@RequestMapping(value="/freeBoard/likeUpdate.do", method = RequestMethod.GET)
	public String likeUpdate(int mno, int no
			,String searchOption
			,int rnum
			,String keyword
			,String lineTitle
			,Model model) {
		log.info("좋아요 수정"+mno + ": 회원번호 " + no + "게시물 번호"+ searchOption + keyword);
		freeBoardService.freeBoardLikeUpdate(no,mno);
		
		model.addAttribute("rnum", rnum);
		model.addAttribute("mno", mno);
		model.addAttribute("no", no);
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("keyword", keyword);
		model.addAttribute("lineTitle", lineTitle);
		return "redirect:/freeBoard/freeBoardListOne.do#date";
	}
	
	
	
	@RequestMapping(value="/freeBoard/likeDel.do", method = RequestMethod.GET)
	public String likeDel(int mno, int no
			,String searchOption
			,int rnum
			,String keyword
			,String lineTitle
			,Model model) {
		log.info("좋아요 삭제"+mno + ": 회원번호 " + no + "게시물 번호" + searchOption + keyword);
		freeBoardService.freeBoardLikeDel(no, mno);
		model.addAttribute("rnum", rnum);
		model.addAttribute("mno", mno);
		model.addAttribute("no", no);
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("keyword", keyword);
		model.addAttribute("lineTitle", lineTitle);
		return "redirect:/freeBoard/freeBoardListOne.do#date";
	}
	
	@RequestMapping(value="/freeBoard/freeBoardAdd.do", method = {RequestMethod.GET, RequestMethod.POST}) 
	public String freeBoardAdd(@RequestParam(defaultValue = "0") int mno
			,Model model) {
		log.info(mno +"회원번호");
		String memInfo = freeBoardService.freeBoardAddOne(mno);
		
		model.addAttribute("memInfo", memInfo);	
		model.addAttribute("mno", mno);
		return "/board/free/freeBoardForm";
	}
	
	@RequestMapping(value="/freeBoard/freeBoardAddCtr.do", method = RequestMethod.POST) 
	public String freeBoardAddCtr(@RequestParam(defaultValue="0") int mno
			,String writer
			,String title
			,String contents) {
		log.info("게시물 작성 "+mno +"회원번호" + title + contents);
		
		freeBoardService.freeBoardAdd(mno, title, contents);
		
		return "redirect:/freeBoard/free.do";
	}
	
	@RequestMapping(value="/freeBoard/freeBoardView.do", method = RequestMethod.GET)
	public String freeBoardView(int mno, int no
			,String searchOption
			,String keyword
			,int rnum
			,String lineTitle
			,Model model) {
		log.info("조회수"+mno + ": 회원번호 " + no + "게시물 번호" + searchOption + keyword);
		freeBoardService.freeBoardView(no);
		
		model.addAttribute("rnum", rnum);
		model.addAttribute("mno", mno);
		model.addAttribute("no", no);
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("keyword", keyword);
		model.addAttribute("lineTitle", lineTitle);
		return "redirect:/freeBoard/freeBoardListOne.do";
	}
	
	@RequestMapping(value="/freeBoard/freeBoardDeleteCtr.do", method = RequestMethod.GET)
	public String freeBoardDel(int no) {
		log.info("게시물 삭제"+ ": 게시물번호 " + no);
		freeBoardService.freeBoardLikeDelete(no);
		freeBoardService.freeBoardCommentDelete(no);
		freeBoardService.freeBoardDelete(no);
		return "redirect:/freeBoard/free.do";
	}
	
	@RequestMapping(value="/freeBoard/freeBoardAdminDeleteCtr.do", method = RequestMethod.GET)
	public String freeBoardAdminDel(int[] noCheck) {
		
		log.info("게시물 삭제"+ ": 게시물번호 " + noCheck);
		for (int i = 0; i < noCheck.length; i++) {
			freeBoardService.freeBoardLikeDelete(noCheck[i]);
			freeBoardService.freeBoardCommentDelete(noCheck[i]);
			freeBoardService.freeBoardDelete(noCheck[i]);
	      }
		
		return "redirect:/freeBoard/free.do";
	}
	
	
	@RequestMapping(value="/freeBoard/commentAdd.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String commentAdd(int mno, int no
			,String searchOption
			,String keyword
			,int rnum
			,String comments
			,String lineTitle
			,Model model) {
		log.info("댓글 추가"+mno + ": 회원번호 " + no + "게시물 번호"+ searchOption + keyword);
		freeBoardService.freeBoardCommentAdd(no,mno,comments);
		
		model.addAttribute("rnum", rnum);
		model.addAttribute("mno", mno);
		model.addAttribute("no", no);
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("keyword", keyword);
		model.addAttribute("lineTitle", lineTitle);
		return "redirect:/freeBoard/freeBoardListOne.do#comments";
	}
	@RequestMapping(value="/freeBoard/freeBoardUpdate.do", method = {RequestMethod.GET, RequestMethod.POST}) 
	public String freeBoardUpdate(@RequestParam(defaultValue = "0") int no
			,int mno		,String writer
			,String title	,String contents
			,String searchOption	,String keyword
			,String lineTitle
			,Model model, int rnum) {
		log.info("수정 알넘 : "+ rnum);
		String memInfo = freeBoardService.freeBoardAddOne(mno);
		
		Map<String, Object> map = new HashMap<>();
		map.put("mno", mno);
		map.put("no", no);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("writer", writer);
		map.put("title", title);
		map.put("lineTitle", lineTitle);
		map.put("contents", contents);
		map.put("rnum", rnum);
		
		model.addAttribute("memInfo", memInfo);	
		model.addAttribute("map", map);	
		return "/board/free/freeBoardUpdateForm";
	}
	
	@RequestMapping(value="/freeBoard/freeBoardUpdateCtr.do", method = {RequestMethod.GET, RequestMethod.POST}) 
	public String freeBoardUpdateCtr(@RequestParam(defaultValue="0") int no
			,String title
			,String contents
			,String searchOption
			,int mno
			,String keyword
			,String lineTitle
			,int rnum
			,Model model) {
		log.info("게시물 수정 "+no +"게시물번호" + title + contents);
		freeBoardService.freeBoardUpdate(no, title, contents);
		
		model.addAttribute("rnum", rnum);
		model.addAttribute("mno", mno);
		model.addAttribute("no", no);
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("keyword", keyword);
		model.addAttribute("lineTitle", lineTitle);
		return "redirect:/freeBoard/freeBoardListOne.do";
	}
	
	@RequestMapping(value="/freeBoard/freeBoardCommentDeleteCtr.do", method = RequestMethod.GET)
	public String freeBoardCommentDeleteCtr(int no, int fcno
			,int rnum
			,int mno
			, String searchOption
			,String keyword
			,String lineTitle
			,Model model) {
		log.info("게시물 댓글 삭제"+ ": 댓글번호 " + fcno + "제목정렬" + lineTitle);
		
		freeBoardService.freeBoardCommentOneDelete(fcno);
		
		model.addAttribute("rnum", rnum);
		model.addAttribute("mno", mno);
		model.addAttribute("no", no);
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("keyword", keyword);
		model.addAttribute("lineTitle", lineTitle);
		
		return "redirect:/freeBoard/freeBoardListOne.do#upd";
	}
	
	@RequestMapping(value="/freeBoard/freeBoardCommentUpdateCtr.do", method = {RequestMethod.GET, RequestMethod.POST}) 
	public String freeBoardCommentUpdateCtr(
			@RequestParam(defaultValue="0") int no
			,String title
			,String searchOption
			,String keyword
			,int mno
			,int rnum
			,String comments
			,String lineTitle
			,int fcno
			,Model model) {
		log.info("댓글 수정 "+fcno +"댓글 내용" + comments);
		freeBoardService.freeBoardCommentUpdate(fcno, comments);
		
		model.addAttribute("rnum", rnum);
		model.addAttribute("mno", mno);
		model.addAttribute("no", no);
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("keyword", keyword);
		model.addAttribute("lineTitle", lineTitle);
		return "redirect:/freeBoard/freeBoardListOne.do#comments";
	}
	
	
	@RequestMapping(value="/freeBoard/prePage.do", method = RequestMethod.GET)
	public String freeBoardPrePage(int mno, int rnum, int no, String searchOption
			,String keyword,@RequestParam(defaultValue = "free_board_no") String lineTitle,Model model) {
		log.info("이전글"+mno + ": 회원번호 " +no+ " : 게시물 번호 " + rnum + " : 알넘" +searchOption + keyword);
		FreeBoardDto freeBoardDto = freeBoardService.selectPrePage(searchOption, keyword
				,lineTitle, rnum);
		
		model.addAttribute("rnum", freeBoardDto.getFreeBoardRownum());
		model.addAttribute("mno", mno);
		model.addAttribute("no", freeBoardDto.getFreeBoardNo());
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("keyword", keyword);
		model.addAttribute("lineTitle", lineTitle);
		return "redirect:/freeBoard/freeBoardView.do";
	}
	
	@RequestMapping(value="/freeBoard/nextPage.do", method = RequestMethod.GET)
	public String freeBoardNextPage(int mno, int rnum, int no, String searchOption
			,String keyword,@RequestParam(defaultValue = "free_board_no") String lineTitle,Model model ) {
		log.info("다음글"+mno + ": 회원번호 " +no+ " : 게시물 번호 " + rnum + " : 알넘" +searchOption + keyword);
		FreeBoardDto freeBoardDto = freeBoardService.selectNextPage(searchOption, keyword
				,lineTitle, rnum);
		
		model.addAttribute("rnum", freeBoardDto.getFreeBoardRownum());
		model.addAttribute("mno", mno);
		model.addAttribute("no", freeBoardDto.getFreeBoardNo());
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("keyword", keyword);
		model.addAttribute("lineTitle", lineTitle);
		return "redirect:/freeBoard/freeBoardView.do";
	}
	
}
