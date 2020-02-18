package takeaway.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import takeaway.action.Business;
import takeaway.action.Order;
import takeaway.action.User;
import takeaway.services.loginService;
import takeaway.services.loginServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * @description:
 * @Time: 2019/1/10 16:17
 */
@Controller
public class cartController {

    @Autowired
    private loginService loginService;

    @RequestMapping("/cart.do")
    protected String doGet(HttpServletRequest request){
        Integer goToUserNum = (Integer) request.getSession().getAttribute("goToUserNum");

        //获取订单列表
        List<Order> ordersList = loginService.queryOrderList(goToUserNum);
        //获取具体User属性
        User user=loginService.queryUser(goToUserNum);
        //用来获取商家信息--电话
//        Business business=loginService.getBusinessByName();
        //将orderList存入Session
        request.getSession().setAttribute("user",user);
        request.getSession().setAttribute("orderList",ordersList);
        //将user的属性存入Session
        request.getSession().setAttribute("userTel",user.getUserTel());
        request.getSession().setAttribute("userName",user.getUserName());

        int ram=(int)Math.random()*10;
        request.getSession().setAttribute("ramPrice",ram);

        return "user/cart";
    }

    @RequestMapping("/shopCart/{goToUserNum}")
    public String shopCart(HttpServletRequest request,@PathVariable("goToUserNum") Integer goToUserNum){

        //获取订单列表
        List<Order> ordersList = loginService.queryOrderList(goToUserNum);
        //获取具体User属性
        Business bs=loginService.queryBusiness(goToUserNum);
        //用来获取商家信息--电话
//        Business business=loginService.getBusinessByName();
        //将orderList存入Session
        request.getSession().setAttribute("user",bs);
        request.getSession().setAttribute("orderList",ordersList);
        //将user的属性存入Session
        request.getSession().setAttribute("userTel",bs.getShopTel());
        request.getSession().setAttribute("userName",bs.getShopName());

        int ram=(int)Math.random()*10;
        request.getSession().setAttribute("ramPrice",ram);

        return "shop/cart";
    }

}
