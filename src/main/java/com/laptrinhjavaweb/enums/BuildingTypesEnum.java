package com.laptrinhjavaweb.enums;

public enum BuildingTypesEnum {
	TANG_TRET("Tầng trệt"), NGUYEN_CAN("Nguyên căn"), NOI_THAT("Nội thất");
	private final String buildingTypesValue;

	private BuildingTypesEnum(String buildingTypesValue) {
		this.buildingTypesValue = buildingTypesValue;
	}

	public String getBuildingTypesValue() {
		return buildingTypesValue;
	}

}
