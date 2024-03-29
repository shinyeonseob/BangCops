package web.dto;

import java.util.Date;

public class BBoardAndBboardType {
	private int rnum;
	private int idx;
	private String title;
	private String contents;
	private Date regDate;
	private int hits;
	
	
	private int reco;
	private int boardNo;
	private int userNo;
	private String usernick;
	
	private String boardname;
	private String userlevel;

	
	
	
	
	public int getRnum() {
		return rnum;
	}
	
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public String getBoardname() {
		return boardname;
	}

	public void setBoardname(String boardname) {
		this.boardname = boardname;
	}

	public String getUserlevel() {
		return userlevel;
	}

	public void setUserlevel(String userlevel) {
		this.userlevel = userlevel;
	}

	@Override
	public String toString() {
		return "BBoardAndBboardType [rnum=" + rnum + ", idx=" + idx + ", title=" + title + ", contents=" + contents
				+ ", regDate=" + regDate + ", hits=" + hits + ", reco=" + reco + ", boardNo=" + boardNo + ", userNo="
				+ userNo + ", usernick=" + usernick + ", boardname=" + boardname + ", userlevel=" + userlevel + "]";
	}

	public String getUsernick() {
		return usernick;
	}

	public void setUsernick(String usernick) {
		this.usernick = usernick;
	}

	public int getHits() {
		return hits;
	}
	
	public void setHits(int hits) {
		this.hits = hits;
	}
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getReco() {
		return reco;
	}
	public void setReco(int reco) {
		this.reco = reco;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
}
