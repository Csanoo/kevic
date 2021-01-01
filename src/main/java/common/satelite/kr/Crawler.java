package main.java.common.satelite.kr;


import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.DriverManager;
import java.util.List;
import java.io.BufferedReader;
import java.io.IOException;
import java.util.Properties;
import java.io.FileOutputStream;
import java.util.HashMap;
import java.util.Map;

import java.util.Arrays;

import org.openqa.selenium.*;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.openqa.selenium.PageLoadStrategy;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;
import org.openqa.selenium.remote.DesiredCapabilities;

import java.util.concurrent.TimeUnit;
import java.sql.*;
import javax.sql.*;

import twitter4j.*;
import twitter4j.conf.ConfigurationBuilder;

public class Crawler {

    public boolean isElementDisplayed(WebElement element) {
        try {
            return element.isDisplayed();
        } catch (NoSuchElementException e) {
            return false;
        }
    }

    private Connection con = null;
    private DataSource ds = null;
    private Statement stmt = null;
    private PreparedStatement psmt = null;


    public static void searchTwit(String keywords, String sType, Integer CountCt, String userid, String sdate, String edate) throws Exception {

        ConfigurationBuilder cb = new ConfigurationBuilder();
        cb.setDebugEnabled(true)
                .setOAuthConsumerKey("TOjS07ytmheXJsEnmQSXJo3IJ")
                .setOAuthConsumerSecret("vPxSLLCcGODo7qn9pCtbU7AMSRWzvXkK8Hy0mDrhappeU3u7c7")
                .setOAuthAccessToken("1328206592253120514-bD55VlbHa8j2lZxwPCgdhBLzCVbfRQ")
                .setOAuthAccessTokenSecret("ppCWmzr9uCWGDxql4dX7yE09m6ipnoKkN55061n2OrgN5");
        TwitterFactory tf = new TwitterFactory(cb.build());
        Twitter twitter = tf.getInstance();
        String thumbnailURL;
        String videoUrl;
        Connection con = null;
        PreparedStatement pstmt = null;
        String qry = "";

        try {
            con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/motiva?serverTimezone=UTC", "crdb", "admin123");
            Query query = new Query(keywords);
            query.setResultType(Query.RECENT);
            query.setCount(CountCt);
            QueryResult result;
            query.setSince(sdate);
            query.setUntil(edate);
            int i = 0;
            int vNum = 0;
            String title;
            String txt ="";
            do {
                result = twitter.search(query);
                List<Status> tweets = result.getTweets();
                for (Status tweet : tweets) {
                    System.out.println("@" + tweet.getUser().getScreenName() + " - " + tweet.getText());
                    if(tweet.getMediaEntities().length!=0){
                        System.out.println(tweet.getMediaEntities()[0].getMediaURL());
                        thumbnailURL = tweet.getMediaEntities()[0].getMediaURL();

                        videoUrl = tweet.getMediaEntities()[0].getMediaURL();
                        title = tweet.getUser().getScreenName().replaceAll("'","''");
                        txt = tweet.getText().replaceAll("'","''");
                        qry = "insert into tbl_contents (project, category01, category02, type, imageUrl, videoUrl, ctSource, title, sText ,state, keyword, userid)"
                                + "select  0, 0, 0, '"+sType+"' , '" + thumbnailURL + "','" + videoUrl + "','TWT', '"+ title +"', '" + txt + "', '000', '"+keywords+"','"+userid+"'  from dual "
                                + " WHERE NOT EXISTS  (SELECT sn FROM tbl_contents WHERE sText = '" + txt + "')";
                        System.out.println(vNum+":"+qry);
                        pstmt = con.prepareStatement(qry);
                        pstmt.executeUpdate();
                        vNum ++;
                    }
                }
            } while ((query = result.nextQuery()) != null && vNum < CountCt );
          //  System.exit(0);
            pstmt.close();
            con.close();
        } catch (TwitterException te) {
            te.printStackTrace();
            System.out.println("Failed to search tweets: " + te.getMessage());
         //   System.exit(-1);
        }
    }
      public static void searchInsta(String keyword, String _kind) throws Exception {
      //public static void main(String[] args) throws  Exception {
        String URL = "https://www.instagram.com/?hl=ko";
       // String _kind = "Music";
        //String keyword = "성시경";
        // 1. WebDriver 경로 설정
        Path path = Paths.get(System.getProperty("user.dir"), "src/main/resources/driver/chromedriver");
        System.setProperty("webdriver.chrome.driver", path.toString());

        // 2. WebDriver 옵션 설정
        ChromeOptions options = new ChromeOptions();
        options.addArguments("--start-maximized");          // 최대크기로
        options.addArguments("--headless");                 // Browser를 띄우지 않음
        options.addArguments("--disable-gpu");              // GPU를 사용하지 않음, Linux에서 headless를 사용하는 경우 필요함.
        options.addArguments("--no-sandbox");               // Sandbox 프로세스를 사용하지 않음, Linux에서 headless를 사용하는 경우 필요함.
        options.setPageLoadStrategy(PageLoadStrategy.NONE);

        // 3. WebDriver 객체 생성
        ChromeDriver driver = new ChromeDriver( options );
        JavascriptExecutor js = (JavascriptExecutor) driver;
        // 4. 웹페이지 요청
       // driver.get(URL);
        // driver.navigate().to(URL);
        // 5. HTML 저장.
        // saveHtml("twitter-selenium.html", driver.getPageSource() );
        driver.get("https://www.instagram.com/accounts/login/?hl=en&source=auth_switcher");

        driver.manage().timeouts().implicitlyWait(10, TimeUnit.SECONDS);
        driver.manage().window().maximize();
        driver.findElement(By.name("username")).sendKeys("sasa@kakao.com");
        driver.findElement(By.name("password")).sendKeys("1024Csw!@");
        driver.findElement(By.xpath("//div[text()='Log In']")).click();
        driver.manage().timeouts().implicitlyWait(10, TimeUnit.SECONDS);
        driver.findElement(By.xpath("//button[text()='Not Now']")).click();
        driver.manage().timeouts().implicitlyWait(10, TimeUnit.SECONDS);
        driver.navigate().to("https://www.instagram.com/explore/tags/"+keyword+"/");
         try {
            //driver.manage().window().maximize();

            int ctContents = 0;
            // 6. 트윗 목록 Block 조회, 로드될 때까지 최대 30초간 대기
            WebDriverWait wait = new WebDriverWait(driver, 10);
            WebElement parent = wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("#react-root > section > main > article")));
            List<WebElement> contents = parent.findElements(By.cssSelector("div.v1Nh3.kIKUG._bz0w"));
            System.out.println("조회된 콘텐츠 수 : " + contents.size());
            if (contents.size() > 0) {
                ctContents += contents.size();
                // 8. 트윗 상세 내용 탐색
                Connection con = null;
                PreparedStatement pstmt = null;
                String qry = "";
                try {
                    con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/motiva?serverTimezone=UTC&useUnicode=true&characterEncoding=utf8", "crdb", "admin123");
                    for (WebElement content : contents) {
                        try {
                            Thread.sleep(3000);
                            String url = content.findElement(By.cssSelector("a")).getAttribute("href");
                            content.findElement(By.cssSelector("a")).click();
                            driver.manage().timeouts().implicitlyWait(10, TimeUnit.SECONDS);
                            Thread.sleep(3000);
                            // WebElement layer = wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("div._2dDPU.RnrQH.CkGkG")));
                            String username = driver.findElement(By.xpath("/html/body/div[5]/div[2]/div/article/header/div[2]/div[1]/div[1]/span/a")).getText();
                            String id = driver.findElement(By.xpath("/html/body/div[5]/div[2]/div/article/header/div[2]/div[1]/div[1]/span/a")).getText();
                            System.out.println(username + " " + id);
                            String text = driver.findElement(By.xpath("/html/body/div[5]/div[2]/div/article/div[3]/div[1]/ul/div/li/div/div/div[2]/span")).getText();
                            System.out.println(text);
                            List<WebElement> eleVideo = driver.findElements(By.xpath("/html/body/div[5]/div[2]/div/article/div[2]/div/div/div[1]/div/div/video"));
                            String img = "";
                            if (eleVideo.size() > 0) {
                                img = driver.findElement(By.xpath("/html/body/div[5]/div[2]/div/article/div[2]/div/div/div[1]/div/div/video")).getAttribute("poster");
                            }else{

                                List<WebElement> eleMimg = driver.findElements(By.xpath("/html/body/div[5]/div[2]/div/article/div[2]/div/div[1]/div[2]/div/div/div/ul/li[2]/div/div/div/div[1]/div[1]/img"));
                                if(eleMimg.size() > 0){
                                    img = driver.findElement(By.xpath("/html/body/div[5]/div[2]/div/article/div[2]/div/div[1]/div[2]/div/div/div/ul/li[2]/div/div/div/div[1]/div[1]/img")).getAttribute("src");
                                }else{
                                    List<WebElement> eleImg = driver.findElements(By.xpath("/html/body/div[5]/div[2]/div/article/div[2]/div/div/div[1]/div[1]/img"));
                                    if (eleImg.size() > 0) {
                                        img = driver.findElement(By.xpath("/html/body/div[5]/div[2]/div/article/div[2]/div/div/div[1]/div[1]/img")).getAttribute("src");
                                    } else {
                                        img = driver.findElement(By.xpath("/html/body/div[5]/div[2]/div/article/div[2]/div/div/div[1]/img")).getAttribute("src");

                                    }
                                }
                            }
                            System.out.println(img);
                            System.out.println("========================");
                            System.out.println(username + " " + id);
                            System.out.println(text);
                            System.out.println(img);
                            System.out.println("========================");
                            qry = "insert into tcontents ( title, memo, url, userid, code2, imgfile, category)"
                                  + " values ('" + username + " " + id
                                  + "','" + text + "','" + url
                                  + "','cp0001','INS','" + img + "','" + _kind + "') ";


                            //System.out.println(qry);
                           // System.out.println("========================");
                            pstmt = con.prepareStatement(qry);
                            pstmt.executeUpdate();
                            driver.findElement(By.cssSelector("body > div._2dDPU.RnrQH.CkGkG > div.Igw0E.IwRSH.eGOV_._4EzTm.BI4qX.qJPeX.fm1AK.TxciK.yiMZG button.wpO6b")).click();
                           // Thread.sleep(3000);
                        } catch (NoSuchElementException e) {
                            // pass
                            driver.findElement(By.cssSelector("body > div._2dDPU.RnrQH.CkGkG > div.Igw0E.IwRSH.eGOV_._4EzTm.BI4qX.qJPeX.fm1AK.TxciK.yiMZG > button.wpO6b")).click();
                            //Thread.sleep(1000);
                        }
                    }
                    pstmt.close();
                    con.close();
                } catch (Exception e) {
                    System.out.println(e.getMessage());
                }
            }
        } catch ( TimeoutException e ) {
            System.out.println("목록을 찾을 수 없습니다.");
        } finally {

        }
        // WebDriver 종료
        driver.quit();
    }

   public static void searchFb(String keyword, String _kind) throws Exception {
   //public static void main(String[] args) throws  Exception {
       // String URL = "https://www.instagram.com/?hl=ko";
    //    String _kind = "Music";
      //  String keyword = "방탄소년단";

        Path path = Paths.get(System.getProperty("user.dir"), "src/main/resources/driver/chromedriver");
        System.setProperty("webdriver.chrome.driver", path.toString());

        ChromeOptions options = new ChromeOptions();
        options.addArguments("--start-maximized");          // 최대크기로
        options.addArguments("--headless");                 // Browser를 띄우지 않음
        options.addArguments("--disable-gpu");              // GPU를 사용하지 않음, Linux에서 headless를 사용하는 경우 필요함.
        options.addArguments("--no-sandbox");               // Sandbox 프로세스를 사용하지 않음, Linux에서 headless를 사용하는 경우 필요함.
        options.addArguments("--disable-notifications");
        options.setPageLoadStrategy(PageLoadStrategy.NONE);

        // 3. WebDriver 객체 생성
        ChromeDriver driver = new ChromeDriver( options );
        JavascriptExecutor js = (JavascriptExecutor) driver;
        Actions builder = new Actions(driver);
        driver.get("https://www.facebook.com/login.php?login_attempt=1&lwv=110");
        driver.manage().timeouts().implicitlyWait(10, TimeUnit.SECONDS);
        driver.manage().window().maximize();
        driver.findElement(By.name("email")).sendKeys("sano@live.co.kr");
        driver.findElement(By.name("pass")).sendKeys("1024Csw!@");

        driver.findElement(By.xpath("//*[@id=\"loginbutton\"]")).click();
        Thread.sleep(6000);
        driver.navigate().to("https://www.facebook.com/search/posts/?q="+keyword);
        System.out.println(driver.getCurrentUrl());
        Thread.sleep(6000);
        driver.navigate().to(driver.findElement(By.cssSelector("a.oajrlxb2.tdjehn4e.qu0x051f.esr5mh6w.e9989ue4.r7d6kgcz.rq0escxv.nhd2j8a9.j83agx80.p7hjln8o.kvgmc6g5.cxmmr5t8.oygrvhab.hcukyx3x.jb3vyjys.rz4wbd8a.qt6c0cv9.a8nywdso.i1ao9s8h.esuyzwwr.f1sip0of.lzcic4wl.l9j0dhe7.abiwlrkh.p8dawk7l.bp9cbjyn.s45kfl79.emlxlaya.bkmhp75w.spb7xbtv.rt8b4zig.n8ej3o3l.agehan2d.sk4xxmp2.taijpn5t.tv7at329.thwo4zme")).getAttribute("href"));
        Thread.sleep(6000);
        System.out.println(driver.getCurrentUrl());
        try {

            int ctContents = 0;
            // 6. 트윗 목록 Block 조회, 로드될 때까지 최대 30초간 대기
            WebDriverWait wait = new WebDriverWait(driver, 10);
            js.executeScript("window.scrollTo(0, document.body.scrollHeight)");
            Thread.sleep(6000);
            js.executeScript("window.scrollTo(0, document.body.scrollHeight)");
            Thread.sleep(6000);
            js.executeScript("window.scrollTo(0, document.body.scrollHeight)");
            Thread.sleep(6000);
            js.executeScript("window.scrollTo(0, document.body.scrollHeight)");
            Thread.sleep(6000);
            js.executeScript("window.scrollTo(0, document.body.scrollHeight)");
            Thread.sleep(6000);
            js.executeScript("window.scrollTo(0, document.body.scrollHeight)");
            Thread.sleep(6000);
            js.executeScript("window.scrollTo(0, document.body.scrollHeight)");
            Thread.sleep(6000);
            js.executeScript("window.scrollTo(0, document.body.scrollHeight)");
            Thread.sleep(6000);


            WebElement parent = wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("#mount_0_0")));

            List<WebElement> contents = parent.findElements(By.cssSelector("div.k4urcfbm.l9j0dhe7.sjgh65i0"));

            System.out.println("조회된 콘텐츠 수 : " + contents.size());
            if (contents.size() > 0) {
                ctContents += contents.size();
                // 8. 트윗 상세 내용 탐색
                Connection con = null;
                PreparedStatement pstmt = null;
                String qry = "";
                try {
                    con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/motiva?serverTimezone=UTC&useUnicode=true&characterEncoding=utf8", "crdb", "admin123");
                    for (WebElement content : contents) {
                        try {


                            String username = "";
                            String id = "";

                            List<WebElement> eletit = content.findElements(By.cssSelector("h3 > div > a.oajrlxb2.g5ia77u1.qu0x051f.esr5mh6w.e9989ue4.r7d6kgcz.rq0escxv.nhd2j8a9.nc684nl6.p7hjln8o.kvgmc6g5.cxmmr5t8.oygrvhab.hcukyx3x.jb3vyjys.rz4wbd8a.qt6c0cv9.a8nywdso.i1ao9s8h.esuyzwwr.f1sip0of.lzcic4wl.oo9gr5id.gpro0wi8.lrazzd5p"));
                            if (eletit.size() > 0) {
                                id           = content.findElement(By.cssSelector("h3 > div > a.oajrlxb2.g5ia77u1.qu0x051f.esr5mh6w.e9989ue4.r7d6kgcz.rq0escxv.nhd2j8a9.nc684nl6.p7hjln8o.kvgmc6g5.cxmmr5t8.oygrvhab.hcukyx3x.jb3vyjys.rz4wbd8a.qt6c0cv9.a8nywdso.i1ao9s8h.esuyzwwr.f1sip0of.lzcic4wl.oo9gr5id.gpro0wi8.lrazzd5p")).getText();
                                username     = content.findElement(By.cssSelector("h3 > div > a.oajrlxb2.g5ia77u1.qu0x051f.esr5mh6w.e9989ue4.r7d6kgcz.rq0escxv.nhd2j8a9.nc684nl6.p7hjln8o.kvgmc6g5.cxmmr5t8.oygrvhab.hcukyx3x.jb3vyjys.rz4wbd8a.qt6c0cv9.a8nywdso.i1ao9s8h.esuyzwwr.f1sip0of.lzcic4wl.oo9gr5id.gpro0wi8.lrazzd5p")).getText();
                            }else{
                                id           = content.findElement(By.cssSelector("h3 > div > div > span:nth-child(1) > span > div > a.oajrlxb2.g5ia77u1.qu0x051f.esr5mh6w.e9989ue4.r7d6kgcz.rq0escxv.nhd2j8a9.nc684nl6.p7hjln8o.kvgmc6g5.cxmmr5t8.oygrvhab.hcukyx3x.jb3vyjys.rz4wbd8a.qt6c0cv9.a8nywdso.i1ao9s8h.esuyzwwr.f1sip0of.lzcic4wl.oo9gr5id.gpro0wi8.lrazzd5p")).getText();
                                username     = content.findElement(By.cssSelector("h3 > div > div > span:nth-child(1) > span > div > a.oajrlxb2.g5ia77u1.qu0x051f.esr5mh6w.e9989ue4.r7d6kgcz.rq0escxv.nhd2j8a9.nc684nl6.p7hjln8o.kvgmc6g5.cxmmr5t8.oygrvhab.hcukyx3x.jb3vyjys.rz4wbd8a.qt6c0cv9.a8nywdso.i1ao9s8h.esuyzwwr.f1sip0of.lzcic4wl.oo9gr5id.gpro0wi8.lrazzd5p")).getText();
                            }
                            String text         = content.findElement(By.cssSelector("div.kvgmc6g5.cxmmr5t8.oygrvhab.hcukyx3x.c1et5uql.ii04i59q > div")).getText();
                            String img          = content.findElement(By.cssSelector("div.do00u71z.ni8dbmo4.stjgntxs.l9j0dhe7 > div > img")).getAttribute("src");
                            WebElement element   = content.findElement(By.cssSelector("a.oajrlxb2.g5ia77u1.qu0x051f.esr5mh6w.e9989ue4.r7d6kgcz.rq0escxv.nhd2j8a9.nc684nl6.p7hjln8o.kvgmc6g5.cxmmr5t8.oygrvhab.hcukyx3x.jb3vyjys.rz4wbd8a.qt6c0cv9.a8nywdso.i1ao9s8h.esuyzwwr.f1sip0of.lzcic4wl.gmql0nx0.gpro0wi8.b1v8xokw"));
                            String link ="";
                            if(element.getTagName().equals('a')) {
                                builder.moveToElement(element).build().perform();
                                Thread.sleep(8000);
                                link = element.getAttribute("href");
                            }
                            System.out.println("========================");
                            System.out.println(username + " " + id);
                            System.out.println(text);
                            System.out.println(img);
                            System.out.println(link);
                            System.out.println("========================");
                            qry = "insert into tcontents ( title, memo, url, userid, code2, imgfile, category)"
                                    + " values ('" + username + " " + id
                                    + "','" + text + "','" + link
                                    + "','cp0001','fb','" + img + "','" + _kind + "') ";


                            System.out.println(qry);
                            System.out.println("========================");
                            pstmt = con.prepareStatement(qry);
                            pstmt.executeUpdate();
                        } catch (NoSuchElementException e) {
                            // pass
                            System.out.println(e.getMessage());
                        }
                    }
                    pstmt.close();
                    con.close();
                } catch (Exception e) {
                    System.out.println(e.getMessage());
                }
            }
        } catch ( TimeoutException e ) {
            System.out.println("목록을 찾을 수 없습니다.");
        } finally {

        }
        // WebDriver 종료
        driver.quit();
    }
    public static void searchTwit1123(String keyword, String _kind) throws Exception {

        //}
        //public static void main(String[] args) throws  Exception {
        //  String keyword = "Music";
        // String _kind = "Music";
        // 1. WebDriver 경로 설정
        String URL = "https://twitter.com/search?q="+keyword+"&src=typed_query";
        // URL ="https://intoli.com/blog/making-chrome-headless-undetectable/chrome-headless-test.html";
        Path path = Paths.get(System.getProperty("user.dir"), "src/main/resources/driver/chromedriver");
        System.setProperty("webdriver.chrome.driver", path.toString());
        // 2. WebDriver 옵션 설정
        ChromeOptions options = new ChromeOptions();
        options.addArguments("--start-maximized");          // 최대크기로
        //options.addArguments("--headless");                 // Browser를 띄우지 않음
        options.addArguments("--disable-gpu");              // GPU를 사용하지 않음, Linux에서 headless를 사용하는 경우 필요함.
        options.addArguments("--enable-javascript");
        options.addArguments("--no-sandbox");               // Sandbox 프로세스를 사용하지 않음, Linux에서 headless를 사용하는 경우 필요함.
        // options.addArguments("user-agent=Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0 Safari/605.1.15");
        //options.addArguments("lang=ko_KR");
        options.setPageLoadStrategy(PageLoadStrategy.NONE);
        Map<String, Object> prefs = new HashMap<String, Object>();
        prefs.put("profile.managed_default_content_settings.javascript", 2);
        options.setExperimentalOption("prefs", prefs);
        ChromeDriver driver = new ChromeDriver(options);
        JavascriptExecutor js = (JavascriptExecutor) driver;

        //driver.get("chrome://settings/content/javascript");
        driver.manage().window().maximize();
        driver.get(URL);
        Thread.sleep(6000);
        System.out.println(driver.getPageSource());

        driver.findElement(By.xpath("/html/body/noscript/form/div/p[2]/button")).click();

        Thread.sleep(6000);

        System.out.println(driver.getCurrentUrl());
        //    driver.manage().timeouts().implicitlyWait(5, TimeUnit.SECONDS);
        try {
            System.out.println(driver.getPageSource());
            int ctContents = 0;
            // 6. 트윗 목록 Block 조회, 로드될 때까지 최대 30초간 대기
            WebDriverWait wait = new WebDriverWait(driver, 15);
            //WebElement parent = wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("section[aria-labelledby*=\"accessible-list\"]")));
            WebElement parent = wait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("div.timeline")));

            while (true) {
                System.out.println(driver.getCurrentUrl());

                js.executeScript("window.scrollTo(0, document.body.scrollHeight)");
                Thread.sleep(3000);
                // 7. 트윗 콘텐츠 조회
                List<WebElement> contents = parent.findElements(By.cssSelector("table"));
                Thread.sleep(3000);
                // List<WebElement> contents = parent.findElements(By.cssSelector("div.timeline > table"));
                System.out.println("조회된 콘텐츠 수 : " + contents.size());
                if (contents.size() > 0) {
                    ctContents += contents.size();
                    // 8. 트윗 상세 내용 탐색
                    Connection con = null;
                    PreparedStatement pstmt = null;
                    String qry = "";
                    try {

                        con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/motiva?serverTimezone=UTC&useUnicode=true&characterEncoding=utf8", "crdb", "admin123");
                        for (WebElement content : contents) {
                            try {

                                String username = content.findElement(By.cssSelector("strong.fullname")).getText();
                                String id = content.findElement(By.cssSelector("div.username")).getText();

                                String text = content.findElement(By.cssSelector("div.tweet-text")).getText();

                                List<WebElement> eleImg = content.findElements(By.cssSelector("div.media img"));
                                System.out.println(eleImg.size());
                                String img = "";
                                if (eleImg.size() > 0) {
                                    img = content.findElement(By.cssSelector("div.media img")).getAttribute("src");
                                }


                                String url = "";
                                url = content.findElement(By.cssSelector("tbody > tr.tweet-container > td > div > div > a")).getAttribute("href");



                                System.out.println("========================");
                                System.out.println(username + " " + id);
                                System.out.println(text);
                                System.out.println(img);
                                System.out.println("========================");
                                qry = "insert into tcontents ( title, memo, url, userid, code2, imgfile, category)"
                                        + " values ('" + username + " " + id
                                        + "','" + text + "','" + url
                                        + "','cp0001','TWT','" + img + "','" + _kind + "') ";


                                System.out.println(qry);
                                System.out.println("========================");
                                pstmt = con.prepareStatement(qry);
                                pstmt.executeUpdate();

                            } catch (NoSuchElementException e) {
                                System.out.println(e.getMessage());
                            }
                        }
                        pstmt.close();
                        con.close();
                    } catch (Exception e) {
                        System.out.println(e.getMessage());
                    }
                }
                if (ctContents > 30) {
                    break;
                }
            }
        } catch (TimeoutException e) {
            System.out.println("목록을 찾을 수 없습니다.");
            System.out.println(e.getMessage());
        } finally {

        }
        // WebDriver 종료
        driver.quit();
    }

}
