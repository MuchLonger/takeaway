package takeaway.services;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import takeaway.action.*;
import takeaway.dao.login.LoginMapper;

import java.util.List;

/**
 * @description:
 * @Time: 2019/1/8 10:56
 */
@Service("loginService")
public class loginServiceImpl implements loginService {
    @Autowired
    private LoginMapper loginMapper;

    @Override
    public Login login(String userAccount, String userPassword) {

        Login log=new Login(userAccount,userPassword);

        Login user=loginMapper.queryPull(log);

        return user;
    }

    @Override
    public User queryUser(Integer goToUserNum) {
        User user=loginMapper.queryUser(goToUserNum.intValue());

        return user;
    }

    @Override
    public Business queryBusiness(Integer goToUserNum) {
        Business business=loginMapper.queryBusiness(goToUserNum.intValue());

        return business;
    }

    /**
     * 加入login对象，并添加进数据库
     * @param login
     */
    @Override
    public void newLogin(Login login) {

        loginMapper.insertLogin(login);

    }

    @Override
    public Integer queryNum(String account) {

        Integer num=loginMapper.queryNum(account);

        return num;
    }


    @Override
    public void newUser(LoginWithUser loginWithUser) {

        //获取对应的num值
        Integer num=queryNum(loginWithUser.getAccount());

        loginMapper.insertUser(loginWithUser.getUser(),num);

    }

    @Override
    public void newShop(LoginWithBus loginWithBus) {

        Integer num=queryNum(loginWithBus.getAccount());
        loginMapper.insertShop(loginWithBus.getBusiness(),num);

    }

    @Override
    public List<Business> queryBusList(String addr) {

        List<Business> list=loginMapper.queryBusinessList(addr);

        return list;
    }

    @Override
    public List<Order> queryOrderList(Integer goToUserNum) {

        List<Order> list=loginMapper.queryOrderList(goToUserNum);

        return list;
    }

    @Override
    public Business queryBusinessByName(String shopName) {

        Business business=loginMapper.queryBusinessByName(shopName);

        return business;
    }

    @Override
    public List<Login> queryLoginByAll() {

        List<Login> logins=loginMapper.queryLoginByAll();

        return logins;
    }

    @Override
    public Login queryLoginByAccount(String account) {
        return loginMapper.queryLoginByAccount(account);
    }

    @Override
    public Login queryLoginByNum(Integer goToUserNum) {

        Login login=loginMapper.queryLoginByNum(goToUserNum);

        return login;
    }
}
