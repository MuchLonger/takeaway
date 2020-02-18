package takeaway.action;

/**
 * @description:
 * @Time: 2019/1/9 21:57
 */
public class LoginWithBus extends Login {
    private Business business;

    public LoginWithBus(String password, String role, String account, Business business) {
        super(password, role, account);
        this.business = business;
    }

    public Business getBusiness() {
        return business;
    }

    public void setBusiness(Business business) {
        this.business = business;
    }
}
