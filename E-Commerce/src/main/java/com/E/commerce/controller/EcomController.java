package com.E.commerce.controller;

import com.E.commerce.Entity.User;
import com.E.commerce.Entity.category;
import com.E.commerce.Entity.product;
import com.E.commerce.Entity.wishlist;
import com.E.commerce.Repository.WhislistRepo;
import com.E.commerce.Repository.categoryRepo;
import com.E.commerce.Repository.productRepo;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.awt.*;
import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

@Controller
public class EcomController {

    @Autowired
    categoryRepo categoryRepo;

    @Autowired
    productRepo productRepo;

    @Autowired
    WhislistRepo wishlistRepo;

    private String Path="C:\\Users\\Pavan\\Downloads\\E Commerce\\E commerce\\src\\main\\webapp\\images\\";
    @GetMapping("/welcome")
    public String index(){
        return "welcome";
    }


    @GetMapping("/category")
    public String category(Model model){
        int page=0;
        int pagesize=5;
        Pageable pageable=PageRequest.of(page,pagesize);
        Page<category> categories=categoryRepo.findAll(pageable);
        model.addAttribute("cats",categories.getContent());
        model.addAttribute("mood","add");
        return "category";
    }

    @GetMapping("/getBysearch")
    public String getBysearchandfilter(@RequestParam String search,Model model){
        List<category> categories=categoryRepo.getsearch(search);
        model.addAttribute("search",categories);
        model.addAttribute("mood","add");
        return "category";
    }


    @GetMapping("/categoryByPage/{pageno}")
    public String categoryByPage(Model model,@PathVariable int pageno){
        Pageable pageable=PageRequest.of((pageno-1),5);
        Page<category> categories=categoryRepo.findAll(pageable);
        model.addAttribute("cats",categories.getContent());
        model.addAttribute("mood","add");
        model.addAttribute("currentpage",categories.getNumber());
        model.addAttribute("totalpages",categories.getTotalPages());
        return "category";
    }

    @PostMapping("/addcategory")
    public String addcategory(category category,Model model){
        model.addAttribute("mood","add");
        categoryRepo.save(category);
        return "redirect:/category";
    }

    @GetMapping("/updatecategory/{cid}")
    public String updatecategory(@PathVariable int cid, Model model){
        category category=categoryRepo.findById(cid).get();
        model.addAttribute("category",category);
        model.addAttribute("mood","update");
        return "category";
    }

    @PostMapping("/updatecat")
    public String udpatecat(category cat){
        categoryRepo.updatecategoryByid(cat.getCname(),cat.getCdesc(),cat.getCid());
        return "redirect:/category";
    }

    @GetMapping("/deletecategory")
    public String deleteByid(@RequestParam int id,Model model){
        categoryRepo.deleteById(id);
        model.addAttribute("mood","add");
        return "redirect:/category";
    }

    @GetMapping("/productmanage")
    public String productmanage(Model model,@RequestParam int id){
        int page=id;
        int pagesize=5;
        Pageable pageable=PageRequest.of(page,pagesize);
        Page<product> page1=productRepo.findAll(pageable);
        List<category> categories=categoryRepo.findAll();
        Set<String> setcategory=new HashSet<>();
        for(int i=0;i<categories.size();i++){
            setcategory.add(categories.get(i).getCname());
        }
        model.addAttribute("mood","add");
        model.addAttribute("products",page1);
        model.addAttribute("category",setcategory);
        return "product";
    }

    @PostMapping("/addproduct")
    public String addproduct(product pro,@RequestParam("image") MultipartFile file) throws IOException {
        String path=Path+file.getOriginalFilename();
        pro.setOriginalname(file.getOriginalFilename());
        file.transferTo(new File(path));
        productRepo.save(pro);
        return "redirect:/productmanage";
    }

    @GetMapping("/deleteproduct")
    public String deleteproduct(@RequestParam int id){
        productRepo.deleteById(id);
        return "redirect:/productmanage";
    }

    @GetMapping("/updateproduct")
    public String updateproduct(@RequestParam int id,Model model){
        List<category> categories=categoryRepo.findAll();
        Set<String> setcategory=new HashSet<>();
        for(int i=0;i<categories.size();i++){
            setcategory.add(categories.get(i).getCname());
        }
        model.addAttribute("category",setcategory);
        model.addAttribute("product",productRepo.findById(id).get());
        model.addAttribute("mood","update");
        return "product";
    }

    @PostMapping("/updateproducts")
    public String updateproducts(@RequestParam String cat,@RequestParam("image") MultipartFile file,@RequestParam int id
    ,@RequestParam int price,@RequestParam int qty) throws IOException {
        product pro=new product();
        String path=Path+file.getOriginalFilename();
        pro.setOriginalname(file.getOriginalFilename());
        file.transferTo(new File(path));
        String filename=file.getOriginalFilename();
        productRepo.updateByprodcut(cat,price,qty,filename,id);
        return "redirect:/productmanage";
    }

    @GetMapping("/getproduct")
    public String getpproduct(Model model){
        model.addAttribute("products", productRepo.findAll());
        return "userproduct";
    }

    @GetMapping("/productid/{id}")
    public String productid(@PathVariable int id,Model model){
        model.addAttribute("product",productRepo.findById(id).get());
       return "productiddisplay";
    }

    @PostMapping("/productbuy/{id}")
    public String productBuy(@PathVariable int id,@RequestParam int quantity,Model model,HttpSession session) throws InterruptedException {
        product product=productRepo.findById(id).get();
        wishlist list=new wishlist();
        list.setUsername((String)session.getAttribute("username"));
        list.setCat(product.getCat());
        list.setQty(quantity);
        list.setPrice(product.getPrice());
        wishlistRepo.save(list);
        model.addAttribute("whislists",wishlistRepo.findByusername(session.getAttribute("username").toString()));
        model.addAttribute("totalamount",gettotalamount(wishlistRepo.findByusername(session.getAttribute("username").toString())));
        return "BuyProduct";
    }
    @GetMapping("/productbuy")
    public String productbuy(Model model,HttpSession session){
        model.addAttribute("whislists",wishlistRepo.findByusername(session.getAttribute("username").toString()));
        model.addAttribute("totalamount",gettotalamount(wishlistRepo.findByusername(session.getAttribute("username").toString())));
        return "BuyProduct";
    }

    @GetMapping("/deletewishlist")
    public String deletewishlistById(@RequestParam int id,Model model,HttpSession session){
        wishlistRepo.deleteByusernameandid(session.getAttribute("username").toString(),id);
        model.addAttribute("whislists",wishlistRepo.findByusername(session.getAttribute("username").toString()));
        model.addAttribute("totalamount",gettotalamount(wishlistRepo.findByusername(session.getAttribute("username").toString())));
        return "BuyProduct";
    }

    @GetMapping("/checkout")
    public String checkout(HttpSession session,Model model){
        model.addAttribute("whislists",wishlistRepo.findByusername(session.getAttribute("username").toString()));
        model.addAttribute("totalamount",gettotalamount(wishlistRepo.findByusername(session.getAttribute("username").toString())));
        return "orderitems";
    }



    public int gettotalamount(List<wishlist> wishlists){
        int totalamount=0;
        for(int i=0;i<wishlists.size();i++){
            totalamount=totalamount+(wishlists.get(i).getPrice()*wishlists.get(i).getQty());
        }
        return totalamount;
    }
}
