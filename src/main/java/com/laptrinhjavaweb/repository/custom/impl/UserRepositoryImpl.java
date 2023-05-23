package com.laptrinhjavaweb.repository.custom.impl;

import com.laptrinhjavaweb.entity.BuildingEntity;
import com.laptrinhjavaweb.entity.UserEntity;
import com.laptrinhjavaweb.repository.custom.UserRepositoryCustom;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;

@Repository
public class UserRepositoryImpl implements UserRepositoryCustom {
    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public List<UserEntity> listAgents() {
        String finalSql = "select * from estateadvance.user\n" +
                "inner join estateadvance.user_role on estateadvance.user.id = estateadvance.user_role.userid\n" +
                "inner join estateadvance.role on estateadvance.role.id = estateadvance.user_role.roleid; ";
        Query query = entityManager.createNativeQuery(finalSql, UserEntity.class);
        return query.getResultList();
    }
}
