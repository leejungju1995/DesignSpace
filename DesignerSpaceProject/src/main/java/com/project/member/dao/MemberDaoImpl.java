package com.project.member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.member.model.MemberBoardDto;
import com.project.member.model.MemberDto;


@Repository
public class MemberDaoImpl implements MemberDao{

	@Autowired
	SqlSessionTemplate sqlSession;
	
	String namespace = "com.project.member.";
	

	// 사용자 존재 유무 확인
	@Override
	public MemberDto memberExist(String member_email, String member_pwd) {
		// TODO Auto-generated method stub
		
		HashMap<String, Object> paramMap = new HashMap<>();
		paramMap.put("member_email", member_email);
		paramMap.put("member_pwd", member_pwd);
		
		MemberDto memberDto = 
				sqlSession.selectOne(namespace + "memberExist", paramMap);
		
		return memberDto;
	}
	
	// 회원가입
		@Override
		public void memberAdd(MemberDto memberDto) {
			// TODO Auto-generated method stub
			
			System.out.println("memberAdd들어왔다");
			
			sqlSession.insert(namespace + "memberAdd", memberDto);
		}

	@Override//아이디찾기
	public MemberDto memberIdFind(String member_name, String member_phone) {
		// TODO Auto-generated method stub
		
		HashMap<String, Object> paramMap = new HashMap<>();
		paramMap.put("member_name", member_name);
		paramMap.put("member_phone", member_phone);
		
		MemberDto memberDto = 
				sqlSession.selectOne(namespace + "memberIdFind", paramMap);
		
		return memberDto;
	}
	
	@Override//비밀번호찾기
	public MemberDto memberPwdFind(String member_email, int member_check_question, String member_check_answer) {
		// TODO Auto-generated method stub
		
		HashMap<String, Object> paramMap = new HashMap<>();
		paramMap.put("member_email", member_email);
		paramMap.put("member_check_question", member_check_question);
		paramMap.put("member_check_answer", member_check_answer);
		
		MemberDto memberDto = 
				sqlSession.selectOne(namespace + "memberPwdFind", paramMap);
		
		return memberDto;
	}
	
	
	@Override
	public void profileAdd(Map<String, Object> map) {
		// TODO Auto-generated method stub
		System.out.println("들어왓나");
		sqlSession.insert(namespace + "profileAdd", map);
	}

	@Override
	public MemberDto memberInfo(int member_no) {
		// TODO Auto-generated method stub
	
		MemberDto memberDto = 
				sqlSession.selectOne(namespace + "memberInfo", member_no);
		
		return memberDto;
	}

	@Override
	public String memberMod(int member_no) {
		// TODO Auto-generated method stub
		
		MemberDto memberDto = 
				sqlSession.selectOne(namespace + "memberMod", member_no);
		System.out.println(memberDto.getMember_pwd());
		String getPwd =memberDto.getMember_pwd();
		return getPwd;
	}

	@Override
	public MemberDto memberModDetail(int member_no) {
		// TODO Auto-generated method stub
		MemberDto memberDto = 
				sqlSession.selectOne(namespace + "memberModDetail", member_no);
		System.out.println(memberDto);
		
		return memberDto;
	}

	@Override
	public void memberUpdate(MemberDto memberDto) {
		// TODO Auto-generated method stub
		System.out.println("memberUpdate들어왔다");
		
		sqlSession.update(namespace + "memberUpdate", memberDto);
		
		
	}


	@Override
	public void profileDelete(int profile_table_mno) {
		// TODO Auto-generated method stub
		System.out.println("profileDelete들어왔다");
		
		sqlSession.delete(namespace + "profileDelete", profile_table_mno);
	}

	@Override
	public Map<String, Object> profileSelectStoredFileName(int profile_table_mno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace 
				+ "profileSelectStoredFileName", profile_table_mno);
	}

	@Override
	public int memberSelectTotalCount(String searchOption, String keyword) {
		// TODO Auto-generated method stub
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("searchOption", searchOption);
		paramMap.put("keyword", keyword);
		
		return sqlSession.selectOne(namespace + "memberSelectTotalCount"
				, paramMap);
	}

	@Override
	public List<MemberBoardDto> memberSelectList(String searchOption, String keyword, int start, int end) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		
		List<MemberBoardDto> memberList = 
				sqlSession.selectList(namespace + "memberSelectList"
				, map);
		
		return memberList;
	}

	@Override
	public int memberSelectCurPage(String searchOption, String keyword, int no) {
		// TODO Auto-generated method stub
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("searchOption", searchOption);
		paramMap.put("keyword", keyword);
		paramMap.put("no", no);
			
		return sqlSession.selectOne(namespace 
				+ "memberSelectCurPage", paramMap);
	}

	@Override
	public void memberRemove(int member_no) {
		// TODO Auto-generated method stub
		
		System.out.println("memberRemove들어왔다");
		
		sqlSession.insert(namespace + "memberRemove", member_no);
		sqlSession.insert(namespace + "projectRemove", member_no);
		
		sqlSession.delete(namespace + "freeLikeDelete", member_no);
		sqlSession.delete(namespace + "freeCommentDelete", member_no);
		sqlSession.delete(namespace + "freeBoardDelete", member_no);
		
		sqlSession.delete(namespace + "QnaCommentDelete", member_no);
		sqlSession.delete(namespace + "QnaBoardDelete", member_no);
		
		sqlSession.delete(namespace + "reportDelete", member_no);

		
	}

	@Override
	public int checkNick(String nick) {
		// TODO Auto-generated method stub
		
		System.out.println("checkNick들어왔다"+nick);
		
		return sqlSession.selectOne(namespace + "checkNick", nick);
		
	}

	@Override
	public int checkEmail(String email) {
		// TODO Auto-generated method stub
		System.out.println("checkEmail들어왔다"+email);
		
		return sqlSession.selectOne(namespace + "checkEmail", email);
	}

	@Override
	public int checkPhone(String phone) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + "checkPhone", phone);
	}

}
