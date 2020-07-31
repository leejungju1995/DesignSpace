package com.project.member.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.member.model.MemberDto;
import com.project.member.model.MemberBoardDto;

public interface MemberService {

	
	public MemberDto memberExist(String member_email, String member_pwd);
	public MemberDto memberIdFind(String member_name, String member_phone);
	public MemberDto memberPwdFind(String member_email, int member_check_question, String member_check_answer);
	public void memberAdd(MemberDto memberDto, MultipartHttpServletRequest mulRequest);
	
	public MemberDto memberInfo(int member_no);
	public String memberMod(int member_no);
	public MemberDto memberModDetail(int member_no);
	void memberUpdate(MemberDto memberDto, String change, MultipartHttpServletRequest mulRequest);
	public int memberSelectTotalCount(String searchOption, String keyword);
	public int memberSelectCurPage(String searchOption, String keyword, int no);
	public List<MemberBoardDto> memberSelectList(String searchOption, String keyword, int start, int end);
	public void memberRemove(int member_no);
	
	//중복체크
	public int checkNick(String nick);
	public int checkEmail(String email);
	public int checkPhone(String phone);
}
