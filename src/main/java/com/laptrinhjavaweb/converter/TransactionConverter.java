package com.laptrinhjavaweb.converter;

import com.laptrinhjavaweb.builder.CustomerSearchBuilder;
import com.laptrinhjavaweb.dto.BuildingDTO;
import com.laptrinhjavaweb.dto.CustomerDTO;
import com.laptrinhjavaweb.dto.Request.BuildingSearchRequestDTO;
import com.laptrinhjavaweb.dto.Request.CustomerSearchRequestDTO;
import com.laptrinhjavaweb.dto.Response.TransactionReponseDTO;
import com.laptrinhjavaweb.dto.TransactionDTO;
import com.laptrinhjavaweb.entity.BuildingEntity;
import com.laptrinhjavaweb.entity.CustomerEntity;
import com.laptrinhjavaweb.entity.TransactionEntity;
import com.laptrinhjavaweb.entity.UserEntity;
import com.laptrinhjavaweb.enums.AssignmentCustomerEnum;
import com.laptrinhjavaweb.enums.BuildingTypesEnum;
import com.laptrinhjavaweb.enums.DistrictsEnum;
import com.laptrinhjavaweb.repository.CustomerRepository;
import com.laptrinhjavaweb.repository.TransactionRepository;
import com.laptrinhjavaweb.security.utils.SecurityUtils;
import com.laptrinhjavaweb.service.impl.TransactionService;
import com.laptrinhjavaweb.utils.ObjectUtils;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class TransactionConverter {

    @Autowired
    private ModelMapper modelMapper;
    @Autowired
    private TransactionService transactionService;


    public TransactionDTO convertToDto(TransactionEntity entity) {
        TransactionDTO dto = modelMapper.map(entity, TransactionDTO.class);
        return dto;
    }

    public TransactionEntity convertToEntity(TransactionDTO dto) {
        TransactionEntity entity = modelMapper.map(dto, TransactionEntity.class);
        entity.setStaffId(SecurityUtils.getPrincipal().getId());
        return entity;
    }


    public List<TransactionReponseDTO> convertToResponse(Long customerId) {
        List<TransactionReponseDTO> list = new ArrayList<>();
        TransactionReponseDTO reponseDTO = null;
        AssignmentCustomerEnum[] assignmentCustomerEnums = AssignmentCustomerEnum.values();
        for (AssignmentCustomerEnum anEnum : assignmentCustomerEnums) {
            reponseDTO = new TransactionReponseDTO();
            reponseDTO.setCodeTransaction(anEnum.name());
            reponseDTO.setNameTransaction(anEnum.getValue());
            reponseDTO.setObject(transactionService.findConditon(anEnum.name(), customerId));
            list.add(reponseDTO);

        }
        return list;
    }


}
