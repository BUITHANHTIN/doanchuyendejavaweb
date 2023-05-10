package com.laptrinhjavaweb.controller.web;

import com.laptrinhjavaweb.dto.BuildingDTO;
import com.laptrinhjavaweb.dto.Request.BuildingSearchRequestDTO;
import com.laptrinhjavaweb.entity.BuildingEntity;
import com.laptrinhjavaweb.service.impl.BuildingService;
import com.laptrinhjavaweb.service.impl.CustomerService;
import com.laptrinhjavaweb.service.impl.DistrictBuildingService;
import com.laptrinhjavaweb.utils.DisplayTagUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller(value = "propertyControllerOfWeb")
public class PropertyController {
    @Autowired
    BuildingService buildingService;
    @Autowired
    DistrictBuildingService districtBuildingService;

    @Autowired
    CustomerService customerService;


    @RequestMapping(value = "/property", method = RequestMethod.GET)
    public ModelAndView propertyPage(@RequestParam(defaultValue = "0") int page,
                                     @RequestParam(defaultValue = "9") int size,
                                     @RequestParam(defaultValue = "id") String sortBy) {
        ModelAndView mav = new ModelAndView("web/property");
        Map<String, String> districtTypes = districtBuildingService.getDistrictMap();
        //phan trang

        Pageable pageable = PageRequest.of(page, size, Sort.by(sortBy));
        Page<BuildingDTO> buildingDTO = buildingService.findAllPage(pageable);
        int totalPages = buildingDTO.getTotalPages();
        int currentPage = buildingDTO.getNumber();

        int startItem = currentPage * size;
        int endItem = (int) Math.min(startItem + size, buildingDTO.getTotalElements());
        mav.addObject("totalPages", totalPages);
        mav.addObject("currentPage", currentPage);
        mav.addObject("startItem", startItem);
        mav.addObject("endItem", endItem);
        mav.addObject("totalItems", buildingDTO.getTotalElements());
        mav.addObject("model", buildingDTO.getContent());

        mav.addObject("showAllBuilding", buildingService.showAllBuilding());
        mav.addObject("districtList", districtTypes);
       // mav.addObject("countCustomer", customerService.countTotalCustomer());

        return mav;
    }
}
