package com.laptrinhjavaweb.repository;

import com.laptrinhjavaweb.repository.custom.BuildingRepositoryCustom;
import com.laptrinhjavaweb.entity.BuildingEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BuildingRepository extends JpaRepository<BuildingEntity, Long>, BuildingRepositoryCustom {
    void deleteById(Long id);

    BuildingEntity findOneById(Long id);

    void deleteByIdIn(Long[] buildingId);

    Long countByIdIn(Long[] id);

    Page<BuildingEntity> findAll(Pageable pageable);

}
