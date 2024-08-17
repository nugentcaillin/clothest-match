package com.example.clothestmatch;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/gallery")
public class GalleryController {

    @Autowired
    UserRepository userRepository;

    @GetMapping("/get")
    public ResponseEntity<Gallery> getGallery(HttpSession session) {
        Long userId = (Long)session.getAttribute("userId");
        User user;
        Gallery gallery;

        if (userId == null) {
            System.out.println("Need to create a new user");
            user = new User();

            gallery = new Gallery();
            gallery.setUser(user);
            user.setGallery(gallery);

            userRepository.save(user);

            userId = user.getId();
            session.setAttribute("userId", user.getId());

        }


        if (userRepository.findById(userId).isPresent()) {
            user = userRepository.findById(userId).get();
        } else {
            return new ResponseEntity<>(null, HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(user.getGallery(), HttpStatus.OK);

    }
}
