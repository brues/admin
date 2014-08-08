package com.demo.basic.action;

import com.demo.base.action.BaseAction;
import com.demo.basic.service.ActorPurviewService;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 *
 */
@SuppressWarnings("serial")
public class ActorPurviewAction extends BaseAction {

    private Long actorId;
    private Long purviewId;

    @Autowired
    private ActorPurviewService actorPurviewService;

    public String saveOrUpdateActorPurview() throws Exception {
        actorPurviewService.add(actorId,purviewId);
        return "saveOrUpdateActorPurview";
    }

    public String deleteByActorId() throws Exception {
        actorPurviewService.deleteByActorId(actorId);
        return "deleteByActorId";
    }


    public Long getActorId() {
        return actorId;
    }

    public void setActorId(Long actorId) {
        this.actorId = actorId;
    }

    public Long getPurviewId() {
        return purviewId;
    }

    public void setPurviewId(Long purviewId) {
        this.purviewId = purviewId;
    }


}
