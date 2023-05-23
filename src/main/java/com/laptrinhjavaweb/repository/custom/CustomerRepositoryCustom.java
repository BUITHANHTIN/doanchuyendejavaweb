package com.laptrinhjavaweb.repository.custom;


import com.laptrinhjavaweb.builder.BuildingSearchBuilder;
import com.laptrinhjavaweb.builder.CustomerSearchBuilder;
import com.laptrinhjavaweb.entity.BuildingEntity;
import com.laptrinhjavaweb.entity.CustomerEntity;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface CustomerRepositoryCustom {

    List<CustomerEntity> listAll(Pageable pageable);

    List<CustomerEntity> findByCondition(CustomerSearchBuilder customerSearchBuilder, Pageable pageable);

    int countTotalItemFindAllCustomer();

    int countTotalItemFindConditionCustomer(CustomerSearchBuilder dto);



}
