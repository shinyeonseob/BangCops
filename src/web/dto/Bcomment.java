package web.dto;

import java.util.Date;

public class Bcomment {
	private int rnum;
	private int commentno;
	private int idx;
	private Date regDate;
	private String contents;
	private int userlevel;
	private int userno;
	
	@Override
	public String toString() {
		return "Bcomment [rnum=" + rnum + ", commentno=" + commentno + ", idx=" + idx + ", regDate=" + regDate
				+ ", contents=" + contents + ", userlevel=" + userlevel + ", userno=" + userno + "]";
	}
	
	
	public int getCommentno() {
		return commentno;
	}


	public void setCommentno(int commentno) {
		this.commentno = commentno;
	}


	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public int getUserlevel() {
		return userlevel;
	}
	public void setUserlevel(int userlevel) {
		this.userlevel = userlevel;
	}
	public int getUserno() {
		return userno;
	}
	public void setUserno(int userno) {
		this.userno = userno;
	}
	
	
	
}
