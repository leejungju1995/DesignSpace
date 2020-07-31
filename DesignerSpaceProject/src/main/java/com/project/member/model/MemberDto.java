package com.project.member.model;

import java.util.Date;

public class MemberDto {

	private int member_no;
	private String member_name;
	private String member_nick;
	private String member_email;
	private String member_pwd;
	private String member_phone;
	private int member_check_question;
	private String member_check_answer;
	private String member_comments;
	private Date member_cre_date;
	private Date member_mod_date;
	private String member_sign_check;
	private int member_grade;
	private String member_del_flag;

	private int profile_table_no;
	private int profile_table_mno;

	private String profile_table_original_name;
	private String profile_table_stored_name;
	


	public MemberDto() {
		super();
	}



	public MemberDto(int member_no, String member_name, String member_nick, String member_email, String member_pwd,
			String member_phone, int member_check_question, String member_check_answer, String member_comments,
			Date member_cre_date, Date member_mod_date, String member_sign_check, int member_grade,
			String member_del_flag, int profile_table_no, int profile_table_mno, String profile_table_original_name,
			String profile_table_stored_name) {
		super();
		this.member_no = member_no;
		this.member_name = member_name;
		this.member_nick = member_nick;
		this.member_email = member_email;
		this.member_pwd = member_pwd;
		this.member_phone = member_phone;
		this.member_check_question = member_check_question;
		this.member_check_answer = member_check_answer;
		this.member_comments = member_comments;
		this.member_cre_date = member_cre_date;
		this.member_mod_date = member_mod_date;
		this.member_sign_check = member_sign_check;
		this.member_grade = member_grade;
		this.member_del_flag = member_del_flag;
		this.profile_table_no = profile_table_no;
		this.profile_table_mno = profile_table_mno;
		this.profile_table_original_name = profile_table_original_name;
		this.profile_table_stored_name = profile_table_stored_name;
	}



	@Override
	public String toString() {
		return "MemberDto [member_no=" + member_no + ", member_name=" + member_name + ", member_nick=" + member_nick
				+ ", member_email=" + member_email + ", member_pwd=" + member_pwd + ", member_phone=" + member_phone
				+ ", member_check_question=" + member_check_question + ", member_check_answer=" + member_check_answer
				+ ", member_comments=" + member_comments + ", member_cre_date=" + member_cre_date + ", member_mod_date="
				+ member_mod_date + ", member_sign_check=" + member_sign_check + ", member_grade=" + member_grade
				+ ", member_del_flag=" + member_del_flag + ", profile_table_no=" + profile_table_no
				+ ", profile_table_mno=" + profile_table_mno + ", profile_table_original_name="
				+ profile_table_original_name + ", profile_table_stored_name=" + profile_table_stored_name + "]";
	}



	public int getMember_no() {
		return member_no;
	}



	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}



	public String getMember_name() {
		return member_name;
	}



	public void setMember_name(String member_name) {
		this.member_name = member_name;
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



	public String getMember_pwd() {
		return member_pwd;
	}



	public void setMember_pwd(String member_pwd) {
		this.member_pwd = member_pwd;
	}



	public String getMember_phone() {
		return member_phone;
	}



	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}



	public int getMember_check_question() {
		return member_check_question;
	}



	public void setMember_check_question(int member_check_question) {
		this.member_check_question = member_check_question;
	}



	public String getMember_check_answer() {
		return member_check_answer;
	}



	public void setMember_check_answer(String member_check_answer) {
		this.member_check_answer = member_check_answer;
	}



	public String getMember_comments() {
		return member_comments;
	}



	public void setMember_comments(String member_comments) {
		this.member_comments = member_comments;
	}



	public Date getMember_cre_date() {
		return member_cre_date;
	}



	public void setMember_cre_date(Date member_cre_date) {
		this.member_cre_date = member_cre_date;
	}



	public Date getMember_mod_date() {
		return member_mod_date;
	}



	public void setMember_mod_date(Date member_mod_date) {
		this.member_mod_date = member_mod_date;
	}



	public String getMember_sign_check() {
		return member_sign_check;
	}



	public void setMember_sign_check(String member_sign_check) {
		this.member_sign_check = member_sign_check;
	}



	public int getMember_grade() {
		return member_grade;
	}



	public void setMember_grade(int member_grade) {
		this.member_grade = member_grade;
	}



	public String getMember_del_flag() {
		return member_del_flag;
	}



	public void setMember_del_flag(String member_del_flag) {
		this.member_del_flag = member_del_flag;
	}



	public int getProfile_table_no() {
		return profile_table_no;
	}



	public void setProfile_table_no(int profile_table_no) {
		this.profile_table_no = profile_table_no;
	}



	public int getProfile_table_mno() {
		return profile_table_mno;
	}



	public void setProfile_table_mno(int profile_table_mno) {
		this.profile_table_mno = profile_table_mno;
	}



	public String getProfile_table_original_name() {
		return profile_table_original_name;
	}



	public void setProfile_table_original_name(String profile_table_original_name) {
		this.profile_table_original_name = profile_table_original_name;
	}



	public String getProfile_table_stored_name() {
		return profile_table_stored_name;
	}



	public void setProfile_table_stored_name(String profile_table_stored_name) {
		this.profile_table_stored_name = profile_table_stored_name;
	}

	

	

	
}