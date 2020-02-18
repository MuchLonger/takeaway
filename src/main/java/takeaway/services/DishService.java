package takeaway.services;

import takeaway.action.Dish;

/**
 * @description:
 * @Time: 2019/3/10 19:31
 */
public interface DishService {

    Dish queryDishByDishId(Integer dishId);

    Boolean updateDish(Dish dish);

    Boolean deleteDish(Integer dishId);

    Boolean insertDish(Dish dish);
}
