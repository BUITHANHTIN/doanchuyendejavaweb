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
        String finalSql = "SELECT  *  FROM estateadvance.user inner join estateadvance.user_role on user.id = user_role.userid where user.status = 1 and user_role.roleid = 2 or user_role.roleid = 1";
        Query query = entityManager.createNativeQuery(finalSql, UserEntity.class);
        return query.getResultList();
    }
}
