package takeaway.interceptors;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.HandlerInterceptor;
import takeaway.action.Business;
import takeaway.action.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @description:
 * @Time: 2019/2/20 16:32
 */
@Controller
public class shopInterceptors implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        Object user = request.getSession().getAttribute("user");
        Object bs = request.getSession().getAttribute("bs");
//        获取页面中的session，查看是否有user
        if (user == null && bs==null) {
            System.out.println("请先登录==null");
            response.sendRedirect(request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/"+"jsp/user/promptLogin.jsp");
            return false;
        }
        if(user instanceof User || bs instanceof Business){
            return true;
        }else{
            System.out.println("请先登录else");
            response.sendRedirect(request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/"+"jsp/user/promptLogin.jsp");
            return false;
        }
    }
}
