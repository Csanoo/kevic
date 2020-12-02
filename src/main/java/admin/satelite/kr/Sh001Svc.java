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
import main.java.admin.satelite.kr.Sh001VO;
import main.java.common.satelite.kr.FileVO;

@Service
public class Sh001Svc {

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private DataSourceTransactionManager txManager;


	
	public Sh001VO selectSh001One(String param) {
		return sqlSession.selectOne("selectSh001One", param);
	}
	
	

	public void insertSh001One(Sh001VO param) {
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		TransactionStatus status = txManager.getTransaction(def);

		try {

			sqlSession.insert("insertSh001One", param);

			txManager.commit(status);
		} catch (TransactionException ex) {
			txManager.rollback(status);

		}
	}
	
	

	public void insertSh001(Sh001VO param, List<FileVO> filelist, String[] fileno) {
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		TransactionStatus status = txManager.getTransaction(def);

		for (FileVO f : filelist) {

			param.setImgfile(f.getFilename());
		}
		try {

			sqlSession.insert("insertSh001One", param);

			txManager.commit(status);
		} catch (TransactionException ex) {
			txManager.rollback(status);

		}
	}
	
	public void updateSh001(Sh001VO param, List<FileVO> filelist, 
			String[] fileno) {
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		TransactionStatus status = txManager.getTransaction(def);

		for (FileVO f : filelist) {

			param.setImgfile(f.getFilename());

			
		}
		
		try {
			if (!param.getImgfile().equals("")) {
				sqlSession.update("updateSh001One", param);
			} else {

				sqlSession.update("updateSh0011One", param);
			}

			txManager.commit(status);
		} catch (TransactionException ex) {
			txManager.rollback(status);

		}
		
		
	}
	
	

	public Integer selectSh001Count(SearchVO param) {
		return sqlSession.selectOne("selectSh001Count", param);
	}

	public List<?> selectSh001List(SearchVO param) {

		return sqlSession.selectList("selectSh001List", param);
	}

	
	
	
	public void Sh001Delete(String param) {

		sqlSession.delete("sh001Delete", param);
	}
	
	
	
	
	

}
