package com.demo.question.mapper;

import com.demo.question.entity.Remark;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by guoyibin on 8/11/14.
 *
 */
@Repository
public interface RemarkMapper {

    public List<Remark> findRemarkList(Long questionId);

    public void deleteRemarkById(Long id);

    public void add(Remark remark);

    public void update(Remark remark);
}
