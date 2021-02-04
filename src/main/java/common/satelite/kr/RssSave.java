package main.java.common.satelite.kr;

import org.mybatis.spring.SqlSessionTemplate;
import main.java.admin.satelite.kr.RssSvc;
import main.java.admin.satelite.kr.RssVO;
import org.springframework.stereotype.Component;

import org.springframework.beans.NullValueInNestedPathException;
import org.springframework.beans.factory.annotation.Autowired;
import java.io.IOException;
import java.net.URL;
import com.rometools.rome.feed.synd.SyndFeed;
import com.rometools.rome.io.SyndFeedInput;
import com.rometools.rome.io.XmlReader;
import com.rometools.rome.feed.synd.SyndEntry;
import com.rometools.rome.io.FeedException;
import java.util.List;

@Component
public class RssSave {

   // @Autowired
    //private SqlSessionTemplate sqlSession;
    private RssSvc rssSvc = new RssSvc();

  // public static  void main(String[] args) throws  Exception {
    public void rssFeedSave() throws NullPointerException {
        //try {
            RssVO rssVO = new RssVO();

            List<RssVO> listview = selectRssFeedSave();
            for (RssVO list : listview) {
                String rssUrl = list.getUrl();
                if (rssUrl.indexOf("http") < 0) {
                    rssUrl = "http://" + rssUrl;
                }
                SyndFeedInput input = new SyndFeedInput();
                SyndFeed feed = null;
                try {
                    URL feedURL = new URL(rssUrl);
                    feed = input.build(new XmlReader(feedURL));
                    for (int i = 0; i < feed.getEntries().size(); i++) {
                        SyndEntry entry = (SyndEntry) feed.getEntries().get(i);
                        System.out.println(entry.getTitle());
                        System.out.println(entry.getAuthor());
                        System.out.println(entry.getDescription().getValue());
                        System.out.println(entry.getLink());
                    }
                } catch (FeedException e) {
                    e.printStackTrace();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
      //  }catch (NullPointerException ee){
          //  ee.printStackTrace();
       //     System.out.println(ee.getMessage());
       // }
    }
    @Autowired
    private SqlSessionTemplate sqlSession;
    public List<RssVO> selectRssFeedSave()  {
       // System.out.println(sqlSession.selectList("selectRssFeedSave"));
        return sqlSession.selectList("selectRssFeedSave");
    }


}
