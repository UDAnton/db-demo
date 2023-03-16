package com.github.udanton.dbdemo.controller;

import java.util.Date;
import java.util.concurrent.ThreadLocalRandom;

import com.github.udanton.dbdemo.persistence.User;
import com.github.udanton.dbdemo.persistence.UserRepository;
import lombok.AllArgsConstructor;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@AllArgsConstructor
@RequestMapping("/api/users")
public class UserController {

    private final UserRepository userRepository;

    @PostMapping
    public User createUser() {
        String randomString = RandomStringUtils.random(10, true, false);
        User user = new User();
        user.setName(randomString);
        user.setEmail(String.format("%s.gmail.com",randomString));
        user.setBirthYear(new Date(ThreadLocalRandom.current().nextInt() * 1000L));
        return userRepository.save(user);
    }

}
