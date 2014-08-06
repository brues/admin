package com.demo.basic.action;

import com.demo.base.action.BaseAction;
import com.demo.basic.entity.Purview;
import com.demo.basic.service.PurviewService;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * 权限action
 *
 */
public class PurviewAction extends BaseAction {

    private Purview purview;
    private Long id;

    @Autowired
    private PurviewService purviewService;





    public String findPurviewById(){
        purview = purviewService.findById(id);
        return "findPurviewById";
    }

    public String purviewList() throws Exception {
        return "purviewList";
    }






    public Purview getPurview() {
        return purview;
    }

    public void setPurview(Purview purview) {
        this.purview = purview;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }



}
