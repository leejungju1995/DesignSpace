package com.project.freeBoard.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.freeBoard.model.FreeBoardDto;
import com.project.qnaBoard.model.QnaBoardDto;
import com.project.reportBoard.model.ReportBoardDto;



@Repository
public class FreeBoardDaoImpl implements FreeBoardDao{

	@Autowired
	SqlSessionTemplate sqlSession;
	
	String namespace = "com.project.freeBoard.";

	@Override
	public int freeBoardSelectTotalCount(String searchOption, String keyword, String lineTitle) {
		// TODO Auto-generated method stub
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("searchOption", searchOption);
		paramMap.put("keyword", keyword);
		paramMap.put("lineTitle", lineTitle);
		
		return sqlSession.selectOne(namespace + "freeBoardSelectTotalCount"
				, paramMap);
	}

	@Override
	public int freeBoardSelectCurPage(String searchOption, String keyword, int no, String lineTitle) {
		// TODO Auto-generated method stub
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("searchOption", searchOption);
		paramMap.put("keyword", keyword);
		paramMap.put("no", no);
		paramMap.put("lineTitle", lineTitle);
			
		return sqlSession.selectOne(namespace 
				+ "freeBoardSelectCurPage", paramMap);
	}

	@Override
	public List<FreeBoardDto> freeBoardSelectList(String searchOption, String keyword, int start, int end, String lineTitle) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		map.put("lineTitle", lineTitle);
		
		List<FreeBoardDto> freeBoardList = 
				sqlSession.selectList(namespace + "freeBoardSelectList"
				, map);
		
		
		return freeBoardList;
	}

	@Override
	public FreeBoardDto freeBoardSelectOne(int no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "freeBoardSelectOne"
				, no);
	}

	@Override
	public List<Map<String, Object>> fileSelectList(int no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int freeBoardView(int no) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace + "freeBoardView", no);
	}
	
	@Override
	public int freeBoardCommentSelectTotalCount(int no) {
		// TODO Auto-generated method stub
	
		return sqlSession.selectOne(namespace + "freeBoardCommentSelectTotalCount", no);
	}

	@Override
	public List<FreeBoardDto> freeBoardCommentSelectList(int no, int end ) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		map.put("end", end);
		map.put("no", no);
		
		List<FreeBoardDto> freeBoardCommentList = 
				sqlSession.selectList(namespace + "freeBoardCommentSelectList", map);
		
		
		return freeBoardCommentList;
	}

	@Override
	public int freeBoardLikeInsert(int mno, int no) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		map.put("mno", mno);
		map.put("no", no);
		
		return sqlSession.insert(namespace + "freeBoardLikeInsert", map);
	}

	@Override
	public String freeBoardLikeSelectList(int no, int mno) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		map.put("no", no);
		map.put("mno", mno);
		
		return sqlSession.selectOne(namespace + "freeBoardLikeSelectList", map);
	}

	@Override
	public int freeBoardLikeUpdate(int no, int mno) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		map.put("no", no);
		map.put("mno", mno);

		return sqlSession.update(namespace + "freeBoardLikeUpdate", map);
	}

	@Override
	public int freeBoardLikeDel(int no, int mno) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		map.put("no", no);
		map.put("mno", mno);

		return sqlSession.update(namespace + "freeBoardLikeDel", map);
	}

	@Override
	public void freeBoardAdd(int mno, String title, String contents) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		map.put("mno", mno);
		map.put("title", title);
		map.put("contents", contents);
		
		sqlSession.insert(namespace + "freeBoardAdd", map);
	}

	@Override
	public String freeBoardAddOne(int mno) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		map.put("mno", mno);
		
		return sqlSession.selectOne(namespace +"freeBoardAddOne", map);
	}

	@Override
	public int freeBoardLikeDelete(int no) {
		// TODO Auto-generated method stub
		return sqlSession.delete(namespace + "freeBoardLikeDelete", no);
	}

	@Override
	public int freeBoardCommentDelete(int no) {
		// TODO Auto-generated method stub
		return sqlSession.delete(namespace + "freeBoardCommentDelete", no);
	}

	@Override
	public int freeBoardDelete(int no) {
		// TODO Auto-generated method stub
		return sqlSession.delete(namespace + "freeBoardDelete", no);
	}

	@Override
	public int freeBoardCommentAdd( int no, int mno,String comments) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		map.put("no", no);
		map.put("mno", mno);
		map.put("comments", comments);
		return sqlSession.insert(namespace + "freeBoardCommentAdd", map);
	}

	@Override
	public void freeBoardUpdate(int no, String title, String contents) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		map.put("no", no);
		map.put("title", title);
		map.put("contents", contents);
		sqlSession.update(namespace + "freeBoardUpdate", map);
	}

	@Override
	public void freeBoardCommentUpdate(int fcno,String comments) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		map.put("fcno", fcno);
		map.put("comments", comments);
		
		sqlSession.update(namespace + "freeBoardCommentUpdate", map);
	}

	@Override
	public void freeBoardCommentOneDelete(int fcno) {
		// TODO Auto-generated method stub
		sqlSession.delete(namespace + "freeBoardCommentOneDelete", fcno);
	}

	@Override
	public int freeBoardCommentTotalCount(int no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "freeBoardCommentTotalCount", no);
	}

	@Override
	public int selectTotalMoveCount(String searchOption, String keyword, String lineTitle) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("lineTitle", lineTitle);
		
		return sqlSession.selectOne(namespace + "selectTotalMoveCount", map);
	}

	@Override
	public FreeBoardDto selectPrePage(String searchOption, String keyword, String lineTitle, int rnum) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("lineTitle", lineTitle);
		map.put("rnum", rnum);
		
		return sqlSession.selectOne(namespace + "selectPrePage",map);
	}

	@Override
	public FreeBoardDto selectNextPage(String searchOption, String keyword, String lineTitle, int rnum) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("lineTitle", lineTitle);
		map.put("rnum", rnum);
		
		return sqlSession.selectOne(namespace + "selectNextPage",map);
	}

	@Override
	public List<ReportBoardDto> reportBoardSelectList(String searchOption, String keyword, String sortOption, int start,
			int end, int mno) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("sortOption", sortOption);
		map.put("start", start);
		map.put("end", end);
		map.put("mno", mno);
		
		List<ReportBoardDto> reportBoardList = sqlSession.selectList(namespace + "reportBoardSelectList", map);
		
		return reportBoardList;
	}

	@Override
	public int reportBoardSelectTotalCount(String searchOption, String keyword,String sortOption,int mno) {
		// TODO Auto-generated method stub
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("searchOption", searchOption);
		paramMap.put("keyword", keyword);
		paramMap.put("sortOption", sortOption);
		paramMap.put("mno", mno);
		
		return sqlSession.selectOne(namespace + "reportBoardSelectTotalCount", paramMap);
	}

	@Override
	public int qnaBoardSelectTotalCount(String searchOption, String keyword, String sortOption, int mno) {
		// TODO Auto-generated method stub
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("searchOption", searchOption);
		paramMap.put("keyword", keyword);
		paramMap.put("sortOption", sortOption);
		paramMap.put("mno", mno);
		
		return sqlSession.selectOne(namespace + "qnaBoardSelectTotalCount", paramMap);
	}

	@Override
	public List<QnaBoardDto> qnaBoardSelectList(String searchOption, String keyword, String sortOption, int start,
			int end, int mno) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("sortOption", sortOption);
		map.put("start", start);
		map.put("end", end);
		map.put("mno", mno);
		
		List<QnaBoardDto> qnaBoardList = sqlSession.selectList(namespace + "qnaBoardSelectList", map);
		
		return qnaBoardList;
	}
	

}
