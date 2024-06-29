package com.spring.controller;

import com.spring.model.Products;
import com.spring.service.CategoryServiceImpl;
import com.spring.service.ProductServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@RequestMapping("/product")
@Controller
public class ProductController {
    @Autowired
    public ProductServiceImpl productService;
    @Autowired
    public CategoryServiceImpl categoryService;

    @GetMapping(value = "/{index}")
    public ModelAndView product(@PathVariable(required = false) Integer index, HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("admin/product");
        int count = productService.countProduct();
        int endPage = count / 10;
        if (count % 10 != 0) {
            endPage = endPage + 1;
        }
        request.setAttribute("endPage", endPage);
        if (index != null && index > 0) {
            mv.addObject("paginationProduct", productService.paginationProduct(index));
        } else {
            mv.addObject("paginationProduct", productService.paginationProduct(1));
        }
        return mv;
    }

    @GetMapping(value = "/delete/{id}")
    public ModelAndView deleteProduct(@PathVariable(required = false) Integer id) {

        ModelAndView mv = new ModelAndView();
        try {
            productService.deleteProduct(id);
            mv.setViewName("redirect:/product/1");
        } catch (DataIntegrityViolationException e) {
            mv.addObject("msg", "Cannot delete product with id " + id + " because it has related data in other tables.");
            mv.setViewName("forward:/product/1");
        }
        return mv;
    }

    @GetMapping(value = "/addproduct")
    public ModelAndView addProduct() {
        ModelAndView mv = new ModelAndView();
        Products product = new Products();
        mv.setViewName("admin/addproduct");
        mv.addObject("product", product);
        mv.addObject("category", categoryService.getCategories());
        return mv;
    }

    @PostMapping(value = "/addproduct")
    public ModelAndView addProduct(@ModelAttribute("product") Products product,
                                   @RequestParam("productImage") MultipartFile file) {
        if (!file.isEmpty()) {
            try {
                // Đường dẫn tới thư mục lưu trữ ảnh
                String uploadDir = System.getProperty("catalina.home") + File.separator + "assets/user/img/products";
                File dir = new File(uploadDir);
                if (!dir.exists()) dir.mkdirs();

                // Lưu trữ tập tin
                String fileName = file.getOriginalFilename();
                File uploadFile = new File(dir, fileName);
                try (BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(uploadFile))) {
                    stream.write(file.getBytes());
                }
                product.setProductImg(fileName); // Lưu tên tập tin vào database
            } catch (Exception e) {
                e.printStackTrace();
                return new ModelAndView("admin/addproduct", "message", "Image upload failed");
            }
        }
        productService.addProduct(product);
        return new ModelAndView("redirect:/product/1");
    }

    @GetMapping(value = "/updateProduct")
    public ModelAndView update(@RequestParam("productId") int productId) {
        ModelAndView mv = new ModelAndView();
        Products product = productService.getProductById(productId);
        mv.setViewName("admin/edit-product");
        mv.addObject("product", product);
        mv.addObject("category", categoryService.getCategories());
        return mv;
    }

    @PostMapping(value = "/updateProduct")
    public ModelAndView updateProduct(@ModelAttribute("product") Products product,
                                      @RequestParam(value = "productImage", required = false) MultipartFile file) {
        if (file != null && !file.isEmpty()) {
            try {
                // Đường dẫn tới thư mục lưu trữ ảnh
                String uploadDir = System.getProperty("catalina.home") + File.separator + "assets/user/img/products";
                File dir = new File(uploadDir);
                if (!dir.exists()) {
                    dir.mkdirs();
                }

                // Lưu trữ tập tin mới
                String fileName = file.getOriginalFilename();
                File uploadFile = new File(dir, fileName);
                try (BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(uploadFile))) {
                    stream.write(file.getBytes());
                }
                product.setProductImg(fileName); // Cập nhật tên tập tin mới vào database
            } catch (Exception e) {
                e.printStackTrace();
                return new ModelAndView("admin/edit-product", "message", "Image upload failed");
            }
        }

        // Thực hiện cập nhật thông tin sản phẩm
        productService.updateProduct(product);
        return new ModelAndView("redirect:/product/1");
    }

    @GetMapping(value = "/bestSeller")
    public ModelAndView showBestSellerProduct(){
        ModelAndView mv = new ModelAndView();
        List<Products> list = productService.showBestSellerProduct();
        mv.addObject("list",list);
        mv.setViewName("admin/bestseller");
        return mv;
    }
    @GetMapping(value = "/poorlySeller")
    public ModelAndView showPoorlySellerProduct(){
        ModelAndView mv = new ModelAndView();
        List<Products> list = productService.showPoorlyProduct();
        mv.addObject("list",list);
        mv.setViewName("admin/poorlyseller");
        return mv;
    }
    @PostMapping("/updateSale")
    public String updateSale(@RequestParam("productId") int productId, @RequestParam("sale") double sale){
        productService.updateSale(productId, sale);
        return "redirect:/product/1";
    }
}
