package com.laptrinhjavaweb.service;

import com.laptrinhjavaweb.dto.BuildingDTO;
import com.laptrinhjavaweb.dto.Request.BuildingSearchRequestDTO;
import com.laptrinhjavaweb.dto.RoleDTO;
import com.laptrinhjavaweb.entity.BuildingEntity;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Map;

public interface IBuildingService {
    List<BuildingDTO> findAll(Pageable pageable);

    List<BuildingDTO> findByCondition(BuildingSearchRequestDTO buildingDTO, Pageable pageable);


    BuildingDTO findByBuidingId(Long id);

    void deleteByBuidingId(Long[] ids);

    BuildingDTO saveBuilding(BuildingDTO buildingDTO);


    int countTotalItemFindAllBuilding();

    int countTotalItemFindConditionBuilding(BuildingSearchRequestDTO buildingDTO);
}
