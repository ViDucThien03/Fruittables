package com.spring.controller;

import com.spring.model.Roles;
import com.spring.model.Users;
import com.spring.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@RequestMapping("/user")
@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @GetMapping(value = "/{index}")
    public ModelAndView user(@PathVariable(required = false) Integer index, HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        List<Roles> listRole = userService.getAllRoles();
        mv.addObject("listRole",listRole);
        mv.setViewName("admin/user");
        int count = userService.countUsers();
        int endPage = count / 10;
        if (count % 10 != 0) {
            endPage = endPage + 1;
        }
        request.setAttribute("endPage", endPage);
        if (index != null && index > 0) {
            mv.addObject("paginationUsers", userService.paginationUsers(index));
        } else {
            mv.addObject("paginationUsers", userService.paginationUsers(1));
        }
        return mv;
    }
    @GetMapping("/add")
    public String showAddForm(Model model) {
        model.addAttribute("user", new Users());
        model.addAttribute("roles", userService.getAllRoles());// Initialize a new Users object
        return "admin/add-user"; // Change to your actual view name for adding users
    }

    @PostMapping("/add")
    public String addUser(@ModelAttribute Users user, RedirectAttributes redirectAttributes) {
        try {
            userService.addUser(user);
            redirectAttributes.addFlashAttribute("addMessageSuccess", "Thêm người dùng thành công");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("addMessageFail", "Thêm người dùng thất bại");
        }
        return "redirect:/user/1";
    }

@PostMapping("/updateUserStatus")
public String updateUserStatus(@RequestParam("userId") int userId, @RequestParam("userStatus") String userStatus, RedirectAttributes redirectAttributes) {
    userService.updateUser(userId, userStatus);
    redirectAttributes.addFlashAttribute("updateMessageSuccess", "Cập nhật trạng thái người dùng thành công");
    return "redirect:/user/1";
}
    @PostMapping("/updateRole")
    public String updateRole(@RequestParam("userId") int userId, @RequestParam("roleId") String roleId, RedirectAttributes redirectAttributes) {
        userService.updateRole(userId, roleId);
        redirectAttributes.addFlashAttribute("updateMessageSuccess", "Cập nhật người dùng thành công");
        return "redirect:/user/1";
    }

    @GetMapping("/delete/{id}")
    public String deleteUser(@PathVariable int id, Model model) {
        try {
            userService.deleteUser(id);
            model.addAttribute("deteleMessageSuccess","Xóa thành công");
            return "forward:/user/1"; // Redirect to the first page after deleting
        }catch (DataIntegrityViolationException e){
            model.addAttribute("deteleMessageFail","Không thể xóa");
            return "forward:/user/1";
        }

    }
}
