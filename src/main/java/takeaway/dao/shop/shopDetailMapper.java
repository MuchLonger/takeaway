package takeaway.dao.shop;

import org.apache.ibatis.annotations.Param;
import takeaway.DTO.updateBsDTO;
import takeaway.action.Business;
import takeaway.action.Dish;
import takeaway.action.Order;

import java.util.List;

/**
 * @description:
 * @Time: 2019/2/18 23:14
 */
public interface shopDetailMapper {
    List<Dish> queryDishById(@Param("shopId") Integer shopId);

    Business queryBusiByDishId(List<Dish> dishes, @Param("goToUserNum") Integer goToUserNum);

    Business queryBusinessByDishId(@Param("shopId") Integer shopId);

    Dish queryDishByDishId(@Param("dishId") Integer dishId);

    int insertOrderByDetail(Order order);

    Business queryBusinessByShopName(@Param("shopName") String shopName);

    List<Order> queryOrderByShopName(@Param("shopName") String shopName);

    Business queryBsByShopId(@Param("shopId") Integer shopId);

    int updateBsByBsDTO(updateBsDTO updateBsDTO);

    int updatePassWordByDTO(updateBsDTO updateBsDTO);
}
