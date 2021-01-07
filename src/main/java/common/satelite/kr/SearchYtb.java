package main.java.common.satelite.kr;

import com.google.api.client.googleapis.json.GoogleJsonResponseException;
import com.google.api.client.http.HttpRequest;
import com.google.api.client.http.HttpRequestInitializer;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.client.util.DateTime;
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
import java.util.Calendar;
import java.text.*;

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
    private static final long NUMBER_OF_VIDEOS_RETURNED = 50;

    /** Global instance of Youtube object to make all API requests. */
    private static YouTube youtube;

    private YouTube.Search.List query;

   //public static final String KEY = "AIzaSyBdo-Z_S4HF4XuAShH7fFbl2a19yj6BrpA"; //test
    public static final String KEY = "AIzaSyDA0poSdJ3z3R487Nk1shSsHIJkegHzdfs"; //real

    public void execute(String keywords, String sType, Integer CountCt, String userid, String sdate, String edate) {
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

            if(!sdate.equals("") && !edate.equals("")){
                sdate = sdate + "T00:00:00Z";
                edate = edate + "T23:59:59Z";
                DateTime sDate = DateTime.parseRfc3339(sdate);
                DateTime eDate = DateTime.parseRfc3339(edate);
                query.setPublishedAfter(sDate);
                query.setPublishedBefore(eDate);
            }

            query.setType("video");
            //query.setFields("items(id/kind,id/videoId,snippet/title,snippet/thumbnails/default/url),nextPageToken");
            query.setFields("items(id/kind,id/videoId,snippet/title),nextPageToken,pageInfo");
            query.setQ(keywords);
            Connection con = null;
            PreparedStatement pstmt = null;
            String qry = "";

            try {
                con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/motiva?serverTimezone=UTC", "crdb", "admin123");
                String nextToken = "";
                int i = 0;
                int vNum = 0;
                int iNum = 0;

                do {
                    query.setPageToken(nextToken);
                    query.setQ(keywords);
                    SearchListResponse response = query.execute();
                    List<SearchResult> results = response.getItems();
                    System.out.println("Printed " +  response.getPageInfo().getResultsPerPage() + " out of " + response.getPageInfo().getTotalResults() + ". Current page token: " + query.getPageToken() + "Next page token: " + response.getNextPageToken() + ". Prev page token" + response.getPrevPageToken());
                    if (results != null) {
                        iNum = prettyPrint(results.iterator(), keywords, sType, userid );
                        vNum += iNum;
                    }


                    nextToken = response.getNextPageToken();
                    i ++;
                    System.out.println("i="+i);
                    System.out.println("vNum="+vNum);
                    System.out.println("iNum="+iNum);
                    System.out.println("CountCt="+CountCt);
                    System.out.println("nextToken :  "+ nextToken);
                //} while (i < 1);
                    String qry2 = "insert into tbl_ytbquota (price) values (-100)";
                    pstmt = con.prepareStatement(qry2);
                    pstmt.executeUpdate();
                } while (nextToken != null && i < 19 && vNum < CountCt && iNum > 1);

                pstmt.close();
                con.close();
               // return items;
            } catch (IOException e) {
                System.out.println("Could not search1: " + e.getMessage());
               // return null;
                //HttpServletResponse response = (HttpServletResponse) res;
                //res.setContentType("text/html; charset=UTF-8");
                //PrintWriter out = res.getWriter();
                //out.println("<script>alert('계정이 등록 되었습니다'); location.href='이동주소';</script>");
                //out.flush();
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

    private static Integer prettyPrint(Iterator<SearchResult> iteratorSearchResults, String keywords, String sType, String userid) {


        Connection con = null;
        PreparedStatement pstmt = null;
        String qry = "";

        int vNum = 0;
        try {
            con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/motiva?serverTimezone=UTC", "crdb", "admin123");

            while (iteratorSearchResults.hasNext()) {

                SearchResult singleVideo = iteratorSearchResults.next();
                ResourceId rId = singleVideo.getId();



                // Double checks the kind is video.
                if (rId.getKind().equals("youtube#video")) {
                    String videoId = rId.getVideoId();
                    String thumbnailURL = "http://img.youtube.com/vi/" + videoId + "/hqdefault.jpg";
                    String videoUrl = "https://www.youtube.com/watch?v=" + videoId;
                    qry = "insert into tbl_contents (project, category01, category02, type, imageUrl, videoUrl, ctSource, title ,state, keyword, userid)"
                            + "select  0, 0, 0, 'CV' , '" + thumbnailURL + "','" + videoUrl + "','YTB', '" + singleVideo.getSnippet().getTitle() + "', '000', '"+keywords+"','"+userid+"'  from dual "
                            + " WHERE NOT EXISTS  (SELECT sn FROM tbl_contents WHERE videoUrl = '" + videoUrl + "')";

                    System.out.println(vNum+":"+qry);
                    pstmt = con.prepareStatement(qry);
                    pstmt.executeUpdate();
                    vNum ++;
                }
            }
            pstmt.close();
            con.close();

        }catch(Exception e) {
            System.out.println( e.getMessage() );
        }finally {
            return vNum;
        }
    }

}

//      for (SearchResult result : results) {
//         ResourceId rId = result.getId();
//         String videoId = rId.getVideoId();
//         String thumbnailURL = "http://img.youtube.com/vi/" + videoId + "/hqdefault.jpg";
//         String videoUrl = "https://www.youtube.com/watch?v=" + videoId;
//          qry = "insert into tbl_contents (project, category01, category02, type, imageUrl, videoUrl, ctSource, title ,state, keyword, userid)"
//           + "select  0, 0, 0, '"+sType+"' , '" + thumbnailURL + "','" + videoUrl + "','YTB', '" + result.getSnippet().getTitle() + "', '000', '"+keywords+"','"+userid+"'  from dual "
//          + " WHERE NOT EXISTS  (SELECT sn FROM tbl_contents WHERE videoUrl = '" + videoUrl + "')";

//           System.out.println(vNum+":"+qry);
//           pstmt = con.prepareStatement(qry);
//           pstmt.executeUpdate();
//           vNum ++;
//       }
