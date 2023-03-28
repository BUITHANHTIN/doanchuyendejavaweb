package com.laptrinhjavaweb.controller.admin;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.laptrinhjavaweb.service.impl.DistrictBuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.laptrinhjavaweb.converter.BuildingConverter;
import com.laptrinhjavaweb.dto.BuildingDTO;
import com.laptrinhjavaweb.dto.UserDTO;
import com.laptrinhjavaweb.dto.Request.BuildingSearchRequestDTO;
import com.laptrinhjavaweb.dto.Response.TypeBuildingResponseDTO;
import com.laptrinhjavaweb.enums.DistrictsEnum;
import com.laptrinhjavaweb.service.impl.BuildingService;
import com.laptrinhjavaweb.service.impl.TypeBuildingService;
import com.laptrinhjavaweb.service.impl.UserService;
import com.laptrinhjavaweb.utils.DisplayTagUtils;

@Controller(value = "buildingControllerOfAdmin")
public class BuildingController {

    @Autowired
    BuildingService buildingService;
    @Autowired
    UserService userService;
    @Autowired
    TypeBuildingService typeService;
    @Autowired
    BuildingConverter buildingConverter;
    @Autowired
    DistrictBuildingService districtBuildingService;


    @RequestMapping(value = "/admin/building-list", method = RequestMethod.GET)
    public ModelAndView buildingList(@ModelAttribute("modelSearch") BuildingSearchRequestDTO buildingDTO, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/building/list");
        Map<String, String> typeMap = typeService.getTypeMap();
        Map<String, String> districtTypes = districtBuildingService.getDistrictMap();
        Map<Long, String> users = userService.getStaffMap();
        //paging
        DisplayTagUtils.of(request, buildingDTO);
        List<BuildingDTO> buildingDTOList = null;
        int countTotalItem = 0;
        if (buildingDTO.getSearchValue() != null) {
            buildingDTOList = buildingService.findByCondition(buildingDTO, new PageRequest(buildingDTO.getPage() - 1, buildingDTO.getMaxPageItems()));
            countTotalItem = buildingService.countTotalItemFindConditionBuilding(buildingDTO);
        } else {
            buildingDTOList = buildingService.findAll(new PageRequest(buildingDTO.getPage() - 1, buildingDTO.getMaxPageItems()));
            countTotalItem = buildingService.countTotalItemFindAllBuilding();
        }
        buildingDTO.setListResult(buildingDTOList);
        buildingDTO.setTotalItems(countTotalItem);

        mav.addObject("modelSearch", buildingDTO);
        mav.addObject("typeList", typeMap);
        mav.addObject("userList", users);
        mav.addObject("districtList", districtTypes);

        return mav;
    }


    @RequestMapping(value = "/admin/building-edit", method = RequestMethod.GET)
    public ModelAndView buildingEdit(@RequestParam(name = "buildingId", required = false) Long buildingId) {
        ModelAndView mav = new ModelAndView("admin/building/edit");
        //khong có id thì add ngc lại thì edit
        BuildingDTO buildingDTO = null;
        if (buildingId != null) {
            buildingDTO = buildingService.findByBuidingId(buildingId);
        }
        List<TypeBuildingResponseDTO> typeBuildingResponseDTOS = typeService.listTypes(buildingConverter.convertToBuildingSearch(buildingDTO));
        DistrictsEnum[] districtTypes = DistrictsEnum.values();
        mav.addObject("building", buildingDTO);
        mav.addObject("typeList", typeBuildingResponseDTOS);
        mav.addObject("districtList", districtTypes);
        return mav;
    }


}
