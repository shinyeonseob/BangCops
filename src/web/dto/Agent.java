package web.dto;

public class Agent {
	private String agent;
	private String property;
	private int phoneno;
	private String aemail;
	
	
	@Override
	public String toString() {
		return "Agent [agent=" + agent + ", property=" + property + ", phoneno=" + phoneno + ", aemail=" + aemail + "]";
	}


	public String getAgent() {
		return agent;
	}


	public void setAgent(String agent) {
		this.agent = agent;
	}


	public String getProperty() {
		return property;
	}


	public void setProperty(String property) {
		this.property = property;
	}


	public int getPhoneno() {
		return phoneno;
	}


	public void setPhoneno(int phoneno) {
		this.phoneno = phoneno;
	}


	public String getAemail() {
		return aemail;
	}


	public void setAemail(String aemail) {
		this.aemail = aemail;
	}
	
	

}
