package kr.ac.hansung.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.hansung.dao.CourseDAO;
import kr.ac.hansung.model.Course;
import kr.ac.hansung.model.CreditsBySemester;
import kr.ac.hansung.model.CreditsByType;

@Service
public class CourseService {

	@Autowired
	private CourseDAO courseDAO;
	
	public List<CreditsBySemester> creditsBySemester() {
		return courseDAO.getCreditsBySemester();
	}
	
	public List<Course> coursesBySemester(int year, int semester){
		return courseDAO.getCoursesBySemester(year, semester);
	}
	
	public List<CreditsByType> creditsByType(){
		return courseDAO.getCoursesByType();
	}
	
	public List<Course> currentCourses(){
		return courseDAO.getCurrentCourses();
	}
	
	public void insert (Course course) {
		courseDAO.insert(course);
	}

}
