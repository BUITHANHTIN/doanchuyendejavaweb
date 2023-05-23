package com.laptrinhjavaweb.service;

import com.laptrinhjavaweb.dto.BuildingDTO;
import com.laptrinhjavaweb.dto.CustomerDTO;
import com.laptrinhjavaweb.dto.Request.BuildingSearchRequestDTO;
import com.laptrinhjavaweb.dto.Request.CustomerSearchRequestDTO;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface ICustomerService {
    List<CustomerDTO> findAll(Pageable pageable);

    List<CustomerDTO> findByCondition(CustomerSearchRequestDTO customerDTO, Pageable pageable);


    CustomerDTO findById(Long id);

    void deleteById(Long[] ids);

    CustomerDTO saveCustomer(CustomerDTO buildingDTO);


    int countTotalItemFindAllCustomer();

    int countTotalItemFindConditionCustomer(CustomerSearchRequestDTO dto);



    public int countTotalCustomer();
}
