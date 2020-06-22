package web.ysk.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import web.ysk.vo.TestDTO;

public interface TestDAO {
	public List<TestDTO> selectAll();
}
