package com.laptrinhjavaweb.service.impl;

import com.laptrinhjavaweb.converter.ContactConverter;
import com.laptrinhjavaweb.dto.BuildingDTO;
import com.laptrinhjavaweb.dto.ContactDTO;
import com.laptrinhjavaweb.entity.BuildingEntity;
import com.laptrinhjavaweb.entity.ContactEntity;
import com.laptrinhjavaweb.repository.ContactRepository;
import com.laptrinhjavaweb.service.IContactService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class ContactService implements IContactService {
    @Autowired
    ContactRepository contactRepository;
    @Autowired
    ContactConverter contactConverter;

    @Override
    public List<ContactDTO> findAll() {
        return null;
    }

    @Override
    public void save(ContactDTO contactDTO) {

        contactRepository.save(contactConverter.convertToEntity(contactDTO));
    }

}
