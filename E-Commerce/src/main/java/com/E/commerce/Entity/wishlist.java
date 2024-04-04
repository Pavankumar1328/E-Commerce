package com.E.commerce.Entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

@Entity
@Table
@AllArgsConstructor
@NoArgsConstructor
@Component
@Data
public class wishlist {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String username;
    private String cat;
    private int price;
    private int qty;
}
