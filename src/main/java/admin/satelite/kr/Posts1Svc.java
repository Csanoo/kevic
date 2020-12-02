package main.java.admin.satelite.kr;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionException;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import main.java.common.satelite.kr.SearchVO;
import main.java.admin.satelite.kr.Posts1VO;
import main.java.common.satelite.kr.FileVO;

@Service
public class Posts1Svc {

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private DataSourceTransactionManager txManager;


	
	public Posts1VO selectPosts1One(String param) {
		return sqlSession.selectOne("selectPosts1One", param);
	}
	
	public List<?> selectBarChart() {
		return sqlSession.selectList("selectBarChart");
	}
	
	public List<?> selectLineChart() {
		return sqlSession.selectList("selectLineChart");
	}
	
	
	
	
	

	public void insertPosts1One(Posts1VO param) {
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		TransactionStatus status = txManager.getTransaction(def);

		try {

			sqlSession.insert("insertPosts1One", param);

			txManager.commit(status);
		} catch (TransactionException ex) {
			txManager.rollback(status);

		}
	}
	
	

	public void insertPosts1(Posts1VO param, List<FileVO> filelist, String[] fileno) {
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		TransactionStatus status = txManager.getTransaction(def);

		for (FileVO f : filelist) {

			param.setImgfile(f.getFilename());
		}
		try {

			sqlSession.insert("insertPosts1One", param);

			txManager.commit(status);
		} catch (TransactionException ex) {
			txManager.rollback(status);

		}
	}
	
	public void updatePosts1(Posts1VO param, List<FileVO> filelist, 
			String[] fileno) {
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		TransactionStatus status = txManager.getTransaction(def);

		for (FileVO f : filelist) {

			param.setImgfile(f.getFilename());

			
		}
		
		try {
			if (!param.getImgfile().equals("")) {
				sqlSession.update("updatePosts1One", param);
			} else {

				sqlSession.update("updatePosts11One", param);
			}

			txManager.commit(status);
		} catch (TransactionException ex) {
			txManager.rollback(status);

		}
		
		
	}
	
	

	public Integer selectPosts1Count(SearchVO param) {
		return sqlSession.selectOne("selectPosts1Count", param);
	}

	public List<?> selectPosts1List(SearchVO param) {

		return sqlSession.selectList("selectPosts1List", param);
	}

	
	
	
	public void Posts1Delete(String param) {

		sqlSession.delete("posts1Delete", param);
	}
	
	
	
	
	

}
