package com.spring.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.spring.domain.Question;

@Repository
@Transactional
public class QuestionDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public List<Question> listQuestions(){
		Session session = sessionFactory.openSession();
		Criteria cr = session.createCriteria(Question.class);
		cr.add(Restrictions.eq("status", "answered"));
		List<Question> qlist = cr.list();
		return qlist;
	}
	
	public Question getQuestionById(Integer id) {
		Session session = sessionFactory.openSession();
		Question qObj = (Question) session.get(Question.class, id);
		return qObj;
	}
	
	public List<Question> listUnansweredQuestion(){
		Session session = sessionFactory.openSession();
		Criteria cr = session.createCriteria(Question.class);
		cr.add(Restrictions.eq("status", "Unanswered"));
		List<Question> list = cr.list();
		return list;
	}
	
	public Boolean saveQuestion(Question q) {
		Session session = sessionFactory.openSession();
		Boolean flag = false;
		if(session.save(q) != null) {
			flag=true;
		}
		else {
			flag=false;
		}
		return flag;
	}
}
