package com.laptrinhjavaweb.service;

import com.laptrinhjavaweb.dto.ContactDTO;

import java.util.List;

public interface IContactService {
    List<ContactDTO> findAll();

     void save(ContactDTO contactDTO);
}
