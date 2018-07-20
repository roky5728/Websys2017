package conn;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Vector;

import bean.TestDoneBean;

public class TestDoneMgr {
	
	private DBConnectionMgr pool = null;
	
	public TestDoneMgr() {
 	 try{
 	   pool = DBConnectionMgr.getInstance();
 	   }catch(Exception e){
 	      System.out.println("Error : 커넥션 얻어오기 실패");
 	   }
     }//TestDonePool();
 
	
	//개인이 수행했던 테스트 목록
    public Vector getTestDoneList(int mem_no) {
	   Connection conn = null;
	   Statement stmt = null;
	   ResultSet rs = null;
	   Vector vecList = new Vector();	   
	   
       try {
          conn = pool.getConnection();
          String strQuery = "select test.Test_name, test.Test_no, test.Count_max, test.VideoURL, test_done.TIMESTAMP, test_done.Result, test.Count from test, test_done where test_done.Test_no = test.Test_no and test_done.Mem_no ="+mem_no;
          stmt = conn.createStatement();
          rs = stmt.executeQuery(strQuery);
          if(rs!=null){
    		  while (rs.next()) {
    	             TestDoneBean testDoneBean = new TestDoneBean();
    	             testDoneBean.setTest_no(rs.getInt("Test_no"));
    	             testDoneBean.setTimestamp(rs.getTimestamp("TIMESTAMP").toString());
    	             testDoneBean.setTest_name(rs.getString("Test_name"));
    	             testDoneBean.setResult(rs.getInt("Result"));
    	             testDoneBean.setVideoURL(rs.getString("VideoURL"));
    	             testDoneBean.setCount(rs.getInt("Count"));
    	             testDoneBean.setCount_max(rs.getInt("Count_max"));
    	             vecList.add(testDoneBean);
    	          }         	  
          }
       } catch (Exception ex) {
          ex.printStackTrace();
       } finally {
	      pool.freeConnection(conn);
       }
       return vecList;
    }
    
    
    //테스트 완료시 저장
    public void setTestDoneList(int test_no, int mem_no, int result){
 	   Connection conn = null;
 	   Statement stmt = null;
 	   Vector vecList = new Vector(); 
 	   
        try {
           conn = pool.getConnection();
           String strQuery = "insert into test_done (Test_no, Mem_no, Result) values ("+test_no+","+mem_no+","+result+")";
           stmt = conn.createStatement();
           int rs = stmt.executeUpdate(strQuery);
        } catch (Exception ex) {
           System.out.println("Exception" + ex);
        } finally {
 	      pool.freeConnection(conn);
        }
    }
    
 }