package takeaway.action;

public class Login {

	private String password;
	private String role;
	private Integer goToUserNum;
	private String account;

	public Login(String account,String password){
		this.account=account;
		this.password=password;
	}

	public Login(String password, String role, String account) {
		this.password = password;
		this.role = role;
		this.account = account;
	}

	public Login(String password, String role, Integer goToUserNum, String account) {
		this.password = password;
		this.role = role;
		this.goToUserNum = goToUserNum;
		this.account = account;
	}

	public Login() {
	}

	public String getPassword(){
		return this.password;
	}
	public String getRole(){
		return this.role;
	}
	public Integer getGoToUserNum(){
		return this.goToUserNum;
	}
	public String getAccount(){
		return this.account;
	}


	public void setPassword(String password){
		this.password=password;
	}
	public void setRole(String role){
		this.role=role;
	}
	public void setGoToUserNum(Integer goToUserNum){
		this.goToUserNum=goToUserNum;
	}
	public void setAccount(String account){
		this.account=account;
	}


}
