package com.example.demo;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class Controller {

    @Value("${demo.env1}")
    private String env1;

    @Value("${demo.env2}")
    private String env2;


    @GetMapping("/env")
    public String getEnv() {
        return "env1: " + env1 + " - " + "env2: " + env2;
    }

    @GetMapping("/hello")
    public String hello() {
        return "Hello World!";
    }

}
