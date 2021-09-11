package com.kgc.book.controller;

import com.github.pagehelper.PageInfo;
import com.kgc.book.pojo.EbookEntry;
import com.kgc.book.service.EbookEntryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

/**
 * @ClassName EbookEntryController
 * @Description TODO
 * @Author 张少军
 * @Date 2021/9/8 14:47
 * @Version 1.0
 **/
@Controller
@RequestMapping("/bookEntry")
public class EbookEntryController {
    // 引入service接口
    @Autowired
    private EbookEntryService ebookEntryService;

    // 删除
    @RequestMapping("/del")
    public  String del(Integer id){
        // 调
        boolean b = ebookEntryService.deleteEbookEntryById(id);
        // 转
        return "redirect:/bookEntry/list";
    }


    // 修改
    @RequestMapping("/update")
    public  String update(EbookEntry ebookEntry,Model model){
        // 调
        boolean b = ebookEntryService.updateEbookEntryById(ebookEntry);
        if(b){
            model.addAttribute("pointout","添加成功");
            // 转到主页 显示
            return "forward:/bookEntry/list";
        }else{
            model.addAttribute("pointout","添加失败");
            return "forward:/bookEntry/list";
        }

    }

    // 修改前的查询， 根据id值进行查询当前图书的信息
    @RequestMapping("/toUpdate/{id}")
    public  String toUpdate(@PathVariable Integer id,Model model){
        // 调
        EbookEntry ebookEntry = ebookEntryService.selectEbookEntryById(id);
        // 存
        model.addAttribute("ebookEntry",ebookEntry);
        // 转 查到后，转到修改页面
        return "update";
    }


    /*// 添加图书信息
    @RequestMapping("/add")
    public String add(EbookEntry ebookEntry,Model model){
        // 调
        boolean b = ebookEntryService.addEbookEntry(ebookEntry);
        if(b){
            // 添加成功去到显示页面
            return "redirect:/bookEntry/list";
        }else{
            model.addAttribute("error","添加失败，重新添加");
            return "forward:/jsp/add.jsp";
        }

    }*/
    // 添加图书信息
    @RequestMapping("/add")
    @ResponseBody
    public Map<String,Object> add(EbookEntry ebookEntry){
        Map<String,Object> map = new HashMap<>();
        // 调
        boolean b = ebookEntryService.addEbookEntry(ebookEntry);
        System.out.println(b);
        if(b){
            map.put("code",200);
            map.put("msg","添加成功");
            // 添加成功去到显示页面
            return map;
        }else{
            map.put("code",500);
            map.put("msg","添加失败");
            return map;
        }

    }


    // 查询全部 分页条件 页面展示
    @RequestMapping("/list")
    public String list(Model model,
                       @RequestParam(required = false,defaultValue = "0") Integer categoryId,
                       @RequestParam(required = false,defaultValue = "1")Integer pageNo){

        //调
        PageInfo<EbookEntry> pageInfo = ebookEntryService.selectEbookEntry(categoryId, pageNo, 3);

        //存
        model.addAttribute("categoryId",categoryId);
        model.addAttribute("pageNo",pageNo);
        model.addAttribute("pageInfo",pageInfo);

        return "booklist";
    }

}
