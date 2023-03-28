package com.laptrinhjavaweb.service.impl;

import com.laptrinhjavaweb.dto.BuildingDTO;
import com.laptrinhjavaweb.dto.Request.BuildingSearchRequestDTO;
import com.laptrinhjavaweb.dto.Response.TypeBuildingResponseDTO;
import com.laptrinhjavaweb.enums.BuildingTypesEnum;
import com.laptrinhjavaweb.enums.DistrictsEnum;
import com.laptrinhjavaweb.service.ITypeBuildingService;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class TypeBuildingService implements ITypeBuildingService {

    public boolean checkExit(String type, String types[]) {
        for (String str : types) {
            if (type.equals(str)) {
                return true;
            }
        }
        return false;
    }

    @Override
    public List<TypeBuildingResponseDTO> listTypes(BuildingSearchRequestDTO buildingDTO) {
        List<TypeBuildingResponseDTO> list = new ArrayList<>();
        TypeBuildingResponseDTO districtResponseDTO = null;
        BuildingTypesEnum[] buildingTypes = BuildingTypesEnum.values();
        for (BuildingTypesEnum type : buildingTypes) {
            districtResponseDTO = new TypeBuildingResponseDTO();
            districtResponseDTO.setName(type.getBuildingTypesValue());
            districtResponseDTO.setCode(type.name());
            if (buildingDTO != null) {
                if (buildingDTO.getBuildingTypes() != null) {
                    if (buildingDTO.getType() == null) {
                        buildingDTO.setType(String.join(",", buildingDTO.getBuildingTypes()));
                    }
                    districtResponseDTO.setSelected(checkExit(type.name(), buildingDTO.getBuildingTypes()) ? "checked" : "");

                }
            }
            list.add(districtResponseDTO);
        }
        return list;
    }

    @Override
    public Map<String, String> getTypeMap() {
        Map<String, String> map = new HashMap<>();
        BuildingTypesEnum[] typesEnums = BuildingTypesEnum.values();
        for (BuildingTypesEnum typesEnum : typesEnums) {
            map.put(typesEnum.name(), typesEnum.getBuildingTypesValue());
        }
        return map;
    }


}
