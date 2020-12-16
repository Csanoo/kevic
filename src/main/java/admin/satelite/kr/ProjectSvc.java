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

    public ProjectVO selectProjectDetail(String param) {
        return sqlSession.selectOne("selectProjectDetail", param);
    }


    public ProjectVO selectCategoryDetail(String param) {
        return sqlSession.selectOne("selectCategoryDetail", param);
    }

    public List<?>  selectCategoryOne(Integer param) {
        return sqlSession.selectList("selectCategoryOne", param);
    }

    public List<?>  selectCategoryTwo(ProjectVO param) {
        return sqlSession.selectList("selectCategoryTwo", param);
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


    public void categoryDelete(Integer param) {

        sqlSession.delete("categoryDelete", param);
    }

    public void updateproject(ProjectVO param, List<FileVO> filelist,  String[] fileno) {
        DefaultTransactionDefinition def = new DefaultTransactionDefinition();
        def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
        TransactionStatus status = txManager.getTransaction(def);

        try {
            sqlSession.update("updateproject", param);
            txManager.commit(status);
        } catch (TransactionException ex) {
            txManager.rollback(status);

        }

    }
    public void updateCategory(ProjectVO param) {
        DefaultTransactionDefinition def = new DefaultTransactionDefinition();
        def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
        TransactionStatus status = txManager.getTransaction(def);
        try {
            sqlSession.update("updateCategory", param);
            txManager.commit(status);
        } catch (TransactionException ex) {

            txManager.rollback(status);

        }

    }


    public void updateprojectDetail(ProjectVO param, List<FileVO> filelist,  String[] fileno) {
        DefaultTransactionDefinition def = new DefaultTransactionDefinition();
        def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
        TransactionStatus status = txManager.getTransaction(def);

        try {
            sqlSession.update("updateprojectDetail", param);
            txManager.commit(status);
        } catch (TransactionException ex) {
            txManager.rollback(status);

        }

    }

    public List<?> selectBoxproject(SearchVO param) {

        return sqlSession.selectList("selectBoxproject", param);
    }

    public Integer selectProjectCount(SearchVO param) {
        return sqlSession.selectOne("selectprojectCount", param);
    }

    public List<?> selectProjectList(SearchVO param) {

        return sqlSession.selectList("selectprojectList", param);
    }

    public Integer selectProjectCount2(SearchVO param) {
        return sqlSession.selectOne("selectprojectCount2", param);
    }

    public List<?> selectProjectList2(SearchVO param) {

        return sqlSession.selectList("selectprojectList2", param);
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

    public List<?> selectMemoSelList(String param) {

        return sqlSession.selectList("selectMemoSelList", param);
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


    public void notProjectPublish(ProjectVO param) {
        DefaultTransactionDefinition def = new DefaultTransactionDefinition();
        def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
        TransactionStatus status = txManager.getTransaction(def);

        try {
            sqlSession.update("notProjectPublish", param);
            txManager.commit(status);
        } catch (TransactionException ex) {
            txManager.rollback(status);

        }


    }


    public void insertProject(ProjectVO param, List<FileVO> filelist, String[] fileno) {
        DefaultTransactionDefinition def = new DefaultTransactionDefinition();
        def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
        TransactionStatus status = txManager.getTransaction(def);

        for (FileVO f : filelist) {

            param.setLogoimg(f.getFilename());
        }

        try {
            sqlSession.insert("insertproject", param);
            txManager.commit(status);
        } catch (TransactionException ex) {
            txManager.rollback(status);

        }
    }



    public void insertProjectMemo(ProjectVO param) {
        DefaultTransactionDefinition def = new DefaultTransactionDefinition();
        def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
        TransactionStatus status = txManager.getTransaction(def);

        try {
            sqlSession.insert("insertProjectMemo", param);
            txManager.commit(status);
        } catch (TransactionException ex) {
            txManager.rollback(status);

        }
    }
    public void updateProjectMemo(ProjectVO param) {
        DefaultTransactionDefinition def = new DefaultTransactionDefinition();
        def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
        TransactionStatus status = txManager.getTransaction(def);

        try {
            sqlSession.update("updateProjectMemo", param);
            txManager.commit(status);
        } catch (TransactionException ex) {
            txManager.rollback(status);

        }
    }


    public void projectMemoDelete(Integer param) {

        sqlSession.delete("projectMemoDelete", param);
    }

    public void delMember(ProjectVO param) {

        sqlSession.delete("delMember", param);
    }


    public Integer selPrjTitCt(String param) {
        return sqlSession.selectOne("selPrjTitCt", param);
    }


    public Integer selPrjCd(String param) {
        return sqlSession.selectOne("selPrjCd", param);
    }

    public void prtSortConfirm(ProjectVO param) {
        DefaultTransactionDefinition def = new DefaultTransactionDefinition();
        def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
        TransactionStatus status = txManager.getTransaction(def);

        try {
            sqlSession.update("prtSortConfirm", param);
            txManager.commit(status);
        } catch (TransactionException ex) {
            txManager.rollback(status);

        }
    }


    public void cmInsert(ProjectVO param) {
        DefaultTransactionDefinition def = new DefaultTransactionDefinition();
        def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
        TransactionStatus status = txManager.getTransaction(def);

        try {
            sqlSession.update("cmInsert", param);
            txManager.commit(status);
        } catch (TransactionException ex) {
            txManager.rollback(status);

        }
    }
    public Integer insertCategory(ProjectVO param) {
        DefaultTransactionDefinition def = new DefaultTransactionDefinition();
        def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
        TransactionStatus status = txManager.getTransaction(def);

        try {
            sqlSession.insert("insertCategory", param);
            txManager.commit(status);
            return 1;
        } catch (TransactionException ex) {
            txManager.rollback(status);
            return 0;
        }

    }



    public List<?> category01(Integer param) {

        return sqlSession.selectList("category01", param);
    }

    public List<?> category02(Integer param) {

        return sqlSession.selectList("category02", param);
    }

    public List<?> categoryMember(Integer param) {

        return sqlSession.selectList("categoryMember", param);
    }

    public List<ProjectVO> selectexcelList(SearchVO param) {

        return sqlSession.selectList("selectprojectList", param);
    }

}
