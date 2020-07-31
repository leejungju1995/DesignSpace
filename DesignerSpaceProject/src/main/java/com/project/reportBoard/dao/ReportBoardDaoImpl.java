package com.project.reportBoard.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.reportBoard.model.ReportBoardDto;

@Repository
public class ReportBoardDaoImpl implements ReportBoardDao{
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	String namespace = "com.project.reportBoard.";

	@Override
	public List<ReportBoardDto> reportBoardSelectList(String searchOption, String keyword, 
				String sortOption, int start, int end, int mno) {
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
	public int reportBoardSelectTotalCount(String searchOption, String keyword, String sortOption, int mno) {
		// TODO Auto-generated method stub
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("searchOption", searchOption);
		paramMap.put("keyword", keyword);
		paramMap.put("sortOption", sortOption);
		paramMap.put("mno", mno);
		
		return sqlSession.selectOne(namespace + "reportBoardSelectTotalCount", paramMap);
	}

	@Override
	public int reportSelectCurPage(String searchOption, String keyword, int report_board_no) {
		// TODO Auto-generated method stub
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("searchOption", searchOption);
		paramMap.put("keyword", keyword);
		paramMap.put("report_board_no", report_board_no);
		
		return sqlSession.selectOne(namespace + "reportSelectCurPage", paramMap);
	}

	@Override
	public ReportBoardDto reportBoardSelectDetail(int report_board_no) {
		// TODO Auto-generated method stub
		
		return sqlSession.selectOne(namespace + "reportBoardSelectDetail", report_board_no);
	}

	@Override
	public void reportBoardInsertOne(ReportBoardDto reportBoardDto) {
		// TODO Auto-generated method stub
		
		sqlSession.insert(namespace + "reportBoardInsertOne", reportBoardDto);
	}

	@Override
	public void processingComplete(ReportBoardDto reportBoardDto) {
		// TODO Auto-generated method stub
		
		sqlSession.update(namespace + "processingComplete", reportBoardDto);
	}

	@Override
	public int selectProjectBoardNumber(String title) {
		// TODO Auto-generated method stub
		
		return sqlSession.selectOne(namespace + "selectProjectBoardNumber", title);
	}

	@Override
	public void reportBoardDeleteOne(int report_board_no) {
		// TODO Auto-generated method stub
		
		sqlSession.delete(namespace + "reportBoardDeleteOne", report_board_no);
		
	}

}
