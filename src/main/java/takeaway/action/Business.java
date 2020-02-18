package takeaway.action;

import java.util.List;

public class Business {

	private String shopTel;
	private String role;
	private Double shopDiscount;
	private String shopName;
	private Integer shopId;
	private String localImg;

	private List<Dish> dishes;

	public List<Dish> getDishes() {
		return dishes;
	}

	public String getLocalImg() {
		return localImg;
	}

	public void setLocalImg(String localImg) {
		this.localImg = localImg;
	}

	public void setDishes(List<Dish> dishes) {
		this.dishes = dishes;
	}

	@Override
	public String toString() {
		return "Business{" +
				"shopTel='" + shopTel + '\'' +
				", role='" + role + '\'' +
				", shopDiscount=" + shopDiscount +
				", shopName='" + shopName + '\'' +
				", shopId=" + shopId +
				", localImg='" + localImg + '\'' +
				", dishes=" + dishes +
				", shopAddress='" + shopAddress + '\'' +
				", operatingStatus=" + operatingStatus +
				", goToUserNum=" + goToUserNum +
				'}';
	}

	public Business() {
	}



	private String shopAddress;
	private Integer operatingStatus;
	private Integer goToUserNum;


	public String getShopTel(){
		return this.shopTel;
	}
	public String getRole(){
		return this.role;
	}
	public Double getShopDiscount(){
		return this.shopDiscount;
	}
	public String getShopName(){
		return this.shopName;
	}
	public Integer getShopId(){
		return this.shopId;
	}
	public String getShopAddress(){
		return this.shopAddress;
	}
	public Integer getOperatingStatus(){
		return this.operatingStatus;
	}
	public Integer getGoToUserNum(){
		return this.goToUserNum;
	}


	public void setShopTel(String shopTel){
		this.shopTel=shopTel;
	}
	public void setRole(String role){
		this.role=role;
	}

	public Business(String shopTel, String role, String shopName, String shopAddress) {
		this.shopTel = shopTel;
		this.role = role;
		this.shopName = shopName;
		this.shopAddress = shopAddress;
	}

	public void setShopDiscount(Double shopDiscount){
		this.shopDiscount=shopDiscount;
	}
	public void setShopName(String shopName){
		this.shopName=shopName;
	}
	public void setShopId(Integer shopId){
		this.shopId=shopId;
	}
	public void setShopAddress(String shopAddress){
		this.shopAddress=shopAddress;
	}
	public void setOperatingStatus(Integer operatingStatus){
		this.operatingStatus=operatingStatus;
	}
	public void setGoToUserNum(Integer goToUserNum){
		this.goToUserNum=goToUserNum;
	}


}
