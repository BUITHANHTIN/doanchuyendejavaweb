package com.laptrinhjavaweb.repository.custom.impl;

import com.laptrinhjavaweb.entity.TransactionEntity;
import com.laptrinhjavaweb.repository.custom.TransactionRepositoryCustom;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;

@Repository
public class TransactionRepositoryImpl implements TransactionRepositoryCustom {
    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public List<TransactionEntity> findByConditon(String code, Long customerId) {
        StringBuilder finalSql = new StringBuilder("select*from transaction t");
        finalSql.append(" Where 1=1 ");
        finalSql.append(" and t.code='" + code+"'");
        finalSql.append(" and t.customerid=" + customerId);
//        if (staffId != null) {
//            finalSql.append(" and t.staffid=" + staffId);
//        }
        Query query = entityManager.createNativeQuery(finalSql.toString(), TransactionEntity.class);
        return query.getResultList();
    }
}
