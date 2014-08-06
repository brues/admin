package com.demo.basic.action;

import com.demo.base.action.BaseAction;

/**
 *@description:角色权限action 
 *
 *@author:§-> 贾方明  <-§
 *@createTime:2013-7-30 下午2:18:09
 */
@SuppressWarnings("serial")
public class ActorPurviewAction extends BaseAction {
	/*private IActorPurviewService actorPurviewService;
	private IPurviewService purviewService;
	private List<ActorPurview> actorPurviewList = new ArrayList<ActorPurview>();
	private List<Purview> purviewList = new ArrayList<Purview>();
	private String actorId;
	private Integer [] purviewIds;
	private ActorPurview actorPurview;

	//查选所有的权限和角色已经选择的权限
	@SuppressWarnings("unchecked")
	public String getPurviewListByActorId(){
		purviewList = purviewService.findObjects(null,null);
		actorPurviewList = actorPurviewService.findObjects(null," where o.actorId='"+actorId+"'");
		request.setAttribute("actorPurviewList", actorPurviewList);
		request.setAttribute("actorId", actorId);
		return SUCCESS;
	}

	//给用户添加角色
	@SuppressWarnings("unchecked")
	public void saveActorPurview(){
		actorId = actorPurview.getActorId().toString();
		actorPurviewList = actorPurviewService.findObjects(null," where o.actorId='"+actorId+"'");
		if(actorPurviewList!=null && actorPurviewList.size()>0){
			actorPurviewService.deleteObjectByParams(" where o.actorId="+actorId);
			if(purviewIds!=null && purviewIds.length>0){
				for(int i=0;i<purviewIds.length;i++){
					if(actorId != null && purviewIds[i] != null){
						ActorPurview actorPurview = new ActorPurview();
						actorPurview.setActorId(Integer.parseInt(actorId));
						actorPurview.setPurviewId(purviewIds[i]);
						actorPurviewService.saveOrUpdateObject(actorPurview);
					}
				}
			}
		}else{
			if(purviewIds!=null && purviewIds.length>0){
				for(int i=0;i<purviewIds.length;i++){
					if(actorId != null && purviewIds[i] != null){
						ActorPurview actorPurview = new ActorPurview();
						actorPurview.setActorId(Integer.parseInt(actorId));
						actorPurview.setPurviewId(purviewIds[i]);
						actorPurviewService.saveOrUpdateObject(actorPurview);
					}
				}
			}
		}
	}
	public List<ActorPurview> getActorPurviewList() {
		return actorPurviewList;
	}
	public void setActorPurviewList(List<ActorPurview> actorPurviewList) {
		this.actorPurviewList = actorPurviewList;
	}
	public List<Purview> getPurviewList() {
		return purviewList;
	}
	public void setPurviewList(List<Purview> purviewList) {
		this.purviewList = purviewList;
	}
	public String getActorId() {
		return actorId;
	}
	public void setActorId(String actorId) {
		this.actorId = actorId;
	}
	public Integer[] getPurviewIds() {
		return purviewIds;
	}
	public void setPurviewIds(Integer[] purviewIds) {
		this.purviewIds = purviewIds;
	}
	public ActorPurview getActorPurview() {
		return actorPurview;
	}
	public void setActorPurview(ActorPurview actorPurview) {
		this.actorPurview = actorPurview;
	}
	public void setActorPurviewService(IActorPurviewService actorPurviewService) {
		this.actorPurviewService = actorPurviewService;
	}
	public void setPurviewService(IPurviewService purviewService) {
		this.purviewService = purviewService;
	}*/
}
