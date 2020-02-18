package takeaway.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import takeaway.action.Business;
import takeaway.action.Login;
import takeaway.action.User;
import takeaway.services.loginService;
import takeaway.services.loginServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * @description:
 * @Time: 2019/1/8 9:56
 */
@Controller
public class LoginController {

    @Autowired
    private takeaway.services.loginService loginService;
    @RequestMapping("/login.do")
    protected String doPost(HttpServletRequest req, HttpSession session){
        System.out.println("login");
        String account = req.getParameter("account");
        String password = req.getParameter("password");

        Login log = loginService.login(account, password);
        if (log != null) {
            if (log.getRole().equals("user")) {
                User user = loginService.queryUser(log.getGoToUserNum());
                req.getSession().setAttribute("userName", user.getUserName());
                req.getSession().setAttribute("goToUserNum",user.getGoToUserNum());
                req.getSession().setAttribute("role", "会员");
                session.setAttribute("user",user);
            } else if (log.getRole().equals("businessman")) {
                Business business = loginService.queryBusiness(log.getGoToUserNum());
                req.getSession().setAttribute("userName", business.getShopName());
                req.getSession().setAttribute("role", "商家");
                session.setAttribute("bs",business);
            }else if(log.getRole().equals("sys")){
                User user=loginService.queryUser(log.getGoToUserNum());
                req.getSession().setAttribute("userName", user.getUserName());
                req.getSession().setAttribute("goToUserNum",user.getGoToUserNum());
                req.getSession().setAttribute("role", "管理员");
                session.setAttribute("user",user);
            }
            return "forward:/index.jsp";
        } else {
            req.setAttribute("error", "你的账户不存在");
            return "reg/login";
        }

    }
}
