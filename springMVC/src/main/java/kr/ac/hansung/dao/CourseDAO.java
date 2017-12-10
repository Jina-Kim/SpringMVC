package kr.ac.hansung.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import kr.ac.hansung.model.Course;
import kr.ac.hansung.model.CreditsByType;
import kr.ac.hansung.model.CreditsBySemester;

@Repository
public class CourseDAO {

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public void setDataSource(DataSource datasource) {
		jdbcTemplate = new JdbcTemplate(datasource);
	}

	// query and return multiple objects
	public List<Course> getCourses() {
		String sqlStatement = "select * from courses";
		return jdbcTemplate.query(sqlStatement, new RowMapper<Course>() {

			@Override
			public Course mapRow(ResultSet rs, int rowNum) throws SQLException {

				Course course = new Course();
				course.setId(rs.getInt("id"));
				course.setYear(rs.getInt("year"));
				course.setSemester(rs.getInt("semester"));
				course.setCode(rs.getString("code"));
				course.setTitle(rs.getString("title"));
				course.setType(rs.getString("type"));
				course.setCredit(rs.getInt("credit"));
				return course;
			}

		});
	}

	// return num of records
	public boolean insert(Course course) {

		int year = 2018;
		int semester = 1;
		String code = course.getCode();
		String title = course.getTitle();
		String type = course.getType();
		int credit = course.getCredit();

		String sqlStatement = "insert into courses (year, semester, code, title, type, credit) values(?, ?, ?, ?, ?, ?)";

		return (jdbcTemplate.update(sqlStatement, new Object[] { year, semester, code, title, type, credit }) == 1);
	}

	public boolean update(Course course) {

		int id = course.getId();
		int year = course.getYear();
		int semester = course.getSemester();
		String code = course.getCode();
		String title = course.getTitle();
		String type = course.getType();
		int credit = course.getCredit();
		String sqlStatement = "update courses set year=?, semester=?, code=?, title=?, type=?, credit=? where id=?";

		return (jdbcTemplate.update(sqlStatement, new Object[] { year, semester, code, title, type, credit, id }) == 1);
	}

	public List<CreditsBySemester> getCreditsBySemester() {
		String sqlStatement = "select year, semester, sum(credit) as 'creditCount' from courses where year<2018 group by year, semester";
		return jdbcTemplate.query(sqlStatement, new RowMapper<CreditsBySemester>() {

			@Override
			public CreditsBySemester mapRow(ResultSet rs, int rowNum) throws SQLException {
				CreditsBySemester course = new CreditsBySemester();
				course.setYear(rs.getInt("year"));
				course.setSemester(rs.getInt("semester"));
				course.setCredits(rs.getInt("creditCount"));
				return course;
			}

		});
	}

	public List<Course> getCoursesBySemester(int year, int semester) {
		String sqlStatement = "select * from courses where year=? and semester=?";
		return jdbcTemplate.query(sqlStatement, new Object[] { year, semester }, new RowMapper<Course>() {
			public Course mapRow(ResultSet rs, int rowNum) throws SQLException {
				Course course = new Course();
				course.setId(rs.getInt("id"));
				course.setYear(rs.getInt("year"));
				course.setSemester(rs.getInt("semester"));
				course.setCode(rs.getString("code"));
				course.setTitle(rs.getString("title"));
				course.setType(rs.getString("type"));
				course.setCredit(rs.getInt("credit"));
				return course;
			}
		});
	}

	public List<CreditsByType> getCoursesByType() {
		String sqlStatement = "select type, sum(credit) from courses where year<2018 group by type";
		List<CreditsByType> coursesByType = jdbcTemplate.query(sqlStatement, new RowMapper<CreditsByType>() {

			@Override
			public CreditsByType mapRow(ResultSet rs, int rowNum) throws SQLException {
				CreditsByType course = new CreditsByType();
				course.setCredits(rs.getInt("sum(credit)"));
				course.setType(rs.getString("type"));
				return course;
			}

		});
		
		int sum = 0;
		for (int i = 0; i < coursesByType.size(); i++) {
			sum += coursesByType.get(i).getCredits();
		}
		CreditsByType course = new CreditsByType("합", sum);
		coursesByType.add(course);
		
		return coursesByType;
	}

	public List<Course> getCurrentCourses() {
		String sqlStatement = "select * from courses where year=2018 and semester=1";
		return jdbcTemplate.query(sqlStatement, new RowMapper<Course>() {
			public Course mapRow(ResultSet rs, int rowNum) throws SQLException {
				Course course = new Course();
				course.setId(rs.getInt("id"));
				course.setYear(2018);
				course.setSemester(1);
				course.setCode(rs.getString("code"));
				course.setTitle(rs.getString("title"));
				course.setType(rs.getString("type"));
				course.setCredit(rs.getInt("credit"));
				return course;
			}
		});

	}
}
