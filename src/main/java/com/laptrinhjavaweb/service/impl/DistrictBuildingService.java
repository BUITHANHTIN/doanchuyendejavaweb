package com.laptrinhjavaweb.service.impl;

import com.laptrinhjavaweb.dto.Request.BuildingSearchRequestDTO;
import com.laptrinhjavaweb.dto.Response.TypeBuildingResponseDTO;
import com.laptrinhjavaweb.enums.BuildingTypesEnum;
import com.laptrinhjavaweb.enums.DistrictsEnum;
import com.laptrinhjavaweb.service.IDistrictBuildingService;
import com.laptrinhjavaweb.service.ITypeBuildingService;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class DistrictBuildingService implements IDistrictBuildingService {


    @Override
    public Map<String, String> getDistrictMap() {

        Map<String, String> map = new TreeMap<String, String>();
        DistrictsEnum[] districtTypes = DistrictsEnum.values();
        for (DistrictsEnum districtsEnum : districtTypes) {
            map.put(districtsEnum.name(), districtsEnum.getDistricValue());
        }

        return map;
    }
}
