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
import main.java.admin.satelite.kr.AppMain1VO;
import main.java.common.satelite.kr.FileVO;

@Service
public class AppMain3Svc {

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private DataSourceTransactionManager txManager;

	public AppMain3VO selectAppMain3One(AppMain1VO param) {
		return sqlSession.selectOne("selectAppMain3One", param);
	}
	
	public AppMain3VO selectAppMain3One(String param) {
		return sqlSession.selectOne("selectAppMain3One", param);
	}
	
	public AppMain3VO selectAppMain4One(AppMain1VO param) {
		return sqlSession.selectOne("selectAppMain4One", param);
	}
	
	public AppMain3VO selectAppMain4One(String param) {
		return sqlSession.selectOne("selectAppMain4One", param);
	}
	
	
	
	
	
	

	public void insertAppMain3One(AppMain3VO param) {
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		TransactionStatus status = txManager.getTransaction(def);

		try {

			sqlSession.insert("insertAppMain3One", param);

			txManager.commit(status);
		} catch (TransactionException ex) {
			txManager.rollback(status);

		}
	}
	
	public void insertAppMain4One(AppMain3VO param) {
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		TransactionStatus status = txManager.getTransaction(def);

		
		try {

			sqlSession.insert("insertAppMain4One", param);

			txManager.commit(status);
		} catch (TransactionException ex) {
			txManager.rollback(status);

		}
	}

	public void insertAppMain3(AppMain3VO param, List<FileVO> filelist, String[] fileno) {
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		TransactionStatus status = txManager.getTransaction(def);

		for (FileVO f : filelist) {

			param.setCreatorimg(f.getFilename());
		}
		try {

			sqlSession.insert("insertAppMain3One", param);

			txManager.commit(status);
		} catch (TransactionException ex) {
			txManager.rollback(status);

		}
	}
	
	public void updateAppMain3(AppMain3VO param, List<FileVO> filelist, 
			String[] fileno) {
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		TransactionStatus status = txManager.getTransaction(def);

		for (FileVO f : filelist) {

			param.setCreatorimg(f.getFilename());

			
		}
		
		try {
			if (!param.getCreatorimg().equals("")) {
				sqlSession.update("updateAppMain3One", param);
			} else {

				sqlSession.update("updateAppMain33One", param);
			}

			txManager.commit(status);
		} catch (TransactionException ex) {
			txManager.rollback(status);

		}
		
		
	}
	
	public void updateAppMain4(AppMain3VO param, List<FileVO> filelist, 
			String[] fileno) {
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		TransactionStatus status = txManager.getTransaction(def);

		for (FileVO f : filelist) {

			param.setCreatorimg(f.getFilename());

			
		}
		
		try {
			if (!param.getCreatorimg().equals("")) {
				sqlSession.update("updateAppMain4One", param);
			} else {

				sqlSession.update("updateAppMain44One", param);
			}

			txManager.commit(status);
		} catch (TransactionException ex) {
			txManager.rollback(status);

		}
		
		
	}
	
	public void insertAppMain4(AppMain3VO param, List<FileVO> filelist, String[] fileno) {
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		TransactionStatus status = txManager.getTransaction(def);

		for (FileVO f : filelist) {

			param.setCreatorimg(f.getFilename());
		}
		try {

			sqlSession.insert("insertAppMain4One", param);

			txManager.commit(status);
		} catch (TransactionException ex) {
			txManager.rollback(status);

		}
	}

	public Integer selectAppMain3Count(SearchVO param) {
		return sqlSession.selectOne("selectAppMain3Count", param);
	}

	public List<?> selectAppMain3List(SearchVO param) {

		return sqlSession.selectList("selectAppMain3List", param);
	}

	
	public Integer selectAppMain4Count(SearchVO param) {
		return sqlSession.selectOne("selectAppMain4Count", param);
	}

	public List<?> selectAppMain4List(SearchVO param) {

		return sqlSession.selectList("selectAppMain4List", param);
	}
	
	public void appmain3Delete(String param) {

		sqlSession.delete("appmain3Delete", param);
	}
	
	
	
	
	

}
