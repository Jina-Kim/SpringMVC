package kr.ac.hansung.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.ac.hansung.model.Course;
import kr.ac.hansung.model.CreditsBySemester;
import kr.ac.hansung.model.CreditsByType;
import kr.ac.hansung.service.CourseService;

@Controller
public class CourseController {

	@Autowired
	private CourseService courseService;

	@RequestMapping("/creditsemester")
	public String showCreditsBySemester(Model model) {
		List<CreditsBySemester> courses = courseService.creditsBySemester();
		model.addAttribute("courses", courses);
		return "creditsemester";
	}

	@RequestMapping("/courses")
	public String showCoursesBySemester(@RequestParam("year") int year,@RequestParam("semester") int semester,Model model) {
		List<Course> courses = courseService.coursesBySemester(year, semester);
		model.addAttribute("courses", courses);
		return "courses";
	}
	
	@RequestMapping("/credittype")
	public String showCreditsByType(Model model) {
		List<CreditsByType> courses = courseService.creditsByType();
		model.addAttribute("courses", courses);
		return "credittype";
	}
	
	@RequestMapping("/applycourse")
	public String applyCourse(Model model) {
		model.addAttribute("course", new Course());
		return "applycourse";
	}

	@RequestMapping("/doapply")
	public String doApply(Model model, @Valid Course course, BindingResult result) {
		if (result.hasErrors()) {
			System.out.println("Form Data does not validated");
			List<ObjectError> errors = result.getAllErrors();

			for (ObjectError error : errors) {
				System.out.println(error.getDefaultMessage());
			}
			return "applycourse";
		}

		courseService.insert(course);
		return "courseapplied";
	}
	
	@RequestMapping("/currentcourse")
	public String currentCourses(Model model) {
		List<Course> courses = courseService.currentCourses();
		model.addAttribute("courses", courses);
		return "currentcourse";
	}
}
