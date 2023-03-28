package com.laptrinhjavaweb.enums;

public enum AssignmentCustomerEnum {
    QUA_TRINH_CSKH("QUÁ TRÌNH CSKH"), DAN_DI_XEM("DẪN ĐI XEM");
    private final String value;

    AssignmentCustomerEnum(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }
}
