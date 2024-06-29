package com.spring.controller;


import com.spring.model.Categories;
import com.spring.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;


import org.springframework.boot.actuate.autoconfigure.metrics.MetricsProperties;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;

@Controller
@RequestMapping("/category")
public class CategoryController {

    @Autowired
    private CategoryService categoryService;

    @GetMapping("/{index}")
    public ModelAndView category(@PathVariable(required = false) Integer index, HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("admin/category");
        int count = categoryService.countCategory();
        int endPage = count / 10;
        if (count % 10 != 0) {
            endPage = endPage + 1;
        }
        request.setAttribute("endPage", endPage);
        if (index != null && index > 0) {
            mv.addObject("paginationCategory", categoryService.paginationCategory(index));
        } else {
            mv.addObject("paginationCategory", categoryService.paginationCategory(1));
        }
        return mv;
    }

    @GetMapping("/add")
    public ModelAndView addCategory() {
        ModelAndView mv = new ModelAndView("admin/add-category");
        mv.addObject("category", new Categories());
        return mv;
    }
    @PostMapping("/add")
    public String addCategory(@ModelAttribute("category") Categories category,
                              @RequestParam("file") MultipartFile file,
                              RedirectAttributes redirectAttributes) {
        try {
            if (!file.isEmpty()) {
                String rootPath = System.getProperty("catalina.home");
                String fileName = file.getOriginalFilename();
                File dest = new File(rootPath + File.separator + "assets/user/img/category/" +fileName);

                System.out.println("Saving file to: " + dest.getAbsolutePath());

                if (!dest.getParentFile().exists()) {
                    dest.getParentFile().mkdirs();
                }

                file.transferTo(dest);
                category.setCateImg(fileName);
            }
            categoryService.addCategory(category);
            redirectAttributes.addFlashAttribute("addMessageSuccess", "Thêm thành công");
        } catch (IOException e) {
            redirectAttributes.addFlashAttribute("addMessageFail", "Upload file thất bại: " + e.getMessage());
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("addMessageFail", "Thêm thất bại: " + e.getMessage());
        }
        return "redirect:/category/1";
    }



    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable int id, Model model) {
        Categories categories = categoryService.getCategoryByID(id);
        model.addAttribute("categories", categories);
        return "admin/edit-category"; // Change to your actual view name for editing categories
    }
    @PostMapping("/edit/{id}")
    public String updateCategory(@PathVariable int id, @ModelAttribute("categories") Categories category,
                                 @RequestParam(name = "file", required = false) MultipartFile file,
                                 RedirectAttributes redirectAttributes) {
        try {
            category.setCateId(id); // Đặt lại ID cho đối tượng danh mục

            // Xử lý upload file nếu có
            if (file != null && !file.isEmpty()) {
                String rootPath = System.getProperty("catalina.home");
                String fileName = file.getOriginalFilename();
                File dest = new File(rootPath + File.separator + "assets/user/img/category/" + fileName);

                System.out.println("Saving file to: " + dest.getAbsolutePath());

                if (!dest.getParentFile().exists()) {
                    dest.getParentFile().mkdirs();
                }

                file.transferTo(dest);

                category.setCateImg(fileName); // Lưu tên file vào category
            }

            categoryService.editCategory(category);
            redirectAttributes.addFlashAttribute("updateMessageSuccess", "Cập nhật thành công");
        } catch (IOException e) {
            redirectAttributes.addFlashAttribute("updateMessageFail", "Upload file thất bại: " + e.getMessage());
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("updateMessageFail", "Cập nhật thất bại: " + e.getMessage());
        }
        return "redirect:/category/1";
    }



    @GetMapping("/delete/{id}")
    public String deleteCategory(@PathVariable int id, Model model) {
        try {
            categoryService.deleteCategory(id);
            model.addAttribute("deteleMessageSuccess","Xóa thành công");
            return "forward:/category/1"; // Redirect to the first page after deleting

        } catch (DataIntegrityViolationException e) {
            model.addAttribute("deteleMessageFail", "Không thể xóa");
            return "forward:/category/1";
        }
    }
}
