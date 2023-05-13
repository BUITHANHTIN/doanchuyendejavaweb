package com.laptrinhjavaweb.controller.web;

import com.laptrinhjavaweb.dto.BuildingDTO;
import com.laptrinhjavaweb.dto.ContactDTO;
import com.laptrinhjavaweb.service.impl.BuildingService;
import com.laptrinhjavaweb.service.impl.ContactService;
import com.laptrinhjavaweb.service.impl.CustomerService;
import com.laptrinhjavaweb.service.impl.DistrictBuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.Map;

@Controller(value = "contactControllerOfWeb")
public class ContactController {

    @Autowired
    ContactService contactService;

    @RequestMapping(value = "/contact", method = RequestMethod.GET)
    public ModelAndView contactPage() {
        ModelAndView mav = new ModelAndView("web/contact");
        return mav;
    }
    @PostMapping (value = "/contact")
    public ModelAndView contactPage(@ModelAttribute ContactDTO contactDTO) {
        ModelAndView mav = new ModelAndView("web/contact");
        contactService.save(contactDTO);
        return mav;
    }
}
