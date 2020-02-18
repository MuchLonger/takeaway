package takeaway.controller;

import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import takeaway.DTO.regUser;
import takeaway.action.LoginWithUser;
import takeaway.action.User;
import takeaway.services.loginService;
import takeaway.services.loginServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Timestamp;

/**
 * @description:
 * @Time: 2019/1/9 20:15
 */
@Controller
public class RegisterUserController{

    @Autowired
    private takeaway.services.loginService loginService;

    @RequestMapping("/regu.do")
        protected String doPost(regUser regUser, Model model, HttpSession httpSession){
        User user=new User(regUser.getAddr(),new Timestamp(System.currentTimeMillis()),"user",regUser.getTel(),regUser.getXiaoName());

        LoginWithUser loginWithUser=new LoginWithUser(regUser.getPassword(),"user",regUser.getUserName(),user);

        loginService.newLogin(loginWithUser);

        loginService.newUser(loginWithUser);

        httpSession.setAttribute("identity","会员");
        return "reg/overReg";
    }
}
