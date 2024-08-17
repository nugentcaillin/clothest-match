package com.example.clothestmatch;

import com.fasterxml.jackson.annotation.JsonBackReference;
import jakarta.persistence.*;

import java.util.ArrayList;
import java.util.List;

@Entity
public class Gallery {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long Id;


    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @JsonBackReference
    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "user_id", referencedColumnName = "id")
    private User user;

    @ManyToMany
    @JoinTable(
            name="gallery_join",
            joinColumns = @JoinColumn(name = "gallery_id"),
            inverseJoinColumns = @JoinColumn(name = "product_id"))
    private final List<Product> productsSaved = new ArrayList<Product>();

    public long getId() {
        return Id;
    }

    public void setId(long id) {
        Id = id;
    }

    public List<Product> getProductsSaved() {
        return productsSaved;
    }

}
