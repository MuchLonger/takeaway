package takeaway.services;

import takeaway.action.*;

import java.util.List;

/**
 * @description:
 * @Time: 2019/1/8 11:00
 */
public interface loginService {
    /**
     * 传入账号密码，用以之后扫描数据库
     * @param userAccount
     * @param userPassword
     * @return
     */
    Login login(String userAccount, String userPassword);

    /**
     * 通过Num获取对应的User对象
     * @param goToUserNum
     * @return
     */
    User queryUser(Integer goToUserNum);

    /**
     * 通过Num获取对应的Business对象
     * @param goToUserNum
     * @return
     */
    Business queryBusiness(Integer goToUserNum);

    /**
     * 获取一个login属性，里面有账号密码，用以添加进login表
     * @param login
     */
    void newLogin(Login login);

    /**
     * 获得上面的方法添加的Num值
     * @param account 唯一索引
     * @return
     */
    Integer queryNum(String account);

    /**
     * 数据库内添加一个User
     * @param loginWithUser 用以提取其中的user对象
     */
    void newUser(LoginWithUser loginWithUser);

    /**
     * 运行添加BUSINESS的mybatis文件
     * @param loginWithBus
     */
    void newShop(LoginWithBus loginWithBus);

    /**
     * 根据地址显示对应的商家
     * @param addr 传入地址
     * @return 商家列表
     */
    List<Business> queryBusList(String addr);


    /**
     * 获取对应的订单信息
     * @param goToUserNum 联系号
     * @return 订单List
     */
    List<Order> queryOrderList(Integer goToUserNum);

    /**
     * 根据商店名获得对应的商户
     * @param shopName 商店名
     * @return
     */
    Business queryBusinessByName(String shopName);

    /**
     * 获取login信息
     * @param goToUserNum
     * @return
     */
    Login queryLoginByNum(Integer goToUserNum);

    /**
     * 获取Login表的所有信息
     * @return
     */
    List<Login> queryLoginByAll();

    /**
     * 用来ajax验证数据库内是否有值
     * @param account
     * @return
     */
    Login queryLoginByAccount(String account);
}
