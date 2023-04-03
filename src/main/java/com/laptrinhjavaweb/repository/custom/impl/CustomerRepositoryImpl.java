package com.laptrinhjavaweb.repository.custom.impl;

import com.laptrinhjavaweb.builder.BuildingSearchBuilder;
import com.laptrinhjavaweb.builder.CustomerSearchBuilder;
import com.laptrinhjavaweb.entity.BuildingEntity;
import com.laptrinhjavaweb.entity.CustomerEntity;
import com.laptrinhjavaweb.repository.custom.BuildingRepositoryCustom;
import com.laptrinhjavaweb.repository.custom.CustomerRepositoryCustom;
import com.laptrinhjavaweb.utils.ObjectUtils;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.lang.reflect.Field;
import java.util.List;

@Repository
public class CustomerRepositoryImpl implements CustomerRepositoryCustom {
    @PersistenceContext
    private EntityManager entityManager;


    @Override
    public List<CustomerEntity> listAll(Pageable pageable) {
        StringBuilder finalSql = buildQueryFindAllFilter().append(" LIMIT ").append(pageable.getPageSize()).append("\n")
                .append(" OFFSET ").append(pageable.getOffset());
        Query query = entityManager.createNativeQuery(finalSql.toString(), CustomerEntity.class);
        return query.getResultList();
    }

    private StringBuilder buildQueryFindAllFilter() {
        StringBuilder sql = new StringBuilder("select*from customer c ");
        return sql;
    }


    private StringBuilder buildQueryFindConditionFilter(CustomerSearchBuilder searchBuilder) {
        StringBuilder finalSql = new StringBuilder("select distinct c.* from customer c ");
        StringBuilder joinQuery = new StringBuilder();
        StringBuilder whereQuery = new StringBuilder();
        buildQueryWithJoin(searchBuilder, joinQuery, whereQuery);
        buildQueryWithoutJoin(searchBuilder, whereQuery);
        finalSql.append(joinQuery);
        finalSql.append(" where 1=1 ");
        finalSql.append(whereQuery);
        return finalSql;
    }

    @Override
    public List<CustomerEntity> findByCondition(CustomerSearchBuilder customerSearchBuilder, Pageable pageable) {
        StringBuilder finalSql = buildQueryFindConditionFilter(customerSearchBuilder).append(" LIMIT ").append(pageable.getPageSize()).append("\n")
                .append(" OFFSET ").append(pageable.getOffset());
        Query query = entityManager.createNativeQuery(finalSql.toString(), CustomerEntity.class);
        return query.getResultList();
    }


    @Override
    public int countTotalItemFindAllCustomer() {
        StringBuilder sql = buildQueryFindAllFilter();
        Query query = entityManager.createNativeQuery(sql.toString());
        return query.getResultList().size();
    }


    @Override
    public int countTotalItemFindConditionCustomer(CustomerSearchBuilder dto) {
        StringBuilder sql = buildQueryFindConditionFilter(dto);
        Query query = entityManager.createNativeQuery(sql.toString());
        return query.getResultList().size();
    }

    @Override
    public List<CustomerEntity> showAllCustommer() {
        String finalSql = "select * from estateadvance.customer ";
        Query query = entityManager.createNativeQuery(finalSql, BuildingEntity.class);
        return query.getResultList();

    }


    private void buildQueryWithJoin(CustomerSearchBuilder customerSearchBuilder, StringBuilder joinQuery,
                                    StringBuilder whereQuery) {
        Long staffId = ObjectUtils.getObject(customerSearchBuilder.getStaffId(), Long.class);
        if (staffId != null) {
            joinQuery.append(" join assignmentcustomer ac on ac.customerid=c.id ");
            whereQuery.append(" and ac.staffid=" + staffId);
        }

    }

    public StringBuilder buildSqlUsingReflection(StringBuilder whereQuery, CustomerSearchBuilder customerSearchBuilder) {
        try {
            Field[] fields = CustomerSearchBuilder.class.getDeclaredFields();
            for (Field field : fields) {
                field.setAccessible(true);
                String fieldName = field.getName();
                Object objectValue = field.get(customerSearchBuilder);
                if (!fieldName.equals("staffId")) {
                    if (field.getType().getName().equals("java.lang.String")) {
                        if (ObjectUtils.getObject(objectValue, String.class) != null) {
                            whereQuery.append(" and c." + fieldName.toLowerCase() + " like '%" + objectValue + "%' ");
                        }
                    } else if (field.getType().getName().equals("java.lang.Integer")) {
                        if (ObjectUtils.getObject(objectValue, Integer.class) != null) {
                            whereQuery.append(" and c." + fieldName.toLowerCase() + " = " + objectValue);
                        }
                    }
                }
            }

        } catch (Exception e) {

        }
        return whereQuery;
    }

    private void buildQueryWithoutJoin(CustomerSearchBuilder customerSearchBuilder, StringBuilder whereQuery) {
        whereQuery = buildSqlUsingReflection(whereQuery, customerSearchBuilder);
    }
}
