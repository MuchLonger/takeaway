package takeaway.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import takeaway.action.Business;

import javax.servlet.ServletException;
import java.io.IOException;
import java.util.List;

/**
 * @description:
 * @Time: 2019/1/10 9:39
 */
@Controller
public class SearchController {

    @Autowired
    private takeaway.services.loginService loginService;

    @RequestMapping("/sear.do/{searchValue}")
    protected String doGet(Model model, @PathVariable("searchValue") String searchValue) throws ServletException, IOException {
//        System.out.println("searchValue:"+searchValue);
//        String searchVal = new String(searchValue.getBytes("ISO-8859-1"), "UTF-8");
//        System.out.println("searchVal:"+searchVal);
        List<Business> list = loginService.queryBusList(searchValue);
        System.out.println(list);
        model.addAttribute("BusinessList", list);

        return "search/ShopStore";
    }
}
