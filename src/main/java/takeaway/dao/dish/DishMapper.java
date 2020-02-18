package takeaway.dao.dish;

import org.apache.ibatis.annotations.Param;
import takeaway.action.Dish;

/**
 * @description:
 * @Time: 2019/3/10 19:32
 */
public interface DishMapper {

    Dish queryDishByDishId(@Param("dishId") Integer dishId);

    int updateDish(Dish dish);

    Boolean deleteDish(@Param("dishId") Integer dishId);

    Boolean insertDish(Dish dish);

}
