package web.dto;

public class Admin {

	private String adminid;
	private String adminpw;
	private String adminnick;
	private String adminname;

	@Override
	public String toString() {
		return "Admin [adminid=" + adminid + ", adminpw=" + adminpw + ", adminnick=" + adminnick + ", adminname="
				+ adminname + "]";
	}

	public String getAdminid() {
		return adminid;
	}

	public void setAdminid(String adminid) {
		this.adminid = adminid;
	}

	public String getAdminpw() {
		return adminpw;
	}

	public void setAdminpw(String adminpw) {
		this.adminpw = adminpw;
	}

	public String getAdminnick() {
		return adminnick;
	}

	public void setAdminnick(String adminnick) {
		this.adminnick = adminnick;
	}

	public String getAdminname() {
		return adminname;
	}

	public void setAdminname(String adminname) {
		this.adminname = adminname;
	}

}
