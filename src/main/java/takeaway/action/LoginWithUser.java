package takeaway.action;

/**
 * @description:
 * @Time: 2019/1/9 11:08
 */
public class LoginWithUser extends Login {
    private User user;

    public LoginWithUser(String password, String role, String account, User user) {
        super(password, role, account);
        this.user = user;
    }

    public LoginWithUser(String password, String role, Integer goToUserNum, String account, User user) {
        super(password, role, goToUserNum, account);
        this.user = user;
    }

    public LoginWithUser(User user) {
        this.user = user;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
