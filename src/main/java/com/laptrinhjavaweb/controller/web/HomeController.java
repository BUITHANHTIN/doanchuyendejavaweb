package com.laptrinhjavaweb.controller.web;

import com.laptrinhjavaweb.service.impl.BuildingService;
import org.springframework.beans.factory.annotation.Autowired;
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

@Controller(value = "homeControllerOfWeb")
public class HomeController {
    @Autowired
    BuildingService buildingService;

    @RequestMapping(value = "/trang-chu", method = RequestMethod.GET)
    public ModelAndView homePage() {
        ModelAndView mav = new ModelAndView("web/home");
        mav.addObject("recentsBuilding", buildingService.recentsBuilding());
        mav.addObject("list3Building", buildingService.findByTop3Building());
        mav.addObject("mostRecommendedBuilding",buildingService.mostRecommendedBuilding());
        return mav;
    }
    @RequestMapping(value = "/property", method = RequestMethod.GET)
    public ModelAndView propertyPage() {
        ModelAndView mav = new ModelAndView("web/property");
        mav.addObject("showAllBuilding", buildingService.showAllBuilding());
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
