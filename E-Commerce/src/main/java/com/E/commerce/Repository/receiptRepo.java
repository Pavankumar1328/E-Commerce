package com.E.commerce.Repository;

import com.E.commerce.Entity.Reciept;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

public interface receiptRepo extends JpaRepository<Reciept,Long> {
    public Reciept findByusername(String username);

    @Modifying
    @Transactional
    @Query("delete from Reciept c where c.username=:username")
    public void deleteByusername(String username);
}
