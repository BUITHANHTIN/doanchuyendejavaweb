package com.laptrinhjavaweb.converter;

import com.laptrinhjavaweb.builder.BuildingSearchBuilder;
import com.laptrinhjavaweb.builder.CustomerSearchBuilder;
import com.laptrinhjavaweb.dto.BuildingDTO;
import com.laptrinhjavaweb.dto.CustomerDTO;
import com.laptrinhjavaweb.dto.Request.BuildingSearchRequestDTO;
import com.laptrinhjavaweb.dto.Request.CustomerSearchRequestDTO;
import com.laptrinhjavaweb.entity.BuildingEntity;
import com.laptrinhjavaweb.entity.CustomerEntity;
import com.laptrinhjavaweb.entity.RentAreaEntity;
import com.laptrinhjavaweb.enums.BuildingTypesEnum;
import com.laptrinhjavaweb.enums.DistrictsEnum;
import com.laptrinhjavaweb.enums.StatusEnum;
import com.laptrinhjavaweb.repository.BuildingRepository;
import com.laptrinhjavaweb.repository.CustomerRepository;
import com.laptrinhjavaweb.repository.TransactionRepository;
import com.laptrinhjavaweb.utils.ObjectUtils;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class CustomerConverter {

    @Autowired
    private ModelMapper modelMapper;
    @Autowired
    private CustomerRepository customerRepository;

    @Autowired
    private TransactionRepository transactionRepository;

    public CustomerSearchBuilder convertToBuilder(CustomerSearchRequestDTO dto) {
        CustomerSearchBuilder builder = modelMapper.map(dto, CustomerSearchBuilder.class);
        return builder;
    }

    public CustomerDTO convertToDto(CustomerEntity entity) {
        CustomerDTO dto = modelMapper.map(entity, CustomerDTO.class);
        dto.setStatus(entity.getUsers().size() > 0 ? StatusEnum.DANG_XU_LI.getValue() : StatusEnum.CHUA_XU_LI.getValue());
        return dto;
    }

    public CustomerEntity convertToEntity(CustomerDTO dto) {
        CustomerEntity entity = modelMapper.map(dto, CustomerEntity.class);
        if (dto.getId() != null) {
            entity.setUsers(customerRepository.findOneById(dto.getId()).getUsers());
            entity.setTransactions(transactionRepository.findByCustomerId(dto.getId()));
        }
        return entity;
    }


}
