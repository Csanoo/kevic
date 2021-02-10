package main.java.common.satelite.kr;

import java.sql.*;

public class LeftMenuUtil {

	public LeftMenuUtil() {
	}

	public void delete(String _table,String _id) {
		Connection conn = null;
		java.sql.Statement stmt = null;
		DBConnect dbcon = new DBConnect();
		String qry = "";
		qry = " delete from " + _table + " where id = " + _id;
		try {
			conn = dbcon.connect();
			stmt = conn.createStatement();
			stmt.executeUpdate(qry);

		} catch (SQLException ex) {

		} finally {

			try {
				if (stmt != null) {
					stmt.close();
				}
			} catch (Exception ex) {
			}

			try {
				if (conn != null) {
					conn.close();
				}
			} catch (Exception ex) {
			}

		}
	}

	public void delete2(String _table,String _whereid,String _id) {
		Connection conn = null;
		java.sql.Statement stmt = null;
		DBConnect dbcon = new DBConnect();
		String qry = "";
		qry = " delete from " + _table + " where "+_whereid+" = " + _id;
		try {
			conn = dbcon.connect();
			stmt = conn.createStatement();
			stmt.executeUpdate(qry);

		} catch (SQLException ex) {

		} finally {

			try {
				if (stmt != null) {
					stmt.close();
				}
			} catch (Exception ex) {
			}

			try {
				if (conn != null) {
					conn.close();
				}
			} catch (Exception ex) {
			}

		}


	}

	

	public String CLASSACTIVE(String _H, String vParam) {
		String s = "";
		if (_H.toUpperCase().indexOf(vParam.toUpperCase()) > 0) {
			s = "active";
		} else {
			s = "";
		}
		return s;
	}

	public String CLASSOPEN(String _H, String vParam) {
		String s = "";
		if (_H.toUpperCase().indexOf(vParam.toUpperCase()) > 0) {
			s = "open";
		} else {
			s = "";
		}
		return s;
	}

	
	
	public void setUserProgram2(String _h) {
		
		Connection con = null;
		java.sql.Statement stmt = null;
		
		DBConnect dbcon = new DBConnect();
		String sql1 = "insert into edumgtfunclist ( funcname , wdate ) values ('"+_h+"',current_timestamp)";
		try {
			con = dbcon.connect();
			stmt = con.createStatement();
			stmt.executeUpdate(sql1);

		} catch (SQLException ex) {

		} finally {
			
			try {
				if (stmt != null) {
					stmt.close();
				}
			} catch (Exception ex) {
			}
			try {
				if (con != null) {
					con.close();
				}
			} catch (Exception ex) {
			}

		}
		

	}
	
	public void setUserProgram(String _h, String _userid) {
		
		Connection con = null;
		java.sql.Statement stmt = null;

		DBConnect dbcon = new DBConnect();
		String sql1 = "insert into edumgtfunclist ( funcname , wdate,userid ) values ('"+_h+"',current_timestamp,'"+_userid+"')";
		//System.out.println(sql1);
		try {
			con = dbcon.connect();
			stmt = con.createStatement();
			stmt.executeUpdate(sql1);

		} catch (SQLException ex) {
			System.out.println(ex.getErrorCode());
		} finally {
			
			try {
				if (stmt != null) {
					stmt.close();
				}
			} catch (Exception ex) {
			}
			try {
				if (con != null) {
					con.close();
				}
			} catch (Exception ex) {
			}

		}
		

	}

}