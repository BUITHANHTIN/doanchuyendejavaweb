package com.laptrinhjavaweb.enums;

public enum DistrictsEnum {
	QUAN_1("Quận 1"), QUAN_2("Quận 2"), QUAN_3("Quận 3"), QUAN_4("Quận 4");
	private final String districValue;

	private DistrictsEnum(String districValue) {
		this.districValue = districValue;
	}

	public String getDistricValue() {
		return districValue;
	}


}
