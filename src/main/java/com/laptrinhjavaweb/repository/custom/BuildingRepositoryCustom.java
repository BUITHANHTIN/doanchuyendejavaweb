package com.laptrinhjavaweb.repository.custom;


import com.laptrinhjavaweb.builder.BuildingSearchBuilder;
import com.laptrinhjavaweb.entity.BuildingEntity;
import com.laptrinhjavaweb.entity.CustomerEntity;
import org.springframework.data.domain.Pageable;


import java.util.List;

public interface BuildingRepositoryCustom {

    List<BuildingEntity> listAll(Pageable pageable);

    List<BuildingEntity> findByCondition(BuildingSearchBuilder building, Pageable pageable);

    List<BuildingEntity> findByConditionOfProperty(BuildingSearchBuilder building);
    int countTotalItemFindAllBuilding();

    int countTotalItemFindConditionBuilding(BuildingSearchBuilder buildingDTO);

    List<BuildingEntity> findByTop3Building();


    List<BuildingEntity> recentsBuilding();

    List<BuildingEntity> mostRecommendedBuilding();

    List<BuildingEntity> showAllBuilding();

    List<BuildingEntity> countBuildingTypeNOITHAT();
    List<BuildingEntity> countBuildingTypeTANGTRET();
    List<BuildingEntity> countBuildingTypeNGUYENCAN();


}
