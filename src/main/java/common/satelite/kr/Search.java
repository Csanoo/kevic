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


public class Search {
	
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



  public void execute(String _title) {
    try {
      String queryTerm = _title;
     // System.out.println(queryTerm);
      youtube = new YouTube.Builder(HTTP_TRANSPORT, JSON_FACTORY, new HttpRequestInitializer() {
        public void initialize(HttpRequest request) throws IOException {}
      }).setApplicationName("youtube-cmdline-search-sample").build();

      YouTube.Search.List search = youtube.search().list("id, snippet");
      String apiKey = "";

      apiKey = "AIzaSyBcvdMA0oquUP_rIkiy3zpmWdcbqmzWjXQ";

      //System.out.println(apiKey);

      search.setKey(apiKey);
      search.setQ(queryTerm);

      search.setType("video");

      search.setFields("items(id/kind,id/videoId,snippet/title,snippet/thumbnails/default/url)");
      search.setMaxResults(NUMBER_OF_VIDEOS_RETURNED);
      SearchListResponse searchResponse = search.execute();

      List<SearchResult> searchResultList = searchResponse.getItems();
      Integer vNum = 0;
      if (searchResultList != null) {
         prettyPrint(searchResultList.iterator(), queryTerm);
      }

    } catch (GoogleJsonResponseException e) {
      System.err.println("There was a service error: " + e.getDetails().getCode() + " : "
          + e.getDetails().getMessage());
    } catch (IOException e) {
      System.err.println("There was an IO error: " + e.getCause() + " : " + e.getMessage());
    } catch (Throwable t) {
      t.printStackTrace();
    }
  }


  private static String getInputQuery() throws IOException {

    String inputQuery = "";

    System.out.print("Please enter a search term: ");
    BufferedReader bReader = new BufferedReader(new InputStreamReader(System.in));
    inputQuery = bReader.readLine();

    if (inputQuery.length() < 1) {
      
      inputQuery = "YouTube Developers Live";
    }
    return inputQuery;
  }


  private static void prettyPrint(Iterator<SearchResult> iteratorSearchResults, String query) {


      Connection con = null;
      PreparedStatement pstmt = null;
      String qry = "";


      try {
        con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/motiva?serverTimezone=UTC", "crdb", "admin123");

        while (iteratorSearchResults.hasNext()) {

          SearchResult singleVideo = iteratorSearchResults.next();
          ResourceId rId = singleVideo.getId();
          System.out.println(singleVideo.getSnippet().getTitle());
          if (rId.getKind().equals("youtube#video")) {
            //Thumbnail thumbnail = singleVideo.getSnippet().getThumbnails().get("default");

            String thumbnailURL = "http://img.youtube.com/vi/" + rId.getVideoId() + "/hqdefault.jpg";
            String videoUrl = "https://www.youtube.com/watch?" + rId.getVideoId();
            //  if ( singleVideo.getSnippet().getTitle().indexOf( query ) > 0 ) {

            //   qry = "insert into tcontents ( title, keyword, videoUrl, userid, ctSource, imageURL, category)"
            //            + " values ('"+singleVideo.getSnippet().getTitle()
            //            +"','"+singleVideo.getSnippet().getTitle()+"','"
            //            +rId.getVideoId()+"','admin','유튜브','"+thumbnailURL+"','"+_kind+"') ";

            // qry = "insert into tcontents ( title, memo, url, userid, code2, imgfile, category)"
            //		+ " values ('"+singleVideo.getSnippet().getTitle()
            //		+"','"+singleVideo.getSnippet().getTitle()+"','"
            //		+videoUrl+"','cp0001','YTB','"+thumbnailURL+"','"+_kind+"') ";

            qry = "insert into tbl_contents (project, category01, category02, type, imageUrl, videoUrl, ctSource, title ,state)"
                    + " values ( 0, 0, 0, 'A1' , '" + thumbnailURL + "','" + videoUrl + "','YTB', '" + singleVideo.getSnippet().getTitle() + "', '000' ); ";
            //System.out.print(qry);
            pstmt = con.prepareStatement(qry);
            pstmt.executeUpdate();


          }
        }
    //  }
        pstmt.close();
        con.close();
      }catch(Exception e) {
    	  System.out.println( e.getMessage() );
      }finally {

      }




  }
}