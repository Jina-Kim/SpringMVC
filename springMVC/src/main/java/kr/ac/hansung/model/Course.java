package kr.ac.hansung.model;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class Course {

	private int id;

	private Integer year;
	private Integer semester;

	@NotEmpty(message = "Course Code cannot be empty")
	private String code;

	@NotEmpty(message = "Course Title cannot be empty")
	private String title;

	@NotEmpty(message = "Course Type cannot be empty")
	private String type;

	@NotNull(message = "Course Credit cannot be empty")
	private Integer credit;
}
