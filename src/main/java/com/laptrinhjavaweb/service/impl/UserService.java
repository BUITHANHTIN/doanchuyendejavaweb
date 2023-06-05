package com.laptrinhjavaweb.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import com.laptrinhjavaweb.builder.CustomerSearchBuilder;
import com.laptrinhjavaweb.builder.UserSearchBuilder;
import com.laptrinhjavaweb.dto.CustomerDTO;
import com.laptrinhjavaweb.dto.Request.UserSearchRequestDTO;
import com.laptrinhjavaweb.entity.CustomerEntity;
import com.laptrinhjavaweb.repository.CustomerRepository;
import com.laptrinhjavaweb.security.utils.SecurityUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.laptrinhjavaweb.constant.SystemConstant;
import com.laptrinhjavaweb.converter.UserConverter;
import com.laptrinhjavaweb.dto.PasswordDTO;
import com.laptrinhjavaweb.dto.UserDTO;
import com.laptrinhjavaweb.dto.Response.StaffResponseDTO;
import com.laptrinhjavaweb.entity.RoleEntity;
import com.laptrinhjavaweb.entity.UserEntity;
import com.laptrinhjavaweb.exception.MyException;
import com.laptrinhjavaweb.repository.BuildingRepository;
import com.laptrinhjavaweb.repository.RoleRepository;
import com.laptrinhjavaweb.repository.UserRepository;
import com.laptrinhjavaweb.service.IUserService;

@Service
public class UserService implements IUserService {

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private BuildingRepository buildingRepository;
    @Autowired
    private CustomerRepository customerRepository;

    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private UserConverter userConverter;

    @Override
    public UserDTO findOneByUserNameAndStatus(String name, int status) {
        return userConverter.convertToDto(userRepository.findOneByUserNameAndStatus(name, status));
    }



    @Override
    public UserDTO findOneByUserName(String userName) {
        UserEntity userEntity = userRepository.findOneByUserName(userName);
        if (userEntity == null) {
            return null;
        }
        UserDTO userDTO = userConverter.convertToDto(userEntity);
        return userDTO;
    }

    @Override
    public UserDTO findUserById(long id) {
        UserEntity entity = userRepository.findOneById(id);
        // userRepository.findOne(id);
        List<RoleEntity> roles = entity.getRoles();
        UserDTO dto = userConverter.convertToDto(entity);
        roles.forEach(item -> {
            dto.setRoleCode(item.getCode());
        });
        return dto;
    }

    @Override
    @Transactional
    public UserDTO insert(UserDTO newUser) {
        newUser.setRoleCode("STAFF");
        RoleEntity role = roleRepository.findOneByCode(newUser.getRoleCode());
        UserEntity userEntity = userConverter.convertToEntity(newUser);
        userEntity.setRoles(Stream.of(role).collect(Collectors.toList()));
        userEntity.setStatus(1);
        userEntity.setPassword(passwordEncoder.encode(SystemConstant.PASSWORD_DEFAULT));
        return userConverter.convertToDto(userRepository.save(userEntity));
    }

    @Override
    @Transactional
    public UserDTO update(Long id, UserDTO updateUser) {
        updateUser.setRoleCode("STAFF");
        RoleEntity role = roleRepository.findOneByCode(updateUser.getRoleCode());
        UserEntity oldUser = userRepository.findOneById(id);
        UserEntity userEntity = userConverter.convertToEntity(updateUser);
        userEntity.setUserName(updateUser.getUserName());
        userEntity.setFullName(updateUser.getFullName());
        userEntity.setPhone(updateUser.getPhone());


        userEntity.setStatus(oldUser.getStatus());
        userEntity.setRoles(Stream.of(role).collect(Collectors.toList()));
        userEntity.setPassword(oldUser.getPassword());
        return userConverter.convertToDto(userRepository.save(userEntity));
    }

    @Override
    @Transactional
    public void updatePassword(long id, PasswordDTO passwordDTO) throws MyException {
        UserEntity user = userRepository.findOneById(id);
        if (passwordEncoder.matches(passwordDTO.getOldPassword(), user.getPassword())
                && passwordDTO.getNewPassword().equals(passwordDTO.getConfirmPassword())) {
            user.setPassword(passwordEncoder.encode(passwordDTO.getNewPassword()));
            userRepository.save(user);
        } else {
            throw new MyException(SystemConstant.CHANGE_PASSWORD_FAIL);
        }
    }



    @Override
    @Transactional
    public void delete(long[] ids) {
        for (Long item : ids) {
            UserEntity userEntity = userRepository.findOneById(item);
            userEntity.setStatus(0);
            userRepository.save(userEntity);
        }
    }

    @Override
    public Map<Long, String> getStaffMap() {
        Map<Long, String> map = new HashMap<>();
        for (UserDTO dto : listUserDto()) {
            map.put(dto.getId(), dto.getFullName());
        }
        return map;

    }

    @Override
    public List<StaffResponseDTO> listStaff(Long id, String mission) {
        List<StaffResponseDTO> staffResponseList = new ArrayList<>();
        StaffResponseDTO staffResponseDTO = null;
        List<UserDTO> listAllUser = listUserDto();
        List<UserEntity> userList = null;
        if (mission.equals(SystemConstant.ASSIGNMENT_BUILDING)) {
            userList = buildingRepository.findOneById(id).getUsers();
        } else if (mission.equals(SystemConstant.ASSIGNMENT_CUSTOMER)) {
            userList = customerRepository.findOneById(id).getUsers();
        }
        for (UserDTO userDTO : listAllUser) {
            staffResponseDTO = new StaffResponseDTO();
            staffResponseDTO.setId(userDTO.getId());
            staffResponseDTO.setFullName(userDTO.getFullName());
            staffResponseDTO.setChecked(checkExitId(userDTO.getId(), userList) ? "checked" : "");
            staffResponseList.add(staffResponseDTO);
        }
        return staffResponseList;
    }

    @Override
    public void save(UserDTO userDTO) {
        userDTO.setRoleCode(SystemConstant.USER);
        UserEntity entity = new UserEntity();
        entity.setUserName(userDTO.getUserName());
        entity.setFullName(userDTO.getFullName());
        entity.setPassword(passwordEncoder.encode(userDTO.getPassword()));
        entity.setStatus(1);
        RoleEntity role = roleRepository.findOneByCode(userDTO.getRoleCode());
        entity.setRoles(Stream.of(role).collect(Collectors.toList()));
        userRepository.save(entity);
    }

    @Override
    public int countTotalItemFindAllUser() {
        return userRepository.countTotalItemFindAllUser();
    }

    @Override
    public List<UserDTO> findAll(Pageable pageable) {

        List<UserDTO> userDTOList = new ArrayList<>();
        for (UserEntity entity : userRepository.listAll(pageable)) {
            UserDTO userDTO = userConverter.convertToDto(entity);
            userDTOList.add(userDTO);
        }
        return userDTOList;
    }

    @Override
    public List<UserDTO> findByCondition(UserSearchRequestDTO userSearchRequestDTO, Pageable pageable) {
        UserSearchBuilder searchBuilder = userConverter.convertToBuilder(userSearchRequestDTO);
        List<UserDTO> userDTOList = new ArrayList<>();
        List<UserEntity> userEntityList = userRepository.findByCondition(searchBuilder, pageable);
        ;
        for (UserEntity entity : userEntityList) {
            UserDTO dto = userConverter.convertToDto(entity);
            userDTOList.add(dto);
        }
        return userDTOList;
    }

    @Override
    public int countTotalItemFindConditionUser(UserSearchRequestDTO dto) {
        UserSearchBuilder searchBuilder = userConverter.convertToBuilder(dto);
        return userRepository.countTotalItemFindConditionUser(searchBuilder);
    }

    public List<UserDTO> listUserDto() {
        List<UserDTO> dtoList = new ArrayList<>();

        List<UserEntity> entityList = roleRepository.findOneByCode(SystemConstant.STAFF).getUsers();

        for (UserEntity entity : entityList) {
            UserDTO dto = userConverter.convertToDto(entity);
            dtoList.add(dto);
        }
        return dtoList;
    }

    public boolean checkExitId(Long userId, List<UserEntity> userList) {
        for (UserEntity entity : userList) {
            if (userId == entity.getId()) {
                return true;
            }
        }
        return false;
    }
}
