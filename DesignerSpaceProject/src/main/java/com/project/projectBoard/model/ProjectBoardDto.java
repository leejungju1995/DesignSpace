package com.project.projectBoard.model;

import java.util.Date;

public class ProjectBoardDto {
	
	private int project_board_no;
	private int project_board_mno;
	private String project_board_title;
	private String project_board_contents;
	private int project_board_like;
	private int project_board_views;
	private String project_board_category; 
	private Date project_board_cre_date;	 
	private Date project_board_mod_date;
	private String project_board_del_flag;
	
	private String member_nick;
	
	private String FILE_TABLE_ORIGINAL_FILE_NAME;
	private String FILE_TABLE_STORED_FILE_NAME;
	private String PROFILE_TABLE_ORIGINAL_NAME;
	private String PROFILE_TABLE_STORED_NAME;
	
	private int project_comment_cnt;
	private String project_comment_comments;
	private Date project_comment_cre_date;
	private Date project_comment_mod_date;
	
	
	public ProjectBoardDto() {
		super();
	}

	public ProjectBoardDto(int project_board_no, int project_board_mno, String project_board_title,
			String project_board_contents, int project_board_like, int project_board_views,
			String project_board_category, Date project_board_cre_date, Date project_board_mod_date,
			String project_board_del_flag, String member_nick, String fILE_TABLE_ORIGINAL_FILE_NAME,
			String fILE_TABLE_STORED_FILE_NAME, String pROFILE_TABLE_ORIGINAL_NAME, String pROFILE_TABLE_STORED_NAME,
			int project_comment_cnt, String project_comment_comments, Date project_comment_cre_date,
			Date project_comment_mod_date) {
		super();
		this.project_board_no = project_board_no;
		this.project_board_mno = project_board_mno;
		this.project_board_title = project_board_title;
		this.project_board_contents = project_board_contents;
		this.project_board_like = project_board_like;
		this.project_board_views = project_board_views;
		this.project_board_category = project_board_category;
		this.project_board_cre_date = project_board_cre_date;
		this.project_board_mod_date = project_board_mod_date;
		this.project_board_del_flag = project_board_del_flag;
		this.member_nick = member_nick;
		FILE_TABLE_ORIGINAL_FILE_NAME = fILE_TABLE_ORIGINAL_FILE_NAME;
		FILE_TABLE_STORED_FILE_NAME = fILE_TABLE_STORED_FILE_NAME;
		PROFILE_TABLE_ORIGINAL_NAME = pROFILE_TABLE_ORIGINAL_NAME;
		PROFILE_TABLE_STORED_NAME = pROFILE_TABLE_STORED_NAME;
		this.project_comment_cnt = project_comment_cnt;
		this.project_comment_comments = project_comment_comments;
		this.project_comment_cre_date = project_comment_cre_date;
		this.project_comment_mod_date = project_comment_mod_date;
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

	public String getProject_board_contents() {
		return project_board_contents;
	}

	public void setProject_board_contents(String project_board_contents) {
		this.project_board_contents = project_board_contents;
	}

	public int getProject_board_like() {
		return project_board_like;
	}

	public void setProject_board_like(int project_board_like) {
		this.project_board_like = project_board_like;
	}

	public int getProject_board_views() {
		return project_board_views;
	}

	public void setProject_board_views(int project_board_views) {
		this.project_board_views = project_board_views;
	}

	public String getProject_board_category() {
		return project_board_category;
	}

	public void setProject_board_category(String project_board_category) {
		this.project_board_category = project_board_category;
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

	public String getMember_nick() {
		return member_nick;
	}

	public void setMember_nick(String member_nick) {
		this.member_nick = member_nick;
	}

	public String getFILE_TABLE_ORIGINAL_FILE_NAME() {
		return FILE_TABLE_ORIGINAL_FILE_NAME;
	}

	public void setFILE_TABLE_ORIGINAL_FILE_NAME(String fILE_TABLE_ORIGINAL_FILE_NAME) {
		FILE_TABLE_ORIGINAL_FILE_NAME = fILE_TABLE_ORIGINAL_FILE_NAME;
	}

	public String getFILE_TABLE_STORED_FILE_NAME() {
		return FILE_TABLE_STORED_FILE_NAME;
	}

	public void setFILE_TABLE_STORED_FILE_NAME(String fILE_TABLE_STORED_FILE_NAME) {
		FILE_TABLE_STORED_FILE_NAME = fILE_TABLE_STORED_FILE_NAME;
	}

	public String getPROFILE_TABLE_ORIGINAL_NAME() {
		return PROFILE_TABLE_ORIGINAL_NAME;
	}

	public void setPROFILE_TABLE_ORIGINAL_NAME(String pROFILE_TABLE_ORIGINAL_NAME) {
		PROFILE_TABLE_ORIGINAL_NAME = pROFILE_TABLE_ORIGINAL_NAME;
	}

	public String getPROFILE_TABLE_STORED_NAME() {
		return PROFILE_TABLE_STORED_NAME;
	}

	public void setPROFILE_TABLE_STORED_NAME(String pROFILE_TABLE_STORED_NAME) {
		PROFILE_TABLE_STORED_NAME = pROFILE_TABLE_STORED_NAME;
	}

	public int getProject_comment_cnt() {
		return project_comment_cnt;
	}

	public void setProject_comment_cnt(int project_comment_cnt) {
		this.project_comment_cnt = project_comment_cnt;
	}

	public String getProject_comment_comments() {
		return project_comment_comments;
	}

	public void setProject_comment_comments(String project_comment_comments) {
		this.project_comment_comments = project_comment_comments;
	}

	public Date getProject_comment_cre_date() {
		return project_comment_cre_date;
	}

	public void setProject_comment_cre_date(Date project_comment_cre_date) {
		this.project_comment_cre_date = project_comment_cre_date;
	}

	public Date getProject_comment_mod_date() {
		return project_comment_mod_date;
	}

	public void setProject_comment_mod_date(Date project_comment_mod_date) {
		this.project_comment_mod_date = project_comment_mod_date;
	}

	@Override
	public String toString() {
		return "ProjectBoardDto [project_board_no=" + project_board_no + ", project_board_mno=" + project_board_mno
				+ ", project_board_title=" + project_board_title + ", project_board_contents=" + project_board_contents
				+ ", project_board_like=" + project_board_like + ", project_board_views=" + project_board_views
				+ ", project_board_category=" + project_board_category + ", project_board_cre_date="
				+ project_board_cre_date + ", project_board_mod_date=" + project_board_mod_date
				+ ", project_board_del_flag=" + project_board_del_flag + ", member_nick=" + member_nick
				+ ", FILE_TABLE_ORIGINAL_FILE_NAME=" + FILE_TABLE_ORIGINAL_FILE_NAME + ", FILE_TABLE_STORED_FILE_NAME="
				+ FILE_TABLE_STORED_FILE_NAME + ", PROFILE_TABLE_ORIGINAL_NAME=" + PROFILE_TABLE_ORIGINAL_NAME
				+ ", PROFILE_TABLE_STORED_NAME=" + PROFILE_TABLE_STORED_NAME + ", project_comment_cnt="
				+ project_comment_cnt + ", project_comment_comments=" + project_comment_comments
				+ ", project_comment_cre_date=" + project_comment_cre_date + ", project_comment_mod_date="
				+ project_comment_mod_date + "]";
	}
		
}