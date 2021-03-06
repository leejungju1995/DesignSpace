package com.project.reportBoard.service;

import java.util.List;

import com.project.reportBoard.model.ReportBoardDto;

public interface ReportBoardService {
	
	public List<ReportBoardDto> reportBoardSelectList(String searchOption, String keyword,
			String sortOption, int start, int end, int member_no);

	public int reportBoardSelectTotalCount(String searchOption, String keyword, String sortOption, int mno);

	public int reportSelectCurPage(String searchOption, String keyword, int report_board_no);

	public ReportBoardDto reportBoardSelectDetail(int report_board_no);

	public void reportBoardInsertOne(ReportBoardDto reportBoardDto);

	public void processingComplete(ReportBoardDto reportBoardDto);

	public int selectProjectBoardNumber(String title);

	public void reportBoardDeleteOne(int report_board_no);

}
