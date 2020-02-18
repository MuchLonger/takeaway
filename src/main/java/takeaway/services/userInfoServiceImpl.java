package takeaway.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import takeaway.DTO.updateUserDTO;
import takeaway.dao.login.userInfoMapper;

/**
 * @description:
 * @Time: 2019/2/18 21:59
 */
@Service("userInfoService")
public class userInfoServiceImpl implements userInfoService {

    @Autowired
    private userInfoMapper userInfoMapper;

    @Override
    public boolean updateUserByUser(updateUserDTO updateUserDTO) {
        int row1 = 1;
//        因为sql语句的原因，updateUserDTO的其他属性为空，在动态sql内就不会显示set这属性值，所以需要判断
        if (updateUserDTO.getAddr() != null || updateUserDTO.getTel() != null || updateUserDTO.getUserName() != null) {
            row1 = userInfoMapper.updateUserByUser(updateUserDTO);
        }
        int row2 = 1;
        if (updateUserDTO.getPassword() != null && updateUserDTO.getPassword() != "") {
            row2 = userInfoMapper.updatePassWordByUser(updateUserDTO);
        }
        return row1 == 1 && row2 == 1 ? true : false;
    }
}
