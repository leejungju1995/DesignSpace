package com.project.projectBoard.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.member.model.MemberDto;
import com.project.projectBoard.model.ProjectBoardDto;
import com.project.projectBoard.model.ProjectBoardFileDto;
import com.project.projectBoard.model.ProjectCommentDto;


@Repository
public class ProjectBoardDaoImpl implements ProjectBoardDao{

	@Autowired
	SqlSessionTemplate sqlSession;
	
	String namespace = "com.project.projectBoard.";

	@Override
	public List<ProjectBoardDto> projectBoardSelectList(String searchOption, String keyword, String sortOption, String categoryOption, int start, int end, String pageOption, int memberNo) {
		
		Map<String, Object> listOptionMap = new HashMap<>();
		listOptionMap.put("searchOption", searchOption);
		listOptionMap.put("keyword", keyword);
		listOptionMap.put("sortOption", sortOption);
		listOptionMap.put("categoryOption", categoryOption);
		listOptionMap.put("start", start);
		listOptionMap.put("end", end);
		listOptionMap.put("pageOption", pageOption);
		listOptionMap.put("memberNo", memberNo);
		
		List<ProjectBoardDto> projectBoardList = sqlSession.selectList(namespace + "projectBoardSelectList", listOptionMap); 
		
		return projectBoardList;
	}

	@Override
	public ProjectBoardDto projectBoardSelectOne(int no) {
		
		ProjectBoardDto projectBoardDto = sqlSession.selectOne(namespace + "projectBoardSelectOne", no);
		
		return projectBoardDto;
	}

	@Override
	public List<ProjectBoardFileDto> projectBoardFileSelectList(int no) {
		
		List<ProjectBoardFileDto> projectBoardFileList = sqlSession.selectList(namespace + "projectBoardFileSelectList", no);
		
		return projectBoardFileList;
	}

	@Override
	public int projectBoardInsertOne(ProjectBoardDto projectBoardDto) {
		
		int checkInsert = sqlSession.insert(namespace + "projectBoardInsertOne", projectBoardDto);
		
		return checkInsert;
	}

	@Override
	public int insertFile(Map<String, Object> map) {
		
		int checkInsertFile = sqlSession.insert(namespace + "insertFile", map);
		
		return checkInsertFile;
	}

	@Override
	public int projectBoardUpdateOne(ProjectBoardDto projectBoardDto) {
		
		int checkUpdate = sqlSession.update(namespace + "projectBoardUpdateOne", projectBoardDto);
		
		return checkUpdate;
	}

	@Override
	public int deleteFile(int project_board_no) {

		int checkDeleteFile = sqlSession.delete(namespace + "deleteFile", project_board_no);
		
		return checkDeleteFile;
	}

	@Override
	public List<Map<String, Object>> fileSelectStoredFileName(int project_board_no) {
		
		return sqlSession.selectList(namespace + "fileSelectStoredFileName", project_board_no);
	}

	@Override
	public int projectBoardDeleteOne(int no) {
		
		int checkDelete = sqlSession.update(namespace + "projectBoardDeleteOne", no);
		
		return checkDelete;
	}

	@Override
	public int projectBoardTotalCount(String searchOption, String keyword, String categoryOption, String pageOption, int memberNo) {
		
		Map<String, Object> listOptionMap = new HashMap<>();
		listOptionMap.put("searchOption", searchOption);
		listOptionMap.put("keyword", keyword);
		listOptionMap.put("categoryOption", categoryOption);
		listOptionMap.put("pageOption", pageOption);
		listOptionMap.put("memberNo", memberNo);
		
		int totalCnt = sqlSession.selectOne(namespace + "projectBoardTotalCount", listOptionMap);
		
		return totalCnt;
	}

	@Override
	public List<ProjectCommentDto> projectCommentSelectList(int no) {
		
		List<ProjectCommentDto> projectCommentDto 
			= sqlSession.selectList(namespace + "projectCommentSelectList", no);
		
		return projectCommentDto;
	}

	@Override
	public int projectCommentInsertOne(ProjectCommentDto projectCommentDto) {
		
		int checkInsert = sqlSession.insert(namespace + "projectCommentInsertOne", projectCommentDto);
		
		return checkInsert;
	}

	@Override
	public int projectCommentUpdateOne(ProjectCommentDto projectCommentDto) {
		
		int checkUpdate = sqlSession.update(namespace + "projectCommentUpdateOne", projectCommentDto);
		
		return checkUpdate;
	}

	@Override
	public int projectCommentDeleteOne(int no) {
		
		int checkDelete = sqlSession.delete(namespace + "projectCommentDeleteOne", no);
		
		return checkDelete;
	}

	@Override
	public int deleteFileName(String str) {
		
		int checkDeleteFile = sqlSession.delete(namespace + "deleteFileName", str);
		
		return checkDeleteFile;
	}

	@Override
	public MemberDto profileSelectOne(int no) {
	
		return sqlSession.selectOne(namespace + "profileSelectOne", no);
	}

	@Override
	public int projectCommentDelete(int no) {
		
		int checkDelete = sqlSession.delete(namespace + "projectCommentDelete", no);
		
		return checkDelete;
	}

	@Override
	public int projectView(int no) {
		
		return sqlSession.update(namespace + "projectView", no);
	}

	@Override
	public int projectLike(int no, int mno) {

		Map<String, Object> map = new HashMap<>();
		map.put("no", no);
		map.put("mno", mno);
			
		return sqlSession.insert(namespace + "projectLike", map);
	}

	@Override
	public int projectLikeUpdate(int no, int mno) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("no", no);
		map.put("mno", mno);
		
		return sqlSession.update(namespace + "projectLikeUpdate", map);
	}

	@Override
	public int projectLikeDelete(int no, int mno) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("no", no);
		map.put("mno", mno);
		
		return sqlSession.update(namespace + "projectLikeDelete", map);
	}

	@Override
	public Map<String, Object> projectLikeFlag(int no, int mno) {

		Map<String, Object> map = new HashMap<>();
		map.put("no", no);
		map.put("mno", mno);
		
		return sqlSession.selectOne(namespace + "projectLikeFlag", map);
	}

	@Override
	public Map<String, Object> selectInfoList() {

		return sqlSession.selectOne(namespace + "selectInfoList");
	}

}
