package com.demo.question.action;

import com.demo.base.action.BaseAction;
import com.demo.question.entity.Question;
import com.demo.question.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by guoyibin on 8/11/14.
 *
 */
public class QuestionAction extends BaseAction {

    private Map map = new HashMap();

    private String key;

    private Long id;

    private String clientName;//客户名称（公司名称）

    private int caseNum;//案例编号

    private String clientAddress;//客户地址

    private String clientPhone;//客户电话

    private String askTime;//提问时间

    private String answerTime;//回复时间

    private String caseTitle;//案例主题

    private String pcharge;//负责人

    private String chargePhone;//负责人电话

    private Long ansShapeId;//回复形式（外健）

    private Long typeId;//问题来源（外键）

    private String question;//问题内容

    private String answer;//回复内容

    private String legalBasis;//法律依据

    private String revComment;//复核人意见

    private String answerPeo;//回复人员

    private String addressee;//收件人

    private String sender;//发件人

    private String senderDept;//发件人部门

    private String addresseeFax;//收件人传真

    private String senderFax;//发件人传真

    private String zxzjfhr;//咨询总监复核人

    private String fhr;//复核人

    private String hhrshr;//合伙人审核人

    private String dqsfsy;//当前是否适用

    @Autowired
    private QuestionService questionService;


    public String questionList() throws Exception {
        return "questionList";
    }

    public String searchList() throws Exception {
        return "searchList";
    }

    public String inSearchList() throws Exception {
        return "inSearchList";
    }

    public String findQuestionList() throws Exception {
        List<Question> questionList = questionService.findQuestionList();
        map.put("total",questionList.size());
        map.put("rows",questionList);
        return "findQuestionList";
    }

    public String searchQuestionList(){
        List<Question> questionList = questionService.searchQuestionList();
        map.put("total",questionList.size());
        map.put("rows",questionList);
        return "searchQuestionList";
    }

    public String searchResultList(){
        List<Question> questionList = questionService.searchResultList(key);
        map.put("total",questionList.size());
        map.put("rows",questionList);
        return "searchResultList";
    }

    public String deleteQuestionById() throws Exception {
        questionService.deleteQuestionById(id);

        return "deleteQuestionById";
    }


    public String saveOrUpdateQuestion() throws Exception {
        questionService.saveOrUpdateQuestion(id,clientName,caseNum,clientAddress,clientPhone,askTime,answerTime,caseTitle,pcharge,chargePhone,
                ansShapeId,typeId,question,answer,legalBasis,revComment,answerPeo,addressee,sender,senderDept,addresseeFax,senderFax,zxzjfhr,fhr,hhrshr,dqsfsy);
        return "saveOrUpdateQuestion";
    }

    public String frontList() throws Exception {
        return "frontList";
    }

    public String detailQue() throws Exception {
        return "detailQue";
    }






    public Map getMap() {
        return map;
    }

    public void setMap(Map map) {
        this.map = map;
    }


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getClientName() {
        return clientName;
    }

    public void setClientName(String clientName) {
        this.clientName = clientName;
    }

    public int getCaseNum() {
        return caseNum;
    }

    public void setCaseNum(int caseNum) {
        this.caseNum = caseNum;
    }

    public String getClientAddress() {
        return clientAddress;
    }

    public void setClientAddress(String clientAddress) {
        this.clientAddress = clientAddress;
    }

    public String getClientPhone() {
        return clientPhone;
    }

    public void setClientPhone(String clientPhone) {
        this.clientPhone = clientPhone;
    }

    public String getAskTime() {
        return askTime;
    }

    public void setAskTime(String askTime) {
        this.askTime = askTime;
    }

    public String getAnswerTime() {
        return answerTime;
    }

    public void setAnswerTime(String answerTime) {
        this.answerTime = answerTime;
    }

    public String getCaseTitle() {
        return caseTitle;
    }

    public void setCaseTitle(String caseTitle) {
        this.caseTitle = caseTitle;
    }

    public String getPcharge() {
        return pcharge;
    }

    public void setPcharge(String pcharge) {
        this.pcharge = pcharge;
    }

    public String getChargePhone() {
        return chargePhone;
    }

    public void setChargePhone(String chargePhone) {
        this.chargePhone = chargePhone;
    }

    public Long getAnsShapeId() {
        return ansShapeId;
    }

    public void setAnsShapeId(Long ansShapeId) {
        this.ansShapeId = ansShapeId;
    }

    public Long getTypeId() {
        return typeId;
    }

    public void setTypeId(Long typeId) {
        this.typeId = typeId;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public String getLegalBasis() {
        return legalBasis;
    }

    public void setLegalBasis(String legalBasis) {
        this.legalBasis = legalBasis;
    }

    public String getRevComment() {
        return revComment;
    }

    public void setRevComment(String revComment) {
        this.revComment = revComment;
    }

    public String getAnswerPeo() {
        return answerPeo;
    }

    public void setAnswerPeo(String answerPeo) {
        this.answerPeo = answerPeo;
    }

    public String getAddressee() {
        return addressee;
    }

    public void setAddressee(String addressee) {
        this.addressee = addressee;
    }

    public String getSender() {
        return sender;
    }

    public void setSender(String sender) {
        this.sender = sender;
    }

    public String getSenderDept() {
        return senderDept;
    }

    public void setSenderDept(String senderDept) {
        this.senderDept = senderDept;
    }

    public String getAddresseeFax() {
        return addresseeFax;
    }

    public void setAddresseeFax(String addresseeFax) {
        this.addresseeFax = addresseeFax;
    }

    public String getSenderFax() {
        return senderFax;
    }

    public void setSenderFax(String senderFax) {
        this.senderFax = senderFax;
    }

    public String getZxzjfhr() {
        return zxzjfhr;
    }

    public void setZxzjfhr(String zxzjfhr) {
        this.zxzjfhr = zxzjfhr;
    }

    public String getFhr() {
        return fhr;
    }

    public void setFhr(String fhr) {
        this.fhr = fhr;
    }

    public String getHhrshr() {
        return hhrshr;
    }

    public void setHhrshr(String hhrshr) {
        this.hhrshr = hhrshr;
    }

    public String getDqsfsy() {
        return dqsfsy;
    }

    public void setDqsfsy(String dqsfsy) {
        this.dqsfsy = dqsfsy;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }



}
