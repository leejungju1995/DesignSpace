package com.project.qnaBoard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.qnaBoard.dao.QnaBoardDao;
import com.project.qnaBoard.model.QnaBoardDto;

@Service
public class QnaBoardServiceImpl implements QnaBoardService{

	@Autowired
	public QnaBoardDao qnaBoardDao;

	@Override
	public List<QnaBoardDto> qnaBoardSelectList(String searchOption, String keyword,
			String sortOption, int start, int end, int mno) {
		// TODO Auto-generated method stub
		
		List<QnaBoardDto> qnaBoardList = 
				qnaBoardDao.qnaBoardSelectList(searchOption, keyword, sortOption, start, end, mno);
		
		return qnaBoardList;
	}

	@Override
	public QnaBoardDto qnaBoardSelectDetail(int qna_board_no) {
		// TODO Auto-generated method stub
		
		QnaBoardDto qnaBoardDto = qnaBoardDao.qnaBoardSelectDetail(qna_board_no);
		
		
		return qnaBoardDto;
	}

	@Override
	public void qnaBoardInsertOne(QnaBoardDto qnaBoardDto) {
		// TODO Auto-generated method stub
		
		qnaBoardDao.qnaBoardInsertOne(qnaBoardDto);
	}

	@Override
	public void qnaBoardUpdateOne(QnaBoardDto qnaBoardDto) {
		// TODO Auto-generated method stub
		
		qnaBoardDao.qnaBoardUpdateOne(qnaBoardDto);
	}

	@Override
	public int qnaBoardDeleteOne(int qna_board_no) {
		// TODO Auto-generated method stub
		
		return qnaBoardDao.qnaBoardDeleteOne(qna_board_no);
	}

	@Override
	public int qnaBoardSelectTotalCount(String searchOption, String keyword, String sortOption, int mno) {
		// TODO Auto-generated method stub
		
		return qnaBoardDao.qnaBoardSelectTotalCount(searchOption, keyword, sortOption, mno);
	}

	@Override
	public int qnaSelectCurPage(String searchOption, String keyword, int qna_board_no) {
		// TODO Auto-generated method stub
		
		return qnaBoardDao.qnaSelectCurPage(searchOption, keyword, qna_board_no);
	}

	@Override
	public int qnaBoardCommentSelectTotalCount(int qna_board_no) {
		// TODO Auto-generated method stub
		return qnaBoardDao.qnaBoardCommentSelectTotalCount(qna_board_no);
	}

	@Override
	public List<QnaBoardDto> qnaBoardCommentSelectList(int qna_board_no, int end) {
		// TODO Auto-generated method stub
		
		List<QnaBoardDto> qnaBoardCommentList =
				qnaBoardDao.qnaBoardCommentSelectList(qna_board_no, end);
		
		return qnaBoardCommentList;
	}

//	@Override
//	public void qnaBoardCommentInsertOne(QnaBoardDto qnaBoardDto) {
//		// TODO Auto-generated method stub
//		
//		qnaBoardDao.qnaBoardCommentInsertOne(qnaBoardDto);
//	}

	@Override
	public int qnaBoardCommentInsertOne(int qna_comment_qbno, int qna_comment_mno, String qna_comment_comments) {
		// TODO Auto-generated method stub
		
		return qnaBoardDao.qnaBoardCommentInsertOne(qna_comment_qbno, qna_comment_mno, qna_comment_comments);
	}

	@Override
	public int qnaCommentDeleteOne(int qna_comment_no) {
		// TODO Auto-generated method stub
		
		return qnaBoardDao.qnaCommentDeleteOne(qna_comment_no);
	}

	@Override
	public void qnaCommentUpdateOne(int qna_comment_no, String qna_comment_comments) {
		// TODO Auto-generated method stub
		
		qnaBoardDao.qnaCommentUpdateOne(qna_comment_no, qna_comment_comments);
	}

	@Override
	public int qnaCommentDelete(int qna_board_no) {
		// TODO Auto-generated method stub
		
		return qnaBoardDao.qnaCommentDelete(qna_board_no);
	}

	@Override
	public void changeUpdateStatus(int qna_comment_qbno) {
		// TODO Auto-generated method stub
		
		qnaBoardDao.changeUpdateStatus(qna_comment_qbno);
		
	}

	@Override
	public void answerCompleteChange(int qna_board_no) {
		// TODO Auto-generated method stub
		
		qnaBoardDao.answerCompleteChange(qna_board_no);
	}

	
}
