package web.dto;

import java.util.Date;

public class BAccuse3 {
	// ctrl + shitf + y 신고문 그 부분만

	private int accuseno; // 신고번호
	private String url; // url
	private String city; // 시
	private String gu; // 구
	private String sitename; // 사이트이름
	private String accusetype; // 신고타입
	private int idx; // 게시물번호
	private String title; // 중계사
	private String agent; // 중계사
	private String phoneNo; // 전화번호
	private String property; // 부동산
	private int fileNo; // 파일번호
	private String fileRoot; // 파일위치
	private String storedName; // 저장된 파일 이름

	@Override
	public String toString() {
		return "BAccuse3 [accuseno=" + accuseno + ", url=" + url + ", city=" + city + ", gu=" + gu + ", sitename="
				+ sitename + ", accusetype=" + accusetype + ", idx=" + idx + ", title=" + title + ", agent=" + agent
				+ ", phoneNo=" + phoneNo + ", property=" + property + ", fileNo=" + fileNo + ", fileRoot=" + fileRoot
				+ ", storedName=" + storedName + "]";
	}

	public int getAccuseno() {
		return accuseno;
	}

	public void setAccuseno(int accuseno) {
		this.accuseno = accuseno;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getGu() {
		return gu;
	}

	public void setGu(String gu) {
		this.gu = gu;
	}

	public String getSitename() {
		return sitename;
	}

	public void setSitename(String sitename) {
		this.sitename = sitename;
	}

	public String getAccusetype() {
		return accusetype;
	}

	public void setAccusetype(String accusetype) {
		this.accusetype = accusetype;
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

	public String getAgent() {
		return agent;
	}

	public void setAgent(String agent) {
		this.agent = agent;
	}

	public String getPhoneNo() {
		return phoneNo;
	}

	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}

	public String getProperty() {
		return property;
	}

	public void setProperty(String property) {
		this.property = property;
	}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
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

}
