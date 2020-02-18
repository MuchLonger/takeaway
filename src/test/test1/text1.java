package test1;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import takeaway.action.*;
import takeaway.dao.login.LoginMapper;
import takeaway.services.loginServiceImpl;

import java.sql.Timestamp;
import java.util.List;

/**
 * @description:
 * @Time: 2019/1/8 9:17
 */
public class text1 {
    @Test
    public void m1(){
        String name="+cqy+c";
        String a=name.replaceFirst("\\+","");
        System.out.println(a);
    }

}
