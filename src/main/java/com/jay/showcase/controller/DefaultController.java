package com.jay.showcase.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class DefaultController {

    private record DefaultResponse(String message) {}

    @GetMapping("/")
    DefaultResponse get() {
        return new DefaultResponse("This works");
    }
}
