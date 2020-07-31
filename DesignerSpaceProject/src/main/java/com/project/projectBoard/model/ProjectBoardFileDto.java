package com.project.projectBoard.model;

import java.util.Date;

public class ProjectBoardFileDto {
	private int FILE_TABLE_NO;						
    private int FILE_TABLE_MNO; 						
    private int FILE_TABLE_PBNO; 					
    private String FILE_TABLE_ORIGINAL_FILE_NAME; 	
    private String FILE_TABLE_STORED_FILE_NAME;			
    private Date FILE_TABLE_CRE_DATE; 				
    private Date FILE_TABLE_mod_date;
	
    public ProjectBoardFileDto() {
		super();
	}

	public ProjectBoardFileDto(int fILE_TABLE_NO, int fILE_TABLE_MNO, int fILE_TABLE_PBNO,
			String fILE_TABLE_ORIGINAL_FILE_NAME, String fILE_TABLE_STORED_FILE_NAME, Date fILE_TABLE_CRE_DATE,
			Date fILE_TABLE_mod_date) {
		super();
		FILE_TABLE_NO = fILE_TABLE_NO;
		FILE_TABLE_MNO = fILE_TABLE_MNO;
		FILE_TABLE_PBNO = fILE_TABLE_PBNO;
		FILE_TABLE_ORIGINAL_FILE_NAME = fILE_TABLE_ORIGINAL_FILE_NAME;
		FILE_TABLE_STORED_FILE_NAME = fILE_TABLE_STORED_FILE_NAME;
		FILE_TABLE_CRE_DATE = fILE_TABLE_CRE_DATE;
		FILE_TABLE_mod_date = fILE_TABLE_mod_date;
	}

	public int getFILE_TABLE_NO() {
		return FILE_TABLE_NO;
	}

	public void setFILE_TABLE_NO(int fILE_TABLE_NO) {
		FILE_TABLE_NO = fILE_TABLE_NO;
	}

	public int getFILE_TABLE_MNO() {
		return FILE_TABLE_MNO;
	}

	public void setFILE_TABLE_MNO(int fILE_TABLE_MNO) {
		FILE_TABLE_MNO = fILE_TABLE_MNO;
	}

	public int getFILE_TABLE_PBNO() {
		return FILE_TABLE_PBNO;
	}

	public void setFILE_TABLE_PBNO(int fILE_TABLE_PBNO) {
		FILE_TABLE_PBNO = fILE_TABLE_PBNO;
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

	public Date getFILE_TABLE_CRE_DATE() {
		return FILE_TABLE_CRE_DATE;
	}

	public void setFILE_TABLE_CRE_DATE(Date fILE_TABLE_CRE_DATE) {
		FILE_TABLE_CRE_DATE = fILE_TABLE_CRE_DATE;
	}

	public Date getFILE_TABLE_mod_date() {
		return FILE_TABLE_mod_date;
	}

	public void setFILE_TABLE_mod_date(Date fILE_TABLE_mod_date) {
		FILE_TABLE_mod_date = fILE_TABLE_mod_date;
	}

	@Override
	public String toString() {
		return "ProjectBoardFileDto [FILE_TABLE_NO=" + FILE_TABLE_NO + ", FILE_TABLE_MNO=" + FILE_TABLE_MNO
				+ ", FILE_TABLE_PBNO=" + FILE_TABLE_PBNO + ", FILE_TABLE_ORIGINAL_FILE_NAME="
				+ FILE_TABLE_ORIGINAL_FILE_NAME + ", FILE_TABLE_STORED_FILE_NAME=" + FILE_TABLE_STORED_FILE_NAME
				+ ", FILE_TABLE_CRE_DATE=" + FILE_TABLE_CRE_DATE + ", FILE_TABLE_mod_date=" + FILE_TABLE_mod_date + "]";
	}	
        
}
