package takeaway.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import takeaway.action.Dish;
import takeaway.dao.dish.DishMapper;

/**
 * @description:
 * @Time: 2019/3/10 19:31
 */
@Service("DishService")
public class DishServiceImpl implements DishService {
    @Autowired
    private DishMapper dishMapper;

    @Override
    public Dish queryDishByDishId(Integer dishId) {
        return dishMapper.queryDishByDishId(dishId);
    }

    @Override
    public Boolean updateDish(Dish dish) {
        if(dish.getDishId()!=null) {
            return dishMapper.updateDish(dish) == 1 ? true : false;
        }else{
            return false;
        }
    }

    @Override
    public Boolean deleteDish(Integer dishId) {

        return dishMapper.deleteDish(dishId);
    }

    @Override
    public Boolean insertDish(Dish dish) {
        return dishMapper.insertDish(dish);
    }
}
