package com.E.commerce.Entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Component
public class Reciept {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE,
    generator ="Receiptid")
    @SequenceGenerator(name = "Receiptid",
    sequenceName = "Receiptid",allocationSize =100)
    private Long id;
    private String username;
    private String address;
    private String paymentdetails;
}
