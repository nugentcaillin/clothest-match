package com.example.clothestmatch;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/product")
public class ProductController {

    @GetMapping("/created")
    public ResponseEntity<List<Product>> getProductsCreated(HttpSession session) {
        User user;
        user = createUserIfNotPresent(session);
        if (user == null) {
            return new ResponseEntity<>(null, HttpStatus.NOT_FOUND);
        }

        return new ResponseEntity<>(user.getProductsCreated(), HttpStatus.OK);
    }

    private User createUserIfNotPresent(HttpSession session) {
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
            userRepository.save(user);
        }

        if (userRepository.findById(userId).isPresent()) {
            user = userRepository.findById(userId).get();
        } else {
            return null;
        }
        return user;
    }

    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private UserRepository userRepository;

    // new product with name and default tag values
    @PostMapping("/new_no_photo/{name}")
    public ResponseEntity<String> newProduct(@PathVariable(name="name") String name, @RequestBody List<TagData> tagDataList, HttpSession session) {
        User user;
        user = createUserIfNotPresent(session);
        if (user == null) {
            return new ResponseEntity<>(null, HttpStatus.NOT_FOUND);
        }

        Product product = new Product();
        product.setName(name);
        product.setUserCreated(user);
        user.getProductsCreated().add(product);
        Tag t;

        for (TagData td: tagDataList) {
            t = new Tag();
            t.setName(td.getName());
            t.setWeight(td.getWeight());
            t.setProduct(product);
            product.getTags().add(t);
        }

        productRepository.save(product);
        return new ResponseEntity<>("Created", HttpStatus.CREATED);
    }

    @PostMapping("/new_photo_and_tags/{name}")
    public ResponseEntity<String> newProduct(@PathVariable(name="name") String name, @RequestBody ProductFullTagDataAndImageURLWrapper body, HttpSession session) {
        User user;
        user = createUserIfNotPresent(session);
        if (user == null) {
            return new ResponseEntity<>(null, HttpStatus.NOT_FOUND);
        }

        Product product = new Product();
        product.setName(name);
        product.setUserCreated(user);
        user.getProductsCreated().add(product);
        Tag t;

        Image image = new Image();
        image.setFilepath(body.getUrl());
        image.setProduct(product);
        product.setImage(image);

        for (TagData td: body.getTags()) {
            t = new Tag();
            t.setName(td.getName());
            t.setWeight(td.getWeight());
            t.setProduct(product);
            product.getTags().add(t);
        }


        productRepository.save(product);

        return new ResponseEntity<>("Created", HttpStatus.CREATED);
    }

    // initialise a product with name, image and tag names
    @PostMapping("/new_photo_no_tag_values/{name}")
    public ResponseEntity<String> newProduct(@PathVariable(name="name") String name, @RequestBody ProductTagNameAndImageURLWrapper body, HttpSession session) {
        User user;
        user = createUserIfNotPresent(session);
        if (user == null) {
            return new ResponseEntity<>(null, HttpStatus.NOT_FOUND);
        }
        Product product = new Product();
        product.setName(name);
        product.setUserCreated(user);
        user.getProductsCreated().add(product);
        // handle image
        Image image = new Image();
        image.setFilepath(body.getUrl());
        image.setProduct(product);
        product.setImage(image);

        Tag t;
        // set up tags with weight 0
        for (String s: body.getTags()) {
            t = new Tag();
            t.setName(s);
            t.setWeight(0);
            t.setProduct(product);
            product.getTags().add(t);
        }

        productRepository.save(product);


        return new ResponseEntity<>("Created", HttpStatus.CREATED);
    }
    @GetMapping("/{num}")
    public ResponseEntity<List<Product>> getProducts(@PathVariable(name="num") int num, HttpSession session) {

        User user;
        user = createUserIfNotPresent(session);
        if (user == null) {
            return new ResponseEntity<>(null, HttpStatus.NOT_FOUND);
        }

        List<Product> products = productRepository.getUnseenProducts(user.getId(), num);
        return new ResponseEntity<>(products, HttpStatus.OK);
    }
    @PutMapping("/swiperight")
    public ResponseEntity<String> swipeRight(@RequestBody long productId, HttpSession session) {

        Product product;

        User user;
        user = createUserIfNotPresent(session);
        if (user == null) {
            return new ResponseEntity<>("error", HttpStatus.NOT_FOUND);
        }

        if (productRepository.findById(productId).isPresent()) {
            product = productRepository.findById(productId).get();
        } else {
            return new ResponseEntity<>("error", HttpStatus.NOT_FOUND);
        }

        // add product to user visited and gallery

        user.getProductsSeen().add(product);
        product.getUsers().add(user);

        user.getGallery().getProductsSaved().add(product);
        product.getGalleries().add(user.getGallery());


        // TODO: change weights of user and product


        userRepository.save(user);



        System.out.println(productId);
        return new ResponseEntity<>("Swiped", HttpStatus.OK);
    }
    @PutMapping("/swipeleft")
    public ResponseEntity<String> swipeLeft(@RequestBody long productId, HttpSession session) {

        Long userId = (Long)session.getAttribute("userId");
        User user;
        Product product;
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
            return new ResponseEntity<>("error", HttpStatus.NOT_FOUND);
        }

        if (productRepository.findById(productId).isPresent()) {
            product = productRepository.findById(productId).get();
        } else {
            return new ResponseEntity<>("error", HttpStatus.NOT_FOUND);
        }

        // add product to user visited but not gallery

        user.getProductsSeen().add(product);
        product.getUsers().add(user);


        // TODO: change weights of user and product


        userRepository.save(user);



        System.out.println(productId);
        return new ResponseEntity<>("Swiped", HttpStatus.OK);

    }
}
