package takeaway.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import takeaway.DTO.regUser;
import takeaway.action.Business;
import takeaway.action.LoginWithBus;
import takeaway.services.loginService;
import takeaway.services.loginServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * @description:
 * @Time: 2019/1/9 22:12
 */
@Controller
public class RegisterBusController {

    @Autowired
    private takeaway.services.loginService loginService;

    @RequestMapping("/regb.do")
    protected String doPost(regUser regUser, Model model, HttpSession httpSession){

        Business business=new Business(regUser.getTel(),"businessman",regUser.getXiaoName(),regUser.getAddr());

        LoginWithBus loginWithBus=new LoginWithBus(regUser.getPassword(),"businessman",regUser.getUserName(),business);

        loginService.newLogin(loginWithBus);

        loginService.newShop(loginWithBus);

        httpSession.setAttribute("identity","商家");
        return "reg/overReg";
    }
}
