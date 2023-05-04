package com.laptrinhjavaweb.controller.web;

import com.laptrinhjavaweb.dto.BuildingDTO;
import com.laptrinhjavaweb.dto.Request.BuildingSearchRequestDTO;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller(value = "homeControllerOfWeb")
public class HomeController {
    @Autowired
    BuildingService buildingService;
    @Autowired
    DistrictBuildingService districtBuildingService;

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


    @RequestMapping(value = "/contact", method = RequestMethod.GET)
    public ModelAndView contactPage() {
        ModelAndView mav = new ModelAndView("web/contact");
        return mav;
    }


    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView login() {
        ModelAndView mav = new ModelAndView("login");
        return mav;
    }

    @RequestMapping(value = "/access-denied", method = RequestMethod.GET)
    public ModelAndView accessDenied() {
        return new ModelAndView("redirect:/login?accessDenied");
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public ModelAndView logout(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null) {
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        return new ModelAndView("redirect:/trang-chu");
    }
}
