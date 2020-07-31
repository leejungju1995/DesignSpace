package com.project.freeBoard.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class FreeBoardDto {
	
	
	private int 		freeBoardNo;
	private int 		freeBoardMno;
	private String 		freeBoardTitle;
	private String 		freeBoardContents;
	private int 		freeBoardViews;
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date 		freeBoardCreDate;
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date 		freeBoardModDate;
	private int 		freeBoardLike;
	private int 		freeBoardRownum;
	private int 		freeBoardCommentCount;
	






	public int getFreeBoardCommentCount() {
		return freeBoardCommentCount;
	}




	public void setFreeBoardCommentCount(int freeBoardCommentCount) {
		this.freeBoardCommentCount = freeBoardCommentCount;
	}




	private int 		freeLikeNo;
	private int 		freeLikeMno;
	private int 		freeLikeFbno;
	private String 		freeLikeFlag;
	
	
	private int 		freeCommentNo;
	private int 		freeCommentFbno;
	private int 		freeCommentMno;
	private String 		freeCommentComments;
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date 		freeCommentCreDate;
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date 		freeCommentModDate;
	
	
	private int 		memberNo;
	private String 		memberName;
	private String 		memberNick;
	private String 		memberEmail;
	private String 		memberPwd;
	private String 		memberPhone;
	private int 		memberCheckQuestion;
	private String 		memberCheckAnswer;
	private String 		memberComments;
	private String 		memberSignCheck;
	private String 		memberDelFlag;
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date 		memberCreDate;
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")

	private Date 		memberModDate;
	private int 		memberGrade;
	
	
	private int 		profileTableNo;
	private int 		profileTableMno;
	private String 		profileTableOriginalName;
	private String 		profileTableStoredName;
	
	
	
	
	public FreeBoardDto() {
		super();
	}

	


	public FreeBoardDto(int freeBoardNo, int freeBoardMno, String freeBoardTitle, String freeBoardContents,
			int freeBoardViews, Date freeBoardCreDate, Date freeBoardModDate, int freeBoardLike, int freeLikeNo,
			int freeLikeMno, int freeLikeFbno, String freeLikeFlag, int freeCommentNo, int freeCommentFbno,
			int freeCommentMno, String freeCommentComments, Date freeCommentCreDate, Date freeCommentModDate,
			int memberNo, String memberName, String memberNick, String memberEmail, String memberPwd,
			String memberPhone, int memberCheckQuestion, String memberCheckAnswer, String memberComments,
			String memberSignCheck, String memberDelFlag, Date memberCreDate, Date memberModDate, int memberGrade,
			int profileTableNo, int profileTableMno, String profileTableOriginalName, String profileTableStoredName) {
		super();
		this.freeBoardNo = freeBoardNo;
		this.freeBoardMno = freeBoardMno;
		this.freeBoardTitle = freeBoardTitle;
		this.freeBoardContents = freeBoardContents;
		this.freeBoardViews = freeBoardViews;
		this.freeBoardCreDate = freeBoardCreDate;
		this.freeBoardModDate = freeBoardModDate;
		this.freeBoardLike = freeBoardLike;
		this.freeLikeNo = freeLikeNo;
		this.freeLikeMno = freeLikeMno;
		this.freeLikeFbno = freeLikeFbno;
		this.freeLikeFlag = freeLikeFlag;
		this.freeCommentNo = freeCommentNo;
		this.freeCommentFbno = freeCommentFbno;
		this.freeCommentMno = freeCommentMno;
		this.freeCommentComments = freeCommentComments;
		this.freeCommentCreDate = freeCommentCreDate;
		this.freeCommentModDate = freeCommentModDate;
		this.memberNo = memberNo;
		this.memberName = memberName;
		this.memberNick = memberNick;
		this.memberEmail = memberEmail;
		this.memberPwd = memberPwd;
		this.memberPhone = memberPhone;
		this.memberCheckQuestion = memberCheckQuestion;
		this.memberCheckAnswer = memberCheckAnswer;
		this.memberComments = memberComments;
		this.memberSignCheck = memberSignCheck;
		this.memberDelFlag = memberDelFlag;
		this.memberCreDate = memberCreDate;
		this.memberModDate = memberModDate;
		this.memberGrade = memberGrade;
		this.profileTableNo = profileTableNo;
		this.profileTableMno = profileTableMno;
		this.profileTableOriginalName = profileTableOriginalName;
		this.profileTableStoredName = profileTableStoredName;
	}




	public int getFreeBoardNo() {
		return freeBoardNo;
	}


	public void setFreeBoardNo(int freeBoardNo) {
		this.freeBoardNo = freeBoardNo;
	}

	public int getFreeBoardRownum() {
		return freeBoardRownum;
	}
	
	
	
	
	public void setFreeBoardRownum(int freeBoardRownum) {
		this.freeBoardRownum = freeBoardRownum;
	}

	public int getFreeBoardMno() {
		return freeBoardMno;
	}

	public int getFreeBoardLike() {
		return freeBoardLike;
	}
	
	
	public void setFreeBoardLike(int freeBoardLike) {
		this.freeBoardLike = freeBoardLike;
	}

	public void setFreeBoardMno(int freeBoardMno) {
		this.freeBoardMno = freeBoardMno;
	}


	public String getFreeBoardTitle() {
		return freeBoardTitle;
	}


	public void setFreeBoardTitle(String freeBoardTitle) {
		this.freeBoardTitle = freeBoardTitle;
	}


	public String getFreeBoardContents() {
		return freeBoardContents;
	}


	public void setFreeBoardContents(String freeBoardContents) {
		this.freeBoardContents = freeBoardContents;
	}


	public int getFreeBoardViews() {
		return freeBoardViews;
	}


	public void setFreeBoardViews(int freeBoardViews) {
		this.freeBoardViews = freeBoardViews;
	}


	public Date getFreeBoardCreDate() {
		return freeBoardCreDate;
	}


	public void setFreeBoardCreDate(Date freeBoardCreDate) {
		this.freeBoardCreDate = freeBoardCreDate;
	}


	public Date getFreeBoardModDate() {
		return freeBoardModDate;
	}


	public void setFreeBoardModDate(Date freeBoardModDate) {
		this.freeBoardModDate = freeBoardModDate;
	}


	public int getFreeLikeNo() {
		return freeLikeNo;
	}


	public void setFreeLikeNo(int freeLikeNo) {
		this.freeLikeNo = freeLikeNo;
	}


	public int getFreeLikeMno() {
		return freeLikeMno;
	}


	public void setFreeLikeMno(int freeLikeMno) {
		this.freeLikeMno = freeLikeMno;
	}


	public int getFreeLikeFbno() {
		return freeLikeFbno;
	}


	public void setFreeLikeFbno(int freeLikeFbno) {
		this.freeLikeFbno = freeLikeFbno;
	}


	public String getFreeLikeFlag() {
		return freeLikeFlag;
	}


	public void setFreeLikeFlag(String freeLikeFlag) {
		this.freeLikeFlag = freeLikeFlag;
	}


	public int getFreeCommentNo() {
		return freeCommentNo;
	}


	public void setFreeCommentNo(int freeCommentNo) {
		this.freeCommentNo = freeCommentNo;
	}


	public int getFreeCommentFbno() {
		return freeCommentFbno;
	}


	public void setFreeCommentFbno(int freeCommentFbno) {
		this.freeCommentFbno = freeCommentFbno;
	}


	public int getFreeCommentMno() {
		return freeCommentMno;
	}


	public void setFreeCommentMno(int freeCommentMno) {
		this.freeCommentMno = freeCommentMno;
	}


	public String getFreeCommentComments() {
		return freeCommentComments;
	}


	public void setFreeCommentComments(String freeCommentComments) {
		this.freeCommentComments = freeCommentComments;
	}


	public Date getFreeCommentCreDate() {
		return freeCommentCreDate;
	}


	public void setFreeCommentCreDate(Date freeCommentCreDate) {
		this.freeCommentCreDate = freeCommentCreDate;
	}


	public Date getFreeCommentModDate() {
		return freeCommentModDate;
	}


	public void setFreeCommentModDate(Date freeCommentModDate) {
		this.freeCommentModDate = freeCommentModDate;
	}


	public int getMemberNo() {
		return memberNo;
	}


	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}


	public String getMemberName() {
		return memberName;
	}


	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}


	public String getMemberNick() {
		return memberNick;
	}


	public void setMemberNick(String memberNick) {
		this.memberNick = memberNick;
	}


	public String getMemberEmail() {
		return memberEmail;
	}


	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}


	public String getMemberPwd() {
		return memberPwd;
	}


	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}


	public String getMemberPhone() {
		return memberPhone;
	}


	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}


	public int getMemberCheckQuestion() {
		return memberCheckQuestion;
	}


	public void setMemberCheckQuestion(int memberCheckQuestion) {
		this.memberCheckQuestion = memberCheckQuestion;
	}


	public String getMemberCheckAnswer() {
		return memberCheckAnswer;
	}


	public void setMemberCheckAnswer(String memberCheckAnswer) {
		this.memberCheckAnswer = memberCheckAnswer;
	}


	public String getMemberComments() {
		return memberComments;
	}


	public void setMemberComments(String memberComments) {
		this.memberComments = memberComments;
	}


	public String getMemberSignCheck() {
		return memberSignCheck;
	}


	public void setMemberSignCheck(String memberSignCheck) {
		this.memberSignCheck = memberSignCheck;
	}


	public String getMemberDelFlag() {
		return memberDelFlag;
	}


	public void setMemberDelFlag(String memberDelFlag) {
		this.memberDelFlag = memberDelFlag;
	}


	public Date getMemberCreDate() {
		return memberCreDate;
	}


	public void setMemberCreDate(Date memberCreDate) {
		this.memberCreDate = memberCreDate;
	}


	public Date getMemberModDate() {
		return memberModDate;
	}


	public void setMemberModDate(Date memberModDate) {
		this.memberModDate = memberModDate;
	}


	public int getMemberGrade() {
		return memberGrade;
	}


	public void setMemberGrade(int memberGrade) {
		this.memberGrade = memberGrade;
	}


	public int getProfileTableNo() {
		return profileTableNo;
	}


	public void setProfileTableNo(int profileTableNo) {
		this.profileTableNo = profileTableNo;
	}


	public int getProfileTableMno() {
		return profileTableMno;
	}


	public void setProfileTableMno(int profileTableMno) {
		this.profileTableMno = profileTableMno;
	}


	public String getProfileTableOriginalName() {
		return profileTableOriginalName;
	}


	public void setProfileTableOriginalName(String profileTableOriginalName) {
		this.profileTableOriginalName = profileTableOriginalName;
	}


	public String getProfileTableStoredName() {
		return profileTableStoredName;
	}


	public void setProfileTableStoredName(String profileTableStoredName) {
		this.profileTableStoredName = profileTableStoredName;
	}




	@Override
	public String toString() {
		return "FreeBoardDto [freeBoardNo=" + freeBoardNo + ", freeBoardMno=" + freeBoardMno + ", freeBoardTitle="
				+ freeBoardTitle + ", freeBoardContents=" + freeBoardContents + ", freeBoardViews=" + freeBoardViews
				+ ", freeBoardCreDate=" + freeBoardCreDate + ", freeBoardModDate=" + freeBoardModDate
				+ ", freeBoardLike=" + freeBoardLike + ", freeLikeNo=" + freeLikeNo + ", freeLikeMno=" + freeLikeMno
				+ ", freeLikeFbno=" + freeLikeFbno + ", freeLikeFlag=" + freeLikeFlag + ", freeCommentNo="
				+ freeCommentNo + ", freeCommentFbno=" + freeCommentFbno + ", freeCommentMno=" + freeCommentMno
				+ ", freeCommentComments=" + freeCommentComments + ", freeCommentCreDate=" + freeCommentCreDate
				+ ", freeCommentModDate=" + freeCommentModDate + ", memberNo=" + memberNo + ", memberName=" + memberName
				+ ", memberNick=" + memberNick + ", memberEmail=" + memberEmail + ", memberPwd=" + memberPwd
				+ ", memberPhone=" + memberPhone + ", memberCheckQuestion=" + memberCheckQuestion
				+ ", memberCheckAnswer=" + memberCheckAnswer + ", memberComments=" + memberComments
				+ ", memberSignCheck=" + memberSignCheck + ", memberDelFlag=" + memberDelFlag + ", memberCreDate="
				+ memberCreDate + ", memberModDate=" + memberModDate + ", memberGrade=" + memberGrade
				+ ", profileTableNo=" + profileTableNo + ", profileTableMno=" + profileTableMno
				+ ", profileTableOriginalName=" + profileTableOriginalName + ", profileTableStoredName="
				+ profileTableStoredName + "]";
	}


	
}
