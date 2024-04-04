package com.E.commerce.Repository;

import com.E.commerce.Entity.category;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

public interface categoryRepo extends JpaRepository<category,Integer> {
    @Modifying
    @Transactional
    @Query("update category s set s.cname=:cname,s.cdesc=:cdesc where s.cid=:cid")
    public void updatecategoryByid(String cname,String cdesc,int cid);

    @Query("select p from category p where "+
            "CONCAT(p.cid,p.cname,p.cdesc)"+" LIKE %?1%"
    )
    public List<category> getsearch(String name);


}
