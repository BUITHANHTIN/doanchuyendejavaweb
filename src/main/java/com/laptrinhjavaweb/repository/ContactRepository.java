package com.laptrinhjavaweb.repository;

import com.laptrinhjavaweb.entity.ContactEntity;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;


public interface ContactRepository extends JpaRepository<ContactEntity, Long> {

    List<ContactEntity> findAll();


}
