package com.laptrinhjavaweb.dto.Request;

public class AssignmentBuildingRequestDTO {
    Long[] staffId;
    Long buildingId;

    public Long[] getStaffId() {
        return staffId;
    }

    public void setStaffId(Long[] userId) {
        this.staffId = userId;
    }

    public Long getBuildingId() {
        return buildingId;
    }

    public void setBuildingId(Long buildingId) {
        this.buildingId = buildingId;
    }
}
