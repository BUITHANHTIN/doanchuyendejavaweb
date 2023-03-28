package com.laptrinhjavaweb.service.impl;

import com.laptrinhjavaweb.builder.CustomerSearchBuilder;
import com.laptrinhjavaweb.constant.SystemConstant;
import com.laptrinhjavaweb.converter.CustomerConverter;
import com.laptrinhjavaweb.converter.TransactionConverter;
import com.laptrinhjavaweb.dto.CustomerDTO;
import com.laptrinhjavaweb.dto.Request.CustomerSearchRequestDTO;
import com.laptrinhjavaweb.dto.Response.TransactionReponseDTO;
import com.laptrinhjavaweb.dto.TransactionDTO;
import com.laptrinhjavaweb.entity.CustomerEntity;
import com.laptrinhjavaweb.entity.RoleEntity;
import com.laptrinhjavaweb.entity.TransactionEntity;
import com.laptrinhjavaweb.entity.UserEntity;
import com.laptrinhjavaweb.repository.*;
import com.laptrinhjavaweb.security.utils.SecurityUtils;
import com.laptrinhjavaweb.service.ICustomerService;
import com.laptrinhjavaweb.service.ITransactionService;
import com.laptrinhjavaweb.utils.UploadFileUtils;
import javassist.NotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
public class TransactionService implements ITransactionService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private TransactionRepository transactionRepository;

    @Autowired
    private TransactionConverter transactionConverter;


    public boolean isManager(List<RoleEntity> list) {
        for (RoleEntity entity : list) {
            if (entity.getCode().equals(SystemConstant.MANAGER_ROLE)) {
                return true;
            }
        }
        return false;

    }

    @Override
    @Transactional
    public List<TransactionDTO> findConditon(String code, Long customerId) {
        List<TransactionDTO> listDTO = new ArrayList<>();
        //  Long staffId = null;
        //    UserEntity userEntity = userRepository.findOneById(SecurityUtils.getPrincipal().getId());
        //   boolean checkIsManager = isManager(userEntity.getRoles());
//        if (!checkIsManager) {
//            staffId = SecurityUtils.getPrincipal().getId();
//        }
        List<TransactionEntity> listEntity = transactionRepository.findByConditon(code, customerId);
        for (TransactionEntity entity : listEntity) {
            listDTO.add(transactionConverter.convertToDto(entity));
        }
        return listDTO;
    }

    @Override
    public TransactionDTO save(TransactionDTO dto) {
        TransactionEntity entity = transactionConverter.convertToEntity(dto);
        return transactionConverter.convertToDto(transactionRepository.save(entity));
    }



}
