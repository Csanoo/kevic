package main.java.common.satelite.kr;
import java.sql.*; 
import javax.sql.*;
import javax.naming.*;
public class DBConnect {
	private Connection con = null;
	private DataSource ds = null;
	private Context initCtx = null;
	private Context envCtx = null;

	public DBConnect() {
		try {
			initCtx = new InitialContext();
			envCtx = (Context) initCtx.lookup("java:/comp/env");
			ds = (DataSource) envCtx.lookup("jdbc/mdvsds");
		} catch (NamingException ex2) {

			ex2.printStackTrace();
		}
	}

	public Connection connect() {
		try {
			con = ds.getConnection();

		} catch (Exception e) {

			e.printStackTrace();
		}
		return con;
	}

	public void disconnect() throws SQLException {

		try {
			con.close();
		} catch (SQLException e) {

			e.printStackTrace(); 
		}finally{
			con.close();
		}

	}

	public Connection getConnection() throws Exception {
		return connect();
	}

	public void release(Connection _con) throws SQLException {
		disconnect();
	}

	public void release(Connection _con, String a) throws SQLException {
		disconnect();
	}

	protected void release(ResultSet resultset) {
		try {
			if (resultset != null) {
				resultset.close();
			}
		} catch (SQLException sqlexception) {

			try {
				resultset.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}


		}
	}

	protected void release(Statement statement) {
		try {
			if (statement != null) {
				statement.close();
			}
		} catch (SQLException sqlexception) {

			try {
				statement.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}


		}
	}

	protected void release(Statement statement, Connection _con) {
		try {
			if (statement != null) {
				statement.close();
			}
			disconnect();
		} catch (SQLException sqlexception) {

			try {
				statement.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}


		}
	}

	protected void release(ResultSet resultset, Statement statement,
			Connection _con) {
		try {
			if (resultset != null) {
				resultset.close();
			}
			if (statement != null) {
				statement.close();
			}
			disconnect();
		} catch (SQLException sqlexception1) {

			try {
				resultset.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}
			try {
				statement.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}


		}
	}

	protected void dbrollBack(Connection _con) {
		try {
			_con.rollback();
		} catch (SQLException sqlexception) {

		}
	}

	public static String chkNull(String Str) {
		return chkNull(Str, "");
	}

	public static String chkNull(String Str, String newStr) {
		return Str != null ? Str : newStr;
	}

	public static String JSFunction(String cmd) {
		String DspStr = "<script>\n";
		String StrStmt[] = cmd.split("\\|");
		for (int cnt = 0; cnt < StrStmt.length; cnt++) {
			String StrCmd[] = StrStmt[cnt].split(":");
			if (StrCmd[0].equals("alt")) {
				DspStr = (new StringBuilder()).append(DspStr).append("alert(\"").
						append(StrCmd[1]).append("\");").toString();
			} else
				if (StrCmd[0].equals("bck")) {
					DspStr = (new StringBuilder()).append(DspStr).append(
							"history.back();").toString();
				} else
					if (StrCmd[0].equals("loc")) {
						DspStr = (new StringBuilder()).append(DspStr).append(StrCmd[1]).
								append(".location.href=\"").append(StrCmd[2]).append(
										"\";").toString();
					} else
						if (StrCmd[0].equals("cls")) {
							DspStr = (new StringBuilder()).append(DspStr).append(StrCmd[1]).
									append(".close();").toString();
						} else
							if (StrCmd[0].equals("rld")) {
								DspStr = (new StringBuilder()).append(DspStr).append(StrCmd[1]).
										append(".reload();").toString();
							} else
								if (StrCmd[0].equals("cmd")) {
									DspStr = (new StringBuilder()).append(DspStr).append(StrCmd[1]).
											toString();
								}
			DspStr = (new StringBuilder()).append(DspStr).append("\n").toString();
		}

		DspStr = (new StringBuilder()).append(DspStr).append("</script>").
				toString();
		return DspStr;
	}

	public static String JSFunction2(String cmd) {
		String DspStr = "<script>\n";
		String StrStmt[] = cmd.split("\\|");
		for (int cnt = 0; cnt < StrStmt.length; cnt++) {
			String StrCmd[] = StrStmt[cnt].split(":");
			if (StrCmd[0].equals("alt")) {
				DspStr = (new StringBuilder()).append(DspStr).append("alert(\"").
						append(StrCmd[1]).append("\");").toString();
			} else
				if (StrCmd[0].equals("bck")) {
					DspStr = (new StringBuilder()).append(DspStr).append(
							"history.back();").toString();
				} else
					if (StrCmd[0].equals("loc")) {
						DspStr = (new StringBuilder()).append(DspStr).append(StrCmd[1]).
								append(".parent.location.href=\"").append(StrCmd[2]).
								append("\";").toString();
					} else
						if (StrCmd[0].equals("cls")) {
							DspStr = (new StringBuilder()).append(DspStr).append(StrCmd[1]).
									append(".close();").toString();
						} else
							if (StrCmd[0].equals("rld")) {
								DspStr = (new StringBuilder()).append(DspStr).append(StrCmd[1]).
										append(".reload();").toString();
							} else
								if (StrCmd[0].equals("cmd")) {
									DspStr = (new StringBuilder()).append(DspStr).append(StrCmd[1]).
											toString();
								}
			DspStr = (new StringBuilder()).append(DspStr).append("\n").toString();
		}

		DspStr = (new StringBuilder()).append(DspStr).append("</script>").
				toString();
		return DspStr;
	}

	

}