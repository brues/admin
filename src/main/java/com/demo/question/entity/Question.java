package com.demo.question.entity;

import com.demo.base.entity.BaseEntity;

/**
 * Created by guoyibin on 8/11/14.
 *
 * 问题
 */
public class Question extends BaseEntity {

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



    private String typeName;
    private String shapeName;
    private String shiyongName;

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public String getShapeName() {
        return shapeName;
    }

    public void setShapeName(String shapeName) {
        this.shapeName = shapeName;
    }

    public String getShiyongName() {
        return shiyongName;
    }

    public void setShiyongName(String shiyongName) {
        this.shiyongName = shiyongName;
    }
}
