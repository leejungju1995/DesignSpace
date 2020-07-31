package com.project.projectBoard.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.member.model.MemberDto;
import com.project.projectBoard.dao.ProjectBoardDao;
import com.project.projectBoard.model.ProjectBoardDto;
import com.project.projectBoard.model.ProjectBoardFileDto;
import com.project.projectBoard.model.ProjectCommentDto;
import com.project.projectBoard.util.FileUtils;

@Service
public class ProjectBoardServiceImpl implements ProjectBoardService{

	private static final Logger log = 
			LoggerFactory.getLogger(ProjectBoardServiceImpl.class);
	
	@Autowired
	public ProjectBoardDao projectBoardDao;

	@Resource(name="fileUtil")
	private FileUtils fileUtil;
	
	@Override
	public List<ProjectBoardDto> projectBoardSelectList(String searchOption, String keyword, String sortOption, String categoryOption, int start, int end, String pageOption, int memberNo) {
		
		return projectBoardDao.projectBoardSelectList(searchOption, keyword, sortOption, categoryOption, start, end, pageOption, memberNo);
	}

	@Override
	public ProjectBoardDto projectBoardSelectOne(int no) {

		return projectBoardDao.projectBoardSelectOne(no);
	}

	@Override
	public List<ProjectBoardFileDto> projectBoardFileSelectList(int no) {

		return projectBoardDao.projectBoardFileSelectList(no);
	}

	@Override
	public int projectBoardInsertOne(ProjectBoardDto projectBoardDto, MemberDto memberDto, MultipartHttpServletRequest mulRequest) {

		//checkInsert로 실행여부 확인 ( 추후 그 값에 따른 결과처리 추가해야함 ! )
		int checkInsert = projectBoardDao.projectBoardInsertOne(projectBoardDto);
		
		int parentSeq = projectBoardDto.getProject_board_no();
		int writerNo = memberDto.getMember_no();
		
		try {
			List<Map<String, Object>> fileList = 
				fileUtil.parseInsertFileInfo(parentSeq
					, writerNo
					, mulRequest);
			
			for (int i = 0; i < fileList.size(); i++) {
				//checkInsertFile로 실행여부 확인 ( 추후 그 값에 따른 결과처리 추가해야함 ! )
				int checkInsertFile = projectBoardDao.insertFile(fileList.get(i));
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("문제 생기면 처리할꺼 정하자");
			System.out.println("일단 여긴 파일 처리 중 문제 발생한 거야");
			e.printStackTrace();
		}
		
		return checkInsert;
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int projectBoardUpdateOne(String[] chkListFlag, String[] chkListFile, ProjectBoardDto projectBoardDto, MultipartHttpServletRequest mulRequest) throws Exception{
		
		int resultNum = 0;	
		// 파일 데이터 먼저 변경 하고 
		try {
			// 해야할 거 : 파일 불러오고 지우고, 삭제하기
			int project_board_no = projectBoardDto.getProject_board_no();
			int writerNo = projectBoardDto.getProject_board_mno();
			
//			List<Map<String, Object>> tempFileList
//				= projectBoardDao.fileSelectStoredFileName(project_board_no);
			
			List<Map<String, Object>> list
				= fileUtil.parseInsertFileInfo(project_board_no, writerNo, mulRequest);
			
			int fileListCnt = 0;
			int tempFileListCnt = 0;
			
			for (int i = 0; i < chkListFlag.length; i++) {
				
				if(chkListFlag[i].equals("old")) {
					System.out.println("old처리");
				}else if(chkListFlag[i].equals("update")) {
					System.out.println("update처리");
					projectBoardDao.deleteFileName(chkListFile[tempFileListCnt]);
					fileUtil.parseDeleteFileInfo(chkListFile[tempFileListCnt++]);
					projectBoardDao.insertFile(list.get(fileListCnt++));
				}else if(chkListFlag[i].equals("new")) {
					System.out.println("new처리");
					projectBoardDao.insertFile(list.get(fileListCnt++));
				}else if(chkListFlag[i].equals("delete")) {
					System.out.println("delete처리");
					projectBoardDao.deleteFileName(chkListFile[tempFileListCnt]);
					fileUtil.parseDeleteFileInfo(chkListFile[tempFileListCnt++]);
				}
				
			}
			
//			if(list.isEmpty() == false) {
//				if(tempFileList != null) {
//					projectBoardDao.deleteFile(project_board_no);
//					fileUtil.parseUpdateFileInfo(tempFileList);
//				}
//				
//				for(Map<String, Object> map : list) {
//					projectBoardDao.insertFile(map);
//				}
//			}

			// 프로젝트 데이터 변경
			resultNum = projectBoardDao.projectBoardUpdateOne(projectBoardDto);
			
		} catch (Exception e) {
			TransactionAspectSupport
			.currentTransactionStatus().setRollbackOnly();
		} 			
		
		return resultNum;
	}

	@Override
	public int projectBoardDeleteOne(int no) {
		
		int checkDelete = projectBoardDao.projectCommentDelete(no);
		
		projectBoardDao.deleteFile(no);		
		checkDelete = projectBoardDao.projectBoardDeleteOne(no);
		
		
		return checkDelete;
	}

	@Override
	public int projectBoardTotalCount(String searchOption, String keyword, String categoryOption, String pageOption, int memberNo) {
		
		int totalCnt = projectBoardDao.projectBoardTotalCount(searchOption, keyword, categoryOption, pageOption, memberNo);
		
		return totalCnt;
	}

	@Override
	public List<ProjectCommentDto> projectCommentSelectList(int no) {
						
		return projectBoardDao.projectCommentSelectList(no);
	}

	@Override
	public int projectCommentInsertOne(ProjectCommentDto projectCommentDto) {

		int checkInsert = projectBoardDao.projectCommentInsertOne(projectCommentDto);
		
		return checkInsert;
	}

	@Override
	public int projectCommentUpdateOne(ProjectCommentDto projectCommentDto) {
		
		int checkUpdate = projectBoardDao.projectCommentUpdateOne(projectCommentDto);
		
		return checkUpdate;
	}

	@Override
	public int projectCommentDeleteOne(int no) {
		
		int checkDelete = projectBoardDao.projectCommentDeleteOne(no);
		
		return checkDelete;
	}

	@Override
	public MemberDto profileSelectOne(int no) {
				
		return projectBoardDao.profileSelectOne(no);
	}

	@Override
	public int projectView(int no) {

		return projectBoardDao.projectView(no);
	}

	@Override
	public int projectLike(int no, int mno) {

		return projectBoardDao.projectLike(no, mno);
	}

	@Override
	public int projectLikeUpdate(int no, int mno) {

		return projectBoardDao.projectLikeUpdate(no, mno);
	}

	@Override
	public int projectLikeDelete(int no, int mno) {

		return projectBoardDao.projectLikeDelete(no, mno);
	}

	@Override
	public Map<String, Object> projectLikeFlag(int no, int mno) {

		return projectBoardDao.projectLikeFlag(no, mno);
	}

	@Override
	public Map<String, Object> selectInfoList() {
		
		return projectBoardDao.selectInfoList();
	}
	
}