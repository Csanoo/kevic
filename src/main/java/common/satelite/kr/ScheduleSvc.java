package main.java.common.satelite.kr;

        import org.mybatis.spring.SqlSessionTemplate;
        import org.springframework.beans.factory.annotation.Autowired;
        import org.springframework.jdbc.datasource.DataSourceTransactionManager;

        import java.util.List;

        import org.springframework.stereotype.Service;

        import javax.annotation.Resource;

@Service
public class ScheduleSvc {

    @Autowired
    private SqlSessionTemplate sqlSession;
    @Autowired
    private DataSourceTransactionManager txManager;



    public Integer selectReserveListCount(SearchVO param) {
        return sqlSession.selectOne("selectReserveListCount", param);
    }

    public List<ScheduleVO> selectReserveList(SearchVO param) {

        return sqlSession.selectList("selectReserveList", param);
    }

    public void insertSchedule(ScheduleVO param) {
        sqlSession.insert("insertSchedule", param);
    }

}
