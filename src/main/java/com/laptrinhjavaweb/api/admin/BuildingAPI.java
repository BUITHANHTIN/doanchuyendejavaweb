package com.laptrinhjavaweb.api.admin;

import com.laptrinhjavaweb.constant.SystemConstant;
import com.laptrinhjavaweb.dto.BuildingDTO;
import com.laptrinhjavaweb.dto.PasswordDTO;
import com.laptrinhjavaweb.dto.Response.StaffResponseDTO;
import com.laptrinhjavaweb.dto.UserDTO;
import com.laptrinhjavaweb.exception.MyException;
import com.laptrinhjavaweb.service.IUserService;
import com.laptrinhjavaweb.service.impl.BuildingService;
import com.laptrinhjavaweb.service.impl.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/building")
public class BuildingAPI {
    @Autowired
    BuildingService buildingService;
    @Autowired
    UserService userService;

    @PostMapping
    public BuildingDTO createBuilding(@RequestBody BuildingDTO buildingDTO) {
        return buildingService.saveBuilding(buildingDTO);
    }

    @PutMapping
    public BuildingDTO updateBuilding(@RequestBody BuildingDTO buildingDTO) {
        return buildingService.saveBuilding(buildingDTO);
    }

    @DeleteMapping
    public void deleteBuilding(@RequestBody Long[] ids) {
        buildingService.deleteByBuidingId(ids);
    }

    @GetMapping("/{buidingId}/staff")
    public  List<StaffResponseDTO>  listStaff(@PathVariable Long buidingId) {
        List<StaffResponseDTO> staffResponseDTOS = userService.listStaff(buidingId,SystemConstant.ASSIGNMENT_BUILDING);
        return staffResponseDTOS;
    }


}
