package com.codegym.controller;


import com.codegym.model.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.codegym.service.ProductService;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


@Controller
public class ProductController {
    @Autowired
    public ProductService productService;

    @GetMapping("/products")
    public ModelAndView list() {
        List<Product> products = this.productService.findAll();
        ModelAndView modelAndView = new ModelAndView("list");
        modelAndView.addObject("product", products);
        return modelAndView;
    }

    @GetMapping("/create")
    public ModelAndView showCreate() {
        ModelAndView modelAndView = new ModelAndView("create");
        modelAndView.addObject("product", new Product());
        return modelAndView;
    }

    @PostMapping("/create")
    public ModelAndView create(
            @ModelAttribute("product") Product product
    ) {
        int id = (int) (Math.random() * 100);
        product.setId(id);
        this.productService.save(product);
        ModelAndView modelAndView = new ModelAndView("create");
        modelAndView.addObject("product", new Product());
        modelAndView.addObject("message", "Successfully Created");
        return modelAndView;
    }

    @GetMapping("/edit")
    public ModelAndView showEdit(
            @RequestParam("id") Integer productId
    ) {
        Product product = this.productService.findById(productId);
        ModelAndView modelAndView;
        if (product == null) {
            modelAndView = new ModelAndView("error");
        } else {
            modelAndView = new ModelAndView("edit");
            modelAndView.addObject("product", product);
        }
        return modelAndView;
    }

    @PostMapping("/edit")
    public ModelAndView edit(
            @ModelAttribute("x1") Product product,
            @RequestParam("id") Integer productId,
            @RequestParam("code") String productCode,
            @RequestParam("name") String productName,
            @RequestParam("price") Double productPrice

    ) {
        product = this.productService.findById(productId);
        ModelAndView modelAndView;
        if (product == null) {
            modelAndView = new ModelAndView("error");
        } else {
            product.setCode(productCode);
            product.setName(productName);
            product.setPrice(productPrice);
            this.productService.update(productId, product);
            modelAndView = new ModelAndView("edit");
            modelAndView.addObject("product", new Product());
            modelAndView.addObject("message", "Successfully Modified");
        }
        return modelAndView;
    }


    @GetMapping("/delete")
    public ModelAndView showDelete(
            @RequestParam("id") Integer id
    ) {
        Product product = this.productService.findById(id);
        ModelAndView modelAndView;
        if (product == null) {
            modelAndView = new ModelAndView("error");
        } else {
            modelAndView = new ModelAndView("delete");
            modelAndView.addObject("product", product);
        }
        return modelAndView;
    }

    @PostMapping("/delete")
    public String delete(
            @ModelAttribute("product") Product product,
            @RequestParam("id") Integer id,
//            HttpServletResponse response
            RedirectAttributes redirectAttributes
    ) {
        product = this.productService.findById(id);
        ModelAndView modelAndView;
        if (product == null) {
            modelAndView = new ModelAndView("error");
        } else {
            this.productService.remove(id);
//            try {
            redirectAttributes.addFlashAttribute("message", "Deleted successfully");
//                response.sendRedirect("/products");
//            } catch (IOException e) {
//                e.printStackTrace();
//            }
//            }
        }
        return "redirect:/products";
    }

    @GetMapping("/view")
    public ModelAndView view(
            @RequestParam("id") Integer id
    ) {
        Product product = this.productService.findById(id);
        ModelAndView modelAndView;
        if (product == null) {
            modelAndView = new ModelAndView("error");
        } else {
            modelAndView = new ModelAndView("view");
            modelAndView.addObject("view", product);
        }
        return modelAndView;
    }

}
