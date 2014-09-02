package com.demo.question.service;

import com.demo.question.entity.Question;
import com.demo.question.entity.WordReplace;
import com.demo.question.mapper.QuestionMapper;
import com.demo.question.mapper.WordReplaceMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by guoyibin on 8/11/14.
 *
 */
@Service
public class QuestionService {

    @Autowired
    private QuestionMapper questionMapper;

    @Autowired
    private WordReplaceMapper wordReplaceMapper;

    public List<Question> searchQuestionList(){
        List<Question> questionList = questionMapper.searchQuestionList();
        for (int i = 0; i < questionList.size(); i++) {
            if (questionList.get(i).getDqsfsy().equals("1")){
                questionList.get(i).setShiyongName("适用");
            }else {
                questionList.get(i).setShiyongName("不适用");
            }
        }
        return questionList;
    }

    public List<Question> searchResultList(String key){

        List<Question> questionList = null;
        if (key==null||key.equals("")){
            questionList = questionMapper.searchQuestionList();
            for (int i = 0; i < questionList.size(); i++) {
                if (questionList.get(i).getDqsfsy().equals("1")){
                    questionList.get(i).setShiyongName("适用");
                }else {
                    questionList.get(i).setShiyongName("不适用");
                }
            }
        }else{
            questionList = questionMapper.searchResultList(key);
            for (int i = 0; i < questionList.size(); i++) {
                if (questionList.get(i).getDqsfsy().equals("1")){
                    questionList.get(i).setShiyongName("适用");
                }else {
                    questionList.get(i).setShiyongName("不适用");
                }
            }

        }

        List<Question> questions = new ArrayList<Question>();

        for (int i = 0; i < questionList.size(); i++) {
            Question question = questionList.get(i);
            List<WordReplace> wordReplaces = wordReplaceMapper.findWordReplaceList(question.getId());
            for (int j = 0; j < wordReplaces.size(); j++) {
                WordReplace wordReplace = wordReplaces.get(j);
                question.setQuestion(question.getQuestion().replace(wordReplace.getWord(),wordReplace.getReplaceWord()));
                question.setAnswer(question.getAnswer().replace(wordReplace.getWord(),wordReplace.getReplaceWord()));
                question.setLegalBasis(question.getLegalBasis().replace(wordReplace.getWord(),wordReplace.getReplaceWord()));
            }
            questions.add(question);

        }


        return questions;
    }

    public List<Question> findQuestionList() {
        return questionMapper.findQuestionList();
    }

    public void deleteQuestionById(Long id) {
        questionMapper.deleteQuestionById(id);
        questionMapper.deleteRemarkByQuestionId(id);
        questionMapper.deleteKeyWordByQuestionId(id);
        questionMapper.deleteReplaceWordByQuestionId(id);
    }

    public void saveOrUpdateQuestion(Long id, String clientName, int caseNum, String clientAddress, String clientPhone,
                                     String askTime, String answerTime, String caseTitle, String pcharge, String chargePhone,
                                     Long ansShapeId, Long typeId, String question, String answer, String legalBasis,
                                     String revComment, String answerPeo, String addressee, String sender, String senderDept,
                                     String addresseeFax, String senderFax, String zxzjfhr, String fhr, String hhrshr, String dqsfsy) {

        Question questions = new Question();
        if(clientName!=null&&!clientName.equals("")){questions.setClientName(clientName);}else{questions.setClientName("null");}
        if(caseNum!=0){questions.setCaseNum(caseNum);}else{questions.setCaseNum(0);}
        if(clientAddress!=null&&!clientAddress.equals("")){questions.setClientAddress(clientAddress);}else{questions.setClientAddress("null");}
        if(clientPhone!=null&&!clientPhone.equals("")){questions.setClientPhone(clientPhone);}else{questions.setClientPhone("null");}
        if(askTime!=null&&!askTime.equals("")){questions.setAskTime(askTime);}else{questions.setAskTime("null");}
        if(answerTime!=null&&!answerTime.equals("")){questions.setAnswerTime(answerTime);}else{questions.setAnswerTime("null");}
        if(caseTitle!=null&&!caseTitle.equals("")){questions.setCaseTitle(caseTitle);}else{questions.setCaseTitle("null");}
        if(pcharge!=null&&!pcharge.equals("")){questions.setPcharge(pcharge);}else{questions.setPcharge("null");}
        if(chargePhone!=null&&!chargePhone.equals("")){questions.setChargePhone(chargePhone);}else{questions.setChargePhone("null");}
        if(ansShapeId!=null&&ansShapeId!=0l){questions.setAnsShapeId(ansShapeId);}else{questions.setAnsShapeId(0l);}
        if(typeId!=null&&typeId!=0l){questions.setTypeId(typeId);}else{questions.setTypeId(0l);}
        if(question!=null&&!question.equals("")){questions.setQuestion(question);}else{questions.setQuestion("null");}
        if(answer!=null&&!answer.equals("")){questions.setAnswer(answer);}else{questions.setAnswer("null");}
        if(legalBasis!=null&&!legalBasis.equals("")){questions.setLegalBasis(legalBasis);}else{questions.setLegalBasis("null");}
        if(revComment!=null&&!revComment.equals("")){questions.setRevComment(revComment);}else{questions.setRevComment("null");}
        if(answerPeo!=null&&!answerPeo.equals("")){questions.setAnswerPeo(answerPeo);}else{questions.setAnswerPeo("null");}
        if(addressee!=null&&!addressee.equals("")){questions.setAddressee(addressee);}else{questions.setAddressee("null");}
        if(sender!=null&&!sender.equals("")){questions.setSender(sender);}else{questions.setSender("null");}
        if(senderDept!=null&&!senderDept.equals("")){questions.setSenderDept(senderDept);}else{questions.setSenderDept("null");}
        if(addresseeFax!=null&&!addresseeFax.equals("")){questions.setAddresseeFax(addresseeFax);}else{questions.setAddresseeFax("null");}
        if(senderFax!=null&&!senderFax.equals("")){questions.setSenderFax(senderFax);}else{questions.setSenderFax("null");}
        if(zxzjfhr!=null&&!zxzjfhr.equals("")){questions.setZxzjfhr(zxzjfhr);}else{questions.setZxzjfhr("null");}
        if(fhr!=null&&!fhr.equals("")){questions.setFhr(fhr);}else{questions.setFhr("null");}
        if(hhrshr!=null&&!hhrshr.equals("")){questions.setHhrshr(hhrshr);}else{questions.setHhrshr("null");}
        if(dqsfsy!=null&&!dqsfsy.equals("")){questions.setDqsfsy(dqsfsy);}else{questions.setDqsfsy("null");}

        if (id==null){
            questionMapper.add(questions);
        }else{
            questions.setId(id);
            questionMapper.update(questions);
        }
    }

    public Map  frontList(String keyWord, String pageSize, String currentPage, String totalCount, String totalPage) {
        if (currentPage==null) currentPage="1";
        pageSize="10";
        Map map = new HashMap();
        List<Question> questionList = null;
        if (keyWord==null||keyWord.equals("")){
            questionList = questionMapper.searchQuestionList();
            for (int i = 0; i < questionList.size(); i++) {
                if (questionList.get(i).getDqsfsy().equals("1")){
                    questionList.get(i).setShiyongName("适用");
                }else {
                    questionList.get(i).setShiyongName("不适用");
                }
            }
        }else{
            questionList = questionMapper.searchResultList(keyWord);
            for (int i = 0; i < questionList.size(); i++) {
                if (questionList.get(i).getDqsfsy().equals("1")){
                    questionList.get(i).setShiyongName("适用");
                }else {
                    questionList.get(i).setShiyongName("不适用");
                }
            }

        }

        List<Question> questions = new ArrayList<Question>();

        for (int i = 0; i < questionList.size(); i++) {
            Question question = questionList.get(i);
            List<WordReplace> wordReplaces = wordReplaceMapper.findWordReplaceList(question.getId());
            for (int j = 0; j < wordReplaces.size(); j++) {
                WordReplace wordReplace = wordReplaces.get(j);
                question.setQuestion(question.getQuestion().replace(wordReplace.getWord(),wordReplace.getReplaceWord()));
                question.setAnswer(question.getAnswer().replace(wordReplace.getWord(),wordReplace.getReplaceWord()));
                question.setLegalBasis(question.getLegalBasis().replace(wordReplace.getWord(),wordReplace.getReplaceWord()));
            }
            questions.add(question);

        }

        List<Question> questionss = new ArrayList<Question>();

        int a=(Integer.parseInt(pageSize))*((Integer.parseInt(currentPage))-1);
        int b=(Integer.parseInt(pageSize))*((Integer.parseInt(currentPage))-1)+4;
        if (a<0) a=0;
        if (b>=questions.size()) b=questions.size()-1;

        for (int i = a; i <= b; i++) {
            questionss.add(questions.get(i));
        }
        map.put("keyWord",keyWord);
        map.put("total",questions.size());
        map.put("currentPage",currentPage);
        if(questions.size()==0){
            map.put("totalPage",1);
        }else if(questions.size()%Integer.parseInt(pageSize)==0){
            map.put("totalPage",questions.size()/Integer.parseInt(pageSize));
        }else{
            map.put("totalPage",questions.size()/Integer.parseInt(pageSize)+1);
        }
        map.put("rows",questionss);
        return map;
    }

    public Question findById(Long id) {
        Question question = questionMapper.findById(id);
        if (question.getDqsfsy().equals("0")){
            question.setDqsfsy("适用");
        }else {
            question.setDqsfsy("不适用");
        }
        return question;
    }
}
