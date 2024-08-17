package com.example.clothestmatch;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface ProductRepository extends CrudRepository<Product, Long> {
    @Query(value = "SELECT * FROM product LIMIT :num", nativeQuery = true)
    List<Product> getSomeProducts(@Param("num") int num);
    @Query(value ="SELECT product.* FROM product LEFT JOIN (SELECT * FROM user_join WHERE user_id = :userId) AS sub ON product.id = sub.product_id WHERE product_id IS NULL LIMIT :num;", nativeQuery = true)
    List<Product> getUnseenProducts(@Param("userId") long userId, @Param("num") int num);
}
