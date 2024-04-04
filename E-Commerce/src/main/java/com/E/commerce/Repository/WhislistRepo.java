package com.E.commerce.Repository;

import com.E.commerce.Entity.wishlist;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface WhislistRepo extends JpaRepository<wishlist,Integer> {

    @Modifying
    @Transactional
    @Query("delete from wishlist c where c.username=:username")
    public void deleteByusername(String username);

    @Modifying
    @Transactional
    @Query("delete from wishlist c where c.username=:username and c.id=:id")
    public void deleteByusernameandid(String username,int id);

    public List<wishlist> findByusername(String username);
}
