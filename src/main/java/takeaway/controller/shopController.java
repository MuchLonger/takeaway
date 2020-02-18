package takeaway.controller;

import com.github.pagehelper.PageInfo;
import com.sun.xml.internal.bind.v2.TODO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import sun.java2d.pipe.SpanIterator;
import takeaway.Commons.CommonVariable;
import takeaway.DTO.updateBsDTO;
import takeaway.Utils.Commons;
import takeaway.action.*;
import takeaway.services.loginService;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @description:
 * @Time: 2019/2/18 22:57
 */
@Controller
@RequestMapping("/shop")
public class shopController {

    @Autowired
    private takeaway.services.shopDetailService shopDetailService;
    @Autowired
    private loginService loginService;


    @RequestMapping("/detail/{shopId}")
    private String shopDetail(@PathVariable("shopId")Integer shopId, Model model,HttpSession session){
        List<Dish> dishes=shopDetailService.queryDishById(shopId);
        model.addAttribute("dishes",dishes);
        return "search/shopDetail";
    }

    @RequestMapping(value = "/order")
    @ResponseBody
    private Map<String,Integer> shopOrder(@RequestBody List<Dish> dishes,Model model,HttpSession session){
        User user= (User) session.getAttribute("user");
        int orderResult=shopDetailService.insertOrderByDishId(dishes,user);
        Map<String,Integer> map=new HashMap<>();
        map.put("code",orderResult);
        return map;
    }
    @RequestMapping(value = "/bsOrder")
    @ResponseBody
    private Map<String,Integer> bsOrder(@RequestBody List<Dish> dishes,Model model,HttpSession session){
        Business bs= (Business) session.getAttribute("bs");
        int orderResult=shopDetailService.insertBsOrderByDishId(dishes,bs);
        Map<String,Integer> map=new HashMap<>();
        map.put("code",orderResult);
        return map;
    }

    @RequestMapping("/toOrderResult/{code}")
    public String toOrderResult(@PathVariable("code")Integer code,Model model){
        if(code== CommonVariable.CODE_SUCESS) {
            model.addAttribute("orderResult", true);
        }else{
            model.addAttribute("orderResult", false);
        }
        return "user/orderResult";
    }
    @RequestMapping("/toShopOrderResult/{code}")
    public String toShopOrderResult(@PathVariable("code")Integer code,Model model){
        if(code== CommonVariable.CODE_SUCESS) {
            model.addAttribute("orderResult", true);
        }else{
            model.addAttribute("orderResult", false);
        }
        return "user/orderResult";
    }

    @RequestMapping("/toShop/{shopName}")
    public String toShop(@PathVariable("shopName")String sourceShopName){
//        String targetShopName="";
//        try {
//            targetShopName = new String(sourceShopName.getBytes("ISO-8859-1"), "UTF-8");
//        } catch (UnsupportedEncodingException e) {
//            e.printStackTrace();
//        }
        Business business=shopDetailService.queryBusinessByShopName(sourceShopName);

        return "forward:/shop/detail/"+business.getShopId();
    }

    @RequestMapping("/shopOrder/{shopName}/{pageNum}")
    public String queryShopOrder(@PathVariable("shopName")String shopNames,@PathVariable("pageNum") Integer pageNum,Model model){
        String shopName="";
        try {
            shopName = new String(shopNames.getBytes("ISO-8859-1"), "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        PageInfo<Order> page=shopDetailService.queryOrderByShopName(shopName,pageNum);
        model.addAttribute("page",page);
        return "shop/shopOrder";
    }

    @RequestMapping("/toEditShopInfo/{shopId}")
    public String toEditShopInfo(@PathVariable("shopId")Integer shopId, Model model,HttpSession session){
        Business bs=shopDetailService.queryBsByShopId(shopId);
        Login l=loginService.queryLoginByNum(bs.getGoToUserNum());
        model.addAttribute("bs",bs);
        model.addAttribute("pLen",l.getPassword().length());
        return "shop/editShop";
    }

    @RequestMapping("/editShopInfo")
    public String editShopInfo(@RequestParam("file") MultipartFile multipartFile, updateBsDTO updateBsDTO, Model model, HttpSession session){
        System.out.println(updateBsDTO);
        String fileStr="";
        File file=null;
        String newFileName="";
//        1 不为空才进行操作
        if (multipartFile != null && !multipartFile.isEmpty()) {
//            2 获取源文件名
            String originalFilename = multipartFile.getOriginalFilename();
//            3 截取不带后缀的文件名
            String fileNamePrefix = originalFilename.substring(0, originalFilename.lastIndexOf("."));
//            4 加工源文件名：置为文件名+时间戳,用来防止覆盖
            String newFileNamePrefix = fileNamePrefix + new Date().getTime();
//            5 得到新文件名（添加.jpg）
            newFileName = newFileNamePrefix + originalFilename.substring(originalFilename.lastIndexOf("."));
//            6 构建文件对象
            fileStr=new String(Commons.DEAFAULT_CONCRETE_DIRECTORY+Commons.DEAFAULT_RELATIVE_DIRECTORY+newFileName);
            file=new File(fileStr);
            updateBsDTO.setLocalImg(Commons.DEAFAULT_RELATIVE_DIRECTORY+newFileName);
//            7 上传
            try {
                multipartFile.transferTo(file);
            } catch (IOException e) {
                e.printStackTrace();
            }

        }
        Boolean updateFlag =shopDetailService.updateShopInfo(updateBsDTO);

        model.addAttribute("updateResult",updateFlag);
        return "shop/updateBsResult";
    }




}
