package com.project.member.model;

import java.util.Date;

public class MemberBoardDto {

	private int member_no;
	private String member_nick;
	private String member_email;
	private Date member_cre_date;
	private int member_grade;

	
	private String board_cnt;
	private String like_cnt;

	public MemberBoardDto() {
		super();
	}

	public MemberBoardDto(int member_no, String member_nick, String member_email, Date member_cre_date,
			int member_grade, String profile_table_original_name,
			String profile_table_stored_name, String board_cnt, String view_cnt, String like_cnt) {
		super();
		this.member_no = member_no;
		this.member_nick = member_nick;
		this.member_email = member_email;
		this.member_cre_date = member_cre_date;
		this.member_grade = member_grade;
		this.board_cnt = board_cnt;
		this.like_cnt = like_cnt;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public String getMember_nick() {
		return member_nick;
	}

	public void setMember_nick(String member_nick) {
		this.member_nick = member_nick;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public Date getMember_cre_date() {
		return member_cre_date;
	}

	public void setMember_cre_date(Date member_cre_date) {
		this.member_cre_date = member_cre_date;
	}

	public int getMember_grade() {
		return member_grade;
	}

	public void setMember_grade(int member_grade) {
		this.member_grade = member_grade;
	}

	


	public String getboard_cnt() {
		return board_cnt;
	}

	public void setboard_cnt(String board_cnt) {
		this.board_cnt = board_cnt;
	}


	public String getlike_cnt() {
		return like_cnt;
	}

	public void setlike_cnt(String like_cnt) {
		this.like_cnt = like_cnt;
	}

	@Override
	public String toString() {
		return "MemberBoardDto [member_no=" + member_no + ", member_nick=" + member_nick + ", member_email="
				+ member_email + ", member_cre_date=" + member_cre_date + ", member_grade=" + member_grade
				+ ", profile_table_original_name="
				+ ", board_cnt=" + board_cnt + ", like_cnt=" + like_cnt + "]";
	}

	
	
}