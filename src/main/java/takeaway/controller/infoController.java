package takeaway.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import takeaway.action.Login;
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
 * @Time: 2019/1/11 8:45
 */
@Controller
public class infoController  {

    @Autowired
    private takeaway.services.loginService loginService;

    @RequestMapping("/info.do")
    protected String doGet(HttpServletRequest request){
        Integer goToUserNum=(Integer)request.getSession().getAttribute("goToUserNum");

        User user=loginService.queryUser(goToUserNum);

        Login login=loginService.queryLoginByNum(goToUserNum);

        int pLen=login.getPassword().length();

        request.getSession().setAttribute("pLen",pLen);
        request.getSession().setAttribute("user",user);

        return "user/info";
    }
}
