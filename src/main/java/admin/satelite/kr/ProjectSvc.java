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
import main.java.admin.satelite.kr.ProjectVO;
import main.java.common.satelite.kr.FileVO;

@Service
public class ProjectSvc {

    @Autowired
    private SqlSessionTemplate sqlSession;
    @Autowired
    private DataSourceTransactionManager txManager;

    public ProjectVO selectProjectOne(ProjectVO param) {
        return sqlSession.selectOne("selectprojectOne", param);
    }

    public ProjectVO selectProjectOne(String param) {
        return sqlSession.selectOne("selectprojectOne", param);
    }


    public void insertProjectOne(ProjectVO param) {
        DefaultTransactionDefinition def = new DefaultTransactionDefinition();
        def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
        TransactionStatus status = txManager.getTransaction(def);

        try {

            sqlSession.insert("insertprojectOne", param);

            txManager.commit(status);
        } catch (TransactionException ex) {
            txManager.rollback(status);

        }
    }



    public void updateproject(ProjectVO param, List<FileVO> filelist,
                               String[] fileno) {
        DefaultTransactionDefinition def = new DefaultTransactionDefinition();
        def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
        TransactionStatus status = txManager.getTransaction(def);



        try {
            sqlSession.update("updateprojectOne", param);
            txManager.commit(status);
        } catch (TransactionException ex) {
            txManager.rollback(status);

        }


    }


    public Integer selectProjectCount(SearchVO param) {
        return sqlSession.selectOne("selectprojectCount", param);
    }

    public List<?> selectProjectList(SearchVO param) {

        return sqlSession.selectList("selectprojectList", param);
    }


    public Integer selectAppMain2Count(SearchVO param) {
        return sqlSession.selectOne("selectAppMain2Count", param);
    }

    public List<?> selectAppMain2List(SearchVO param) {

        return sqlSession.selectList("selectAppMain2List", param);
    }


    public List<?> selectCateSelList(SearchVO param) {

        return sqlSession.selectList("selectCateSelList", param);
    }

    public List<?> selectSourceSelList(SearchVO param) {

        return sqlSession.selectList("selectSourceSelList", param);
    }

    public void projectDelete(String param) {

        sqlSession.delete("projectDelete", param);
    }

    public void chkProjectDelete(String param) {

        sqlSession.delete("chkProjectDelete", param);
    }



    public void notProjectPublish(String param) {

        sqlSession.delete("notProjectPublish", param);
    }


}
