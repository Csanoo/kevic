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

@Service
public class BannerSvc {

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private DataSourceTransactionManager txManager;

	//public BannerVO selectBanner1One(BannerVO param) {
	//	return sqlSession.selectOne("selectBanner1One", param);
	//}
	
	public BannerVO selectBanner1One(String param) {
		return sqlSession.selectOne("selectBanner1One", param);
	}
	
	public BannerVO selectBanner2One(BannerVO param) {
		return sqlSession.selectOne("selectBanner2One", param);
	}
	
	public BannerVO selectBanner2One(String param) {
		return sqlSession.selectOne("selectBanner2One", param);
	}
	
	
	public BannerVO selectContentsOne(String param) {
		return sqlSession.selectOne("selectContentsOne", param);
	}


	public List<?>  selectBannerDetail(String param) {
		return sqlSession.selectList("selectBannerDetail", param);
	}


	public void insertBanner1One(BannerVO param) {
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		TransactionStatus status = txManager.getTransaction(def);

		try {

			sqlSession.insert("insertBanner1One", param);

			txManager.commit(status);
		} catch (TransactionException ex) {
			txManager.rollback(status);

		}
	}
	
	public void insertBanner2One(BannerVO param) {
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		TransactionStatus status = txManager.getTransaction(def);

		try {

			sqlSession.insert("insertBanner2One", param);

			txManager.commit(status);
		} catch (TransactionException ex) {
			txManager.rollback(status);

		}
	}

	public void insertBanner1(BannerVO param) {
			sqlSession.insert("insertBanner1One", param);
	}

	public void insertBannerDetail(BannerVO param) {
			sqlSession.insert("insertBannerDetail", param);
	}

	
	public void updateBanner1(BannerVO param) {
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		TransactionStatus status = txManager.getTransaction(def);

		try {
			sqlSession.update("updateBanner", param);
			txManager.commit(status);
		} catch (TransactionException ex) {
			txManager.rollback(status);

		}
		
		
	}
	
	public void insertBanner2(BannerVO param, List<FileVO> filelist, String[] fileno) {
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		TransactionStatus status = txManager.getTransaction(def);

		for (FileVO f : filelist) {

			param.setImgfile(f.getFilename());
		}
		try {

			sqlSession.insert("insertBanner2One", param);

			txManager.commit(status);
		} catch (TransactionException ex) {
			txManager.rollback(status);

		}
	}

	public Integer selectBanner1Count(SearchVO param) {
		return sqlSession.selectOne("selectBanner1Count", param);
	}

	public List<?> selectBanner1List(SearchVO param) {

		return sqlSession.selectList("selectBanner1List", param);
	}

	
	public Integer selectBanner2Count(SearchVO param) {
		return sqlSession.selectOne("selectBanner2Count", param);
	}

	public List<?> selectBanner2List(SearchVO param) {

		return sqlSession.selectList("selectBanner2List", param);
	}
	
	public void banner1Delete(String param) {

		sqlSession.delete("banner1Delete", param);
	}

	public void bannerChkDelete(String param) {

		sqlSession.delete("bannerChkDelete", param);
	}

	public void deleteBannerDetail(Integer param){
		sqlSession.delete("deleteBannerDetail", param);
	}
	public List<?> selectBoxproject(SearchVO param) {

		return sqlSession.selectList("selectBoxprojectBan", param);
	}




}
