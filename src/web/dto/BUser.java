package web.dto;

public class BUser {
	private String userid;
	private String userpw;
	private String usernick;
	private String username;
	private String usertel;
	private int userlevel;	
	
	@Override
	public String toString() {
		return "BUser [userid=" + userid + ", userpw=" + userpw + ", usernick=" + usernick + ", username=" + username
				+ ", usertel=" + usertel + ", userlevel=" + userlevel + "]";
	}
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpw() {
		return userpw;
	}
	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}
	public String getUsernick() {
		return usernick;
	}
	public void setUsernick(String usernick) {
		this.usernick = usernick;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUsertel() {
		return usertel;
	}
	public void setUsertel(String usertel) {
		this.usertel = usertel;
	}
	public int getUserlevel() {
		return userlevel;
	}
	public void setUserlevel(int userlevel) {
		this.userlevel = userlevel;
	}

}
