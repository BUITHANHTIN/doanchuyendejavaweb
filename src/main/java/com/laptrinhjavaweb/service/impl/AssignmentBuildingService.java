package com.laptrinhjavaweb.service.impl;

import com.laptrinhjavaweb.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.laptrinhjavaweb.dto.Request.AssignmentBuildingRequestDTO;
import com.laptrinhjavaweb.entity.BuildingEntity;
import com.laptrinhjavaweb.entity.UserEntity;
import com.laptrinhjavaweb.repository.BuildingRepository;
import com.laptrinhjavaweb.service.IAssignmentBuildingService;

import java.util.ArrayList;
import java.util.List;

@Service
public class AssignmentBuildingService implements IAssignmentBuildingService {

    @Autowired
    private BuildingRepository buildingRepository;
    @Autowired
    private UserRepository userRepository;

    @Transactional
    public void updateAssignmentBuilding(AssignmentBuildingRequestDTO assignmentBuildingRequestDTO) {
        BuildingEntity buildingEntity = buildingRepository.findOneById(assignmentBuildingRequestDTO.getBuildingId());
        buildingEntity.setUsers(userRepository.findByIdIn(assignmentBuildingRequestDTO.getStaffId()));
        buildingRepository.save(buildingEntity);
    }
}
