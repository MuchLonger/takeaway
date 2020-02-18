package takeaway.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import takeaway.Commons.CommonVariable;
import takeaway.action.Login;
import takeaway.services.loginService;
import takeaway.services.loginServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @description:
 * @Time: 2019/1/11 10:42
 */
@Controller
public class checkController {
    @Autowired
    private takeaway.services.loginService loginService;

    @RequestMapping("/checkusername.do/{account}")
    @ResponseBody
    protected Map<String,Integer> doGet(@PathVariable("account")String account){
        Login user=loginService.queryLoginByAccount(account);
        Map<String,Integer> map=new HashMap<>();
        if(user!=null){
            map.put("code",CommonVariable.CODE_FLASE);
        }else{
            map.put("code",CommonVariable.CODE_SUCESS);
        }
        return map;
    }
}
