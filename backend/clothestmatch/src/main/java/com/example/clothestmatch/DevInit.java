package com.example.clothestmatch;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Profile;
import org.springframework.stereotype.Component;

@Component
@Profile("dev")
public class DevInit implements CommandLineRunner {
    @Autowired
    private HelloRepository helloRepository;

    @Override
    public void run(String... args) {
        helloRepository.deleteAll();
        Hello hello = new Hello();
        hello.setMessage("Database Working");
        helloRepository.save(hello);
    }
}
