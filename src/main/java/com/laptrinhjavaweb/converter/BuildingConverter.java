package com.laptrinhjavaweb.converter;

import com.laptrinhjavaweb.builder.BuildingSearchBuilder;
import com.laptrinhjavaweb.dto.BuildingDTO;
import com.laptrinhjavaweb.dto.Request.BuildingSearchRequestDTO;
import com.laptrinhjavaweb.entity.BuildingEntity;
import com.laptrinhjavaweb.entity.RentAreaEntity;
import com.laptrinhjavaweb.enums.BuildingTypesEnum;
import com.laptrinhjavaweb.enums.DistrictsEnum;
import com.laptrinhjavaweb.repository.BuildingRepository;
import com.laptrinhjavaweb.utils.ObjectUtils;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Component
public class BuildingConverter {

    @Autowired
    private ModelMapper modelMapper;
    @Autowired
    private BuildingRepository buildingRepository;

    public BuildingSearchBuilder convertToBuilder(BuildingSearchRequestDTO dto) {
        BuildingSearchBuilder builder = modelMapper.map(dto, BuildingSearchBuilder.class);
        if (dto.getBuildingTypes() != null) {
            builder.setType(String.join(",", dto.getBuildingTypes()));
        }

        return builder;
    }

    public Page<BuildingDTO> convertToPageDtoOfProperty(List<BuildingEntity> buildingDTO, Pageable pageable) {

        int start = pageable.getPageNumber() * pageable.getPageSize();
        int end = Math.min((start + pageable.getPageSize()), buildingDTO.size());

        List<BuildingDTO> buildingDTOList = buildingDTO.stream()
                .map(buildingEntity -> modelMapper.map(buildingEntity, BuildingDTO.class))
                .collect(Collectors.toList()).subList(start,end);
        return new PageImpl<>(buildingDTOList, pageable, buildingDTO.size());
    }

    public Page<BuildingDTO> convertToPageDTO(Page<BuildingEntity> entities) {

        List<BuildingDTO> buildingDTOList = entities.getContent().stream()
                .map(buildingEntity -> modelMapper.map(buildingEntity, BuildingDTO.class))
                .collect(Collectors.toList());
        return new PageImpl<>(buildingDTOList, entities.getPageable(), entities.getTotalElements());
    }

    public BuildingDTO convertToDto(BuildingEntity entity) {
        BuildingDTO dto = modelMapper.map(entity, BuildingDTO.class);
        List<String> rentAreaList = new ArrayList<>();
        for (RentAreaEntity entity1 : entity.getRentAreas()) {
            rentAreaList.add(entity1.getValue().toString());
        }
        dto.setRentArea(String.join(",", rentAreaList));
        dto.setAddress(entity.getStreet() + "-" + entity.getWard() + "-" + convertToDistrictName(entity.getDistrict()));
        dto.setType(String.join(",", convertToTypeName(entity)));
        if (entity.getType() != null) {
            dto.setBuildingTypes(entity.getType().split(","));
        }
        return dto;
    }

    public BuildingEntity convertToEntity(BuildingDTO dto) {
        BuildingEntity entity = modelMapper.map(dto, BuildingEntity.class);
        String[] rentAreas = dto.getRentArea().split(",");
        List<RentAreaEntity> rentAreaEntityList = new ArrayList<>();
        if (!rentAreas[0].equals("")) {
            for (String str : rentAreas) {
                RentAreaEntity rentAreaEntity = new RentAreaEntity();
                rentAreaEntity.setValue(Integer.parseInt(str));
                rentAreaEntity.setBuilding(entity);
                rentAreaEntityList.add(rentAreaEntity);
            }
        }
        if (dto.getId() != null) {
            entity.setUsers(buildingRepository.findOneById(dto.getId()).getUsers());
        }
        entity.setRentAreas(rentAreaEntityList);
        entity.setType(String.join(",", dto.getBuildingTypes()));
        return entity;
    }

    public BuildingSearchRequestDTO convertToBuildingSearch(BuildingDTO dto) {
        return dto == null ? null : modelMapper.map(dto, BuildingSearchRequestDTO.class);
    }

    public String convertToDistrictName(String district) {
        String re = "";
        String districtCode = ObjectUtils.getObject(district, String.class);
        if (districtCode != null && !districtCode.equals("")) {
            re = DistrictsEnum.valueOf(district).getDistricValue();
        }
        return re;
    }

    public List<String> convertToTypeName(BuildingEntity entity) {
        List<String> list = new ArrayList<>();
        if (!entity.getType().equals("")) {
            String[] types = entity.getType().split(",");
            for (String type : types) {
                list.add(BuildingTypesEnum.valueOf(type).getBuildingTypesValue());
            }
        }
        return list;

    }


}
