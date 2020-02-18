package takeaway.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * @description:
 * @Time: 2019/1/9 9:46
 */
@Controller
public class LogoutController{
    @RequestMapping("/logout.do/{role}")
    protected String doGet(@PathVariable("role")String role, HttpSession session) {
        if("user".equals(role)) {
            session.removeAttribute("user");
        }else if("businessman".equals(role)) {
            session.removeAttribute("bs");
        }
        session.invalidate();
        return "redirect:/index.jsp";
    }

}
