package com.spring.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.spring.domain.*;

@Repository
@Transactional
public class CategoryDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public List<Category> listAllCategory(){
		Session session = sessionFactory.openSession();
		Criteria cr = session.createCriteria(Category.class);
		List<Category> list = cr.list();
		return list;
	}
	
	public Category getCategoryById(Integer id) {
		Session session = sessionFactory.openSession();
		Category category = (Category) session.get(Category.class, id);
		return category;
	}
}
