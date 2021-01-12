package main.java.admin.satelite.kr;

import java.io.IOException;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import main.java.common.satelite.kr.ExcelReadOption;
import main.java.common.satelite.kr.ExcelRead;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionException;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import javax.annotation.Resource;

@Service
public class ExcelSvc {


    @Autowired
    private SqlSessionTemplate sqlSession;
    @Autowired
    private DataSourceTransactionManager txManager;

    public void excelUpload(File destFile) {
        DefaultTransactionDefinition def = new DefaultTransactionDefinition();
        def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
        TransactionStatus status = txManager.getTransaction(def);
        ExcelReadOption excelReadOption = new ExcelReadOption();
        //		파일경로 추가
        excelReadOption.setFilePath(destFile.getAbsolutePath());
        //      추출할 컬럼 명 추가
        excelReadOption.setOutputColumns("A","B","C","D","E","F");
        // 시작 행
        excelReadOption.setStartRow(2);

        List<Map<String, String>>excelContent = ExcelRead.read(excelReadOption);

        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("excelContent", excelContent);

        try {
            sqlSession.insert("insertExcel", paramMap);
            txManager.commit(status);
        } catch (TransactionException ex) {
            txManager.rollback(status);
        }
    }

    public List<?>  selectCodelistOne() {
        return sqlSession.selectList("selectCodeListOne");
    }

    public List<?>  selectCodelistTwo() {
        return sqlSession.selectList("selectCodeListTwo");
    }
}
