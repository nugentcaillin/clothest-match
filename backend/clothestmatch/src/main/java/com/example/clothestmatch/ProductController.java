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
    @Autowired
    private ProductRepository productRepository;

    // new product with name and default tag values
    @PostMapping("/new_no_photo/{name}")
    public ResponseEntity<String> newProduct(@PathVariable(name="name") String name, @RequestBody List<TagData> tagDataList) {
        Product product = new Product();
        product.setName(name);
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

    // initialise a product with name, image and tag names
    @PostMapping("/new_photo_no_tag_values/{name}")
    public ResponseEntity<String> newProduct(@PathVariable(name="name") String name, @RequestBody ProductTagNameAndImageURLWrapper body) {
        Product product = new Product();
        product.setName(name);
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
        List<Product> products = productRepository.getSomeProducts(num);
        return new ResponseEntity<>(products, HttpStatus.OK);
    }
}
