package com.laptrinhjavaweb.repository;

import com.laptrinhjavaweb.repository.custom.UserRepositoryCustom;
import com.laptrinhjavaweb.entity.UserEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface UserRepository extends JpaRepository<UserEntity, Long>, UserRepositoryCustom {
    UserEntity findOneByUserNameAndStatus(String name, int status);
    UserEntity findOneByUserName(String userName);

    UserEntity findOneById(Long id);

    List<UserEntity> findByIdIn(Long[] ids);

    List<UserEntity> listAgents();


}
