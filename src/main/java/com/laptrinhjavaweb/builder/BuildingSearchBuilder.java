package com.laptrinhjavaweb.builder;

import com.laptrinhjavaweb.dto.AbstractDTO;

public class BuildingSearchBuilder extends AbstractDTO {
    private String name;
    private Integer floorArea;
    private String district;
    private String ward;
    private String street;
    private Integer numberOfBasement;
    private String direction;// hướng
    private String level;// hạng
    private Integer areaTo;
    private Integer areaFrom;
    private Integer priceTo;
    private Integer priceFrom;
    private String manageName;
    private String manageOfPhone;
    private Long staffInCharge;
    private String[] buildingTypes;
    private String type;
    private Integer bedroom;
    private Integer bathroom;

    public Integer getBedroom() {
        return bedroom;
    }

    public void setBedroom(Integer bedroom) {
        this.bedroom = bedroom;
    }

    public Integer getBathroom() {
        return bathroom;
    }

    public void setBathroom(Integer bathroom) {
        this.bathroom = bathroom;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getFloorArea() {
        return floorArea;
    }

    public void setFloorArea(Integer floorArea) {
        this.floorArea = floorArea;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getWard() {
        return ward;
    }

    public void setWard(String ward) {
        this.ward = ward;
    }

    public String getStreet() {
        return street;
    }

    public void setStreet(String street) {
        this.street = street;
    }

    public Integer getNumberOfBasement() {
        return numberOfBasement;
    }

    public void setNumberOfBasement(Integer numberOfBasement) {
        this.numberOfBasement = numberOfBasement;
    }

    public String getDirection() {
        return direction;
    }

    public void setDirection(String direction) {
        this.direction = direction;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public Integer getAreaTo() {
        return areaTo;
    }

    public void setAreaTo(Integer areaTo) {
        this.areaTo = areaTo;
    }

    public Integer getAreaFrom() {
        return areaFrom;
    }

    public void setAreaFrom(Integer areaFrom) {
        this.areaFrom = areaFrom;
    }

    public Integer getPriceTo() {
        return priceTo;
    }

    public void setPriceTo(Integer priceTo) {
        this.priceTo = priceTo;
    }

    public Integer getPriceFrom() {
        return priceFrom;
    }

    public void setPriceFrom(Integer priceFrom) {
        this.priceFrom = priceFrom;
    }

    public String getManageName() {
        return manageName;
    }

    public void setManageName(String manageName) {
        this.manageName = manageName;
    }

    public String getManageOfPhone() {
        return manageOfPhone;
    }

    public void setManageOfPhone(String manageOfPhone) {
        this.manageOfPhone = manageOfPhone;
    }

    public Long getStaffInCharge() {
        return staffInCharge;
    }

    public void setStaffInCharge(Long staffInCharge) {
        this.staffInCharge = staffInCharge;
    }

    public String[] getBuildingTypes() {
        return buildingTypes;
    }

    public void setBuildingTypes(String[] buildingTypes) {
        this.buildingTypes = buildingTypes;
    }

    public static class BuildingBuilder {
        private String name;
        private Integer floorArea;
        private String district;
        private String ward;
        private String street;
        private Integer numberOfBasement;
        private String direction;// hướng
        private String level;// hạng
        private Integer areaTo;
        private Integer areaFrom;
        private Integer priceTo;
        private Integer priceFrom;
        private String manageName;
        private String manageOfPhone;
        private String staffInCharge;
        private String[] buildingTypes;
        private String type;
        private Integer bedroom;
        private Integer bathroom;

        public BuildingBuilder setBedroom(Integer bedroom) {
            this.bedroom = bedroom;
            return this;
        }

        public BuildingBuilder setBathroom(Integer bathroom) {
            this.bathroom = bathroom;
            return this;
        }


        public BuildingBuilder setName(String name) {
            this.name = name;
            return this;
        }

        public BuildingBuilder setFloorArea(Integer floorArea) {
            this.floorArea = floorArea;
            return this;
        }

        public BuildingBuilder setDistrict(String district) {
            this.district = district;
            return this;
        }

        public BuildingBuilder setWard(String ward) {
            this.ward = ward;
            return this;
        }

        public BuildingBuilder setStreet(String street) {
            this.street = street;
            return this;
        }

        public BuildingBuilder setNumberOfBasement(Integer numberOfBasement) {
            this.numberOfBasement = numberOfBasement;
            return this;
        }

        public BuildingBuilder setDirection(String direction) {
            this.direction = direction;
            return this;
        }

        public BuildingBuilder setLevel(String level) {
            this.level = level;
            return this;
        }

        public BuildingBuilder setAreaTo(Integer areaTo) {
            this.areaTo = areaTo;
            return this;
        }

        public BuildingBuilder setAreaFrom(Integer areaFrom) {
            this.areaFrom = areaFrom;
            return this;
        }

        public BuildingBuilder setPriceTo(Integer priceTo) {
            this.priceTo = priceTo;
            return this;
        }

        public BuildingBuilder setPriceFrom(Integer priceFrom) {
            this.priceFrom = priceFrom;
            return this;
        }

        public BuildingBuilder setManageName(String manageName) {
            this.manageName = manageName;
            return this;
        }

        public BuildingBuilder setManageOfPhone(String manageOfPhone) {
            this.manageOfPhone = manageOfPhone;
            return this;
        }

        public BuildingBuilder setStaffInCharge(String staffInCharge) {
            this.staffInCharge = staffInCharge;
            return this;
        }

        public BuildingBuilder setBuildingTypes(String[] buildingTypes) {
            this.buildingTypes = buildingTypes;
            return this;
        }

        public BuildingBuilder setType(String type) {
            this.type = type;
            return this;
        }


    }

}
