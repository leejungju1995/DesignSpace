package com.project.freeBoard.service;

import java.util.List;
import java.util.Map;

import com.project.freeBoard.model.FreeBoardDto;
import com.project.qnaBoard.model.QnaBoardDto;
import com.project.reportBoard.model.ReportBoardDto;

public interface FreeBoardService {

	public int freeBoardSelectTotalCount(String searchOption, String keyword, String lineTitle);

	public int freeBoardSelectCurPage(String searchOption, String keyword, int no, String lineTitle);

	public List<FreeBoardDto> freeBoardSelectList(String searchOption, String keyword, int start, int end, String lineTitle);

	public Map<String, Object> freeBoardSelectOne(int no);

	public int freeBoardView(int no);
	
	public int freeBoardCommentSelectTotalCount(int no);

	public List<FreeBoardDto> freeBoardCommentSelectList(int no, int end);

	public int freeBoardLikeInsert(int no,int mno);

	public String freeBoardLikeSelectList(int no, int mno);

	public int freeBoardLikeUpdate(int no, int mno);

	public int freeBoardLikeDel(int no, int mno);

	public void freeBoardAdd(int mno, String title, String contents);

	public String freeBoardAddOne(int mno);

	public int freeBoardLikeDelete(int no);

	public int freeBoardCommentDelete(int no);

	public int freeBoardDelete(int no);

	public int freeBoardCommentAdd(int no, int mno, String comments);

	public void freeBoardUpdate(int no, String title, String contents);

	public void freeBoardCommentUpdate(int fcno, String comments);

	public void freeBoardCommentOneDelete(int fcno);

	public int freeBoardCommentTotalCount(int no);

	public int selectTotalMoveCount(String searchOption, String keyword, String lineTitle);

	public FreeBoardDto selectPrePage(String searchOption, String keyword, String lineTitle, int rnum);

	public FreeBoardDto selectNextPage(String searchOption, String keyword, String lineTitle, int rnum);

	public int reportBoardSelectTotalCount(String searchOption, String keyword, String sortOption, int mno);

	public List<ReportBoardDto> reportBoardSelectList(String searchOption, String keyword, String sortOption, int start,
			int end, int mno);

	public int qnaBoardSelectTotalCount(String searchOption, String keyword, String sortOption, int mno);

	public List<QnaBoardDto> qnaBoardSelectList(String searchOption, String keyword, String sortOption, int start,
			int end, int mno);

	
}
