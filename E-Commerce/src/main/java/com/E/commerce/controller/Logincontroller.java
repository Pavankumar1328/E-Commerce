package com.E.commerce.controller;

import com.E.commerce.Entity.User;
import com.E.commerce.Repository.UserRepo;
import com.E.commerce.Repository.productRepo;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class Logincontroller {

    @Autowired
    UserRepo userRepo;

    @Autowired
    productRepo ProductRepo;

    @GetMapping("/login")
    public String loginpage(){
        return "login";
    }

    @GetMapping("/Register")
    public String Register(){
        return "Register";
    }

    @PostMapping("/sign up")
    public String signup(@Valid User user, BindingResult result,Model model){
        if(userRepo.findByusername(user.getUsername())!=null){
            model.addAttribute("usernames","Username Already Exist");
            return "Register";
        }
        if(result.hasErrors()){
            model.addAttribute("mood","error");
            model.addAttribute("result",result);
            return "Register";
        }
        else{
            model.addAttribute("success","Register Successfully");
            userRepo.save(user);
            return "login";
        }
    }

    @PostMapping("/sign in")
    public String signin(User user, Model model, HttpSession httpSession) {
        User user1 = userRepo.findByusername(user.getUsername());
        if (user1 == null) {
            return "login";
        }
        if(user.getUsername().equals("Pavankumar") && user.getPassword().equals("Pavan@1328")){
            return "adminproduct";
        }
        if (user1.getPassword().equals(user.getPassword()) && user1.getUsername().equals(user.getUsername())) {
            httpSession.setAttribute("username",user1.getUsername());
            model.addAttribute("products",ProductRepo.findAll());
            return "userproduct";
        }
        else {
            return "login";
        }
    }

        @GetMapping("/forgotpassword")
        public String forgotpassword(){
          return "forgot";
        }

    @PostMapping("/forgot")
    public String retrivepassword(@RequestParam String phone, @RequestParam String DOB, Model model){
        User login=userRepo.findByphone(phone);
        if(login==null){
            model.addAttribute("invalid","Invalid Phone No and DOB");
            return "forgot";
        }
        if(phone.equals(login.getPhone()) && DOB.equals(login.getDOB())){
            model.addAttribute("retrivepassword","Your Password is : "+login.getPassword());
            return "forgot";
        }
        else{
            model.addAttribute("invalid","Invalid phone no and DOB");
            return "forgot";
        }
    }
}

