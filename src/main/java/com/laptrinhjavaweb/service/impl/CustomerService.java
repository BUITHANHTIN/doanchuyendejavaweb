package com.laptrinhjavaweb.service.impl;

import com.laptrinhjavaweb.builder.BuildingSearchBuilder;
import com.laptrinhjavaweb.builder.CustomerSearchBuilder;
import com.laptrinhjavaweb.constant.SystemConstant;
import com.laptrinhjavaweb.converter.BuildingConverter;
import com.laptrinhjavaweb.converter.CustomerConverter;
import com.laptrinhjavaweb.dto.BuildingDTO;
import com.laptrinhjavaweb.dto.CustomerDTO;
import com.laptrinhjavaweb.dto.Request.BuildingSearchRequestDTO;
import com.laptrinhjavaweb.dto.Request.CustomerSearchRequestDTO;
import com.laptrinhjavaweb.entity.BuildingEntity;
import com.laptrinhjavaweb.entity.CustomerEntity;
import com.laptrinhjavaweb.entity.RoleEntity;
import com.laptrinhjavaweb.entity.UserEntity;
import com.laptrinhjavaweb.repository.BuildingRepository;
import com.laptrinhjavaweb.repository.CustomerRepository;
import com.laptrinhjavaweb.repository.RentAreaRepository;
import com.laptrinhjavaweb.repository.UserRepository;
import com.laptrinhjavaweb.security.utils.SecurityUtils;
import com.laptrinhjavaweb.service.IBuildingService;
import com.laptrinhjavaweb.service.ICustomerService;
import com.laptrinhjavaweb.utils.UploadFileUtils;
import javassist.NotFoundException;
import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

@Service
public class CustomerService implements ICustomerService {

    @Autowired
    private CustomerRepository customerRepository;

    @Autowired
    private BuildingRepository buildingRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RentAreaRepository rentAreaRepository;
    @Autowired
    private UploadFileUtils uploadFileUtils;


    @Autowired
    private CustomerConverter customerConverter;

    @Override
    public List<CustomerDTO> findAll(Pageable pageable) {
        List<CustomerEntity> customerEntityList = new ArrayList<>();
        UserEntity userEntity = userRepository.findOneById(SecurityUtils.getPrincipal().getId());
        boolean checkIsManager = isManager(userEntity.getRoles());
        if (checkIsManager) {
            customerEntityList = customerRepository.listAll(pageable);
        } else {
            customerEntityList = userEntity.getCustomers();
        }
        List<CustomerDTO> customerDTOList = new ArrayList<>();
        for (CustomerEntity entity : customerEntityList) {
            CustomerDTO customerDTO = customerConverter.convertToDto(entity);
            customerDTOList.add(customerDTO);
        }
        return customerDTOList;

    }

    public boolean isManager(List<RoleEntity> list) {
        for (RoleEntity entity : list) {
            if (entity.getCode().equals(SystemConstant.MANAGER)) {
                return true;
            }
        }
        return false;

    }

    @Override
    public List<CustomerDTO> findByCondition(CustomerSearchRequestDTO customerSearch, Pageable pageable) {
        CustomerSearchBuilder searchBuilder = customerConverter.convertToBuilder(customerSearch);
        List<CustomerDTO> customerDTOList = new ArrayList<>();
        UserEntity userEntity = userRepository.findOneById(SecurityUtils.getPrincipal().getId());
        boolean checkIsManager = isManager(userEntity.getRoles());
        if (!checkIsManager) {
            searchBuilder.setStaffId(userEntity.getId());
        }
        List<CustomerEntity> customerEntityList = customerRepository.findByCondition(searchBuilder, pageable);
        ;
        for (CustomerEntity entity : customerEntityList) {
            CustomerDTO dto = customerConverter.convertToDto(entity);
            customerDTOList.add(dto);
        }
        return customerDTOList;
    }

    @Override
    @Transactional
    public CustomerDTO saveCustomer(CustomerDTO dto) {
        CustomerEntity entity = customerConverter.convertToEntity(dto);
        customerRepository.save(entity);
        return dto;
    }

    @Override
    public int countTotalItemFindAllCustomer() {
        UserEntity userEntity = userRepository.findOneById(SecurityUtils.getPrincipal().getId());
        boolean checkIsManager = isManager(userEntity.getRoles());
        int countCustomer = 0;
        if (checkIsManager) {
            countCustomer = customerRepository.countTotalItemFindAllCustomer();
        } else {
            countCustomer = userEntity.getCustomers().size();
        }
        return countCustomer;

    }

    @Override
    public int countTotalItemFindConditionCustomer(CustomerSearchRequestDTO dto) {
        CustomerSearchBuilder searchBuilder = customerConverter.convertToBuilder(dto);
        UserEntity userEntity = userRepository.findOneById(SecurityUtils.getPrincipal().getId());
        boolean checkIsManager = isManager(userEntity.getRoles());
        if (!checkIsManager) {
            searchBuilder.setStaffId(userEntity.getId());
        }
        return customerRepository.countTotalItemFindConditionCustomer(searchBuilder);
    }

    @Override
    public List<CustomerDTO> showAllCustommer() {
        List<CustomerDTO> customerDTOS = new ArrayList<>();
        List<CustomerEntity> customerEntities = customerRepository.showAllCustommer();
        for (CustomerEntity entity : customerEntities) {

            customerDTOS.add(customerConverter.convertToDto(entity));
        }
        return customerDTOS;
    }

    @Override
    public int countTotalCustomer() {
        return customerRepository.countTotalItemFindAllCustomer();
    }

    @Override
    public CustomerDTO findById(Long id) {
        CustomerEntity entity = customerRepository.findOneById(id);
        CustomerDTO dto = customerConverter.convertToDto(entity);
        return dto;
    }

    @Override
    @Transactional
    public void deleteById(Long[] ids) {
        if (ids.length > 0) {
            Long count = customerRepository.countByIdIn(ids);
            if (count != ids.length) {
                try {
                    throw new NotFoundException(SystemConstant.CUSTOMER_NOT_FOUND);
                } catch (NotFoundException e) {
                    e.printStackTrace();
                }
            }

            customerRepository.deleteByIdIn(ids);
        }

    }

}
