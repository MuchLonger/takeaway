package takeaway.DTO;

/**
 * @description:
 * @Time: 2019/2/18 21:52
 */
public class updateUserDTO {
    private Integer id;
    private String password;
    private Long tel;
    private String addr;
    private String userName;

    @Override
    public String toString() {
        return "updateUserDTO{" +
                "id=" + id +
                ", password='" + password + '\'' +
                ", tel=" + tel +
                ", addr='" + addr + '\'' +
                ", userName='" + userName + '\'' +
                '}';
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public Long getTel() {
        return tel;
    }

    public void setTel(Long tel) {
        this.tel = tel;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }


}
