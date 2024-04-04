package com.E.commerce.controller;

import com.E.commerce.Entity.Reciept;
import com.E.commerce.Entity.wishlist;
import com.E.commerce.Repository.WhislistRepo;
import com.E.commerce.Repository.receiptRepo;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;

@Controller
public class PaymentController {
    @Autowired
    receiptRepo receiptRepo;

    @Autowired
    WhislistRepo wishlistRepo;

    @PostMapping("/orderconfirm")
    public String orderconfirm(HttpSession session, Model model, Reciept reciept){
        if(reciept.getPaymentdetails().equals("Credit card")){
            reciept.setUsername(session.getAttribute("username").toString());
            receiptRepo.save(reciept);
            return "creditcard";
        }
        else {
            reciept.setUsername(session.getAttribute("username").toString());
            receiptRepo.save(reciept);
            LocalDate date=LocalDate.now();
            model.addAttribute("date",date);
            model.addAttribute("reciept",receiptRepo.findByusername(reciept.getUsername()));
            model.addAttribute("whislists", wishlistRepo.findByusername(session.getAttribute("username").toString()));
            model.addAttribute("totalamount", gettotalamount(wishlistRepo.findByusername(session.getAttribute("username").toString())));
            wishlistRepo.deleteByusername(session.getAttribute("username").toString());
            receiptRepo.deleteByusername(session.getAttribute("username").toString());
            return "orderconfirm";
        }
    }

    @PostMapping("/onlinepayment")
    public String onlinePayment(HttpSession session, Model model){
        String username=session.getAttribute("username").toString();
        LocalDate date=LocalDate.now();
        Reciept reciept=receiptRepo.findByusername(username);
        reciept.setPaymentdetails("ONLINE PAYMENT");
        model.addAttribute("date",date);
        model.addAttribute("reciept",reciept);
        model.addAttribute("whislists", wishlistRepo.findByusername(session.getAttribute("username").toString()));
        model.addAttribute("totalamount", gettotalamount(wishlistRepo.findByusername(session.getAttribute("username").toString())));
        wishlistRepo.deleteByusername(session.getAttribute("username").toString());
        receiptRepo.deleteByusername(session.getAttribute("username").toString());
        return "orderconfirm";
    }

    public int gettotalamount(List<wishlist> wishlists){
        int totalamount=0;
        for(int i=0;i<wishlists.size();i++){
            totalamount=totalamount+(wishlists.get(i).getPrice()*wishlists.get(i).getQty());
        }
        return totalamount;
    }
}
