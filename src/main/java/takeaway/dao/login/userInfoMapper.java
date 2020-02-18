package takeaway.dao.login;

import takeaway.DTO.updateUserDTO;

/**
 * @description:
 * @Time: 2019/2/18 22:00
 */
public interface userInfoMapper {
    int updateUserByUser(updateUserDTO updateUserDTO);

    int updatePassWordByUser(updateUserDTO updateUserDTO);
}
