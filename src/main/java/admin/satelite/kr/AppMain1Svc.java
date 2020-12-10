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
import main.java.common.satelite.kr.FileVO;
import main.java.admin.satelite.kr.AppMain1VO;

@Service
public class AppMain1Svc {

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private DataSourceTransactionManager txManager;

	public AppMain1VO selectAppMain1One(AppMain1VO param) {
		return sqlSession.selectOne("selectAppMain1One", param);
	}
	
	public AppMain1VO selectAppMain1One(String param) {
		return sqlSession.selectOne("selectAppMain1One", param);
	}
	
	public AppMain1VO selectAppMain2One(AppMain1VO param) {
		return sqlSession.selectOne("selectAppMain2One", param);
	}
	
	public AppMain1VO selectAppMain2One(String param) {
		return sqlSession.selectOne("selectAppMain2One", param);
	}
	


	public void insertAppMain1One(AppMain1VO param) {
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		TransactionStatus status = txManager.getTransaction(def);

		try {
			sqlSession.insert("insertAppMain1One", param);
			txManager.commit(status);
		} catch (TransactionException ex) {
			txManager.rollback(status);
		}
	}
	
	public void insertAppMain2One(AppMain1VO param) {
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		TransactionStatus status = txManager.getTransaction(def);

		try {

			sqlSession.insert("insertAppMain2One", param);

			txManager.commit(status);
		} catch (TransactionException ex) {
			txManager.rollback(status);

		}
	}

	public void insertAppMain1(AppMain1VO param) {
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		TransactionStatus status = txManager.getTransaction(def);

				try {

			sqlSession.insert("insertAppMain1One", param);

			txManager.commit(status);
		} catch (TransactionException ex) {
			txManager.rollback(status);

		}
	}
	
	public void updateAppMain1(AppMain1VO param, List<FileVO> filelist, 
			String[] fileno) {
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		TransactionStatus status = txManager.getTransaction(def);

		for (FileVO f : filelist) {

			//param.setImgfile(f.getFilename());
			param.setCreatorimg(f.getFilename());

			
		}
		
		try {
			if (!param.getCreatorimg().equals("")) {
				sqlSession.update("updateAppMain1One", param);
			} else {

				sqlSession.update("updateAppMain11One", param);
			}

			txManager.commit(status);
		} catch (TransactionException ex) {
			txManager.rollback(status);

		}
		
		
	}
	
	public void updateAppMain2(AppMain1VO param, List<FileVO> filelist, 
			String[] fileno) {
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		TransactionStatus status = txManager.getTransaction(def);

		for (FileVO f : filelist) {

			//param.setImgfile(f.getFilename());
			param.setCreatorimg(f.getFilename());

			
		}
		
		try {
			if (!param.getCreatorimg().equals("")) {
				sqlSession.update("updateAppMain2One", param);
			} else {

				sqlSession.update("updateAppMain22One", param);
			}

			txManager.commit(status);
		} catch (TransactionException ex) {
			txManager.rollback(status);

		}
		
		
	}
	
	public void insertAppMain2(AppMain1VO param, List<FileVO> filelist, String[] fileno) {
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		TransactionStatus status = txManager.getTransaction(def);

		for (FileVO f : filelist) {

			param.setCreatorimg(f.getFilename());
		}
		try {

			sqlSession.insert("insertAppMain2One", param);

			txManager.commit(status);
		} catch (TransactionException ex) {
			txManager.rollback(status);

		}
	}

	public Integer selectAppMain1Count(SearchVO param) {
		return sqlSession.selectOne("selectAppMain1Count", param);
	}

	public List<?> selectAppMain1List(SearchVO param) {

		return sqlSession.selectList("selectAppMain1List", param);
	}

	
	public Integer selectAppMain2Count(SearchVO param) {
		return sqlSession.selectOne("selectAppMain2Count", param);
	}

	public List<?> selectAppMain2List(SearchVO param) {

		return sqlSession.selectList("selectAppMain2List", param);
	}
	
	public void appmain1Delete(String param) {

		sqlSession.delete("appmain1Delete", param);
	}


}
