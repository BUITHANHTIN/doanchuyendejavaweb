package com.laptrinhjavaweb.enums;

public enum StatusEnum {
    DANG_XU_LI("Đang xử lí"), CHUA_XU_LI("Chưa xử lí");
    private final String value;

    StatusEnum(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }
}
