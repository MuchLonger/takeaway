package takeaway.DTO;

/**
 * @description:
 * @Time: 2019/2/18 18:03
 */
public class regUser {
    private String userName;
    private String password;
    private String XiaoName;
    private String Tel;
    private String addr;

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getXiaoName() {
        return XiaoName;
    }

    public void setXiaoName(String xiaoName) {
        XiaoName = xiaoName;
    }

    public String getTel() {
        return Tel;
    }

    public void setTel(String tel) {
        Tel = tel;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }
}
