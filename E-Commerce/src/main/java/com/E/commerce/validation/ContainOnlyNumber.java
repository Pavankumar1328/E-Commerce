package com.E.commerce.validation;

import jakarta.validation.Constraint;
import jakarta.validation.Payload;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target(ElementType.FIELD)
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy =OnlyNumber.class)
public @interface ContainOnlyNumber  {
    String message() default "Phone No contain only Number";

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};
}
