package com.demo.question.mapper;

import com.demo.question.entity.Notice;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by guoyibin on 8/27/14.
 */
@Repository
public interface NoticeMapper {

    public List<Notice> findNoticeList();

    public void deleteNoticeById(Long id);

    public void add(Notice notice);

    public void update(Notice notice);
}
