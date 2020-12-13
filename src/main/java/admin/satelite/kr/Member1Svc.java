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

import main.java.common.satelite.kr.FileVO;
import main.java.common.satelite.kr.SearchVO;


@Service
public class Member1Svc {

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private DataSourceTransactionManager txManager;

	
	public Member1VO selectMainStat(String param) {
		return sqlSession.selectOne("selectMainStat", param);
	}
	
	public Member1VO selectMainStat2(String param) {
		return sqlSession.selectOne("selectMainStat2", param);
	}
	
	
	
	public Member1VO selectMember1One(Member1VO param) {
		return sqlSession.selectOne("selectMember1One", param);
	}
	
	public Member1VO selectMember1Read(String param) {
		return sqlSession.selectOne("selectMember1Read", param);
	}

	public void insertMember1One(Member1VO param) {
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		TransactionStatus status = txManager.getTransaction(def);

		try {

			sqlSession.insert("insertMember1One", param);

			txManager.commit(status);
		} catch (TransactionException ex) {
			txManager.rollback(status);

		}
	}
	
	public void updateMember1One(Member1VO param) {
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		TransactionStatus status = txManager.getTransaction(def);
		
		try {

			sqlSession.update("updateMember1One", param);

			txManager.commit(status);
		} catch (TransactionException ex) {
			txManager.rollback(status);

		}
	}
	
	public void updateMember1One2(Member1VO param,List<FileVO> filelist,
			String[] fileno) {
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		TransactionStatus status = txManager.getTransaction(def);

		for (FileVO f : filelist) {

			param.setImgfile(f.getFilename());

			
		}
		
		try {
			
			if (!param.getImgfile().equals("")) {
				sqlSession.update("updateMember1One", param);
			} else {

				sqlSession.update("updateMember11One", param);
			}

			

			txManager.commit(status);
		} catch (TransactionException ex) {
			txManager.rollback(status);

		}
	}

	public Integer selectMember1Count(SearchVO param) {
		return sqlSession.selectOne("selectMember1Count", param);
	}

	public List<?> selectMember1List(SearchVO param) {

		return sqlSession.selectList("selectMember1List", param);
	}
	
	public Integer selectCode1Count(SearchVO param) {
		return sqlSession.selectOne("selectCode1Count", param);
	}

	public List<?> selectCode1List(SearchVO param) {

		return sqlSession.selectList("selectCode1List", param);
	}
	
	public List<?> selectCode1SelList() {

		return sqlSession.selectList("selectCode1SelList");
	}
	
	public Member1VO selectCode1One(String param) {
		return sqlSession.selectOne("selectCode1One", param);
	}
	
	public void insertCode1One(Member1VO param) {
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		TransactionStatus status = txManager.getTransaction(def);

		try {

			if (param.getSn().equals("")) {
				sqlSession.insert("insertCode1One", param);
			} else {
				sqlSession.insert("updateCode1One", param);
			}

			txManager.commit(status);
		} catch (TransactionException ex) {
			txManager.rollback(status);

		}
	}
	
	public void deleteCode1One(String param) {
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		TransactionStatus status = txManager.getTransaction(def);

		try {

			sqlSession.insert("deleteCode1One", param);

			txManager.commit(status);
		} catch (TransactionException ex) {
			txManager.rollback(status);

		}
	}

	public void deletePost1One(String param) {
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		TransactionStatus status = txManager.getTransaction(def);

		try {

			sqlSession.insert("deletePost1One", param);

			txManager.commit(status);
		} catch (TransactionException ex) {
			txManager.rollback(status);

		}
	}
	
	public Integer selectContents1Count(SearchVO param) {
		return sqlSession.selectOne("selectContents1Count", param);
	}

	public List<?> selectContents1List(SearchVO param) {

		return sqlSession.selectList("selectContents1List", param);
	}
	
	public Integer selectContents12Count(SearchVO param) {
		return sqlSession.selectOne("selectContents12Count", param);
	}

	public List<?> selectContents12List(SearchVO param) {

		return sqlSession.selectList("selectContents12List", param);
	}

	public List<?> selectMember1Excel(SearchVO param) {

		return sqlSession.selectList("selectMember1Excel", param);
	}
	
	public void updateContents(BannerVO param, List<FileVO> filelist) {
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		TransactionStatus status = txManager.getTransaction(def);
		
		for (FileVO f : filelist) {

			param.setImgfile(f.getFilename());
		}
	
		try {

			if (!param.getImgfile().equals("")) {
				sqlSession.update("updateContents", param);
			} else {

				sqlSession.update("updateContents2", param);
			}

			txManager.commit(status);
		} catch (TransactionException ex) {
			txManager.rollback(status);

		}
	}
	
	public void ContentsDelete(String param) {
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		TransactionStatus status = txManager.getTransaction(def);
		
		
	
		try {

			

				sqlSession.delete("ContentsDelete", param);
			

			txManager.commit(status);
		} catch (TransactionException ex) {
			txManager.rollback(status);

		}
	}
	
	public void insertContents(BannerVO param, List<FileVO> filelist) {
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		TransactionStatus status = txManager.getTransaction(def);
		for (FileVO f : filelist) {

			param.setImgfile(f.getFilename());
		}
	
		try {

			sqlSession.insert("insertContents", param);

			txManager.commit(status);
		} catch (TransactionException ex) {
			txManager.rollback(status);

		}
	}

	public Integer selDupUserid(String param) {
		return sqlSession.selectOne("selDupUserid", param);
	}

}
