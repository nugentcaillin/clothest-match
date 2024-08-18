package com.example.clothestmatch;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;

import java.util.ArrayList;
import java.util.List;

@Entity
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Image getImage() {
        return image;
    }

    public void setImage(Image image) {
        this.image = image;
    }

    private String name;

    public List<User> getUsers() {
        return users;
    }

    public List<Gallery> getGalleries() {
        return galleries;
    }

    @JsonBackReference
    @ManyToMany(mappedBy = "productsSeen")
    private final List<User> users = new ArrayList<User>();

    @JsonBackReference
    @ManyToMany(mappedBy = "productsSaved")
    private final List<Gallery> galleries = new ArrayList<Gallery>();

    public User getUserCreated() {
        return userCreated;
    }

    public void setUserCreated(User userCreated) {
        this.userCreated = userCreated;
    }

    @JsonBackReference
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="user_created_id")
    private User userCreated;

    @JsonManagedReference
    @OneToMany(mappedBy = "product", cascade = CascadeType.ALL, orphanRemoval = true)
    private final List<Tag> tags = new ArrayList<Tag>();

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "image_id", referencedColumnName = "id")
    private Image image;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public List<Tag> getTags() {
        return tags;
    }

}
