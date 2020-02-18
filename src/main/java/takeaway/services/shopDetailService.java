package takeaway.services;

import com.github.pagehelper.PageInfo;
import takeaway.DTO.updateBsDTO;
import takeaway.action.Business;
import takeaway.action.Dish;
import takeaway.action.Order;
import takeaway.action.User;

import java.util.List;

/**
 * @description:
 * @Time: 2019/2/18 23:13
 */
public interface shopDetailService
{
    List<Dish> queryDishById(Integer shopId);

    int insertOrderByDishId(List<Dish> dishId, User user);

    Business queryBusinessByShopName(String shopName);

    PageInfo<Order> queryOrderByShopName(String shopName, Integer pageNum);

    int insertBsOrderByDishId(List<Dish> dishes, Business bs);

    Business queryBsByShopId(Integer shopId);

    Boolean updateShopInfo(updateBsDTO updateBsDTO);

}
