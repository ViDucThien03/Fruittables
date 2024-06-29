package com.spring.controller;

import com.spring.model.Supplier;
import com.spring.service.SupplierService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/supplier")
public class SupplierController {

    @Autowired
    private SupplierService supplierService;

    @GetMapping("/{index}")
    public ModelAndView listSuppliers(@PathVariable(required = false) Integer index, HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("admin/supplier");
        int count = supplierService.countSupplier();
        int endPage = count / 10;
        if (count % 10 != 0) {
            endPage = endPage + 1;
        }
        request.setAttribute("endPage", endPage);
        if (index != null && index > 0) {
            mv.addObject("paginationSupplier", supplierService.paginationSupplier(index));
        } else {
            mv.addObject("paginationSupplier", supplierService.paginationSupplier(1));
        }
        return mv;
    }
    @GetMapping("/add")
    public String showAddSupplierForm(Model model) {
        model.addAttribute("supplier", new Supplier());
        return "admin/add-supplier";
    }

    @PostMapping("/add")
    public String addSupplier(@ModelAttribute("supplier") Supplier supplier, RedirectAttributes redirectAttributes) {
        try {
            supplierService.addSupplier(supplier);
            redirectAttributes.addFlashAttribute("addMessageSuccess", "Thêm nhà cung cấp thành công");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("addMessageFail", "Thêm nhà cung cấp thất bại");
        }
        return "redirect:/supplier/1";
    }

    @GetMapping("/edit/{id}")
    public String showEditSupplierForm(@PathVariable("id") int id, Model model) {
        Supplier supplier = supplierService.getSupplierById(id);
        model.addAttribute("supplier", supplier);
        return "admin/edit-supplier";
    }

    @PostMapping("/edit/{id}")
    public String updateSupplier(@PathVariable("id") int id, @ModelAttribute("supplier") Supplier supplier,
                                 RedirectAttributes redirectAttributes) {
        try {
            supplier.setId(id);
            supplierService.updateSupplier(supplier);
            redirectAttributes.addFlashAttribute("updateMessageSuccess", "Cập nhật nhà cung cấp thành công");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("updateMessageFail", "Cập nhật nhà cung cấp thất bại");
        }
        return "redirect:/supplier/1";
    }

    @GetMapping("/delete/{id}")
    public String deleteSupplier(@PathVariable("id") int id, RedirectAttributes redirectAttributes) {
        try {
            supplierService.deleteSupplier(id);
            redirectAttributes.addFlashAttribute("deleteMessageSuccess", "Xóa nhà cung cấp thành công");
        } catch (DataIntegrityViolationException e) {
            redirectAttributes.addFlashAttribute("deleteMessageFail", "Không thể xóa nhà cung cấp");
        }
        return "redirect:/supplier/1";
    }
}
