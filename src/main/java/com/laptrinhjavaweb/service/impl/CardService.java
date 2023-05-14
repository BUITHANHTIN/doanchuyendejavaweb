package com.laptrinhjavaweb.service.impl;

import com.laptrinhjavaweb.builder.BuildingSearchBuilder;
import com.laptrinhjavaweb.constant.SystemConstant;
import com.laptrinhjavaweb.converter.BuildingConverter;
import com.laptrinhjavaweb.dto.BuildingDTO;
import com.laptrinhjavaweb.dto.MyUserDetail;
import com.laptrinhjavaweb.dto.Request.BuildingSearchRequestDTO;
import com.laptrinhjavaweb.entity.BuildingEntity;
import com.laptrinhjavaweb.entity.RoleEntity;
import com.laptrinhjavaweb.entity.UserEntity;
import com.laptrinhjavaweb.repository.BuildingRepository;
import com.laptrinhjavaweb.repository.RentAreaRepository;
import com.laptrinhjavaweb.repository.UserRepository;
import com.laptrinhjavaweb.security.utils.SecurityUtils;
import com.laptrinhjavaweb.service.IBuildingService;
import com.laptrinhjavaweb.service.ICardService;
import com.laptrinhjavaweb.utils.UploadFileUtils;
import javassist.NotFoundException;
import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

@Service
public class CardService implements ICardService {

    @Autowired
    private BuildingRepository buildingRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private BuildingConverter buildingConverter;

    @Override
    @Transactional
    public void save(Long building) {
        BuildingEntity buildingEntity = buildingRepository.findOneById(building);
        MyUserDetail myUserDetail=(MyUserDetail)SecurityContextHolder
                .getContext().getAuthentication().getPrincipal();
        UserEntity userEntity = userRepository.findOneById(myUserDetail.getId());
        if (buildingEntity == null && userEntity == null) {
            try {
                throw new NotFoundException(SystemConstant.BUILDING_NOT_FOUND + " and " + SystemConstant.CUSTOMER_NOT_FOUND);
            } catch (NotFoundException e) {
                e.printStackTrace();
            }
        }
        List<UserEntity> list = new ArrayList<>();
        list.add(userEntity);
        buildingEntity.setCard(list);
        buildingRepository.save(buildingEntity);

    }


}