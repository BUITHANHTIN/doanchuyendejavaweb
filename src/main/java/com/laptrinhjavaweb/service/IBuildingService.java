package com.laptrinhjavaweb.service;

import com.laptrinhjavaweb.dto.BuildingDTO;
import com.laptrinhjavaweb.dto.Request.BuildingSearchRequestDTO;
import com.laptrinhjavaweb.entity.BuildingEntity;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface IBuildingService {
    List<BuildingDTO> findAll(Pageable pageable);

    List<BuildingDTO> findByCondition(BuildingSearchRequestDTO buildingDTO, Pageable pageable);


    List<BuildingDTO> recentsBuilding();


    List<BuildingDTO> mostRecommendedBuilding();

    BuildingDTO findByBuidingId(Long id);

    void deleteByBuidingId(Long[] ids);

    BuildingDTO saveBuilding(BuildingDTO buildingDTO);


    int countTotalItemFindAllBuilding();

    int countTotalItemFindConditionBuilding(BuildingSearchRequestDTO buildingDTO);

    List<BuildingDTO> findByTop3Building();

    List<BuildingDTO> showAllBuilding();

    BuildingDTO findById(Long id);

    Page<BuildingDTO> findAllPage(Pageable pageable);

    Page<BuildingDTO> findBuildingConditionOfProperty(BuildingSearchRequestDTO buildingDTO, Pageable pageable);


}
