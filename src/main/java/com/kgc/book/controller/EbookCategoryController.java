package com.kgc.book.controller;

import com.kgc.book.pojo.EbookCategory;
import com.kgc.book.service.EbookCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @ClassName EbookCategoryController
 * @Description TODO
 * @Author 张少军
 * @Date 2021/9/8 16:02
 * @Version 1.0
 **/
@Controller
@RequestMapping("/bookCategory")
public class EbookCategoryController {

    // 引入service接口
    @Autowired
    private EbookCategoryService ebookCategoryService;

    // 查询图书 分类信息 全部
    @RequestMapping("/list")
    @ResponseBody
    public List<EbookCategory> list(){

        // 调
        List<EbookCategory> ebookCategories = ebookCategoryService.selectEbookCategory();

        return ebookCategories;
    }

}
