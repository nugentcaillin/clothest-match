package com.example.clothestmatch;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

    @Autowired
    private HelloRepository helloRepository;

    @GetMapping("/hello")
    String Hello(HttpSession session) {
        System.out.println(session.getId());
        if (!helloRepository.findAll().iterator().hasNext()) return "Database not working";
        return helloRepository.findAll().iterator().next().getMessage();
    }
}
