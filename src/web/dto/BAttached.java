package web.dto;

import java.util.Date;

public class BAttached {
	private int fileNo;
	private String originName;
	private String fileRoot;
	private String storedName;
	private Date writeDate;
	private int idx;
	private long filesize;
	
	
	
	@Override
	public String toString() {
		return "BAttached [fileNo=" + fileNo + ", originName=" + originName + ", fileRoot=" + fileRoot + ", storedName="
				+ storedName + ", writeDate=" + writeDate + ", idx=" + idx + ", filesize=" + filesize + "]";
	}
	public long getFilesize() {
		return filesize;
	}
	public void setFilesize(long filesize) {
		this.filesize = filesize;
	}
	
	public int getFileNo() {
		return fileNo;
	}
	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}
	public String getOriginName() {
		return originName;
	}
	public void setOriginName(String originName) {
		this.originName = originName;
	}
	public String getFileRoot() {
		return fileRoot;
	}
	public void setFileRoot(String fileRoot) {
		this.fileRoot = fileRoot;
	}
	public String getStoredName() {
		return storedName;
	}
	public void setStoredName(String storedName) {
		this.storedName = storedName;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	
	
	
}
