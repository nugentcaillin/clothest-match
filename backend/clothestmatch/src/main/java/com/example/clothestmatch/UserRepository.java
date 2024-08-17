package com.example.clothestmatch;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface UserRepository extends CrudRepository<User, Long> {
    @Query(value = "SELECT * FROM user WHERE sessionid = :sessionid", nativeQuery = true)
    User getUserBySession(@Param("sessionid") String sessionid);
}
