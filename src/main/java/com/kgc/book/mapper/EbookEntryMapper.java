package com.kgc.book.mapper;

import com.kgc.book.pojo.EbookEntry;
import com.kgc.book.pojo.EbookEntryExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface EbookEntryMapper {
    long countByExample(EbookEntryExample example);

    int deleteByExample(EbookEntryExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(EbookEntry record);

    int insertSelective(EbookEntry record);

    List<EbookEntry> selectByExample(EbookEntryExample example);

    EbookEntry selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") EbookEntry record, @Param("example") EbookEntryExample example);

    int updateByExample(@Param("record") EbookEntry record, @Param("example") EbookEntryExample example);

    int updateByPrimaryKeySelective(EbookEntry record);

    int updateByPrimaryKey(EbookEntry record);
}