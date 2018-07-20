package conn;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Vector;

import bean.MemberBean;

/**
 * Vector getMemberList() : 전체멤버리스트 반환
 * Vector getMemberInfo(int mem_no) : 해당 mem_no에 대한 멤버정보 반환
 * 
 * @author LEEHOJEONGLOCAL
 *
 */
public class MemberPool {
	
	private DBConnectionMgr pool = null;
	
	public MemberPool() {
 	 try{
 	   pool = DBConnectionMgr.getInstance();
 	   }catch(Exception e){
 	      System.out.println("Error : 커넥션 얻어오기 실패");
 	   }
     }//MemberMgrPool()
 
	
	//전체 member list를 반환
    public Vector getAllMember() {
	   Connection conn = null;
	   Statement stmt = null;
	   ResultSet rs = null;
	   Vector vecList = new Vector();	   
	   
       try {
          conn = pool.getConnection();
          String strQuery = "select * from member";
          stmt = conn.createStatement();
          rs = stmt.executeQuery(strQuery);
		  while (rs.next()) {
             MemberBean memberBean = new MemberBean();
             memberBean.setMem_no(Integer.parseInt(rs.getString("Mem_no")));
             memberBean.setName(rs.getString("name"));
             memberBean.setId(rs.getString("id"));
//             memberBean.setPassword(rs.getString("pw"));
             memberBean.setSex(rs.getString("sex"));
             memberBean.setEmail(rs.getString("email"));
             memberBean.setBirthday(rs.getString("birthday"));
             vecList.add(memberBean);
          }
       } catch (Exception ex) {
          System.out.println("Exception" + ex);
       } finally {
	      pool.freeConnection(conn);
       }
       return vecList;
    }
    
    
    
    // mem_no를 parameter로 받으면 해당하는 멤버의 정보를 반환
    public Vector getMemberInfo(int mem_no){
 	   Connection conn = null;
 	   Statement stmt = null;
 	   ResultSet rs = null;
 	   Vector vecList = new Vector();	   
 	   
        try {
           conn = pool.getConnection();
           String strQuery = "select * from member where Mem_no="+mem_no;
           stmt = conn.createStatement();
           rs = stmt.executeQuery(strQuery);
 		  while (rs.next()) {
              MemberBean memberBean = new MemberBean();
              memberBean.setMem_no(rs.getInt("Mem_no"));
              memberBean.setName(rs.getString("name"));
              memberBean.setId(rs.getString("id"));
              memberBean.setPassword(rs.getString("pw"));
              memberBean.setEmail(rs.getString("email"));
              memberBean.setSex(rs.getString("sex"));
              memberBean.setBirthday(rs.getString("birthday"));
              vecList.add(memberBean);
           }
        } catch (Exception ex) {
           System.out.println("Exception" + ex);
        } finally {
 	      pool.freeConnection(conn);
        }
    	
    	return vecList;
    }
    
    public int getMem_noById(String id){
  	   Connection conn = null;
  	   Statement stmt = null;
  	   ResultSet rs = null;
  	   Vector vecList = new Vector();	   
  	   int mem_no=0;
         try {
            conn = pool.getConnection();
            String strQuery = "select Mem_no from member where id='"+id+"'";
            stmt = conn.createStatement();
            rs = stmt.executeQuery(strQuery);
  		  while (rs.next()) {
  			  mem_no=rs.getInt("Mem_no");
            }
         } catch (Exception ex) {
            System.out.println("Exception" + ex);
         } finally {
  	      pool.freeConnection(conn);
         }    	
    	return mem_no;
    }
 }//class