package com.example.clothestmatch;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface ProductRepository extends CrudRepository<Product, Long> {
    @Query(value = "SELECT * FROM product LIMIT :num", nativeQuery = true)
    List<Product> getSomeProducts(@Param("num") int num);
}
