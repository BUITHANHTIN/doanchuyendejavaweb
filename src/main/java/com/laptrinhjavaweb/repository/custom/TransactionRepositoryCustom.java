package com.laptrinhjavaweb.repository.custom;


import com.laptrinhjavaweb.entity.TransactionEntity;

import java.util.List;

public interface TransactionRepositoryCustom {
    //    List<TransactionEntity> findByConditon(String code,Long customerId,Long staffId);
    List<TransactionEntity> findByConditon(String code, Long customerId);

}
