package com.gs52.vo.schedule;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.gs52.vo.manager.DeptVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data // DTO 코드를 자동으로 Generate (Getter, Setter, toString, default 생성자)
@NoArgsConstructor // 기본생성자
@AllArgsConstructor // 모든 속성을 파라미터로 갖는 생성자

public class ProjectSelectVO {

	long PROJECT_INDEX = 0L;

	String PROJECT_TITLE = null;
	String PROJECT_CONTENT = null;
	String PROJECT_START = null;
	String PROJECT_END = null;
	String PROJECT_DATE = null;
	int PROJECT_OKAY = 0;  
	

}
