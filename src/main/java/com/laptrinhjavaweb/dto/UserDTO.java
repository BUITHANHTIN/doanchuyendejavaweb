package com.laptrinhjavaweb.dto;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class UserDTO extends AbstractDTO {

    private String userName;
    private String fullName;
    private String password;
    private Integer status;
    private List<RoleDTO> roles = new ArrayList<>();
    private String roleName;
    private String roleCode;
    private String phone;

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    private Map<String,String> roleDTOs = new HashMap<>();

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public List<RoleDTO> getRoles() {
        return roles;
    }

    public void setRoles(List<RoleDTO> roles) {
        this.roles = roles;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public String getRoleCode() {
        return roleCode;
    }

    public void setRoleCode(String roleCode) {
        this.roleCode = roleCode;
    }

    public Map<String, String> getRoleDTOs() {
        return roleDTOs;
    }

    public void setRoleDTOs(Map<String, String> roleDTOs) {
        this.roleDTOs = roleDTOs;
    }

    @Override
    public String toString() {
        return "UserDTO{" +
                "userName='" + userName + '\'' +
                ", fullName='" + fullName + '\'' +
                ", password='" + password + '\'' +
                ", status=" + status +
                ", roles=" + roles +
                ", roleName='" + roleName + '\'' +
                ", roleCode='" + roleCode + '\'' +
                ", roleDTOs=" + roleDTOs +
                '}';
    }
}
