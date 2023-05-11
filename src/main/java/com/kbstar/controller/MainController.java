package com.kbstar.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
public class MainController {

    @Value("${adminserver}")
    String adminServer;

    @RequestMapping("/")
    public String main(Model model) {
        model.addAttribute("adminserver", adminServer);
        return "index";
    }

    @RequestMapping("/charts")
    public String charts(Model model) {
        model.addAttribute("adminserver", adminServer);
        model.addAttribute("center", "charts");
        return "index";
    }

    @RequestMapping("/tables")
    public String tables(Model model) {
        model.addAttribute("adminserver", adminServer);
        model.addAttribute("center", "tables");
        return "index";
    }

    @RequestMapping("/loginpage")
    public String loginpage(Model model) {
        model.addAttribute("adminserver", adminServer);
        model.addAttribute("center", "login");
        return "index";
    }

    @RequestMapping("/register")
    public String register(Model model) {
        model.addAttribute("adminserver", adminServer);
        model.addAttribute("center", "register");
        return "index";
    }

    @RequestMapping("/forgotpassword")
    public String forgotpassword(Model model) {
        model.addAttribute("adminserver", adminServer);
        model.addAttribute("center", "forgotpassword");
        return "index";
    }

}
