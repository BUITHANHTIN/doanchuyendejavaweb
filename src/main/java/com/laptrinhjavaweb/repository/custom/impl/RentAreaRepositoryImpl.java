package com.laptrinhjavaweb.repository.custom.impl;

import com.laptrinhjavaweb.repository.custom.RentAreaRepositoryCustom;
import org.springframework.stereotype.Repository;

import javax.persistence.*;

@Repository
public class RentAreaRepositoryImpl implements RentAreaRepositoryCustom {
    @PersistenceContext
    private EntityManager entityManager;




}
