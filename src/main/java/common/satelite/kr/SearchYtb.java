package main.java.common.satelite.kr;

import com.google.api.client.googleapis.json.GoogleJsonResponseException;
import com.google.api.client.http.HttpRequest;
import com.google.api.client.http.HttpRequestInitializer;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.services.youtube.YouTube;
import com.google.api.services.youtube.model.ResourceId;
import com.google.api.services.youtube.model.SearchListResponse;
import com.google.api.services.youtube.model.SearchResult;
import com.google.api.services.youtube.model.Thumbnail;
import com.google.api.services.youtube.model.*;
import java.util.ArrayList;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;

import java.sql.*;
import javax.sql.*;
import javax.naming.*;

public class SearchYtb {

    private Connection con = null;
    private DataSource ds = null;
    private Statement stmt = null;
    private PreparedStatement psmt = null;

    /** Global instance properties filename. */
    private static String PROPERTIES_FILENAME = "youtube.properties";

    /** Global instance of the HTTP transport. */
    private static final HttpTransport HTTP_TRANSPORT = new NetHttpTransport();

    /** Global instance of the JSON factory. */
    private static final JsonFactory JSON_FACTORY = new JacksonFactory();

    /** Global instance of the max number of videos we want returned (50 = upper limit per page). */
    private static final long NUMBER_OF_VIDEOS_RETURNED = 30;

    /** Global instance of Youtube object to make all API requests. */
    private static YouTube youtube;

    private YouTube.Search.List query;

    public static final String KEY = "AIzaSyBdo-Z_S4HF4XuAShH7fFbl2a19yj6BrpA"; //test
    //public static final String KEY = "AIzaSyDA0poSdJ3z3R487Nk1shSsHIJkegHzdfs"; //real

    public void execute(String keywords, String sType, Integer CountCt, String userid, HttpServletResponse response) {
        youtube = new YouTube.Builder(new NetHttpTransport(), new JacksonFactory(), new HttpRequestInitializer() {
            @Override
            public void initialize(HttpRequest httpRequest) throws IOException {
            }
        }).setApplicationName("youtube-search").build();

        try {
            query = youtube.search().list("id,snippet");
            query.setMaxResults(Long.parseLong("50"));
            query.setKey(KEY);
            query.setOrder("date");
           // query.setPublishedAfter('');
         //   query.setPublishedBefore('');
            query.setType("video");
            //query.setFields("items(id/kind,id/videoId,snippet/title,snippet/thumbnails/default/url),nextPageToken");
            query.setFields("items(id/kind,id/videoId,snippet/title),nextPageToken");
            query.setQ(keywords);
            Connection con = null;
            PreparedStatement pstmt = null;
            String qry = "";

            try {
                con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/motiva?serverTimezone=UTC", "crdb", "admin123");
                String nextToken = "";
                int i = 0;
                int vNum = 0;
                do {
                    query.setPageToken(nextToken);
                    SearchListResponse response = query.execute();
                    List<SearchResult> results = response.getItems();
                    for (SearchResult result : results) {
                        ResourceId rId = result.getId();
                        String videoId = rId.getVideoId();
                        String thumbnailURL = "http://img.youtube.com/vi/" + videoId + "/hqdefault.jpg";
                        String videoUrl = "https://www.youtube.com/watch?v=" + videoId;
                        qry = "insert into tbl_contents (project, category01, category02, type, imageUrl, videoUrl, ctSource, title ,state, keyword, userid)"
                        + "select  0, 0, 0, '"+sType+"' , '" + thumbnailURL + "','" + videoUrl + "','YTB', '" + result.getSnippet().getTitle() + "', '000', '"+keywords+"','"+userid+"'  from dual "
                        + " WHERE NOT EXISTS  (SELECT sn FROM tbl_contents WHERE videoUrl = '" + videoUrl + "')";

                        pstmt = con.prepareStatement(qry);
                        pstmt.executeUpdate();

                        vNum ++;
                    }
                    nextToken = response.getNextPageToken();
                    i ++;
                    System.out.println("i="+i);
                    System.out.println("vNum="+vNum);
                    System.out.println("CountCt="+CountCt);
                    System.out.println("nextToken :  "+ nextToken);
                //} while (i < 1);
                    String qry2 = "insert into tbl_ytbquota (price) values (-100)";
                    pstmt = con.prepareStatement(qry2);
                    pstmt.executeUpdate();
                } while (nextToken != null && i < 20 && vNum < CountCt);

                pstmt.close();
                con.close();
               // return items;
            } catch (IOException e) {
               // System.out.println("Could not search1: " + e.getMessage());
               // return null;
                response.setContentType("text/html; charset=UTF-8");
                PrintWriter out = response.getWriter();
                out.println("<script>alert('계정이 등록 되었습니다'); location.href='이동주소';</script>");
                out.flush();
            }catch (Exception er) {
                System.out.println("Could not search2: " + er.getMessage());
               // return null;
            }
        } catch (IOException e) {
            System.out.println("Could not initialize: " + e.getMessage());
        }catch (Throwable t) {
            t.printStackTrace();
            System.out.println("Could not initialize: " + t.getMessage());
        }
    }

}