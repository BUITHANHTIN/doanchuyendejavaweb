package com.laptrinhjavaweb.builder;

import com.laptrinhjavaweb.dto.AbstractDTO;

public class UserSearchBuilder extends AbstractDTO {
    private String fullName;
    private String phone;
    private String username;
    private Integer status;

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

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

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public static class UserBuilder {
        private String fullName;
        private String phone;
        private String username;
        private Integer status;


        public UserBuilder setFullName(String fullName) {
            this.fullName = fullName;
            return this;
        }


        public UserBuilder setStatus(Integer status) {
            this.status = status;
            return this;
        }

        public UserBuilder setPhone(String phone) {
            this.phone = phone;
            return this;
        }

        public UserBuilder setUsername(String username) {
            this.username = username;
            return this;
        }


    }

}
