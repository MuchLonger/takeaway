package takeaway.services;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import takeaway.Commons.CommonVariable;
import takeaway.DTO.updateBsDTO;
import takeaway.DTO.updateUserDTO;
import takeaway.action.Business;
import takeaway.action.Dish;
import takeaway.action.Order;
import takeaway.action.User;
import takeaway.dao.login.userInfoMapper;
import takeaway.dao.shop.shopDetailMapper;

import java.sql.Timestamp;
import java.util.List;

/**
 * @description:
 * @Time: 2019/2/18 23:13
 */
@Service("shopDetailService")
public class shopDetailServiceImpl implements shopDetailService {

    @Autowired
    private shopDetailMapper shopDetailMapper;

    @Override
    public List<Dish> queryDishById(Integer shopId) {
        return shopDetailMapper.queryDishById(shopId);
    }

    @Override
    public int insertOrderByDishId(List<Dish> dishes, User user) {
        Order order = new Order();
        int totalDishPrice = 0;
        String sourceDishName = "";
        String targetDishName = "";
//        将List内的东西取出，再组装菜名与菜价
        for (int i = 0; i < dishes.size(); i++) {
            Business business = shopDetailMapper.queryBusinessByDishId(dishes.get(i).getShopId());
//            设置店名
            Dish dish = shopDetailMapper.queryDishByDishId(dishes.get(i).getDishId());
            order.setShopName(business.getShopName());
            if (dish.getDishName() != null && dish.getDishName() != "") {
                sourceDishName = sourceDishName + "+" + dish.getDishName();
            }
            totalDishPrice = totalDishPrice + Integer.valueOf(dish.getDishPrice());
        }
        targetDishName = sourceDishName.replaceFirst("\\+", "");
//        设置全菜名
        order.setDishName(targetDishName);
//        设置总菜价
        order.setDishPrice((double) totalDishPrice);
//        设置用户号
        order.setGoToUserNum(user.getGoToUserNum());
//        设置用户地址
        order.setHandToAddr(user.getUserAddress());
//        设置订单时间
        order.setOrderTime(new Timestamp(System.currentTimeMillis()));
        System.out.println(order);
        int row = shopDetailMapper.insertOrderByDetail(order);

        return row == 1 ? CommonVariable.CODE_SUCESS : CommonVariable.CODE_FLASE;
    }

    @Override
    public Business queryBusinessByShopName(String shopName) {
        return shopDetailMapper.queryBusinessByShopName(shopName);
    }

    @Override
    public PageInfo<Order> queryOrderByShopName(String shopName, Integer pageNum) {
        PageHelper.startPage(pageNum,8);

        List<Order> orders=shopDetailMapper.queryOrderByShopName(shopName);

        PageInfo<Order> pageInfo=new PageInfo<>(orders);

        return pageInfo;
    }

    @Override
    public int insertBsOrderByDishId(List<Dish> dishes, Business bs) {
        Order order = new Order();
        int totalDishPrice = 0;
        String sourceDishName = "";
        String targetDishName = "";
//        将List内的东西取出，再组装菜名与菜价
        for (int i = 0; i < dishes.size(); i++) {
            Business business = shopDetailMapper.queryBusinessByDishId(dishes.get(i).getShopId());
//            设置店名
            Dish dish = shopDetailMapper.queryDishByDishId(dishes.get(i).getDishId());
            order.setShopName(business.getShopName());
            if (dish.getDishName() != null && dish.getDishName() != "") {
                sourceDishName = sourceDishName + "+" + dish.getDishName();
            }
            totalDishPrice = totalDishPrice + Integer.valueOf(dish.getDishPrice());
        }
        targetDishName = sourceDishName.replaceFirst("\\+", "");
//        设置全菜名
        order.setDishName(targetDishName);
//        设置总菜价
        order.setDishPrice((double) totalDishPrice);
//        设置用户号
        order.setGoToUserNum(bs.getGoToUserNum());
//        设置用户地址
        order.setHandToAddr(bs.getShopAddress());
//        设置订单时间
        order.setOrderTime(new Timestamp(System.currentTimeMillis()));
        System.out.println(order);
        int row = shopDetailMapper.insertOrderByDetail(order);

        return row == 1 ? CommonVariable.CODE_SUCESS : CommonVariable.CODE_FLASE;
    }

    @Override
    public Business queryBsByShopId(Integer shopId) {
        return shopDetailMapper.queryBsByShopId(shopId);
    }

    @Override
    public Boolean updateShopInfo(updateBsDTO updateBsDTO) {
        int row1 = 1;
//       如果全部为空的话update语句会出错，所以只有要一个不为空就执行update语句
        if (updateBsDTO.getOperatingStatus() != null || updateBsDTO.getShopAddress()!=null||updateBsDTO.getShopDiscount()!=null
                ||updateBsDTO.getShopName()!=null||updateBsDTO.getShopTel()!=null||updateBsDTO.getLocalImg()!=null) {
            row1 = shopDetailMapper.updateBsByBsDTO(updateBsDTO);
        }
        int row2 = 1;
        if (updateBsDTO.getPassword() != null && updateBsDTO.getPassword() != "") {
            row2 = shopDetailMapper.updatePassWordByDTO(updateBsDTO);
        }
        return row1 == 1 && row2 == 1 ? true : false;
    }
}
