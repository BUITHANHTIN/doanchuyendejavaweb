package com.laptrinhjavaweb.repository.custom.impl;

import com.laptrinhjavaweb.builder.CustomerSearchBuilder;
import com.laptrinhjavaweb.builder.UserSearchBuilder;
import com.laptrinhjavaweb.entity.BuildingEntity;
import com.laptrinhjavaweb.entity.CustomerEntity;
import com.laptrinhjavaweb.entity.UserEntity;
import com.laptrinhjavaweb.repository.custom.UserRepositoryCustom;
import com.laptrinhjavaweb.utils.ObjectUtils;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.lang.reflect.Field;
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

    @Override
    public List<UserEntity> listAll(Pageable pageable) {
        StringBuilder finalSql = buildQueryFindAllFilter().append(" LIMIT ").append(pageable.getPageSize()).append("\n")
                .append(" OFFSET ").append(pageable.getOffset());
        Query query = entityManager.createNativeQuery(finalSql.toString(), UserEntity.class);
        return query.getResultList();
    }


    private StringBuilder buildQueryFindAllFilter() {
        StringBuilder sql = new StringBuilder("select*from user u ");
        return sql;
    }


    private StringBuilder buildQueryFindConditionFilter(UserSearchBuilder searchBuilder) {
        StringBuilder finalSql = new StringBuilder("select distinct u.* from user u ");
        StringBuilder joinQuery = new StringBuilder();
        StringBuilder whereQuery = new StringBuilder();
        buildQueryWithoutJoin(searchBuilder, whereQuery);
        finalSql.append(joinQuery);
        finalSql.append(" where 1=1 ");
        finalSql.append(whereQuery);
        return finalSql;
    }

    @Override
    public List<UserEntity> findByCondition(UserSearchBuilder userSearchBuilder, Pageable pageable) {
        StringBuilder finalSql = buildQueryFindConditionFilter(userSearchBuilder).append(" LIMIT ").append(pageable.getPageSize()).append("\n")
                .append(" OFFSET ").append(pageable.getOffset());
        Query query = entityManager.createNativeQuery(finalSql.toString(), UserEntity.class);
        return query.getResultList();
    }


    @Override
    public int countTotalItemFindAllUser() {
        StringBuilder sql = buildQueryFindAllFilter();
        Query query = entityManager.createNativeQuery(sql.toString());
        return query.getResultList().size();
    }


    @Override
    public int countTotalItemFindConditionUser(UserSearchBuilder dto) {
        StringBuilder sql = buildQueryFindConditionFilter(dto);
        Query query = entityManager.createNativeQuery(sql.toString());
        return query.getResultList().size();
    }


    public StringBuilder buildSqlUsingReflection(StringBuilder whereQuery, UserSearchBuilder userSearchBuilder) {
        try {
            Field[] fields = UserSearchBuilder.class.getDeclaredFields();
            for (Field field : fields) {
                field.setAccessible(true);
                String fieldName = field.getName();
                Object objectValue = field.get(userSearchBuilder);
                // if (!fieldName.equals("staffId")) {
                if (field.getType().getName().equals("java.lang.String")) {
                    if (ObjectUtils.getObject(objectValue, String.class) != null) {
                        whereQuery.append(" and u." + fieldName.toLowerCase() + " like '%" + objectValue + "%' ");
                    }
                } else if (field.getType().getName().equals("java.lang.Integer")) {
                    if (ObjectUtils.getObject(objectValue, Integer.class) != null) {
                        whereQuery.append(" and u." + fieldName.toLowerCase() + " = " + objectValue);
                    }
                }
                //    }
            }

        } catch (Exception e) {

        }
        return whereQuery;
    }

    private void buildQueryWithoutJoin(UserSearchBuilder userSearchBuilder, StringBuilder whereQuery) {
        whereQuery = buildSqlUsingReflection(whereQuery, userSearchBuilder);
    }
}
