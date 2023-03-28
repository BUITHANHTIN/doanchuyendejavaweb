package com.laptrinhjavaweb.dto.Request;

public class AssignmentCustomerRequestDTO {
    Long[] staffId;
    Long customerId;

    public Long[] getStaffId() {
        return staffId;
    }

    public void setStaffId(Long[] staffId) {
        this.staffId = staffId;
    }

    public Long getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Long customerId) {
        this.customerId = customerId;
    }
}
