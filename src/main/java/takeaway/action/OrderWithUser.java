package takeaway.action;

import java.sql.Timestamp;

/**
 * @description:
 * @Time: 2019/1/10 15:03
 */
public class OrderWithUser extends Order{
    public User user;

    public OrderWithUser(Integer orderNumber, Timestamp orderTime, Double dishPrice, String shopName, String dishName, String handToAddr, User user) {
        super(orderNumber, orderTime, dishPrice, shopName, dishName, handToAddr);
        this.user = user;
    }


    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
