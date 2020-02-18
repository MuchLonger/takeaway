package takeaway.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import takeaway.action.Business;
import takeaway.action.Dish;
import takeaway.services.DishService;
import takeaway.services.shopDetailService;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @description:
 * @Time: 2019/3/10 19:31
 */
@Controller
@RequestMapping("/dish")
public class DishController {
    @Autowired
    private DishService dishService;
    @Autowired
    private shopDetailService shopDetailService;

    @RequestMapping("/toDishPage/{shopId}")
    public String toDishPage(@PathVariable("shopId") Integer shopId, Model model) {
        List<Dish> dishes = shopDetailService.queryDishById(shopId);
        model.addAttribute("dishes", dishes);
        return "dish/dishDetail";
    }

    @RequestMapping("/toDishInfoPage/{dishId}/{operation}")
    public String toDishInfoPage(@PathVariable("dishId") Integer dishId, Model model,@PathVariable("operation")String operation) {
        Dish dish=null;
        System.out.println("操作:"+operation);
//        更新与新增共用一个页面
        if("update".equals(operation)) {
            dish = dishService.queryDishByDishId(dishId);
            model.addAttribute("dish", dish);
            model.addAttribute("update",operation);
        }else if("insert".equals(operation)){
            model.addAttribute("insert",operation);
        }
        return "dish/dishInfo";
    }

    @RequestMapping("/updateDish")
    public String updateDish(Dish dish, Model model) {
        Boolean updateFlag = dishService.updateDish(dish);

        model.addAttribute("dish", dish);
        model.addAttribute("updateFlag", updateFlag);
        return "forward:/dish/toDishInfoPage/"+dish.getDishId()+"/update";
    }
    @RequestMapping("/insertDish")
    public String insertDish(Dish dish, Model model) {
        System.out.println(dish);
        Boolean insertDish = dishService.insertDish(dish);

        model.addAttribute("dish", dish);
        model.addAttribute("insertDish", insertDish);
        return "forward:/dish/toDishPage/"+dish.getShopId();
    }

    @RequestMapping("/delDish/{dishId}")
    public String delDish(@PathVariable("dishId") Integer dishId, Model model, HttpSession session) {
        Business bs=(Business)session.getAttribute("bs");
        Boolean deleteFlag=dishService.deleteDish(dishId);

        model.addAttribute("deleteFlag", deleteFlag);
        return "forward:/dish/toDishPage/"+bs.getShopId();
    }


}
