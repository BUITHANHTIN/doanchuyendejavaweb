package com.laptrinhjavaweb.controller.admin;

import com.laptrinhjavaweb.converter.BuildingConverter;
import com.laptrinhjavaweb.dto.BuildingDTO;
import com.laptrinhjavaweb.dto.ContactDTO;
import com.laptrinhjavaweb.dto.Request.BuildingSearchRequestDTO;
import com.laptrinhjavaweb.dto.Response.TypeBuildingResponseDTO;
import com.laptrinhjavaweb.enums.DistrictsEnum;
import com.laptrinhjavaweb.repository.ContactRepository;
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

@Controller(value = "contactControllerOfAdmin")
public class ContactController {

    @Autowired
    ContactRepository contactRepository;

    @RequestMapping(value = "/admin/contact-list", method = RequestMethod.GET)
    public ModelAndView buildingEdit(@RequestParam(name = "contactId", required = false) Long contactId) {
        ModelAndView mav = new ModelAndView("admin/contact/list");
        mav.addObject("contacts", contactRepository.findAll());
        return mav;
    }


}
