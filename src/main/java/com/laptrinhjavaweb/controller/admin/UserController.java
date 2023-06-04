package com.laptrinhjavaweb.controller.admin;

import com.laptrinhjavaweb.constant.SystemConstant;
import com.laptrinhjavaweb.dto.CustomerDTO;
import com.laptrinhjavaweb.dto.Request.CustomerSearchRequestDTO;
import com.laptrinhjavaweb.dto.Request.UserSearchRequestDTO;
import com.laptrinhjavaweb.dto.UserDTO;
import com.laptrinhjavaweb.security.utils.SecurityUtils;
import com.laptrinhjavaweb.service.IUserService;
import com.laptrinhjavaweb.service.impl.RoleService;
import com.laptrinhjavaweb.service.impl.UserService;
import com.laptrinhjavaweb.utils.DisplayTagUtils;
import com.laptrinhjavaweb.utils.MessageUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller(value = "usersControllerOfAdmin")
public class UserController {

    @Autowired
    private IUserService userService;

    @Autowired
    private RoleService roleService;

    @Autowired
    private MessageUtils messageUtil;

    @RequestMapping(value = "/admin/user-list", method = RequestMethod.GET)
    public ModelAndView customerList(@ModelAttribute("modelSearch") UserSearchRequestDTO userDTO, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/user/list");

        //paging
        DisplayTagUtils.of(request, userDTO);
        List<UserDTO> userDTOList = null;
        int countTotalItem = 0;
        if (userDTO.getSearchValue() != null) {
            userDTOList = userService.findByCondition(userDTO, new PageRequest(userDTO.getPage() - 1, userDTO.getMaxPageItems()));
            countTotalItem = userService.countTotalItemFindConditionUser(userDTO);
        } else {
            userDTOList = userService.findAll(new PageRequest(userDTO.getPage() - 1, userDTO.getMaxPageItems()));
            countTotalItem = userService.countTotalItemFindAllUser();
        }
        userDTO.setListResult(userDTOList);
        userDTO.setTotalItems(countTotalItem);

        mav.addObject("modelSearch", userDTO);


        return mav;
    }

    @RequestMapping(value = "/admin/user-edit", method = RequestMethod.GET)
    public ModelAndView customerEdit(@RequestParam(name = "id") Long id) {
        ModelAndView mav = new ModelAndView("admin/user/edit");
        mav.addObject("user", userService.findUserById(id));
        return mav;
    }

    @RequestMapping(value = "/admin/user-add", method = RequestMethod.GET)
    public ModelAndView userAdd() {
        ModelAndView mav = new ModelAndView("admin/user/edit");
        mav.addObject("user", null);
        return mav;
    }

    @RequestMapping(value = "/admin/profile-password", method = RequestMethod.GET)
    public ModelAndView updatePassword(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/user/password");
        UserDTO model = userService.findOneByUserName(SecurityUtils.getPrincipal().getUsername());
        initMessageResponse(mav, request);
        mav.addObject(SystemConstant.MODEL, model);
        return mav;
    }

    private void initMessageResponse(ModelAndView mav, HttpServletRequest request) {
        String message = request.getParameter("message");
        if (message != null && StringUtils.isNotEmpty(message)) {
            Map<String, String> messageMap = messageUtil.getMessage(message);
            mav.addObject(SystemConstant.ALERT, messageMap.get(SystemConstant.ALERT));
            mav.addObject(SystemConstant.MESSAGE_RESPONSE, messageMap.get(SystemConstant.MESSAGE_RESPONSE));
        }
    }

   /* @RequestMapping(value = "/admin/user-edit", method = RequestMethod.GET)
    public ModelAndView addUser(@ModelAttribute(SystemConstant.MODEL) UserDTO model, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/user/edit");
        model.setRoleDTOs(roleService.getRoles());
        initMessageResponse(mav, request);
        mav.addObject(SystemConstant.MODEL, model);
        return mav;
    }

    @RequestMapping(value = "/admin/profile-{username}", method = RequestMethod.GET)
    public ModelAndView updateProfile(@PathVariable("username") String username, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/user/profile");
        UserDTO model = userService.findOneByUserName(username);
        initMessageResponse(mav, request);
        model.setRoleDTOs(roleService.getRoles());
        mav.addObject(SystemConstant.MODEL, model);
        return mav;
    }

    @RequestMapping(value = "/admin/user-edit-{id}", method = RequestMethod.GET)
    public ModelAndView updateUser(@PathVariable("id") Long id, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/user/edit");
        UserDTO model = userService.findUserById(id);
        model.setRoleDTOs(roleService.getRoles());
        initMessageResponse(mav, request);
        mav.addObject(SystemConstant.MODEL, model);
        return mav;
    }

    @RequestMapping(value = "/admin/profile-password", method = RequestMethod.GET)
    public ModelAndView updatePassword(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/user/password");
        UserDTO model = userService.findOneByUserName(SecurityUtils.getPrincipal().getUsername());
        initMessageResponse(mav, request);
        mav.addObject(SystemConstant.MODEL, model);
        return mav;
    }

    private void initMessageResponse(ModelAndView mav, HttpServletRequest request) {
        String message = request.getParameter("message");
        if (message != null && StringUtils.isNotEmpty(message)) {
            Map<String, String> messageMap = messageUtil.getMessage(message);
            mav.addObject(SystemConstant.ALERT, messageMap.get(SystemConstant.ALERT));
            mav.addObject(SystemConstant.MESSAGE_RESPONSE, messageMap.get(SystemConstant.MESSAGE_RESPONSE));
        }
    }*/
}
