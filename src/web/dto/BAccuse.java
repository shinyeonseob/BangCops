package web.dto;

public class BAccuse {
	//ctrl + shitf + y 신고문 그 부분만
	
	private int accuseno;
	private String url;
	private String city;
	private String gu;
	private String dong;
	private String accusetype;
	private int idx;
	private String agent;
	private int userlevel;
	@Override
	public String toString() {
		return "BAccuse [accuseno=" + accuseno + ", url=" + url + ", city=" + city + ", gu=" + gu + ", dong=" + dong
				+ ", accusetype=" + accusetype + ", idx=" + idx + ", agent=" + agent + ", userlevel=" + userlevel + "]";
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
	public String getDong() {
		return dong;
	}
	public void setDong(String dong) {
		this.dong = dong;
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
	public int getUserlevel() {
		return userlevel;
	}
	public void setUserlevel(int userlevel) {
		this.userlevel = userlevel;
	}
	
	
	
	
}
