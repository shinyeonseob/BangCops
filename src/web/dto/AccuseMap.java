package web.dto;

public class AccuseMap {
	private String guname;
	private int totalaccuse;
	private int totalagent;
	private Double lat;
	private Double lng;
	
	@Override
	public String toString() {
		return "AccusedMap [guname=" + guname + ", totalaccuse=" + totalaccuse + ", totalagent=" + totalagent + ", lat="
				+ lat + ", lng=" + lng + "]";
	}

	
	
	public Double getLat() {
		return lat;
	}



	public void setLat(Double lat) {
		this.lat = lat;
	}



	public Double getLng() {
		return lng;
	}



	public void setLng(Double lng) {
		this.lng = lng;
	}



	public String getGuname() {
		return guname;
	}

	public void setGuname(String guname) {
		this.guname = guname;
	}

	public int getTotalaccuse() {
		return totalaccuse;
	}

	public void setTotalaccuse(int totalaccuse) {
		this.totalaccuse = totalaccuse;
	}

	public int getTotalagent() {
		return totalagent;
	}

	public void setTotalagent(int totalagent) {
		this.totalagent = totalagent;
	}

	
	

}
