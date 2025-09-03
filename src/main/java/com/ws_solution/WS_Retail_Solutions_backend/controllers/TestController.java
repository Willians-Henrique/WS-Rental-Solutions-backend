package com.ws_solution.WS_Retail_Solutions_backend.controllers;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestController {
    @GetMapping("/")
    public String home() {
        return "Hello, Spring Boot!";
    }

    @GetMapping("/test")
    public String test() {
        return "Test endpoint is working!";
    }
}