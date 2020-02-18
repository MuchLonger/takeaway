package takeaway.action;

import java.sql.*;

public class Order {

	private Integer orderNumber;
	private java.sql.Timestamp orderTime;
	private Double dishPrice;
	private String shopName;
	private String dishName;
	private String handToAddr;
	private Integer goToUserNum;

	public Order() {

	}

	public Order(Integer orderNumber, Timestamp orderTime, Double dishPrice, String shopName, String dishName, String handToAddr) {
		this.orderNumber = orderNumber;
		this.orderTime = orderTime;
		this.dishPrice = dishPrice;
		this.shopName = shopName;
		this.dishName = dishName;
		this.handToAddr = handToAddr;
	}

	public Integer getOrderNumber(){
		return this.orderNumber;
	}
	public java.sql.Timestamp getOrderTime(){
		return this.orderTime;
	}
	public Double getDishPrice(){
		return this.dishPrice;
	}
	public String getShopName(){
		return this.shopName;
	}
	public String getDishName(){
		return this.dishName;
	}
	public String getHandToAddr(){
		return this.handToAddr;
	}
	public Integer getGoToUserNum(){
		return this.goToUserNum;
	}

	@Override
	public String toString() {
		return "Order{" +
				"orderNumber=" + orderNumber +
				", orderTime=" + orderTime +
				", dishPrice=" + dishPrice +
				", shopName='" + shopName + '\'' +
				", dishName='" + dishName + '\'' +
				", handToAddr='" + handToAddr + '\'' +
				", goToUserNum=" + goToUserNum +
				'}';
	}

	public void setOrderNumber(Integer orderNumber){
		this.orderNumber=orderNumber;
	}
	public void setOrderTime(java.sql.Timestamp orderTime){
		this.orderTime=orderTime;
	}
	public void setDishPrice(Double dishPrice){
		this.dishPrice=dishPrice;
	}
	public void setShopName(String shopName){
		this.shopName=shopName;
	}
	public void setDishName(String dishName){
		this.dishName=dishName;
	}
	public void setHandToAddr(String handToAddr){
		this.handToAddr=handToAddr;
	}
	public void setGoToUserNum(Integer goToUserNum)
	{
		this.goToUserNum=goToUserNum;
	}


}
