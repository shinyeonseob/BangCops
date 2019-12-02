package web.dto;

public class Recommend {
	
	private int idx;
	private int userno;
	
	
	@Override
	public String toString() {
		return "Recommend [idx=" + idx + ", userno=" + userno + "]";
	}
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getUserno() {
		return userno;
	}
	public void setUserno(int userno) {
		this.userno = userno;
	}
	
	
	
	
}
