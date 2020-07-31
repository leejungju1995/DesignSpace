package com.project.reportBoard.model;

import java.util.Date;

public class ReportBoardDto {

	private int report_board_no = 0;
	private int report_board_mno = 0;
	private String report_board_reason = "";
	private String report_board_title = "";
	private String report_board_name = "";
	private String report_board_contents = "";
	private Date report_board_cre_date = null;
	private Date report_board_mod_date = null;
	private Date report_board_answer_date= null;
	private String report_board_answer_status = "";
	
	private int project_board_no = 0;
	private int project_board_mno = 0;
	private String project_board_title = "";
	private int project_board_views = 0;
	private Date project_board_cre_date = null;
	private Date project_board_mod_date = null;
	private String project_board_del_flag = "";
	private String project_board_category = "";
	private String project_board_contents = "";
	
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
	
	public ReportBoardDto() {
		super();
	}

	public ReportBoardDto(int report_board_no, int report_board_mno, String report_board_reason,
			String report_board_title, String report_board_name, String report_board_contents,
			Date report_board_cre_date, Date report_board_mod_date, Date report_board_answer_date,
			String report_board_answer_status, int project_board_no, int project_board_mno, String project_board_title,
			int project_board_views, Date project_board_cre_date, Date project_board_mod_date,
			String project_board_del_flag, String project_board_category, String project_board_contents, int member_no,
			String member_name, String member_nick, String member_email, String member_pwd, String member_phone,
			int member_check_question, String member_check_answer, String member_comments, Date member_cre_date,
			Date member_mod_date, String member_sign_check, int member_grade, String member_del_flag) {
		super();
		this.report_board_no = report_board_no;
		this.report_board_mno = report_board_mno;
		this.report_board_reason = report_board_reason;
		this.report_board_title = report_board_title;
		this.report_board_name = report_board_name;
		this.report_board_contents = report_board_contents;
		this.report_board_cre_date = report_board_cre_date;
		this.report_board_mod_date = report_board_mod_date;
		this.report_board_answer_date = report_board_answer_date;
		this.report_board_answer_status = report_board_answer_status;
		this.project_board_no = project_board_no;
		this.project_board_mno = project_board_mno;
		this.project_board_title = project_board_title;
		this.project_board_views = project_board_views;
		this.project_board_cre_date = project_board_cre_date;
		this.project_board_mod_date = project_board_mod_date;
		this.project_board_del_flag = project_board_del_flag;
		this.project_board_category = project_board_category;
		this.project_board_contents = project_board_contents;
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
	}

	public int getReport_board_no() {
		return report_board_no;
	}

	public void setReport_board_no(int report_board_no) {
		this.report_board_no = report_board_no;
	}

	public int getReport_board_mno() {
		return report_board_mno;
	}

	public void setReport_board_mno(int report_board_mno) {
		this.report_board_mno = report_board_mno;
	}

	public String getReport_board_reason() {
		return report_board_reason;
	}

	public void setReport_board_reason(String report_board_reason) {
		this.report_board_reason = report_board_reason;
	}

	public String getReport_board_title() {
		return report_board_title;
	}

	public void setReport_board_title(String report_board_title) {
		this.report_board_title = report_board_title;
	}

	public String getReport_board_name() {
		return report_board_name;
	}

	public void setReport_board_name(String report_board_name) {
		this.report_board_name = report_board_name;
	}

	public String getReport_board_contents() {
		return report_board_contents;
	}

	public void setReport_board_contents(String report_board_contents) {
		this.report_board_contents = report_board_contents;
	}

	public Date getReport_board_cre_date() {
		return report_board_cre_date;
	}

	public void setReport_board_cre_date(Date report_board_cre_date) {
		this.report_board_cre_date = report_board_cre_date;
	}

	public Date getReport_board_mod_date() {
		return report_board_mod_date;
	}

	public void setReport_board_mod_date(Date report_board_mod_date) {
		this.report_board_mod_date = report_board_mod_date;
	}

	public Date getReport_board_answer_date() {
		return report_board_answer_date;
	}

	public void setReport_board_answer_date(Date report_board_answer_date) {
		this.report_board_answer_date = report_board_answer_date;
	}

	public String getReport_board_answer_status() {
		return report_board_answer_status;
	}

	public void setReport_board_answer_status(String report_board_answer_status) {
		this.report_board_answer_status = report_board_answer_status;
	}

	public int getProject_board_no() {
		return project_board_no;
	}

	public void setProject_board_no(int project_board_no) {
		this.project_board_no = project_board_no;
	}

	public int getProject_board_mno() {
		return project_board_mno;
	}

	public void setProject_board_mno(int project_board_mno) {
		this.project_board_mno = project_board_mno;
	}

	public String getProject_board_title() {
		return project_board_title;
	}

	public void setProject_board_title(String project_board_title) {
		this.project_board_title = project_board_title;
	}

	public int getProject_board_views() {
		return project_board_views;
	}

	public void setProject_board_views(int project_board_views) {
		this.project_board_views = project_board_views;
	}

	public Date getProject_board_cre_date() {
		return project_board_cre_date;
	}

	public void setProject_board_cre_date(Date project_board_cre_date) {
		this.project_board_cre_date = project_board_cre_date;
	}

	public Date getProject_board_mod_date() {
		return project_board_mod_date;
	}

	public void setProject_board_mod_date(Date project_board_mod_date) {
		this.project_board_mod_date = project_board_mod_date;
	}

	public String getProject_board_del_flag() {
		return project_board_del_flag;
	}

	public void setProject_board_del_flag(String project_board_del_flag) {
		this.project_board_del_flag = project_board_del_flag;
	}

	public String getProject_board_category() {
		return project_board_category;
	}

	public void setProject_board_category(String project_board_category) {
		this.project_board_category = project_board_category;
	}

	public String getProject_board_contents() {
		return project_board_contents;
	}

	public void setProject_board_contents(String project_board_contents) {
		this.project_board_contents = project_board_contents;
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

	@Override
	public String toString() {
		return "ReportBoardDto [report_board_no=" + report_board_no + ", report_board_mno=" + report_board_mno
				+ ", report_board_reason=" + report_board_reason + ", report_board_title=" + report_board_title
				+ ", report_board_name=" + report_board_name + ", report_board_contents=" + report_board_contents
				+ ", report_board_cre_date=" + report_board_cre_date + ", report_board_mod_date="
				+ report_board_mod_date + ", report_board_answer_date=" + report_board_answer_date
				+ ", report_board_answer_status=" + report_board_answer_status + ", project_board_no="
				+ project_board_no + ", project_board_mno=" + project_board_mno + ", project_board_title="
				+ project_board_title + ", project_board_views=" + project_board_views + ", project_board_cre_date="
				+ project_board_cre_date + ", project_board_mod_date=" + project_board_mod_date
				+ ", project_board_del_flag=" + project_board_del_flag + ", project_board_category="
				+ project_board_category + ", project_board_contents=" + project_board_contents + ", member_no="
				+ member_no + ", member_name=" + member_name + ", member_nick=" + member_nick + ", member_email="
				+ member_email + ", member_pwd=" + member_pwd + ", member_phone=" + member_phone
				+ ", member_check_question=" + member_check_question + ", member_check_answer=" + member_check_answer
				+ ", member_comments=" + member_comments + ", member_cre_date=" + member_cre_date + ", member_mod_date="
				+ member_mod_date + ", member_sign_check=" + member_sign_check + ", member_grade=" + member_grade
				+ ", member_del_flag=" + member_del_flag + "]";
	}

	
	
}
