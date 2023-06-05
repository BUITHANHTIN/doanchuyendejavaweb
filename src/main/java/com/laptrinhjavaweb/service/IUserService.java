package com.laptrinhjavaweb.service;

import com.laptrinhjavaweb.dto.CustomerDTO;
import com.laptrinhjavaweb.dto.PasswordDTO;
import com.laptrinhjavaweb.dto.Request.CustomerSearchRequestDTO;
import com.laptrinhjavaweb.dto.Request.UserSearchRequestDTO;
import com.laptrinhjavaweb.dto.Response.StaffResponseDTO;
import com.laptrinhjavaweb.dto.UserDTO;
import com.laptrinhjavaweb.exception.MyException;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Map;

public interface IUserService {
    UserDTO findOneByUserNameAndStatus(String name, int status);

    UserDTO findOneByUserName(String userName);

    UserDTO findUserById(long id);

    UserDTO insert(UserDTO userDTO);

    UserDTO update(Long id, UserDTO userDTO);

    void updatePassword(long id, PasswordDTO userDTO) throws MyException;

    void delete(long[] ids);

    Map<Long, String> getStaffMap();

    List<StaffResponseDTO> listStaff(Long id, String mission);

    void save(UserDTO userDTO);

    int countTotalItemFindAllUser();

    List<UserDTO> findAll(Pageable pageable);

    List<UserDTO> findByCondition(UserSearchRequestDTO userSearchRequestDTO, Pageable pageable);

    int countTotalItemFindConditionUser(UserSearchRequestDTO dto);
}
