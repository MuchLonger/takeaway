package takeaway.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import takeaway.action.User;
import takeaway.services.loginService;
import takeaway.services.loginServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @description:
 * @Time: 2019/1/10 22:08
 */
@Controller
public class accController {

    @Autowired
    private loginService loginService;

    @RequestMapping("/acc.do")
    protected String doGet(HttpServletRequest request){
        Integer goToUserNum=(Integer)request.getSession().getAttribute("goToUserNum");

        User user=loginService.queryUser(goToUserNum);

        request.getSession().setAttribute("user",user);
        request.getSession().setAttribute("userName",user.getUserName());
        request.getSession().setAttribute("userTel",user.getUserTel());

        return "user/account";
    }
}
