package web.dto;

public class BUser {

	private int userno;
	private String userid;
	private String userpw;
	private String usernick;
	private String username;
	private String usertel;
	private String photo;
	private int userlevel;

	@Override
	public String toString() {
		return "BUser [userno=" + userno + ", userid=" + userid + ", userpw=" + userpw + ", usernick=" + usernick
				+ ", username=" + username + ", usertel=" + usertel + ", photo=" + photo + ", userlevel=" + userlevel
				+ "]";
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public int getUserno() {
		return userno;
	}

	public void setUserno(int userno) {
		this.userno = userno;
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
