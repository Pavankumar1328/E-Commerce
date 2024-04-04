package com.E.commerce.Repository;

import com.E.commerce.Entity.product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

public interface productRepo extends JpaRepository<product,Integer> {

    @Modifying
    @Transactional
    @Query("update product s set s.cat=?1,s.price=?2,s.qty=?3,s.originalname=?4 where s.id=?5")
    public void updateByprodcut(String cat,int price,int qty,String originalname,int id);

    @Modifying
    @Transactional
    @Query(value = "update product set qty=:qty where id=:id",nativeQuery = true)
    public void updateproductstock(int qty,int id);
}
