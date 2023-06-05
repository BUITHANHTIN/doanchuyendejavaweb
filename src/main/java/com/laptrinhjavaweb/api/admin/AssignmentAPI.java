package com.laptrinhjavaweb.api.admin;

import com.laptrinhjavaweb.dto.Request.AssignmentCustomerRequestDTO;
import com.laptrinhjavaweb.service.impl.AssignmentBuildingService;
import com.laptrinhjavaweb.service.impl.AssignmentCustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.laptrinhjavaweb.dto.Request.AssignmentBuildingRequestDTO;

@RestController
@RequestMapping("/api/assignment")
public class AssignmentAPI {


    @Autowired
    AssignmentBuildingService assignmentBuildingService;

    @Autowired
    AssignmentCustomerService assignmentCustomerService;


    @PutMapping("/building")
    public void updateAssignmentBuilding(@RequestBody AssignmentBuildingRequestDTO assignmentBuildingRequestDTO) {
        assignmentBuildingService.updateAssignmentBuilding(assignmentBuildingRequestDTO);
    }

    @PutMapping("/customer")
    public void updateAssignmentCustomer(@RequestBody AssignmentCustomerRequestDTO assignmentCustomerRequestDTO) {
        assignmentCustomerService.updateAssignmentCustomer(assignmentCustomerRequestDTO);
    }

}
