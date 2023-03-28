package com.laptrinhjavaweb.service;

import com.laptrinhjavaweb.dto.BuildingDTO;
import com.laptrinhjavaweb.dto.Request.BuildingSearchRequestDTO;
import com.laptrinhjavaweb.dto.Response.TypeBuildingResponseDTO;

import java.util.List;
import java.util.Map;

public interface ITypeBuildingService {
    List<TypeBuildingResponseDTO> listTypes(BuildingSearchRequestDTO buildingDTO);
    Map<String,String> getTypeMap();
}
