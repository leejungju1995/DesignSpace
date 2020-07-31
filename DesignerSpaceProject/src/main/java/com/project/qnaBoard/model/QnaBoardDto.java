package com.project.qnaBoard.model;

import java.util.Date;

public class QnaBoardDto {
	
	private int qna_board_no = 0;
    private int qna_board_mno = 0;
    private String qna_board_title = "";
    private String qna_board_contents = "";
    private Date qna_board_cre_date = null;
    private Date qna_board_mod_date = null;
    private Date qna_board_answer_date = null;
    private String qna_board_answer_status = "";
    
    private int qna_comment_no = 0;
    private int qna_comment_qbno = 0;
    private int qna_comment_mno = 0;
    private String qna_comment_comments = "";
    private Date qna_comment_cre_date = null;
    private Date qna_comment_mod_date = null;
    
    private int member_no = 0;
    private String member_name = "";
    private String member_nick = "";
    private String member_email = "";
    private String member_pwd = "";
    private String member_phone = "";
    private int member_check_question = 0;
    private String member_check_answer = "";
    private String member_comments = "";
    private Date member_cre_date = null;
    private Date member_mod_date = null;
    private String member_sign_check = "";
    private int member_grade = 0;
    private String member_del_flag = "";
    
    private int profile_table_no = 0;
    private int profile_table_mno = 0;
    private String profile_table_original_name = "";
    private String profile_table_stored_name = "";
	
    public QnaBoardDto() {
		super();
	}

	public QnaBoardDto(int qna_board_no, int qna_board_mno, String qna_board_title, String qna_board_contents,
			Date qna_board_cre_date, Date qna_board_mod_date, Date qna_board_answer_date,
			String qna_board_answer_status, int qna_comment_no, int qna_comment_qbno, int qna_comment_mno,
			String qna_comment_comments, Date qna_comment_cre_date, Date qna_comment_mod_date, int member_no,
			String member_name, String member_nick, String member_email, String member_pwd, String member_phone,
			int member_check_question, String member_check_answer, String member_comments, Date member_cre_date,
			Date member_mod_date, String member_sign_check, int member_grade, String member_del_flag,
			int profile_table_no, int profile_table_mno, String profile_table_original_name,
			String profile_table_stored_name) {
		super();
		this.qna_board_no = qna_board_no;
		this.qna_board_mno = qna_board_mno;
		this.qna_board_title = qna_board_title;
		this.qna_board_contents = qna_board_contents;
		this.qna_board_cre_date = qna_board_cre_date;
		this.qna_board_mod_date = qna_board_mod_date;
		this.qna_board_answer_date = qna_board_answer_date;
		this.qna_board_answer_status = qna_board_answer_status;
		this.qna_comment_no = qna_comment_no;
		this.qna_comment_qbno = qna_comment_qbno;
		this.qna_comment_mno = qna_comment_mno;
		this.qna_comment_comments = qna_comment_comments;
		this.qna_comment_cre_date = qna_comment_cre_date;
		this.qna_comment_mod_date = qna_comment_mod_date;
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

	public int getQna_board_no() {
		return qna_board_no;
	}

	public void setQna_board_no(int qna_board_no) {
		this.qna_board_no = qna_board_no;
	}

	public int getQna_board_mno() {
		return qna_board_mno;
	}

	public void setQna_board_mno(int qna_board_mno) {
		this.qna_board_mno = qna_board_mno;
	}

	public String getQna_board_title() {
		return qna_board_title;
	}

	public void setQna_board_title(String qna_board_title) {
		this.qna_board_title = qna_board_title;
	}

	public String getQna_board_contents() {
		return qna_board_contents;
	}

	public void setQna_board_contents(String qna_board_contents) {
		this.qna_board_contents = qna_board_contents;
	}

	public Date getQna_board_cre_date() {
		return qna_board_cre_date;
	}

	public void setQna_board_cre_date(Date qna_board_cre_date) {
		this.qna_board_cre_date = qna_board_cre_date;
	}

	public Date getQna_board_mod_date() {
		return qna_board_mod_date;
	}

	public void setQna_board_mod_date(Date qna_board_mod_date) {
		this.qna_board_mod_date = qna_board_mod_date;
	}

	public Date getQna_board_answer_date() {
		return qna_board_answer_date;
	}

	public void setQna_board_answer_date(Date qna_board_answer_date) {
		this.qna_board_answer_date = qna_board_answer_date;
	}

	public String getQna_board_answer_status() {
		return qna_board_answer_status;
	}

	public void setQna_board_answer_status(String qna_board_answer_status) {
		this.qna_board_answer_status = qna_board_answer_status;
	}

	public int getQna_comment_no() {
		return qna_comment_no;
	}

	public void setQna_comment_no(int qna_comment_no) {
		this.qna_comment_no = qna_comment_no;
	}

	public int getQna_comment_qbno() {
		return qna_comment_qbno;
	}

	public void setQna_comment_qbno(int qna_comment_qbno) {
		this.qna_comment_qbno = qna_comment_qbno;
	}

	public int getQna_comment_mno() {
		return qna_comment_mno;
	}

	public void setQna_comment_mno(int qna_comment_mno) {
		this.qna_comment_mno = qna_comment_mno;
	}

	public String getQna_comment_comments() {
		return qna_comment_comments;
	}

	public void setQna_comment_comments(String qna_comment_comments) {
		this.qna_comment_comments = qna_comment_comments;
	}

	public Date getQna_comment_cre_date() {
		return qna_comment_cre_date;
	}

	public void setQna_comment_cre_date(Date qna_comment_cre_date) {
		this.qna_comment_cre_date = qna_comment_cre_date;
	}

	public Date getQna_comment_mod_date() {
		return qna_comment_mod_date;
	}

	public void setQna_comment_mod_date(Date qna_comment_mod_date) {
		this.qna_comment_mod_date = qna_comment_mod_date;
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

	@Override
	public String toString() {
		return "QnaBoardDto [qna_board_no=" + qna_board_no + ", qna_board_mno=" + qna_board_mno + ", qna_board_title="
				+ qna_board_title + ", qna_board_contents=" + qna_board_contents + ", qna_board_cre_date="
				+ qna_board_cre_date + ", qna_board_mod_date=" + qna_board_mod_date + ", qna_board_answer_date="
				+ qna_board_answer_date + ", qna_board_answer_status=" + qna_board_answer_status + ", qna_comment_no="
				+ qna_comment_no + ", qna_comment_qbno=" + qna_comment_qbno + ", qna_comment_mno=" + qna_comment_mno
				+ ", qna_comment_comments=" + qna_comment_comments + ", qna_comment_cre_date=" + qna_comment_cre_date
				+ ", qna_comment_mod_date=" + qna_comment_mod_date + ", member_no=" + member_no + ", member_name="
				+ member_name + ", member_nick=" + member_nick + ", member_email=" + member_email + ", member_pwd="
				+ member_pwd + ", member_phone=" + member_phone + ", member_check_question=" + member_check_question
				+ ", member_check_answer=" + member_check_answer + ", member_comments=" + member_comments
				+ ", member_cre_date=" + member_cre_date + ", member_mod_date=" + member_mod_date
				+ ", member_sign_check=" + member_sign_check + ", member_grade=" + member_grade + ", member_del_flag="
				+ member_del_flag + ", profile_table_no=" + profile_table_no + ", profile_table_mno="
				+ profile_table_mno + ", profile_table_original_name=" + profile_table_original_name
				+ ", profile_table_stored_name=" + profile_table_stored_name + "]";
	}

	

}
