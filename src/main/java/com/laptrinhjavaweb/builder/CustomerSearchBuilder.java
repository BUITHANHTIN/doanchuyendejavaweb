package com.laptrinhjavaweb.builder;

import com.laptrinhjavaweb.dto.AbstractDTO;

public class CustomerSearchBuilder extends AbstractDTO {
    private String fullName;
    private String phone;
    private String email;
    private Long staffId;


    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Long getStaffId() {
        return staffId;
    }

    public void setStaffId(Long staffId) {
        this.staffId = staffId;
    }

    public static class BuildingBuilder {
        private String fullName;
        private String phone;
        private String email;
        private Long staffId;


        public BuildingBuilder setFullName(String fullName) {
            this.fullName = fullName;
            return this;
        }


        public BuildingBuilder setPhone(String phone) {
            this.phone = phone;
            return this;
        }

        public BuildingBuilder setEmail(String email) {
            this.email = email;
            return this;
        }

        public BuildingBuilder setStaffId(Long staffId) {
            this.staffId = staffId;
            return this;
        }


    }

}
