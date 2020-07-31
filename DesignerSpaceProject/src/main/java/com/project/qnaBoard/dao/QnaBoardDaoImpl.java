package com.project.qnaBoard.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.qnaBoard.model.QnaBoardDto;

@Repository
public class QnaBoardDaoImpl implements QnaBoardDao{

	@Autowired
	SqlSessionTemplate sqlSession;
	
	String namespace = "com.project.qnaBoard.";
	
	@Override
	public List<QnaBoardDto> qnaBoardSelectList(String searchOption, String keyword,
			String sortOption, int start, int end, int mno) {
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

	@Override
	public QnaBoardDto qnaBoardSelectDetail(int qna_board_no) {
		// TODO Auto-generated method stub
		
		return sqlSession.selectOne(namespace + "qnaBoardSelectDetail", qna_board_no);
		
	}

	@Override
	public void qnaBoardInsertOne(QnaBoardDto qnaBoardDto) {
		// TODO Auto-generated method stub
		
		sqlSession.insert(namespace + "qnaBoardInsertOne", qnaBoardDto);
	}

	@Override
	public void qnaBoardUpdateOne(QnaBoardDto qnaBoardDto) {
		// TODO Auto-generated method stub
		
		sqlSession.update(namespace + "qnaBoardUpdateOne", qnaBoardDto);
	}

	@Override
	public int qnaBoardDeleteOne(int qna_board_no) {
		// TODO Auto-generated method stub
		
		return sqlSession.delete(namespace + "qnaBoardDeleteOne", qna_board_no);
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
	public int qnaSelectCurPage(String searchOption, String keyword, int qna_board_no) {
		// TODO Auto-generated method stub
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("searchOption", searchOption);
		paramMap.put("keyword", keyword);
		paramMap.put("qna_board_no", qna_board_no);
		
		return sqlSession.selectOne(namespace + "qnaSelectCurPage", paramMap);
	}

	@Override
	public int qnaBoardCommentSelectTotalCount(int qna_board_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "qnaBoardCommentSelectTotalCount", qna_board_no);
	}

	@Override
	public List<QnaBoardDto> qnaBoardCommentSelectList(int qna_board_no, int end) {
		// TODO Auto-generated method stub
		
		Map<String, Object> map = new HashMap<>();
		map.put("end", end);
		map.put("qna_board_no", qna_board_no);
		
		List<QnaBoardDto> qnaBoardCommentList = 
				sqlSession.selectList(namespace + "qnaBoardCommentSelectList", map);
		
		return qnaBoardCommentList;
	}

//	@Override
//	public void qnaBoardCommentInsertOne(QnaBoardDto qnaBoardDto) {
//		// TODO Auto-generated method stub
//		
//		sqlSession.insert(namespace + "qnaBoardCommentInsertOne", qnaBoardDto);
//	}

	@Override
	public int qnaBoardCommentInsertOne(int qna_comment_qbno, int qna_comment_mno, String qna_comment_comments) {
		// TODO Auto-generated method stub
		
		Map<String, Object> map = new HashMap<>();
		map.put("qna_comment_qbno", qna_comment_qbno);
		map.put("qna_comment_mno", qna_comment_mno);
		map.put("qna_comment_comments", qna_comment_comments);
		return sqlSession.insert(namespace + "qnaBoardCommentInsertOne", map);
		
	}

	@Override
	public int qnaCommentDeleteOne(int qna_comment_no) {
		// TODO Auto-generated method stub
		
		return sqlSession.delete(namespace + "qnaCommentDeleteOne", qna_comment_no);
	}

	@Override
	public void qnaCommentUpdateOne(int qna_comment_no, String qna_comment_comments) {
		// TODO Auto-generated method stub
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("qna_comment_no", qna_comment_no);
		map.put("qna_comment_comments", qna_comment_comments);
		
		sqlSession.update(namespace + "qnaCommentUpdateOne", map);
	}

	@Override
	public int qnaCommentDelete(int qna_board_no) {
		// TODO Auto-generated method stub
		
		return sqlSession.delete(namespace + "qnaCommentDelete", qna_board_no);
	}

	@Override
	public void changeUpdateStatus(int qna_comment_qbno) {
		// TODO Auto-generated method stub
		
		sqlSession.update(namespace + "changeUpdateStatus", qna_comment_qbno);
		
	}

	@Override
	public void answerCompleteChange(int qna_board_no) {
		// TODO Auto-generated method stub
		
		sqlSession.update(namespace + "answerCompleteChange", qna_board_no);
	}


}
