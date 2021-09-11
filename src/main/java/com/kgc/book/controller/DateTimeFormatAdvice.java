package com.kgc.book.controller;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.InitBinder;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @ClassName DateTimeFormatAdvice
 * @Description TODO
 * @Author 张少军
 * @Date 2021/8/26 15:33
 * @Version 1.0
 **/
@ControllerAdvice
public class DateTimeFormatAdvice {

    @InitBinder
    public void initBindDateType(WebDataBinder binder)
    {
        //时间格式对象
        SimpleDateFormat sdf=new SimpleDateFormat();
        sdf.applyPattern("yyyy-MM-dd");
        //new CustomDateEditor(sdf, true)  是否允许为空
        binder.registerCustomEditor(Date.class,new CustomDateEditor(sdf, true));
    }

}