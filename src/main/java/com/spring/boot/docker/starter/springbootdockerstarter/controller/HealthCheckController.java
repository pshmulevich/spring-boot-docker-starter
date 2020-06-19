package com.spring.boot.docker.starter.springbootdockerstarter.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class HealthCheckController {
    @GetMapping(path = "/health")
    public ResponseEntity<String> healthGet() {
        return new ResponseEntity<>("Healthy", HttpStatus.OK);
    }
}