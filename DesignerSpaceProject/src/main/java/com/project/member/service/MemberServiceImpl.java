package com.project.member.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.member.dao.MemberDao;
import com.project.member.model.MemberBoardDto;
import com.project.member.model.MemberDto;
import com.project.util.ProfileUtils;


@Service
public class MemberServiceImpl implements MemberService{

	private static final Logger log = 
			LoggerFactory.getLogger(MemberServiceImpl.class);
	
	@Autowired
	public MemberDao memberDao;	
	
	@Resource(name="profileUtils")
	private ProfileUtils profileUtils;
	

	@Override
	public MemberDto memberExist(String member_email, String member_pwd) {
		// TODO Auto-generated method stub
		
		MemberDto memberDto = memberDao.memberExist(member_email, member_pwd);
		
		return memberDto;
	}
	
	@Override
	public void memberAdd(MemberDto memberDto, MultipartHttpServletRequest mulRequest) {
		// TODO Auto-generated method stub
		System.out.println("ooooooo00000000000000000000000ooooooooooo");
		
		
		memberDao.memberAdd(memberDto);
		
		System.out.println("멤버는 추가하였다");
		
		
		
		int profile_table_mno = memberDto.getMember_no();
		
		try {
			List<Map<String, Object>> profileList = 
				profileUtils.parseInsertFileInfo(profile_table_mno
					, mulRequest);
			
			System.out.println(profileList);
			
			for (int i = 0; i < profileList.size(); i++) {
				memberDao.profileAdd(profileList.get(i));
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("문제 생기면 처리할꺼 정하자");
			System.out.println("일단 여긴 파일 처리 중 문제 발생한 거야");
			e.printStackTrace();
		}
		
		
	}
	
	@Override
	public MemberDto memberIdFind(String member_name, String member_phone) {
		// TODO Auto-generated method stub
		
		MemberDto memberDto = memberDao.memberIdFind(member_name, member_phone);
		
		return memberDto;
	}
	
	
	@Override
	public MemberDto memberPwdFind(String member_email, int member_check_question, String member_check_answer) {
		// TODO Auto-generated method stub
		
		MemberDto memberDto = memberDao.memberPwdFind(member_email, member_check_question, member_check_answer);
		
		return memberDto;
	}

	


	@Override
	public MemberDto memberInfo(int member_no) {
		// TODO Auto-generated method stub
		
		MemberDto memberDto = memberDao.memberInfo(member_no);
		
		return memberDto;
	}

	@Override
	public String memberMod(int member_no) {
		// TODO Auto-generated method stub
		String getPwd = memberDao.memberMod(member_no);
		
		return getPwd;
	}

	@Override
	public MemberDto memberModDetail(int member_no) {
		// TODO Auto-generated method stub
		MemberDto memberDto = memberDao.memberModDetail(member_no);
		
		return memberDto;
	}

	
	@Override
	public void memberUpdate(MemberDto memberDto, String change,
			MultipartHttpServletRequest mulRequest) {
		// TODO Auto-generated method stub
		
			if(change.equals("Y")) {
				int profile_table_mno = memberDto.getMember_no();
				
				System.out.println("memberServiceimple"+profile_table_mno);
				
				Map<String, Object> tempFileMap //존재하는 파일명
					= memberDao.profileSelectStoredFileName(profile_table_mno);
				System.out.println("0000000000000000000000000000000000000000000000000000");
				System.out.println(tempFileMap);
				
				
				try {
					System.out.println("안들어옴");
					List<Map<String, Object>> profileList = 
						profileUtils.parseInsertFileInfo(profile_table_mno
							, mulRequest);
					
					System.out.println(profileList);
					
					if(tempFileMap == null && profileList != null ) {//없고 있고
						System.out.println("1");
						for (int i = 0; i < profileList.size(); i++) {
							System.out.println("4");
							memberDao.profileAdd(profileList.get(i));
						}
					}else if(tempFileMap!=null && profileList!=null) {//있고 있고
						System.out.println("2");
						profileUtils.UpdateProfile(tempFileMap);
						memberDao.profileDelete(profile_table_mno);
						memberDao.profileAdd(profileList.get(0));
					}else if(tempFileMap !=null && profileList==null) {//있고 없고
						System.out.println("3");
						profileUtils.UpdateProfile(tempFileMap);
						memberDao.profileDelete(profile_table_mno);
					}else {//없고 없고
						System.out.println("●▅▇█▇▅▄▄▌●▅▇█▇▅▄▄▌프로필은 변하지 않는다●▅▇█▇▅▄▄▌●▅▇█▇▅▄▄▌");
					}
					
				} catch (Exception e) {
					// TODO Auto-generated catch block
					System.out.println("문제 생기면 처리할꺼 정하자");
					System.out.println("일단 여긴 파일 처리 중 문제 발생한 거야");
					e.printStackTrace();
				}
				
			}else {
				System.out.println("변화 없음");
			}
	
			
			
			
			memberDao.memberUpdate(memberDto);
			
	}

	@Override
	public int memberSelectTotalCount(String searchOption, String keyword) {
		// TODO Auto-generated method stub
		return memberDao.memberSelectTotalCount(searchOption
			, keyword);
	}

	@Override
	public int memberSelectCurPage(String searchOption, String keyword, int no) {
		// TODO Auto-generated method stub
		return memberDao.memberSelectCurPage(searchOption, keyword, no);
	}

	@Override
	public List<MemberBoardDto> memberSelectList(String searchOption, String keyword, int start, int end) {
		// TODO Auto-generated method stub
		
		List<MemberBoardDto> memberList = 
				memberDao.memberSelectList(searchOption, keyword
					, start, end);
		
		return memberList;
	}

	@Override
	public void memberRemove(int member_no) {
		// TODO Auto-generated method stub
		memberDao.memberRemove(member_no);
	}

	@Override
	public int checkNick(String nick) {
		// TODO Auto-generated method stub
		
		return memberDao.checkNick(nick);
		
		
	}

	@Override
	public int checkEmail(String email) {
		// TODO Auto-generated method stub
		return memberDao.checkEmail(email);
	}

	@Override
	public int checkPhone(String phone) {
		// TODO Auto-generated method stub
		return memberDao.checkPhone(phone);
	}
}
