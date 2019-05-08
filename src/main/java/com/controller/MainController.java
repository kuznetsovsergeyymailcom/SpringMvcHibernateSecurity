package com.controller;

import com.dao.UserDao;
import com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class MainController {

    @Autowired
    private UserService userService;

    @GetMapping("/show")
    public String show(Model model){
        model.addAttribute("users", userService.getAllUsers());
        return "admin/adminPage";
    }

    @GetMapping("/user")
    public String user(){
        return "user";
    }

    @GetMapping("/error")
    public String error(){
        return "error";
    }
}
