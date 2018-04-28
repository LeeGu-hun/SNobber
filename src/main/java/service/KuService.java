package service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class KuService {
	@Autowired
	private SqlSession sqlSession;
	//확인확인
}
