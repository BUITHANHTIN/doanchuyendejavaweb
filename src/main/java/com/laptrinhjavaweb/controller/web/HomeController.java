package com.laptrinhjavaweb.controller.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.laptrinhjavaweb.constant.SystemConstant;
import com.laptrinhjavaweb.dto.UserDTO;
import com.laptrinhjavaweb.service.impl.BuildingService;
import com.laptrinhjavaweb.service.impl.CustomerService;
import com.laptrinhjavaweb.service.impl.DistrictBuildingService;
import com.laptrinhjavaweb.service.impl.UserService;

@Controller(value = "homeControllerOfWeb")
public class HomeController {
    @Autowired
    BuildingService buildingService;
    @Autowired
    DistrictBuildingService districtBuildingService;
    @Autowired
    UserService userService;

    @Autowired
    CustomerService customerService;


    @RequestMapping(value = "/trang-chu", method = RequestMethod.GET)
    public ModelAndView homePage() {
        ModelAndView mav = new ModelAndView("web/home");
        mav.addObject("showAllBuilding", buildingService.showAllBuilding());
        mav.addObject("recentsBuilding", buildingService.recentsBuilding());
        mav.addObject("list3Building", buildingService.findByTop3Building());
        mav.addObject("mostRecommendedBuilding", buildingService.mostRecommendedBuilding());

        return mav;
    }

    @RequestMapping(value = "/agents", method = RequestMethod.GET)
    public ModelAndView agentsPage() {
        ModelAndView mav = new ModelAndView("web/agents");
        return mav;
    }

    @RequestMapping(value = "/about", method = RequestMethod.GET)
    public ModelAndView aboutPage() {
        ModelAndView mav = new ModelAndView("web/about");
        return mav;
    }

    @RequestMapping(value = "/blog", method = RequestMethod.GET)
    public ModelAndView blogPage() {
        ModelAndView mav = new ModelAndView("web/blog");
        return mav;
    }




}
