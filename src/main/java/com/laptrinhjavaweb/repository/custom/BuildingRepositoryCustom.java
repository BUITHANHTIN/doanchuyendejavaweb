package com.laptrinhjavaweb.repository.custom;


import com.laptrinhjavaweb.builder.BuildingSearchBuilder;
import com.laptrinhjavaweb.entity.BuildingEntity;
import org.springframework.data.domain.Pageable;


import java.util.List;

public interface BuildingRepositoryCustom {

    List<BuildingEntity> listAll(Pageable pageable);

    List<BuildingEntity> findByCondition(BuildingSearchBuilder building, Pageable pageable);


    int countTotalItemFindAllBuilding();

    int countTotalItemFindConditionBuilding(BuildingSearchBuilder buildingDTO);


}
