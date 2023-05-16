package com.laptrinhjavaweb.api.admin;

import com.laptrinhjavaweb.constant.SystemConstant;
import com.laptrinhjavaweb.dto.BuildingDTO;
import com.laptrinhjavaweb.dto.CustomerDTO;
import com.laptrinhjavaweb.dto.Response.StaffResponseDTO;
import com.laptrinhjavaweb.service.impl.BuildingService;
import com.laptrinhjavaweb.service.impl.CustomerService;
import com.laptrinhjavaweb.service.impl.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/customer")
public class CustomerAPI {
    @Autowired
    CustomerService customerService;
    @Autowired
    UserService userService;

    @PostMapping
    public CustomerDTO createCustomer(@RequestBody CustomerDTO customerDTO) {
        return customerService.saveCustomer(customerDTO);
    }

    @PutMapping
    public CustomerDTO updateCustomer(@RequestBody CustomerDTO customerDTO) {
        return customerService.saveCustomer(customerDTO);
    }

    @DeleteMapping
    public void deleteBuilding(@RequestBody Long[] ids) {
        customerService.deleteById(ids);
    }

    @GetMapping("/{customerId}/staff")
    public List<StaffResponseDTO> listStaff(@PathVariable Long customerId) {
        List<StaffResponseDTO> staffResponseDTOS = userService.listStaff(customerId, SystemConstant.ASSIGNMENT_CUSTOMER);
        return staffResponseDTOS;
    }


}
