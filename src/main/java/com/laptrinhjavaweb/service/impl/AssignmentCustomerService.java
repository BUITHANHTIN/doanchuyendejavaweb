package com.laptrinhjavaweb.service.impl;

import com.laptrinhjavaweb.dto.Request.AssignmentBuildingRequestDTO;
import com.laptrinhjavaweb.dto.Request.AssignmentCustomerRequestDTO;
import com.laptrinhjavaweb.entity.BuildingEntity;
import com.laptrinhjavaweb.entity.CustomerEntity;
import com.laptrinhjavaweb.repository.BuildingRepository;
import com.laptrinhjavaweb.repository.CustomerRepository;
import com.laptrinhjavaweb.repository.UserRepository;
import com.laptrinhjavaweb.service.IAssignmentBuildingService;
import com.laptrinhjavaweb.service.IAssignmentCustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class AssignmentCustomerService implements IAssignmentCustomerService {

    @Autowired
    private CustomerRepository customerRepository;
    @Autowired
    private UserRepository userRepository;

    @Transactional
    public void updateAssignmentCustomer(AssignmentCustomerRequestDTO assignmentCustomerRequestDTO) {
        CustomerEntity entity = customerRepository.findOneById(assignmentCustomerRequestDTO.getCustomerId());
        entity.setUsers(userRepository.findByIdIn(assignmentCustomerRequestDTO.getStaffId()));
        customerRepository.save(entity);
    }
}
