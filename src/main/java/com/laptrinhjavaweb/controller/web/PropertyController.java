package com.laptrinhjavaweb.controller.web;

import com.laptrinhjavaweb.dto.Request.BuildingSearchRequestDTO;
import com.laptrinhjavaweb.service.impl.BuildingService;
import com.laptrinhjavaweb.service.impl.CustomerService;
import com.laptrinhjavaweb.service.impl.DistrictBuildingService;
import com.laptrinhjavaweb.utils.DisplayTagUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
    public ModelAndView propertyPage(BuildingSearchRequestDTO buildingDTO, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("web/property");
        Map<String, String> districtTypes = districtBuildingService.getDistrictMap();
        //phan trang
        DisplayTagUtils.of(request, buildingDTO);

        buildingDTO.setListResult(buildingService.findAllProperty(new PageRequest(buildingDTO.getPage() - 1, buildingDTO.getMaxPageItems())));
        buildingDTO.setTotalItems(buildingService.countTotalItemFindAllBuildingOfProperty());

        mav.addObject("modelSearch", buildingDTO);
        mav.addObject("showAllBuilding", buildingService.showAllBuilding());
        mav.addObject("districtList", districtTypes);
        mav.addObject("modelSearch", buildingDTO);

        return mav;
    }
}
