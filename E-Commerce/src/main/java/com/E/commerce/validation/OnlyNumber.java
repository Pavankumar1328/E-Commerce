package com.E.commerce.validation;

import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

public class OnlyNumber implements ConstraintValidator<ContainOnlyNumber,String> {
    boolean k=true;
    @Override
    public boolean isValid(String string, ConstraintValidatorContext constraintValidatorContext) {
        if(string.length()==10){
            for(int i=0;i<string.length();i++){
                if(string.charAt(i)>=48 && string.charAt(i)<=57){
                    k=true;
                }
                else{
                    k=false;
                    break;
                }
            }
        }
        return k;
    }
}
