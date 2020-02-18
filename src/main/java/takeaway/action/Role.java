package takeaway.action;

public class Role {

	private String role;

	public Role() {
	}

	public Role(String role, Integer roleId) {
		this.role = role;
		this.roleId = roleId;
	}

	private Integer roleId;


	public String getRole(){
		return this.role;
	}
	public Integer getRoleId(){
		return this.roleId;
	}


	public void setRole(String role){
		this.role=role;
	}
	public void setRoleId(Integer roleId){
		this.roleId=roleId;
	}


}
