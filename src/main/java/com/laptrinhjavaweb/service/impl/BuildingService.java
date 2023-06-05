package com.laptrinhjavaweb.service.impl;

import com.laptrinhjavaweb.builder.BuildingSearchBuilder;
import com.laptrinhjavaweb.constant.SystemConstant;
import com.laptrinhjavaweb.converter.BuildingConverter;
import com.laptrinhjavaweb.dto.BuildingDTO;
import com.laptrinhjavaweb.dto.Request.BuildingSearchRequestDTO;
import com.laptrinhjavaweb.entity.BuildingEntity;
import com.laptrinhjavaweb.entity.RoleEntity;
import com.laptrinhjavaweb.entity.UserEntity;
import com.laptrinhjavaweb.repository.BuildingRepository;
import com.laptrinhjavaweb.repository.RentAreaRepository;
import com.laptrinhjavaweb.repository.UserRepository;
import com.laptrinhjavaweb.security.utils.SecurityUtils;
import com.laptrinhjavaweb.service.IBuildingService;
import com.laptrinhjavaweb.utils.UploadFileUtils;
import javassist.NotFoundException;
import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

@Service
public class BuildingService implements IBuildingService {

    @Autowired
    private BuildingRepository buildingRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private UploadFileUtils uploadFileUtils;

    @Autowired
    private BuildingConverter buildingConverter;

    @Override
    public List<BuildingDTO> findAll(Pageable pageable) {
        List<BuildingEntity> buildingEntityList = null;
        UserEntity userEntity = userRepository.findOneById(SecurityUtils.getPrincipal().getId());
        boolean checkIsManager = isManager(userEntity.getRoles());
        if (checkIsManager) {
            buildingEntityList = buildingRepository.listAll(pageable);
        } else {
            buildingEntityList = userEntity.getBuildings();
        }
        List<BuildingDTO> buildingDTOList = new ArrayList<>();
        for (BuildingEntity entity : buildingEntityList) {
            BuildingDTO buildingDTO = buildingConverter.convertToDto(entity);
            buildingDTOList.add(buildingDTO);
        }
        return buildingDTOList;

    }


    public boolean isManager(List<RoleEntity> list) {
        for (RoleEntity entity : list) {
            if (entity.getCode().equals(SystemConstant.MANAGER)) {
                return true;
            }
        }
        return false;

    }

    @Override
    public List<BuildingDTO> findByCondition(BuildingSearchRequestDTO buildingDTO, Pageable pageable) {
        BuildingSearchBuilder searchBuilder = buildingConverter.convertToBuilder(buildingDTO);
        List<BuildingDTO> buildingDTOList = new ArrayList<>();
        UserEntity userEntity = userRepository.findOneById(SecurityUtils.getPrincipal().getId());
        boolean checkIsManager = isManager(userEntity.getRoles());
        if (!checkIsManager) {
            searchBuilder.setStaffInCharge(userEntity.getId());
        }
        List<BuildingEntity> buildingEntityList = buildingRepository.findByCondition(searchBuilder, pageable);
        ;
        for (BuildingEntity entity : buildingEntityList) {
            BuildingDTO building = buildingConverter.convertToDto(entity);
            buildingDTOList.add(building);
        }
        return buildingDTOList;
    }

    @Override
    @Transactional
    public BuildingDTO saveBuilding(BuildingDTO buildingDTO) {
        BuildingEntity buildingEntity = buildingConverter.convertToEntity(buildingDTO);
        saveThumbnail(buildingDTO, buildingEntity);
        buildingRepository.save(buildingEntity);
        return buildingDTO;
    }

    @Override
    public int countTotalItemFindAllBuilding() {
        UserEntity userEntity = userRepository.findOneById(SecurityUtils.getPrincipal().getId());
        boolean checkIsManager = isManager(userEntity.getRoles());
        int countBuilding = 0;
        if (checkIsManager) {
            countBuilding = buildingRepository.countTotalItemFindAllBuilding();
        } else {
            countBuilding = userEntity.getBuildings().size();
        }
        return countBuilding;

    }


    @Override
    public int countTotalItemFindConditionBuilding(BuildingSearchRequestDTO buildingDTO) {
        BuildingSearchBuilder searchBuilder = buildingConverter.convertToBuilder(buildingDTO);
        UserEntity userEntity = userRepository.findOneById(SecurityUtils.getPrincipal().getId());
        boolean checkIsManager = isManager(userEntity.getRoles());
        if (!checkIsManager) {
            searchBuilder.setStaffInCharge(userEntity.getId());
        }
        return buildingRepository.countTotalItemFindConditionBuilding(searchBuilder);
    }

    @Override
    public List<BuildingDTO> findByTop3Building() {
        List<BuildingDTO> buildingDTOS = new ArrayList<>();
        List<BuildingEntity> buildingEntities = buildingRepository.findByTop3Building();
        for (BuildingEntity entity : buildingEntities) {

            buildingDTOS.add(buildingConverter.convertToDto(entity));
        }
        return buildingDTOS;

    }

    @Override
    public List<BuildingDTO> showAllBuilding() {
        List<BuildingDTO> buildingDTOS = new ArrayList<>();
        List<BuildingEntity> buildingEntities = buildingRepository.showAllBuilding();
        for (BuildingEntity entity : buildingEntities) {

            buildingDTOS.add(buildingConverter.convertToDto(entity));
        }
        return buildingDTOS;
    }

    @Override
    public BuildingDTO findById(Long id) {
        BuildingEntity buildingEntity = buildingRepository.findOneById(id);

        return buildingConverter.convertToDto(buildingEntity);
    }


    @Override
    public Page<BuildingDTO> findAllPage(Pageable pageable) {
        return buildingConverter.convertToPageDTO(buildingRepository.findAll(pageable));
    }

    @Override
    public Page<BuildingDTO> findBuildingConditionOfProperty(BuildingSearchRequestDTO buildingDTO, Pageable pageable) {
        BuildingSearchBuilder searchBuilder = buildingConverter.convertToBuilder(buildingDTO);
        List<BuildingEntity> buildingEntityList = buildingRepository.findByConditionOfProperty(searchBuilder);
        return buildingConverter.convertToPageDtoOfProperty(buildingEntityList, pageable);
    }


    @Override
    public List<BuildingDTO> recentsBuilding() {
        List<BuildingDTO> buildingDTOS = new ArrayList<>();
        List<BuildingEntity> buildingEntities = buildingRepository.recentsBuilding();
        for (BuildingEntity entity : buildingEntities) {

            buildingDTOS.add(buildingConverter.convertToDto(entity));
        }
        return buildingDTOS;

    }

    @Override
    public List<BuildingDTO> mostRecommendedBuilding() {
        List<BuildingDTO> buildingDTOS = new ArrayList<>();
        List<BuildingEntity> buildingEntities = buildingRepository.mostRecommendedBuilding();
        for (BuildingEntity entity : buildingEntities) {

            buildingDTOS.add(buildingConverter.convertToDto(entity));
        }
        return buildingDTOS;

    }

    @Override
    public BuildingDTO findByBuidingId(Long id) {
        BuildingEntity entity = buildingRepository.findOneById(id);
        BuildingDTO dto = buildingConverter.convertToDto(entity);
        return dto;
    }


    @Override
    @Transactional
    public void deleteByBuidingId(Long[] ids) {
        if (ids.length > 0) {
            Long count = buildingRepository.countByIdIn(ids);
            if (count != ids.length) {
                try {
                    throw new NotFoundException(SystemConstant.BUILDING_NOT_FOUND);
                } catch (NotFoundException e) {
                    e.printStackTrace();
                }
            }

            buildingRepository.deleteByIdIn(ids);
        }

    }

    private void saveThumbnail(BuildingDTO buildingDTO, BuildingEntity buildingEntity) {
        String path = "/building/" + buildingDTO.getImageName();
        if (null != buildingDTO.getImageBase64()) {
            if (null != buildingEntity.getAvatar()) {
                if (!path.equals(buildingEntity.getAvatar())) {
                    File file = new File("C://home/office" + buildingEntity.getAvatar());
                    file.delete();
                }
            }
            byte[] bytes = Base64.decodeBase64(buildingDTO.getImageBase64().getBytes());
            uploadFileUtils.writeOrUpdate(path, bytes);
            buildingEntity.setAvatar(path);
        }
    }

}
