package com.laptrinhjavaweb.repository.custom;


import com.laptrinhjavaweb.builder.CustomerSearchBuilder;
import com.laptrinhjavaweb.builder.UserSearchBuilder;
import com.laptrinhjavaweb.entity.CustomerEntity;
import com.laptrinhjavaweb.entity.UserEntity;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface UserRepositoryCustom {

    List<UserEntity> listAgents();

    List<UserEntity> listAll(Pageable pageable);

    List<UserEntity> findByCondition(UserSearchBuilder userSearchBuilder, Pageable pageable);

    int countTotalItemFindAllUser();

    int countTotalItemFindConditionUser(UserSearchBuilder userSearchBuilder);


}
