package web.dto;

import java.util.Date;

public class BAccuse2 {
	// ctrl + shitf + y 신고문 그 부분만

	private int accuseno;
	private String url;
	private String city;
	private String gu;
	private String sitename;
	private String accusetype;
	private int idx;
	private String agent;
	private String phoneNo;
	private String property;
	private String title;
	private String contents;
	private Date regDate;
	private int userNo;
	private String usernick;
	private String userid;
	
	
	
	@Override
	public String toString() {
		return "BAccuse2 [accuseno=" + accuseno + ", url=" + url + ", city=" + city + ", gu=" + gu + ", sitename="
				+ sitename + ", accusetype=" + accusetype + ", idx=" + idx + ", agent=" + agent + ", phoneNo=" + phoneNo
				+ ", property=" + property + ", title=" + title + ", contents=" + contents + ", regDate=" + regDate
				+ ", userNo=" + userNo + ", usernick=" + usernick + ", userid=" + userid + "]";
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
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getUsernick() {
		return usernick;
	}
	public void setUsernick(String usernick) {
		this.usernick = usernick;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	

}
