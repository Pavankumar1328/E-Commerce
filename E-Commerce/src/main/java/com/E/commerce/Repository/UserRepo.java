package com.E.commerce.Repository;

import com.E.commerce.Entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepo extends JpaRepository<User,Integer> {
    public User findByusername(String username);

    public User findByphone(String phone);
}
