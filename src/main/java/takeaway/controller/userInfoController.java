package takeaway.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import takeaway.DTO.updateUserDTO;
import takeaway.services.userInfoService;

/**
 * @description:
 * @Time: 2019/2/18 21:06
 */
@Controller
@RequestMapping("/user")
public class userInfoController {

    @Autowired
    private userInfoService userInfoService;

    @RequestMapping("/updateUser")
    public String updateUserByUser(updateUserDTO updateUserDTO, Model model){
        boolean updateFlag=userInfoService.updateUserByUser(updateUserDTO);
        model.addAttribute("updateResult",updateFlag);
        return "user/updateResult";
    }

}
