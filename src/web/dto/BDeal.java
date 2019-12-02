package web.dto;

public class BDeal {
	private int bdealno;
	private String dealtype2;
	private int deposit;
	private int price;
	private int accuseno;
	
	
	@Override
	public String toString() {
		return "BDeal [bdealno=" + bdealno + ", dealtype2=" + dealtype2 + ", deposit=" + deposit + ", price=" + price
				+ ", accuseno=" + accuseno + "]";
	}


	public int getBdealno() {
		return bdealno;
	}


	public void setBdealno(int bdealno) {
		this.bdealno = bdealno;
	}


	public String getDealtype2() {
		return dealtype2;
	}


	public void setDealtype2(String dealtype2) {
		this.dealtype2 = dealtype2;
	}


	public int getDeposit() {
		return deposit;
	}


	public void setDeposit(int deposit) {
		this.deposit = deposit;
	}


	public int getPrice() {
		return price;
	}


	public void setPrice(int price) {
		this.price = price;
	}


	public int getAccuseno() {
		return accuseno;
	}


	public void setAccuseno(int accuseno) {
		this.accuseno = accuseno;
	}
	
	
	

}
