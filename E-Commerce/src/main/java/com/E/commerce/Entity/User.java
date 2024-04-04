package com.E.commerce.Entity;

import com.E.commerce.validation.ContainOnlyNumber;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.NumberFormat;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Component;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Data
@Component
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @NotBlank(message = "Username is Blank")
    private String username;
    @NotBlank(message = "Password is Blank")
    private String password;
    @NotBlank(message = "DOB is Blank")
    private String DOB;
    @NotBlank(message = "Phone is Blank")
    @ContainOnlyNumber
    private String phone;
    @NotBlank(message = "Gender is Blank")
    private String Gender;
}
