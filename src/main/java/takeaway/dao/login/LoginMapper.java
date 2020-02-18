package takeaway.dao.login;

import org.apache.ibatis.annotations.Param;
import takeaway.action.*;

import java.util.List;

/**
 * @description:
 * @Time: 2019/1/8 9:24
 */
public interface LoginMapper {
    /**
     * 登陆界面,传入账号信息
     * @param user 账号，密码
     * @return Login对象，用以下面表的查询
     */
    Login queryPull(Login user);

    /**
     * 在User表内查询对应的编号，如果为空则没有，不为空则返回对象
     * @param goToUserNum login表内的编号
     * @return User
     */
    User queryUser(int goToUserNum);

    /**
     * 在business表内查询对应的账号，如果为空则没有，不为空则返回对象
     * @param goToUserNum login表内的编号
     * @return Business
     */
    Business queryBusiness(int goToUserNum);

    /**
     * 在login表内插入一条信息
     * @param login 获取的Login信息
     */
    void insertLogin(Login login);

    /**
     * 获取对应的账号的goToUserNum属性
     * @param account 唯一索引
     * @return
     */
    Integer queryNum(@Param("account") String account);

    /**
     * 创建对应的User对象，完成注册功能
     * @param user User的信息
     * @param goToUserNum User的号码，是从上面的queryNum获取到的
     */
    void insertUser(@Param("lwu") User user,@Param("num")Integer goToUserNum);

    /**
     * 在表内创建对应的business信息
     * @param business
     * @param goToUserNum
     */
    void insertShop(@Param("lws")Business business,@Param("num")Integer goToUserNum);

    /**
     * 根据地址获取商家信息，用以搜索功能
     * @param addr 地址
     * @return 返回对应的商家对象List
     */
    List<Business> queryBusinessList(@Param("addr") String addr);

    /**
     * 用来返回订单表的属性
     * @param goToUserNum 根据对应的序号返回订单
     * @return 订单List
     */
    List<Order> queryOrderList(@Param("goToUserNum") Integer goToUserNum);

    /**
     * 通过店铺名字得到对应的商家对象
     * @param shopName 唯一索引
     * @return
     */
    Business queryBusinessByName(@Param("shopName") String shopName);

    /**
     * 返回login信息，即账号信息
     * @param goToUserNum 根据唯一序号
     * @return Login
     */
    Login queryLoginByNum(@Param("goToUserNum") Integer goToUserNum);

    /**
     * 获取Login表的所有信息
     * @return
     */
    List<Login> queryLoginByAll();

    Login queryLoginByAccount(@Param("account") String account);
}
