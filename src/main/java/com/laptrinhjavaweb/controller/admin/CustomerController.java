package com.laptrinhjavaweb.controller.admin;

import com.laptrinhjavaweb.converter.BuildingConverter;
import com.laptrinhjavaweb.converter.TransactionConverter;
import com.laptrinhjavaweb.dto.BuildingDTO;
import com.laptrinhjavaweb.dto.CustomerDTO;
import com.laptrinhjavaweb.dto.Request.BuildingSearchRequestDTO;
import com.laptrinhjavaweb.dto.Request.CustomerSearchRequestDTO;
import com.laptrinhjavaweb.dto.Response.TypeBuildingResponseDTO;
import com.laptrinhjavaweb.dto.TransactionDTO;
import com.laptrinhjavaweb.enums.AssignmentCustomerEnum;
import com.laptrinhjavaweb.enums.DistrictsEnum;
import com.laptrinhjavaweb.service.impl.*;
import com.laptrinhjavaweb.utils.DisplayTagUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller(value = "customerControllerOfAdmin")
public class CustomerController {

    @Autowired
    CustomerService customerService;
    @Autowired
    UserService userService;
    @Autowired
    TypeBuildingService typeService;
    @Autowired
    TransactionConverter transactionConverter;
    @Autowired
    DistrictBuildingService districtBuildingService;

    @Autowired
    TransactionService transactionService;


    @RequestMapping(value = "/admin/customer-list", method = RequestMethod.GET)
    public ModelAndView customerList(@ModelAttribute("modelSearch") CustomerSearchRequestDTO customerDTO, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/customer/list");
        Map<Long, String> users = userService.getStaffMap();
        //paging
        DisplayTagUtils.of(request, customerDTO);
        List<CustomerDTO> customerDTOList = null;
        int countTotalItem = 0;
        if (customerDTO.getSearchValue() != null) {
            customerDTOList = customerService.findByCondition(customerDTO, new PageRequest(customerDTO.getPage() - 1, customerDTO.getMaxPageItems()));
            countTotalItem = customerService.countTotalItemFindConditionCustomer(customerDTO);
        } else {
            customerDTOList = customerService.findAll(new PageRequest(customerDTO.getPage() - 1, customerDTO.getMaxPageItems()));
            countTotalItem = customerService.countTotalItemFindAllCustomer();
        }
        customerDTO.setListResult(customerDTOList);
        customerDTO.setTotalItems(countTotalItem);

        mav.addObject("modelSearch", customerDTO);
        mav.addObject("userList", users);

        return mav;
    }


    @RequestMapping(value = "/admin/customer-edit", method = RequestMethod.GET)
    public ModelAndView customerEdit(@RequestParam(name = "id") Long customerId) {
        ModelAndView mav = new ModelAndView("admin/customer/edit");
        mav.addObject("transaction", transactionConverter.convertToResponse(customerId));
        mav.addObject("customer",customerService.findById(customerId));
        return mav;
    }
    @RequestMapping(value = "/admin/customer-add", method = RequestMethod.GET)
    public ModelAndView customerAdd() {
        ModelAndView mav = new ModelAndView("admin/customer/add");
        mav.addObject("transaction", null);
        mav.addObject("customer",null);
        return mav;
    }


}
