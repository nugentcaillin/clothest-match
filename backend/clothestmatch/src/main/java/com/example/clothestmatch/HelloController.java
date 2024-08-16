package com.example.clothestmatch;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

    @Autowired
    private HelloRepository helloRepository;

    @GetMapping("/hello")
    String Hello() {
        if (!helloRepository.findAll().iterator().hasNext()) return "Database not working";
        return helloRepository.findAll().iterator().next().getMessage();
    }
}
