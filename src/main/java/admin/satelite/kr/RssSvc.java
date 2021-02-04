package main.java.admin.satelite.kr;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;

import main.java.common.satelite.kr.SearchVO;
import java.util.Map;
import java.util.List;

@Service
public class RssSvc {

    @Autowired
    private SqlSessionTemplate sqlSession;


    public Integer selectrssCount(SearchVO param) {
        return sqlSession.selectOne("selectrssCount", param);
    }

    public List<?> selectrssList(SearchVO param) {

        return sqlSession.selectList("selectrssList", param);
    }

    public void inserrss(RssVO param) {
        sqlSession.insert("insertRss", param);
    }

    public void chkRssDelete(String param) {

        sqlSession.delete("chkRssDelete", param);
    }

    public RssVO selectRssOne(String param) {
        return sqlSession.selectOne("selectRssOne", param);
    }

    public Integer selUrlCt(String param) {
        return sqlSession.selectOne("selUrlCt", param);
    }


    public void updateRss(RssVO param) {
            sqlSession.update("updateRss", param);
    }


    public List<RssVO> selectRssFeedSave() {
        return sqlSession.selectList("selectRssFeedSave");
    }

}
