package com.project.projectBoard.model;

import java.util.Date;

public class ProjectCommentDto {
	
	private int PROJECT_COMMENT_NO;      	
	private int PROJECT_COMMENT_MNO;      	
	private int PROJECT_COMMENT_PBNO;     	
	private String PROJECT_COMMENT_COMMENTS;	
	private Date PROJECT_COMMENT_CRE_DATE;	
	private Date PROJECT_COMMENT_MOD_DATE;
	
	private String member_nick;
	private String profile_table_stored_name;
	
	public ProjectCommentDto() {
		super();
	}

	public ProjectCommentDto(int pROJECT_COMMENT_NO, int pROJECT_COMMENT_MNO, int pROJECT_COMMENT_PBNO,
			String pROJECT_COMMENT_COMMENTS, Date pROJECT_COMMENT_CRE_DATE, Date pROJECT_COMMENT_MOD_DATE,
			String member_nick, String profile_table_stored_name) {
		super();
		PROJECT_COMMENT_NO = pROJECT_COMMENT_NO;
		PROJECT_COMMENT_MNO = pROJECT_COMMENT_MNO;
		PROJECT_COMMENT_PBNO = pROJECT_COMMENT_PBNO;
		PROJECT_COMMENT_COMMENTS = pROJECT_COMMENT_COMMENTS;
		PROJECT_COMMENT_CRE_DATE = pROJECT_COMMENT_CRE_DATE;
		PROJECT_COMMENT_MOD_DATE = pROJECT_COMMENT_MOD_DATE;
		this.member_nick = member_nick;
		this.profile_table_stored_name = profile_table_stored_name;
	}

	public int getPROJECT_COMMENT_NO() {
		return PROJECT_COMMENT_NO;
	}

	public void setPROJECT_COMMENT_NO(int pROJECT_COMMENT_NO) {
		PROJECT_COMMENT_NO = pROJECT_COMMENT_NO;
	}

	public int getPROJECT_COMMENT_MNO() {
		return PROJECT_COMMENT_MNO;
	}

	public void setPROJECT_COMMENT_MNO(int pROJECT_COMMENT_MNO) {
		PROJECT_COMMENT_MNO = pROJECT_COMMENT_MNO;
	}

	public int getPROJECT_COMMENT_PBNO() {
		return PROJECT_COMMENT_PBNO;
	}

	public void setPROJECT_COMMENT_PBNO(int pROJECT_COMMENT_PBNO) {
		PROJECT_COMMENT_PBNO = pROJECT_COMMENT_PBNO;
	}

	public String getPROJECT_COMMENT_COMMENTS() {
		return PROJECT_COMMENT_COMMENTS;
	}

	public void setPROJECT_COMMENT_COMMENTS(String pROJECT_COMMENT_COMMENTS) {
		PROJECT_COMMENT_COMMENTS = pROJECT_COMMENT_COMMENTS;
	}

	public Date getPROJECT_COMMENT_CRE_DATE() {
		return PROJECT_COMMENT_CRE_DATE;
	}

	public void setPROJECT_COMMENT_CRE_DATE(Date pROJECT_COMMENT_CRE_DATE) {
		PROJECT_COMMENT_CRE_DATE = pROJECT_COMMENT_CRE_DATE;
	}

	public Date getPROJECT_COMMENT_MOD_DATE() {
		return PROJECT_COMMENT_MOD_DATE;
	}

	public void setPROJECT_COMMENT_MOD_DATE(Date pROJECT_COMMENT_MOD_DATE) {
		PROJECT_COMMENT_MOD_DATE = pROJECT_COMMENT_MOD_DATE;
	}

	public String getMember_nick() {
		return member_nick;
	}

	public void setMember_nick(String member_nick) {
		this.member_nick = member_nick;
	}

	public String getProfile_table_stored_name() {
		return profile_table_stored_name;
	}

	public void setProfile_table_stored_name(String profile_table_stored_name) {
		this.profile_table_stored_name = profile_table_stored_name;
	}

	@Override
	public String toString() {
		return "ProjectCommentDto [PROJECT_COMMENT_NO=" + PROJECT_COMMENT_NO + ", PROJECT_COMMENT_MNO="
				+ PROJECT_COMMENT_MNO + ", PROJECT_COMMENT_PBNO=" + PROJECT_COMMENT_PBNO + ", PROJECT_COMMENT_COMMENTS="
				+ PROJECT_COMMENT_COMMENTS + ", PROJECT_COMMENT_CRE_DATE=" + PROJECT_COMMENT_CRE_DATE
				+ ", PROJECT_COMMENT_MOD_DATE=" + PROJECT_COMMENT_MOD_DATE + ", member_nick=" + member_nick
				+ ", profile_table_stored_name=" + profile_table_stored_name + "]";
	}
	
}
