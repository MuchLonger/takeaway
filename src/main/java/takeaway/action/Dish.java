package takeaway.action;

public class Dish {

	private String dishDetails;
	private Integer dishId;
	private String dishPrice;
	private String dishName;
	private Integer shopId;

	private Business business;

	@Override
	public String toString() {
		return "Dish{" +
				"dishDetails='" + dishDetails + '\'' +
				", dishId=" + dishId +
				", dishPrice='" + dishPrice + '\'' +
				", dishName='" + dishName + '\'' +
				", shopId=" + shopId +
				'}';
	}

	public Business getBusiness() {
		return business;
	}

	public void setBusiness(Business business) {
		this.business = business;
	}

	public Dish() {
	}

	public Dish(String dishDetails, Integer dishId, String dishPrice, String dishName, Integer shopId) {
		this.dishDetails = dishDetails;
		this.dishId = dishId;
		this.dishPrice = dishPrice;
		this.dishName = dishName;
		this.shopId = shopId;
	}

	public String getDishDetails(){
		return this.dishDetails;
	}
	public Integer getDishId(){
		return this.dishId;
	}
	public String getDishPrice(){
		return this.dishPrice;
	}
	public String getDishName(){
		return this.dishName;
	}
	public Integer getShopId(){
		return this.shopId;
	}


	public void setDishDetails(String dishDetails){
		this.dishDetails=dishDetails;
	}
	public void setDishId(Integer dishId){
		this.dishId=dishId;
	}
	public void setDishPrice(String dishPrice){
		this.dishPrice=dishPrice;
	}
	public void setDishName(String dishName){
		this.dishName=dishName;
	}
	public void setShopId(Integer shopId){
		this.shopId=shopId;
	}


}
