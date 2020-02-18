package takeaway.action;

import java.sql.*;

public class User {

	private String userAddress;
	private java.sql.Timestamp userRegTime;
	private String role;
	private String userTel;
	private Integer id;
	private String userName;
	private Integer goToUserNum;

	public User() {
	}


	public User(String userAddress, Timestamp userRegTime, String role, String userTel, String userName) {
		this.userAddress = userAddress;
		this.userRegTime = userRegTime;
		this.role = role;
		this.userTel = userTel;
		this.userName = userName;
	}



	public String getUserAddress(){
		return this.userAddress;
	}
	public java.sql.Timestamp getUserRegTime(){
		return this.userRegTime;
	}
	public String getRole(){
		return this.role;
	}
	public String getUserTel(){
		return this.userTel;
	}
	public Integer getId(){
		return this.id;
	}
	public String getUserName(){
		return this.userName;
	}
	public Integer getGoToUserNum(){
		return this.goToUserNum;
	}


	public void setUserAddress(String userAddress){
		this.userAddress=userAddress;
	}
	public void setUserRegTime(java.sql.Timestamp userRegTime){
		this.userRegTime=userRegTime;
	}
	public void setRole(String role){
		this.role=role;
	}
	public void setUserTel(String userTel){
		this.userTel=userTel;
	}
	public void setId(Integer id){
		this.id=id;
	}
	public void setUserName(String userName){
		this.userName=userName;
	}
	public void setGoToUserNum(Integer goToUserNum){
		this.goToUserNum=goToUserNum;
	}


}
